package com.example.sd_36_datn_tung.Controller.User;


import com.example.sd_36_datn_tung.Model.User;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.UserRepository;
import com.example.sd_36_datn_tung.Service.impl.UserServiceImpl;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class TrangChuLogController {

    //Todo code trang chủ bên admin

    @Autowired
    ServletContext context;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private UserRepository userRepository;


    @RequestMapping(value = "/TrangChu/Admin/home")
    public String homeAdmin(){

        return "/TrangChuAdmin/home";

    }

    //Todo code Admin chưa đăng nhập tài khoản

    @GetMapping("/Admin/NotLoin")
    public String showViewAdminNotLogin(){

        return "/templates/Users/Layouts/Log/adminNotLogin";

    }

    //Todo code thông báo thay đổi dữ liệu admin thành công
    @GetMapping("/Admin/thayDoiDuLieuThanhCong")
    public String showViewAdminThayDoiDuLieuThanhCong(){

        return "/templates/Users/Layouts/Log/thayDoiThongTinAdminThanhCong";

    }

    //Todo code view thông tin tài khoản và save
    @GetMapping("/TrangChu/ThongTinCaNhan/Admin")
    public String showViewThongTinCaNhanAdmin(Model model,
                                              HttpSession session,
                                              RedirectAttributes attributes){

        if(session.getAttribute("userLog") != null){

            UUID idUser = (UUID) session.getAttribute("idUser");

            if(idUser != null){

                System.out.println("Đăng nhập tài khoản thành công !");
                User user = userRepository.findById(idUser).orElse(null);

                model.addAttribute("user",user);

            }

            return "/templates/Admin/Layouts/DangNhap/thongTinCaNhan";

        }else{

            System.out.println("Khách hàng chưa đăng nhập tài khoản !");
            return "redirect:/Admin/NotLoin";

        }

    }

    //Todo code thay đổi thông tin của khách hàng
    @PostMapping("/TrangChu/Admin/ThongTinCaNhan/Luu")
    public String luuThongTin(
            Model model,
            @ModelAttribute("user") User user,
            HttpSession session,
            @RequestParam("file") MultipartFile file,
            RedirectAttributes attributes
    ) {

        if (session.getAttribute("userLog") != null) {

            UUID idUser = (UUID) session.getAttribute("idUser");

            if (idUser != null) {
                System.out.println("Đăng nhập tài khoản thành công !");
                User userDangNhap = userRepository.findById(idUser).orElse(null);

                if (userDangNhap != null) {
                    // Kiểm tra xem đối tượng có tồn tại hay không
                    try {

                        if (!file.isEmpty()) {
                            // Lưu file vào thư mục upload
                            String fileOriginal = file.getOriginalFilename();
                            String fileDest = context.getRealPath("/upload/" + fileOriginal);
                            file.transferTo(new File(fileDest));

                            // Cập nhật trường link trong đối tượng KhachHang
                            userDangNhap.setLink(fileOriginal);
                            System.out.println("Lưu ảnh thành công !");

                        }

                    } catch (IOException e) {

                        e.printStackTrace();

                    }

                    //Check tên khách hàng
                    if(user.getTenUser() == null
                            || user.getTenUser().trim().length() ==0
                            || user.getTenUser().isEmpty()){

                        attributes.addFlashAttribute("erCheckTenUser","Xin lỗi không được để trống tên !");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    //Check tên khách hàng là số
                    if (user.getTenUser().matches("^\\d.*") ||
                            !user.getTenUser().matches(".*[a-zA-Z].*")) {

                        attributes.addFlashAttribute("erCheckTen", "Tên User phải là chữ");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }


                    //Check số điện thoại
                    if(user.getSoDienThoai() == null
                            || user.getSoDienThoai().trim().length()==0
                            || user.getSoDienThoai().isEmpty()){

                        attributes.addFlashAttribute("erCheckSoDienThoai","Xin lỗi không được để trống số điện thoại !");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    //Check số điện thoại phải là số
                    try {

                        int soDienThoai = Integer.parseInt(user.getSoDienThoai());

                        if(soDienThoai < 0){

                            attributes.addFlashAttribute("erCheckSoDienThoaiNumer","Xin lỗi số điện thoại không được nhỏ hơn 0 !");
                            return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                        }
                    }catch (NumberFormatException e){

                        e.printStackTrace();
                        attributes.addFlashAttribute("erCheckSoDienThoaiString","Xin lỗi số điện thoại không được là chữ!");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    String phoneNumberRegex = "^0\\d{9}$";

                    if (!user.getSoDienThoai().matches(phoneNumberRegex)) {

                        attributes.addFlashAttribute("erLogSoDienThoaiNumber", "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại bắt đầu bằng số 0 và có độ dài là 10 số.");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }


                    //check địa chỉ cụ thể
                    if(user.getDiaChi() == null
                            || user.getDiaChi().trim().length() ==0
                            || user.getDiaChi().isEmpty()){

                        attributes.addFlashAttribute("erCheckDiaChi","Xin lỗi không được để trống địa chỉ !");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    if (user.getDiaChi().matches("^\\d.*") ||
                            !user.getDiaChi().matches(".*[a-zA-Z].*")) {

                        attributes.addFlashAttribute("erCheckDiaChiSo", "Địa chỉ  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    //Check password
                    if(user.getMatKhau() == null
                        || user.getMatKhau().trim().length()==0
                        || user.getMatKhau().isEmpty()){

                        attributes.addFlashAttribute("erCheckMatKhauNull", "Mật khẩu không được để trống !");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }

                    if(user.getMatKhau().trim().length() < 7){

                        attributes.addFlashAttribute("erCheckMatKhauLenght", "Mật khẩu phải có độ dài lớn hơn hoặc bằng 7 !");
                        return "redirect:/TrangChu/ThongTinCaNhan/Admin";

                    }


                    // Cập nhật thông tin từ form
                    userDangNhap.setMatKhau(user.getMatKhau());
                    userDangNhap.setTenUser(user.getTenUser());
                    userDangNhap.setSoDienThoai(user.getSoDienThoai());
                    userDangNhap.setDiaChi(user.getDiaChi());

                    userRepository.save(userDangNhap);

                    System.out.println("Lưu thành công !");
                    return "redirect:/Admin/thayDoiDuLieuThanhCong";

                } else {

                    System.out.println("Không tìm thấy thông tin khách hàng!");

                }
            }

        }else{

            System.out.println("Admin chưa đăng nhập tài khoản !");
            return "redirect:/Admin/NotLoin";

        }

        return "/templates/Admin/Layouts/DangNhap/thongTinCaNhan";

    }


   //Todo code thông tin tài khoản bên Admin

    //Todo code log sweler thay đổi mật khẩu thành công
    @GetMapping("User/ThayDoiMatKhauThanhCong")
    public String showViewThayDoiMatKhauThanhCong(){

        System.out.println("Thay đổi mật khẩu thành công !");
        return "/templates/Users/Layouts/Log/thayDoiMatKhauUserThanhCong";

    }


    //Todo code thay đổi mật khẩu bên admin khi quên

    @GetMapping("/Admin/viewQuenMatKhau/*")
    public String showviewQuenMatKhau(

            HttpServletRequest request,
            Model model
    ){

        String url = request.getRequestURI();
        String[] p = url.split("/Admin/viewQuenMatKhau/");
        String idStr = p[1];

        if (idStr.equalsIgnoreCase("2")) {

            model.addAttribute("idUser", "2");

        }

        return "/templates/Admin/Layouts/DangNhap/quenMatKhau";

    }

    //Todo code gửi email và save lại dữ liệu

    @PostMapping("/Admin/QuenMatKhau")
    public String saveAdminQuenMatKhau(

            Model model,
            HttpServletRequest request

    ){

        String email = request.getParameter("email");
        System.out.println("Email : "+ email);

        if(email == null || email.isEmpty() || email.trim().length() ==0){

            System.out.println("Xin lỗi vui lòng nhập địa chỉ email !");
            model.addAttribute("loiEmailNull","Vui lòng nhập địa chỉ email !");
            return "/templates/Admin/Layouts/DangNhap/quenMatKhau";

        }

        try{

            User user = userServiceImpl.findByEmail(email);

            int min = 100000;
            int max = 999999;
            int randomNumber = (int) (Math.random() * (max - min + 1) + min);

            User us = new User();
            // Thay đổi thông tin user
            us.setMaUser(user.getMaUser());
            us.setEmail(user.getEmail());
            us.setMatKhau(String.valueOf(randomNumber));
            us.setTenUser(user.getTenUser());
            us.setGioiTinh(user.getGioiTinh());
            us.setNgaySinh(user.getNgaySinh());
            us.setMaCCCD(user.getMaCCCD());
            us.setHoKhau(user.getHoKhau());
            us.setSoDienThoai(user.getSoDienThoai());
            us.setDiaChi(user.getDiaChi());
            us.setGhiChu(user.getGhiChu());
            us.setNgayTao(user.getNgayTao());
            us.setNgaySua(user.getNgaySua());
            us.setTrangThai(user.getTrangThai());
            us.setRole(user.getRole());

            userServiceImpl.update(user.getId(),us);


            SimpleMailMessage message = new SimpleMailMessage();

            message.setTo(email);
            message.setSubject("Mật khẩu mới của bạn là ");
            message.setText("Mật khẩu mới của bạn là :" + randomNumber);

            mailSender.send(message);
            System.out.println("Thay đổi mật khẩu khách hàng thành công !");

            return "redirect:/User/ThayDoiMatKhauThanhCong";

        }catch (Exception e){

            e.printStackTrace();
            e.printStackTrace();
            System.out.println("Lỗi thay đổi tài khoản mật khẩu");
            model.addAttribute("idUser", "2");
            model.addAttribute("loi", "Xin lỗi email không hợp lệ hoặc không có tài khoản nào áp dụng cho email này");
            return "/templates/Admin/Layouts/DangNhap/quenMatKhau";

        }

    }





}
