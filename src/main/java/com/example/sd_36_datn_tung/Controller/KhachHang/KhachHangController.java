package com.example.sd_36_datn_tung.Controller.KhachHang;



import com.example.sd_36_datn_tung.Model.KhachHang;
import com.example.sd_36_datn_tung.Repository.KhachHang.KhachHangRepository;
import com.example.sd_36_datn_tung.Service.KhachHang.KhachHangImpl;
import com.example.sd_36_datn_tung.Service.KhachHang.KhachHangService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller

@RequestMapping("/khachhang")

public class KhachHangController {

    @Autowired
    ServletContext context;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @Autowired
    private KhachHangService khachHangService;

//    @Autowired
//    private GioHangRepository gioHangRepository;

    @Autowired
    private KhachHangImpl khachHangImpl;


    @Data
    public static class SearchKH{
        String keyword;
        String tenKhachHang;
        String email;
        String matKhau;
        String gioiTinh;
        String ngaySinh;
        String soDienThoai;
        String diaChi;
    }
    @GetMapping("")
    public String viewKhachHang(Model model,
                                @RequestParam(name = "pageNumber", required = false, defaultValue = "1") Integer pageNumber,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                @ModelAttribute("searchKH") SearchKH searchKH)
    {
        List<KhachHang> listKH = khachHangRepository.findAll();
        model.addAttribute("listKH", listKH);

        Pageable pageable = PageRequest.of(pageNumber-1, pageSize);
        Page<KhachHang> page = khachHangService.searchKH(searchKH.keyword, searchKH.tenKhachHang, searchKH.email, searchKH.matKhau, searchKH.gioiTinh, searchKH.ngaySinh, searchKH.soDienThoai, searchKH.diaChi, pageable);

        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());

        return "/KhachHang/index";
    }

    //Todo code check trùng email của khách hàng
    private  boolean checkTrungEmailKhachHang(String emailKhachHang){
            for(KhachHang khachHang : khachHangRepository.findAll()){
                 if(khachHang.getEmail().equalsIgnoreCase(emailKhachHang)){
                     return true;
                 }
            }
            return false;
    }

    //Todo code log view Đăng ký tài khoản thành công
    @GetMapping("/DangKyTaiKhoanThanhCong")
    public String showViewDangKyTaiKhoanThanhCong(){

        System.out.println("Đăng ký tài khoản thành công !");
        return "/templates/Users/Layouts/Log/dangKyTaiKhoanThanhCong";

    }

//    //Todo code đăng ký tài khoản khách hàng
    @GetMapping("/view-createDanngKy")
    public String create(Model model){

        model.addAttribute("khachHang", new KhachHang());
        return "/templates/Users/Layouts/DangNhap/Register";

    }

    @PostMapping(value = "/create")
    public String create(@Valid
                         @ModelAttribute("khachHang") KhachHang khachHang,
                         @RequestParam("quocGia1") String quocGia1,
                         @RequestParam("thanhPho1") String thanhPho1,
                         @RequestParam("diaChi1") String diaChi1  ,
                         BindingResult result,
                         Model model,
                         RedirectAttributes attributes,
                         HttpSession session,
                         @RequestParam("file") MultipartFile file
        ){

        if (result.hasErrors()){

            return "/templates/Users/Layouts/DangNhap/Register";

        }


        //Check trống thành phố
        if(quocGia1 == null || quocGia1.isEmpty() || quocGia1.trim().length() ==0){

            model.addAttribute("erCheckThanhPhoNull","Địa chỉ thành phố không được để trống!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if(thanhPho1 == null || thanhPho1.isEmpty() || thanhPho1.trim().length() ==0){

            model.addAttribute("erCheckHuyenNull","Địa chỉ quận huyện không được để trống!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if(diaChi1 == null || diaChi1.trim().length() ==0 || diaChi1.isEmpty()){

            model.addAttribute("erCheckXaNull","Địa chỉ xã không được để trống!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }


        //Check trống email
        if(khachHang.getEmail() == null
            || khachHang.getEmail().isEmpty()
                || khachHang.getEmail().trim().length()==0){

            model.addAttribute("erCheckEmailKhachHangNull","Không được để trống Email !");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        //Check email phải có đuôi @gmail.com
        if(!khachHang.getEmail().endsWith("@gmail.com")){

            model.addAttribute("erMailgmail","Email của bạn không đúng định dạng (.@gmail.com)!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        //Check tên email nhập kí tự số đầu tiên
        if (khachHang.getEmail().matches("^\\d.*") ||
                !khachHang.getEmail().matches(".*[a-zA-Z].*")) {
            model.addAttribute("erCheckEmailSo", "Tên Email  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        Pattern pattern = Pattern.compile("^[^-0-9].*");
        Matcher matcher = pattern.matcher(khachHang.getEmail());

        if (!matcher.matches()) {

            model.addAttribute("erCheckEmail", "Email thao không hợp lệ!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }


        //Check trùng tên Email
        if(checkTrungEmailKhachHang(khachHang.getEmail())){

            model.addAttribute("erCheckTrungEmailKhachHang","Xin lỗi tên email này đã tồn tại trong hệ thống !");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if (khachHang.getTenKhachHang() == null || khachHang.getTenKhachHang().isEmpty() || khachHang.getTenKhachHang().trim().length()==0){
            model.addAttribute("tenKhachHangNotNull", "Tên khách hàng không được để trống");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if (khachHang.getTenKhachHang().matches("^\\d.*") || !khachHang.getTenKhachHang().matches(".*[a-zA-Z].*")){
            model.addAttribute("tenKhachHangHopLe", "Tên khách hàng không hợp lệ");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if (khachHang.getEmail() == null || khachHang.getEmail().isEmpty() || khachHang.getEmail().trim().length()==0){
            model.addAttribute("emailNotNull", "Email không được để trống");

            return "/templates/Users/Layouts/DangNhap/Register";

        }


        //Check mật khẩu
        if (khachHang.getMatKhau() == null || khachHang.getMatKhau().isEmpty() || khachHang.getMatKhau().trim().length()==0){

            model.addAttribute("matKhauNotNull", "Mật khẩu không được để trống");
            return "/templates/Users/Layouts/DangNhap/Register";

        }


        //Chech địa chỉ khách hàng
        if (khachHang.getDiaChi() == null || khachHang.getDiaChi().isEmpty() || khachHang.getDiaChi().trim().length()==0){

            model.addAttribute("diaChiNotNull", "Địa chỉ không được để trống");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        if (khachHang.getDiaChi().matches("^\\d.*") || !khachHang.getDiaChi().matches(".*[a-zA-Z].*")){

            model.addAttribute("diaChiHopLe", "Địa chỉ không hợp lệ");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        //Check số điện thoai
        if(khachHang.getSoDienThoai() == null
            || khachHang.getSoDienThoai().trim().length() == 0
            || khachHang.getSoDienThoai().isEmpty()){

            model.addAttribute("soDienThoaiNotNull", "Số điện thoại không được để trống !");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        //Check số điện thoại phải là số
        try {

            int soDienThoai = Integer.parseInt(khachHang.getSoDienThoai());

            if(soDienThoai < 0){

                attributes.addFlashAttribute("erCheckSoDienThoaiNumer","Xin lỗi số điện thoại không được nhỏ hơn 0 !");
                return "/templates/Users/Layouts/DangNhap/Register";

            }
        }catch (NumberFormatException e){

            e.printStackTrace();
            attributes.addFlashAttribute("erCheckSoDienThoaiString","Xin lỗi số điện thoại không được là chữ!");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        String phoneNumberRegex = "^0\\d{9}$";

        if (!khachHang.getSoDienThoai().matches(phoneNumberRegex)) {

            attributes.addFlashAttribute("erLogSoDienThoaiNumber", "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại bắt đầu bằng số 0 và có độ dài là 10 số.");
            return "/templates/Users/Layouts/DangNhap/Register";

        }

        //Chọn ảnh

        try {

            if (!file.isEmpty()) {
                // Lưu file vào thư mục upload
                String fileOriginal = file.getOriginalFilename();
                String fileDest = context.getRealPath("/upload/" + fileOriginal);
                file.transferTo(new File(fileDest));

                // Cập nhật trường link trong đối tượng KhachHang
                khachHang.setLink(fileOriginal);
                System.out.println("Lưu ảnh thành công !");

            }

        } catch (IOException e) {

            e.printStackTrace();

        }



        LocalDate ngayTao = LocalDate.now();
        LocalDate ngaySua = LocalDate.now();

        //Tạo mã tự sinh cho khách hàng
        LocalTime localTime = LocalTime.now();

        String ngayTaoDate = ngayTao.toString();
        String ngaySuaDate = ngaySua.toString();

        khachHang.setNgayTao(ngayTaoDate);
        khachHang.setNgaySua(ngaySuaDate);
        khachHang.setMaKhachHang("MaKH" + localTime.getHour() + localTime.getMinute() + localTime.getSecond());
        khachHang.setThanhPho(quocGia1);
        khachHang.setHuyen(thanhPho1);
        khachHang.setXa(diaChi1);
        khachHang.setDiaChi(khachHang.getDiaChi());

        khachHangRepository.save(khachHang);

//        Tạo mới giỏ hàng cho khách hàng luôn
//        GioHang gioHang = new GioHang();
//
//        gioHang.setKhachHang(khachHang);
//        session.setAttribute("gioHang",gioHang);
//        gioHangRepository.save(gioHang);


        attributes.addFlashAttribute("message", "Đăng kí tài khoản thành công");

        return "redirect:/khachHang/DangKyTaiKhoanThanhCong";

    }

    //Todo code edit khách hàng
    @GetMapping("/edit/{id}")
    public String edit(Model model, @PathVariable UUID id){
        KhachHang khachHang = khachHangRepository.findById(id).orElse(null);

        if (khachHang == null){
            model.addAttribute("messageFind", "Không tìm thấy khách hàng có id: "+id);
            return "/KhachHang/index";
        }

        model.addAttribute("khachHang", khachHangRepository.findById(id));
        return "/KhachHang/edit";

    }

    //Todo code xóa khách hàng
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") UUID id){
//        GioHang gioHang = gioHangRepository.findByKhachHangId(id);
//        gioHangRepository.delete(gioHang);
        khachHangRepository.deleteById(id);
        return "redirect:/KhachHang/index";
    }


    //Todo code update login
    @GetMapping("/loginViewDangNhap")
    public String loginKhachHang(Model model){

        model.addAttribute("khachHang", new KhachHang());
        return "/templates/Users/Layouts/DangNhap/Login";

    }

    //Todo code log login
    @GetMapping("/showSweetAlertLoginSuccess")
    public String showSweetAlertLogLogin() {

        return "/templates/Users/Layouts/Log/DangNhapLog";

    }



    @PostMapping("/loginViewDangNhap")
    public String checkLoginKhachHang(Model model,
                                      @ModelAttribute("khachHang") KhachHang khachHang,
                                      @Valid BindingResult result,
                                      HttpSession session) {

        // Xóa các thuộc tính cụ thể trong phiên
        session.removeAttribute("khachHangLog");
        session.removeAttribute("maKH");
        session.removeAttribute("idKhachHang");

        if (result.hasErrors()) {

            System.out.println("Đăng nhập thất bại !");
            model.addAttribute("messErLogin", "Đăng nhập thất bại");
            return "/templates/Users/Layouts/DangNhap/Login";

        }

        KhachHang khachHangData = khachHangRepository.findByEmailAndMatKhau(khachHang.getEmail(), khachHang.getMatKhau());

        //Đăng nhập thành công

        if (khachHangData != null) {

            UUID idKhachHang = khachHangData.getId(); //tìm kiếm mã khách hàng
            String maKH = khachHangData.getMaKhachHang();

            session.setAttribute("khachHangLog", khachHangData);
            session.setAttribute("maKH", maKH);
            session.setAttribute("idKhachHang", idKhachHang);//Lưu lại mã trong quá trình làm việc

            return "redirect:/KhachHang/showSweetAlertLoginSuccess";


        } else if (khachHangData == null) {

            session.setAttribute("KhachHangNull", "Xin lỗi tài khoản này không tồn tại !");
            System.out.println("Xin lỗi tài khoản này không tồn tại !");
            return "/templates/Users/Layouts/DangNhap/Login";

        }

        model.addAttribute("erLogLogin", "Email hoặc mật khẩu không đúng !");
        System.out.println("Lỗi dữ liệu !");

        return "/templates/Users/Layouts/DangNhap/Login";
    }




    //Todo code đăng xuất tài khoản khách hàng
    @GetMapping("/dangXuat")
    public String logout(Model model,
                         HttpSession session,
                         RedirectAttributes attributes){

     session.invalidate();
     attributes.addFlashAttribute("messageLogout","Đăng xuất tài khoản thành công !");

        return "redirect:/KhachHang/loginViewDangNhap";

    }


    @GetMapping("/search")
    public String searchCoGiay(@RequestParam(value = "tenKhachHang", required = false) String tenKhachHang, Model model) {
        List<KhachHang> searchResults;
        if (tenKhachHang != null) {
            searchResults  = khachHangService.findKhachHang(tenKhachHang);
            model.addAttribute("searchResults ", searchResults );
            if (!searchResults .isEmpty()) {
                model.addAttribute("messageFindDone", "Tìm thấy dữ liệu");
            } else {
                model.addAttribute("messageFindError", "Không tìm thấy dữ liệu");
            }
        } else {
            model.addAttribute("messageFind", "Bạn hãy nhập tên khách hàng muốn tìm kiếm!");
        }
        return "/KhachHang/index";
    }

    //Todo codo log Khách hàng chưa đăng nhập
    @GetMapping("/showSweetAlertLogin")
    public String showLogErNotLogin(){

        System.out.println("Bạn chưa đăng nhập tài khoản cho người dùng");
        return "/templates/Users/Layouts/Log/AddToCartLogNotLogin";

    }

    //Todo code log thay đổi thông tin khách hàng thành công!
    @GetMapping("/showSweetAlertThayDoiThanhCong")
    public String thayDoiThongTinKhachHangThanhCong(){

        System.out.println("Thay đổi thông tin khách hàng thành công!");
        return "/templates/Users/Layouts/Log/thayDoiThongTinKhachHangThanhCong";

    }

    //Todo code edit thông tin khách hàng
    @GetMapping("/TrangChu/ThongTinCaNhan")
    public String thongTinKhachHang(
            HttpSession session,
            Model model,
            RedirectAttributes attributes) {

        if (session.getAttribute("khachHangLog") != null) {

            UUID idKhachHang = (UUID) session.getAttribute("idKhachHang");
            if (idKhachHang != null) {

                System.out.println("Đăng nhập tài khoản thành công !");
                KhachHang khachHang = khachHangRepository.findById(idKhachHang).orElse(null);
                model.addAttribute("khachHang", khachHang);

            }

            return "/templates/Users/Layouts/DangNhap/CaiDat";

        } else {

            System.out.println("Khách hàng chưa đăng nhập tài khoản !");
            return "redirect:/KhachHang/showSweetAlertLogin";

        }
    }

    //Todo code thay đổi thông tin của khách hàng và view thông tin của khách hàng
    @PostMapping("/TrangChu/ThongTinCaNhan/Luu")
    public String luuThongTin(
                              Model model,
                              @ModelAttribute("khachHang") KhachHang khachHang,
                              HttpSession session,
                              @RequestParam("file") MultipartFile file,
                              RedirectAttributes attributes
                              ) {
        if (session.getAttribute("khachHangLog") != null) {
            UUID idKhachHang = (UUID) session.getAttribute("idKhachHang");
            if (idKhachHang != null) {
                System.out.println("Đăng nhập tài khoản thành công !");
                KhachHang khachHangDangNhap = khachHangRepository.findById(idKhachHang).orElse(null);

                if (khachHangDangNhap != null) { // Kiểm tra xem đối tượng có tồn tại hay không
                    try {

                        if (!file.isEmpty()) {
                            // Lưu file vào thư mục upload
                            String fileOriginal = file.getOriginalFilename();
                            String fileDest = context.getRealPath("/upload/" + fileOriginal);
                            file.transferTo(new File(fileDest));

                            // Cập nhật trường link trong đối tượng KhachHang
                            khachHangDangNhap.setLink(fileOriginal);
                            System.out.println("Lưu ảnh thành công !");
                        }

                    } catch (IOException e) {

                        e.printStackTrace();

                    }

                    //Check tên khách hàng
                    if(khachHang.getTenKhachHang() == null
                            || khachHang.getTenKhachHang().trim().length() ==0
                            || khachHang.getTenKhachHang().isEmpty()){

                        attributes.addFlashAttribute("erCheckTenKhachHang","Xin lỗi không được để trống tên !");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    //Check tên khách hàng là số
                    if (khachHang.getTenKhachHang().matches("^\\d.*") ||
                            !khachHang.getTenKhachHang().matches(".*[a-zA-Z].*")) {

                        attributes.addFlashAttribute("erCheckTen", "Tên khách hàng phải là chữ");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }


                    //Check số điện thoại
                    if(khachHang.getSoDienThoai() == null
                            || khachHang.getSoDienThoai().trim().length()==0
                            || khachHang.getSoDienThoai().isEmpty()){

                        attributes.addFlashAttribute("erCheckSoDienThoai","Xin lỗi không được để trống số điện thoại !");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    //Check số điện thoại phải là số
                    try {

                        int soDienThoai = Integer.parseInt(khachHang.getSoDienThoai());

                        if(soDienThoai < 0){

                            attributes.addFlashAttribute("erCheckSoDienThoaiNumer","Xin lỗi số điện thoại không được nhỏ hơn 0 !");
                            return "redirect:/TrangChu/ThongTinCaNhan";

                        }
                    }catch (NumberFormatException e){

                        e.printStackTrace();
                        attributes.addFlashAttribute("erCheckSoDienThoaiString","Xin lỗi số điện thoại không được là chữ!");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    String phoneNumberRegex = "^0\\d{9}$";

                    if (!khachHang.getSoDienThoai().matches(phoneNumberRegex)) {

                        attributes.addFlashAttribute("erLogSoDienThoaiNumber", "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại bắt đầu bằng số 0 và có độ dài là 10 số.");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }


                    //check địa chỉ cụ thể
                    if(khachHang.getDiaChi() == null
                            || khachHang.getDiaChi().trim().length() ==0
                            || khachHang.getDiaChi().isEmpty()){

                        attributes.addFlashAttribute("erCheckDiaChi","Xin lỗi không được để trống địa chỉ !");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    if (khachHang.getDiaChi().matches("^\\d.*") ||
                            !khachHang.getDiaChi().matches(".*[a-zA-Z].*")) {

                        attributes.addFlashAttribute("erCheckDiaChiSo", "Địa chỉ  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    //Check mật khẩu
                    if(khachHang.getMatKhau() == null
                        || khachHang.getMatKhau().trim().length()==0
                        || khachHang.getMatKhau().isEmpty()){

                        attributes.addFlashAttribute("erCheckPassWordNull", "Mật khẩu không được để trống !");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }

                    if(khachHang.getMatKhau().trim().length() < 7){

                        attributes.addFlashAttribute("erCheckMatKhauLenght", "Mật khẩu phải có độ dài từ 7 ký tự trở lên!");
                        return "redirect:/TrangChu/ThongTinCaNhan";

                    }


                    // Cập nhật thông tin từ form
                    khachHangDangNhap.setMatKhau(khachHang.getMatKhau());
                    khachHangDangNhap.setTenKhachHang(khachHang.getTenKhachHang());
                    khachHangDangNhap.setSoDienThoai(khachHang.getSoDienThoai());
                    khachHangDangNhap.setDiaChi(khachHang.getDiaChi());

                    khachHangRepository.save(khachHangDangNhap);
                    System.out.println("Lưu thành công !");
                    return "redirect:/KhachHang/showSweetAlertThayDoiThanhCong";

                } else {
                    System.out.println("Không tìm thấy thông tin khách hàng!");
                }
            }
        }else{

            System.out.println("Khách hàng chưa đăng nhập tài khoản !");
            return "redirect:/KhachHang/showSweetAlertLogin";

        }

        return "/templates/Users/Layouts/DangNhap/CaiDat";

    }







    //Todo code log thông báo thay đổi mật khẩu thành công
    @GetMapping("/ThayDoiMatKhauThanhCong")
    public String showViewThayDoiTaiKhoanThanhCong(){

        System.out.println("Thay đổi mật khẩu khách hàng thành công !");
        return "/templates/Users/Layouts/Log/thayDoiMatKhauKhachHangThanhCong";

    }

    //Todo code view thay đổi thông tin của khách hàng
    @GetMapping("/viewQuenMatKhau/*")
    public String viewQuenMatKhau(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/KhachHang/viewQuenMatKhau/");
        String idStr = p[1];

        if (idStr.equalsIgnoreCase("2")) {

            model.addAttribute("idKH", "2");

        }

        return "/templates/Users/Layouts/DangNhap/quenMatKhau";

    }

    //Todo code khách hàng quên mật khẩu đăng nhập
    @PostMapping("/QuenMatKhau")
    public String saveKhachHangQuenMatKhau(

            Model model,
            HttpServletRequest request){

        String email = request.getParameter("email");

        System.out.println(email);

        if (email == null || email.trim().isEmpty()) {

            System.out.println("Xin lỗi, vui lòng nhập email!");
            model.addAttribute("loiEmailNull", "Xin lỗi, vui lòng nhập email");
            return "/templates/Users/Layouts/DangNhap/quenMatKhau";

        }


        try{

            KhachHang khachHang = khachHangImpl.findByEmail(email);

            int min = 100000;
            int max = 999999;
            int randomNumber = (int) (Math.random() * (max - min + 1) + min);

            KhachHang kh = new KhachHang();

            //Thay đổi thông tin của khách hàng

            kh.setMaKhachHang(khachHang.getMaKhachHang());
            kh.setTenKhachHang(khachHang.getTenKhachHang());
            kh.setEmail(khachHang.getEmail());
            kh.setMatKhau(String.valueOf(randomNumber));
            kh.setNgaySinh(khachHang.getNgaySinh());
            kh.setDiaChi(khachHang.getDiaChi());
            kh.setSoDienThoai(khachHang.getSoDienThoai());
            kh.setHuyen(khachHang.getHuyen());
            kh.setThanhPho(khachHang.getThanhPho());
            kh.setXa(khachHang.getXa());
            kh.setTrangThai(khachHang.getTrangThai());

            khachHangImpl.update(khachHang.getId(),kh);

            SimpleMailMessage message = new SimpleMailMessage();

            message.setTo(email);
            message.setSubject("Mật khẩu mới của bạn là ");
            message.setText("Mật khẩu mới của bạn là :" + randomNumber);

            mailSender.send(message);
            System.out.println("Thay đổi mật khẩu khách hàng thành công !");
            return "redirect:/KhachHang/ThayDoiMatKhauThanhCong";

        }catch (Exception e){

            e.printStackTrace();
            System.out.println("Lỗi thay đổi tài khoản mật khẩu");
            model.addAttribute("idKH", "2");
            model.addAttribute("loi", "Xin lỗi email không hợp lệ hoặc không có tài khoản nào áp dụng cho email này");
            return "/templates/Users/Layouts/DangNhap/quenMatKhau";

        }

    }

}
