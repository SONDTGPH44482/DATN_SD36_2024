package com.example.sd_36_datn_tung.Controller.GiayTheThao;


import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoChiTietRepository;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoRepository;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.ImageRepository;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.*;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class GiayTheThaoController {

    @Autowired
    ServletContext context;




    @Autowired
    private ChatLieuRepository chatLieuRepository;


    @Autowired
    private LotGiayRepository lotGiayRepository;



    @Autowired
    private DayGiayRepository dayGiayRepository;


    @Autowired
    private ThuongHieuRepository thuongHieuRepository;





    @Autowired
    private GiayTheThaoRepository giayTheThaoRepository;

    @Autowired
    private GiayTheThaoChiTietRepository giayTheThaoChiTietRepository;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private SizeRepository sizeRepository;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    private GiayTheThaoService giayTheThaoService;

    //Todo code list giầy thể thao
    @GetMapping("GiayTheThao/listGiayTheThao")
    public String listShowViewGiayTheThao(Model model,
                                          HttpSession session,
                                          @RequestParam(name = "tab", required = false, defaultValue = "active") String tab,
                                          @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                          @RequestParam(name = "pageSize", required = false, defaultValue = "3") Integer pageSize,
                                          @RequestParam(name = "sort", required = false, defaultValue = "asc") String sort) {


            //Todo code tab trạng thái và phân trang
            int trangThai = tab.equals("active") ? 1 : 0;
            Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
            Page<GiayTheThao> page = giayTheThaoRepository.findByTrangThai(trangThai, pageable);
            //listPage sẽ dùng cho trạng thái giầy thể thao kích hoạt hay chưa
            model.addAttribute("totalPage", page.getTotalPages());
            model.addAttribute("listPage", page.getContent());

            List<Integer> pageNumbers = getPageNumbers(page, pageNum);
            model.addAttribute("pageNumbers", pageNumbers);
            model.addAttribute("currentPage", pageNum);


            // Lấy danh sách giày thể thao từ cơ sở dữ liệu
            List<GiayTheThao> listPageFind = giayTheThaoRepository.findAll();

            // Sắp xếp danh sách theo giá bán
            if ("asc".equals(sort)) {
                Collections.sort(listPageFind, Comparator.comparing(GiayTheThao::getGiaBan));
            } else if ("desc".equals(sort)) {
                Collections.sort(listPageFind, Comparator.comparing(GiayTheThao::getGiaBan).reversed());
            }

            model.addAttribute("listPageFind", listPageFind);

            return "/GiayTheThao/All_GiayTheThao/list";

    }


    private List<Integer> getPageNumbers(Page<?> page, int currentPage) {
        List<Integer> pageNumbers = new ArrayList<>();
        int totalPages = page.getTotalPages();
        int startPage, endPage;

        if (totalPages <= 5) {
            startPage = 1;
            endPage = totalPages;
        } else {
            if (currentPage <= 2) {
                startPage = 1;
                endPage = 5;
            } else if (currentPage + 2 >= totalPages) {
                startPage = totalPages - 4;
                endPage = totalPages;
            } else {
                startPage = currentPage - 2;
                endPage = currentPage + 2;
            }
        }

        for (int i = startPage; i <= endPage; i++) {
            pageNumbers.add(i);
        }

        return pageNumbers;
    }
//////////////////code crud ở dưới nhé ae

//    //Todo caode create bảng giầy thể thao
//    private boolean tenGiayTheThaoCheckTrung(String tenGiayTheThao){
//
//        for(GiayTheThao giayTheThao: giayTheThaoRepository.findAll()){
//
//            if(giayTheThao.getTenGiayTheThao().equalsIgnoreCase(tenGiayTheThao)){
//
//                return true;//Tên sản phẩm đã tồn tại trong list
//
//            }
//
//        }
//
//        return false;
//    }
//
//    //Todo code bảng giầy thể thao
//    @GetMapping("GiayTheThao/create")
//    public String createShow(Model model){
//
//        model.addAttribute("giayTheThao",new GiayTheThao());
//        return "/GiayTheThao/All_GiayTheThao/create";
//
//    }
//
//    @PostMapping(value = "GiayTheThao/create")
//    public String createSaveGiayTheThao(Model model,
//                                        @Valid
//                                        @ModelAttribute("giayTheThao") GiayTheThao giayTheThao,
//                                        BindingResult result,
//                                        RedirectAttributes attributes,
//                                        HttpSession session
//
//    ){
//
//        if(result.hasErrors()){
//
//            model.addAttribute("viewEr","Lỗi All");
//            return "/GiayTheThao/All_GiayTheThao/create";
//
//        }
//
//        //Todo code check
//
//        //Check tên sản phẩm trống
//        if(giayTheThao.getTenGiayTheThao() == null
//                ||  giayTheThao.getTenGiayTheThao().trim().length() ==0
//                ||   giayTheThao.getTenGiayTheThao().isEmpty()){
//
//            model.addAttribute("erTenGiayTheThaoIsEmty","Tên giầy thể thao không được để trống !");
//            return "/GiayTheThao/All_GiayTheThao/create";
//
//        }
//        //Check tên sản phẩm nhập kí tự số đầu tiên
//        if (giayTheThao.getTenGiayTheThao().matches("^\\d.*") ||
//                !giayTheThao.getTenGiayTheThao().matches(".*[a-zA-Z].*")) {
//            model.addAttribute("erCheckTenGiayTheThaoSo", "Tên giầy thể thao không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
//            return "/GiayTheThao/All_GiayTheThao/create";
//
//        }
//
//        Pattern pattern = Pattern.compile("^[^-0-9].*");
//        Matcher matcher = pattern.matcher(giayTheThao.getTenGiayTheThao());
//
//        if (!matcher.matches()) {
//            model.addAttribute("erCheckTenGiayTheThaoSo", "Tên giày thể thao không hợp lệ!");
//            return "/GiayTheThao/All_GiayTheThao/create";
//        }
//
//
//
//        //Check tên sản phẩm trùng
//        if(tenGiayTheThaoCheckTrung(giayTheThao.getTenGiayTheThao())){
//
//            model.addAttribute("erCheckTenGiayTheThaoTrung","Tên giầy thể thao đã có trong list !");
//            return "/GiayTheThao/All_GiayTheThao/create";
//
//        }
//
//
//        if(giayTheThao.getGiaBan() == null
//                || giayTheThao.getGiaBan().trim().length()==0
//                || giayTheThao.getGiaBan().isEmpty()){
//
//            model.addAttribute("erCheckGiaBanIsEmtry","Giá bán giầy thể thao không được để trống !");
//            return "/GiayTheThao/All_GiayTheThao/create";
//
//        }
//
//        String giaBanFormatted = giayTheThao.getGiaBan().replace(",", "").replace(" ", "");
//
//        try {
//
//            int giaBan = Integer.parseInt(giaBanFormatted);
//
//            if(giaBan < 100000){
//
//                model.addAttribute("erCheckGiaBanNumber","Giá bán không được là số nguyên âm và phải lớn hơn hoặc bằng 100.000 VNĐ");
//                return "/GiayTheThao/All_GiayTheThao/create";
//
//            }
//
//            giayTheThao.setGiaBan(String.valueOf(giaBan)); // Lưu giá trị đã xử lý vào đối tượng
//
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            model.addAttribute("erCheckGiaBanSoConertString", "Giá bán phải là số không được là chữ");
//            return "/GiayTheThao/All_GiayTheThao/create";
//        }
//
//        giayTheThao.setTrangThai(0); //là set trạng thái chưa được kích hoạt
//        giayTheThaoRepository.save(giayTheThao).getId();
//        attributes.addFlashAttribute("messageDone","Create giầy thể thao thành công !");
//
//        return "redirect:/GiayTheThao/update/"+giayTheThao.getId();
//
//    }
//
//
//    //Todo code giầy thể thao chi tiết
//    @PostMapping(value = "GiayTheThao/update/{id}")
//    public String showSaveUpdateGiayTheThao(Model model,
//                                            @ModelAttribute("giayTheThao") GiayTheThao giayTheThao,
//                                            RedirectAttributes attributes){
//
//        model.addAttribute("viewMessage","Update dữ liệu giầy thể thao thành công !");
//        //Check validate cho update
//        //Check tên sản phẩm trống
//        if(giayTheThao.getTenGiayTheThao() == null
//                ||  giayTheThao.getTenGiayTheThao().trim().length() ==0
//                ||   giayTheThao.getTenGiayTheThao().isEmpty()){
//
//            model.addAttribute("erTenGiayTheThaoIsEmty","Tên giầy thể thao không được để trống !");
//            return "/GiayTheThao/All_GiayTheThao/update";
//
//        }
//        //Check tên sản phẩm nhập kí tự số đầu tiên
//        if (giayTheThao.getTenGiayTheThao().matches("^\\d.*") ||
//                !giayTheThao.getTenGiayTheThao().matches(".*[a-zA-Z].*")) {
//            model.addAttribute("erCheckTenGiayTheThaoSo", "Tên giầy thể thao không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
//            return "/GiayTheThao/All_GiayTheThao/update";
//
//        }
//        // Kiểm tra tên giày thể thao trùng trong danh sách, nhưng loại trường hợp cùng tên với sản phẩm đang cập nhật
//        List<GiayTheThao> giayTheThaoList = giayTheThaoRepository.findAll();
//        for (GiayTheThao giay : giayTheThaoList) {
//            if (giay.getId().equals(giayTheThao.getId())) {
//
//                continue; // Bỏ qua sản phẩm đang cập nhật
//
//            }
//            if (giay.getTenGiayTheThao().equalsIgnoreCase(giayTheThao.getTenGiayTheThao())) {
//
//                model.addAttribute("erCheckTenGiayTheThaoTrung", "Tên giày thể thao đã có trong danh sách!");
//                return "/GiayTheThao/All_GiayTheThao/update";
//
//            }
//        }
//
//        //Check giá bán
//        if(giayTheThao.getGiaBan() == null
//                || giayTheThao.getGiaBan().trim().length()==0
//                || giayTheThao.getGiaBan().isEmpty()){
//
//            model.addAttribute("erCheckGiaBanIsEmtry","Giá bán giầy thể thao không được để trống !");
//            return "/GiayTheThao/All_GiayTheThao/update";
//
//        }
//
//        String giaBanFormatted = giayTheThao.getGiaBan().replace(",", "").replace(" ", "");
//
//        try {
//
//            int giaBan = Integer.parseInt(giaBanFormatted);
//
//            if(giaBan < 100000){
//
//                model.addAttribute("erCheckGiaBanNumber","Giá bán không được là số nguyên âm và phải lớn hơn hoặc bằng 100.000 VNĐ");
//                return "/GiayTheThao/All_GiayTheThao/update";
//
//            }
//
//            giayTheThao.setGiaBan(String.valueOf(giaBan)); // Lưu giá trị đã xử lý vào đối tượng
//
//        } catch (NumberFormatException e) {
//
//            e.printStackTrace();
//            model.addAttribute("erCheckGiaBanSoConertString", "Giá bán phải là số không được là chữ");
//            return "/GiayTheThao/All_GiayTheThao/update";
//
//        }
//
//        giayTheThao.setTrangThai(1);
//        giayTheThaoRepository.save(giayTheThao);
//        attributes.addFlashAttribute("messDoneUpdate","Update dữ liệu thành công !");
//        attributes.addFlashAttribute("messageDoneUpdateTrangThai", "Bạn cần tiếp tục tạo thêm thông tin để giầy thể thao được hoạt động !");
//
//
//        return "redirect:/GiayTheThao/update/"+giayTheThao.getId();
//
//    }
//
//
//    //Todo code code update sản phẩm lên chi tiết sản phẩm
//    @RequestMapping("GiayTheThao/update/{id}")//id của giầy thể thao
//    public String showUpdateGiayTheThaoChiTiet(Model model,
//                                               @PathVariable("id") UUID id){
//
//        //Id của giầy thể thao
//        model.addAttribute("giayTheThaoDetail",giayTheThaoChiTietRepository.getAllById(id));
//        model.addAttribute("image",imageRepository.getImageByIdGiayTheThao(id));
//        model.addAttribute("giayTheThao",giayTheThaoRepository.getGiayTheThaoById(id));
//
//        return "/GiayTheThao/All_GiayTheThao/update";
//
//    }
//
//    //Todo code update lại giầy thể thao và giầy thể thao chi tiết
//
//    @RequestMapping(value = "GiayTheThao/update/{id}",params = "giayTheThaoChiTietId"
//    )
//    public String showSaveGiayTheThaoChiTietAndUpdateGiayTheThao(
//            Model model,
//            @PathVariable("id") UUID id,
//            //id của giầy thể thao
//            @RequestParam("giayTheThaoChiTietId")UUID giayTheThaoChiTietId //id của giầy thể thao chi tiết
//    ){
//
//        model.addAttribute("giayTheThaoChiTiet",giayTheThaoChiTietRepository.findById(giayTheThaoChiTietId).get());
//        model.addAttribute("giayTheThao",giayTheThaoRepository.getGiayTheThaoById(id));
//
//        return "/GiayTheThao/All_GiayTheThao/update";
//
//    }
//
//
//    //Todo code create size, số lượng , màu sắc giầy thể thao chi tiết
//
//    @PostMapping(value = "GiayTheThao/createGiayTheThaoChiTiet")
//    public String createGiayTheThaoChiTiet(Model model,
//                                           @ModelAttribute("giayTheThaoChiTiet") GiayTheThaoChiTiet giayTheThaoChiTiet,
//                                           @RequestParam("id") UUID id, // ID của giày thể thao
//                                           @RequestParam(value = "giayTheThaoChiTietId",required = false) UUID giayTheThaoChiTietId, // ID của giày thể thao chi tiết (nếu có)
//                                           RedirectAttributes attributes) {
//
//        if (giayTheThaoChiTietId != null) {
//            // Nếu có, thực hiện cập nhật thông tin cho giày thể thao chi tiết đã tồn tại
//            GiayTheThaoChiTiet existingChiTiet = giayTheThaoChiTietRepository.findById(giayTheThaoChiTietId).get();
//
//            if (existingChiTiet != null) {
//                if (giayTheThaoChiTiet.getSoLuong() == null
//                        || giayTheThaoChiTiet.getSoLuong().trim().length() == 0
//                        || giayTheThaoChiTiet.getSoLuong().isEmpty()) {
//
//                    attributes.addFlashAttribute("erCheckSoLuongIsEmtry", "Số lượng không được để trống !");
//                    return "redirect:/GiayTheThao/update/" + id;
//
//                }
//
//                try {
//
//                    int soLuongCheck = Integer.parseInt(giayTheThaoChiTiet.getSoLuong());
//
//                    if (soLuongCheck <= 0) {
//
//                        attributes.addFlashAttribute("erCheckSoLuongNumber", "Số lượng phải lớn hơn hoặc bằng 1 !");
//                        return "redirect:/GiayTheThao/update/" + id;
//
//                    }
//
//
//                } catch (NumberFormatException e) {
//
//                    e.printStackTrace();
//                    attributes.addFlashAttribute("erCheckSoLuongString", "Số lượng phải là số không được là chữ !");
//                    return "redirect:/GiayTheThao/update/" + id;
//
//                }
//                    existingChiTiet.setSize(giayTheThaoChiTiet.getSize());
//                    existingChiTiet.setMauSac(giayTheThaoChiTiet.getMauSac());
//                    existingChiTiet.setSoLuong(giayTheThaoChiTiet.getSoLuong());
//                    giayTheThaoChiTietRepository.save(existingChiTiet);
//
//                attributes.addFlashAttribute("messageUpdateChiTiet", "Update giầy thể thao chi tiết thành công!");
//            }
//
//        } else {
//            // Nếu không có giày thể thao chi tiết id, tạo bản ghi mới
//            //Check validate cho các trường
//            if(giayTheThaoChiTiet.getSoLuong() == null
//                    || giayTheThaoChiTiet.getSoLuong().trim().length()==0
//                    || giayTheThaoChiTiet.getSoLuong().isEmpty()){
//
//                attributes.addFlashAttribute("erCheckSoLuongIsEmtry","Số lượng không được để trống !");
//                return "redirect:/GiayTheThao/update/" + id;
//
//            }
//
//            try{
//
//                int soLuongCheck = Integer.parseInt(giayTheThaoChiTiet.getSoLuong());
//
//                if(soLuongCheck <=0 ){
//
//                    attributes.addFlashAttribute("erCheckSoLuongNumber","Số lượng phải lớn hơn hoặc bằng 1 !");
//                    return "redirect:/GiayTheThao/update/" + id;
//
//                }
//
//
//            }catch (NumberFormatException e){
//
//                e.printStackTrace();
//                attributes.addFlashAttribute("erCheckSoLuongString","Số lượng phải là số không được là chữ !");
//                return "redirect:/GiayTheThao/update/" + id;
//
//            }
//
//            //Cộng dồn số lượng cho idGiayTheThao idSize idMauSac giống nhau
//
//            List<GiayTheThaoChiTiet> existingRecords = giayTheThaoChiTietRepository
//                    .findByGiayTheThaoAndMauSacAndSize(
//                            giayTheThaoChiTiet.getGiayTheThao(),
//                            giayTheThaoChiTiet.getMauSac(),
//                            giayTheThaoChiTiet.getSize()
//                    );
//
//            // Tính tổng số lượng từ các bản ghi đã tìm thấy
//            int totalQuantity = existingRecords.stream()
//                    .mapToInt(record -> Integer.parseInt(record.getSoLuong()))
//                    .sum();
//
//            // Cộng thêm số lượng mới
//            totalQuantity += Integer.parseInt(giayTheThaoChiTiet.getSoLuong());
//
//            // Cập nhật số lượng trong bản ghi đầu tiên hoặc tạo mới nếu không tìm thấy
//            if (!existingRecords.isEmpty()) {
//
//                GiayTheThaoChiTiet firstRecord = existingRecords.get(0);
//                firstRecord.setSoLuong(String.valueOf(totalQuantity));
//
//                giayTheThaoChiTietRepository.save(firstRecord);//lưu vào biến tạm để cộng dồn số lượng
//
//            }else {
//
//                giayTheThaoChiTiet.setSoLuong(String.valueOf(totalQuantity));
//
//                GiayTheThao giayTheThao = giayTheThaoRepository.findById(id).orElse(null);
//
//                if (giayTheThao == null) {
//                    giayTheThao = new GiayTheThao();
//                    giayTheThaoRepository.save(giayTheThao);
//                }
//
//                giayTheThaoChiTiet.setGiayTheThao(giayTheThao);
//                giayTheThaoChiTietRepository.save(giayTheThaoChiTiet);
//
//            }
//
//            attributes.addFlashAttribute("messageDoneGiayTheThaoChiTiet","Thêm chi tiết dữ liệu giầy thể thao thành công, nếu mà giầy thể thao đã tồn tại với các thuộc tính đã có lên sẽ được cộng dồn lại số lượng!");
//
//        }
//
//        return "redirect:/GiayTheThao/update/" + id;
//
//    }
//
//
//    //Todo code tìm kiếm thông tin giầy thể thao theo ten
//
//    @GetMapping("GiayTheThao/search")
//    public String showListSearch(
//            Model model,
//            @RequestParam(value = "tenGiayTheThao", required = false) String tenGiayTheThao
//            ) {
//
//        List<GiayTheThao> listPageFind;
//
//        if (tenGiayTheThao != null) {
//
//            listPageFind = giayTheThaoService.findGiayTheThao(tenGiayTheThao);
//            model.addAttribute("listPageFind", listPageFind);
//
//            if (!listPageFind.isEmpty()) {
//
//                model.addAttribute("messageFindDone", "Tìm thấy dữ liệu");
//
//            } else {
//
//                model.addAttribute("messageFindError", "Không tìm thấy dữ liệu");
//
//            }
//        } else {
//
//            model.addAttribute("messageFind", "Bạn hãy nhập tên giầy thể thao muốn tìm kiếm!");
//
//        }
//
//
//        return "/GiayTheThao/All_GiayTheThao/list";
//
//    }
//
//
//
//    //Todo code save image của giây thể thao
//
//    @PostMapping(value = "GiayTheThao/createImage")
//    public String createanh(Model model,
//                            HttpServletRequest request,
//                            Image image,
//                            @RequestParam("id")UUID id,//lấy id của giầy thể thao
//                            @RequestPart("url") MultipartFile file,
//                            RedirectAttributes attributes) throws IOException, ServletException {
//
//        //Todo code check ảnh
//
//        //Todo code check ảnh trống
//        if (file.isEmpty()) {
//
//            attributes.addFlashAttribute("erCheckImageIsEmtry", "Vui lòng chọn một tệp ảnh để được kích hoạt sản phẩm!");
//            return "redirect:/GiayTheThao/update/" + id;
//
//        }
//        //Todo code check ảnh trùng
//        GiayTheThao giayTheThao = giayTheThaoRepository.findById(id).orElse(null);
//
//        //Kiểm tra xem có ảnh khác có cùng trường url_image không
//        Image existingImage = imageRepository.findImageByLinkAndGiayTheThao(file.getOriginalFilename(),giayTheThao);
//
//        if (existingImage != null) {
//
//            attributes.addFlashAttribute("erCheckImageTrung", "Ảnh này đã tồn tại. Vui lòng chọn ảnh khác !");
//            return "redirect:/GiayTheThao/update/" + id;

//        }
//
//
//        Path path = Paths.get("src/main/webapp/upload/");
//
//        try {
//
//            System.out.println("Lỗi");
//            InputStream inputStream = file.getInputStream();
//            Files.copy(inputStream,path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        image.setLink(file.getOriginalFilename());
//        imageRepository.save(image);
//
//        //là giầy thể thao có hình ảnh
//        if(giayTheThao !=null){
//
//            giayTheThao.setTrangThai(1);//là đã được kích hoạt
//            giayTheThaoRepository.save(giayTheThao);
//
//        }
//        attributes.addFlashAttribute("erCheckImageDone","Thêm Image thành công !");
//        attributes.addFlashAttribute("messageKichHoatDone","Giầy thể thao đã được kích hoạt !");
//        return "redirect:/GiayTheThao/update/"+id;
//
//    }
//
//    //Todo code xóa image
//
//    @GetMapping("/GiayTheThao/Image/delete/{imageId}")
//    public String deleteImage(Model model,
//                              @PathVariable("imageId") UUID imageId,
//                              @RequestParam("id") UUID id,
//                              RedirectAttributes attributes) {
//
//        //Tìm kiếm id của giầy thể thao
//        GiayTheThao giayTheThao = giayTheThaoRepository.findById(id).orElse(null);
//
//        if (giayTheThao != null) {
//
//
//            imageRepository.deleteImageAndGiayTheThao(imageId);//Xóa ảnh theo id của image
//
//            attributes.addFlashAttribute("messageDeleteAnhDone", "Xóa Image thành công!");
//
//            // Kiểm tra xem sản phẩm còn ảnh hay không
//            List<Image> images = imageRepository.findImageByGiayTheThao(giayTheThao);//check list của sản phẩm xem có cần image hay không
//
//            if (images.isEmpty()) {
//
//                giayTheThao.setTrangThai(0); // Không còn ảnh
//                attributes.addFlashAttribute("checkHetAnh", "Không còn ảnh và trạng thái của giầy thể thao không được kích hoạt");
//
//            } else {
//
//                giayTheThao.setTrangThai(1); // Còn ít nhất một ảnh
//                attributes.addFlashAttribute("checkConAnh", "Còn ảnh");
//
//            }
//
//            giayTheThaoRepository.save(giayTheThao);
//
//        }
//
//        return "redirect:/GiayTheThao/update/" + id;
//    }
//
//
//    //Todo code thông tin giầy thể thao
//    @GetMapping("GiayTheThao/detailGiayTheThaoViewIndex/{id}")
//    public String detailGiayTheThaoViewIndexViewIndex(Model model,
//                                                      @PathVariable UUID id){
//
//        model.addAttribute("giayTheThao",giayTheThaoRepository.findById(id).orElse(null));
//        return "/BanHang/GiayTheThaoDetail";
//
//    }
//
//    //Todo code detail số lượng của size và màu sắc
//    @GetMapping("/find/{idGiayTheThao}/{idMauSac}/{idSize}")
//    public ResponseEntity<?> find(@PathVariable UUID idGiayTheThao, @PathVariable UUID idMauSac, @PathVariable UUID idSize) {
//
//        System.out.println(idGiayTheThao);
//        System.out.println(idMauSac);
//        System.out.println(idSize);
//
//        GiayTheThaoChiTiet giayTheThaoChiTiet = giayTheThaoChiTietRepository.findIdByIdGiayTheThaoMauSacSize(idGiayTheThao, idMauSac, idSize);
//
//        return ResponseEntity.ok(giayTheThaoChiTiet.getSoLuong());
//
//    }
//
//
//    //Todo code giầy thể thao xuất file PDF
//    @GetMapping("GiayTheThao/exportPDF")
//    public void GiayTheThaoExportPDF(HttpServletResponse response)throws DocumentException, IOException {
//
//        response.setContentType("application/pdf");
//
//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
//        String currenDateTime = dateFormat.format(new Date());
//
//        String headerkey = "Content-Disposition";
//        String headerValue = "attachment; filename=Product_"+currenDateTime+".pdf";
//
//        response.setHeader(headerkey,headerValue);
//
//        List<GiayTheThaoChiTiet> giayTheThaoChiTietList = giayTheThaoChiTietRepository.findAll();
//
//        GiayTheThaoPDFController pdfExport = new GiayTheThaoPDFController(giayTheThaoChiTietList);
//        pdfExport.export(response);
//
//    }
//
//    //Todo code giầy thể thao chi tiết xuất file Excal
//    @GetMapping("GiayTheThao/exportExcal")
//    public void GiayTheThaoExportExcal(HttpServletResponse response)throws DocumentException, IOException {
//
//        response.setContentType("application/octet-stream");
//
//        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
//        String currenDateTime = dateFormat.format(new Date());
//
//        String headerKey = "Content-Disposition";
//        String headerValue = "attachment; filename=Product_"+currenDateTime+".xlsx";
//
//        response.setHeader(headerKey,headerValue);
//
//        List<GiayTheThaoChiTiet> giayTheThaoChiTietList = giayTheThaoChiTietRepository.findAll();
//
//        GiayTheThaoExcalController exportExcel = new GiayTheThaoExcalController(giayTheThaoChiTietList);
//        exportExcel.export(response);
//
//
//    }
//
//
//    //Todo code thống kê data cho giầy thể thao
//
//    @GetMapping("/thongke-data")
//    @ResponseBody
//    public String thongKeData() {
//        List<GiayTheThaoChiTiet> sanPhams = giayTheThaoChiTietRepository.findAll();
//
//        ObjectMapper objectMapper = new ObjectMapper();
//
//        try {
//
//            String jsonData = objectMapper.writeValueAsString(sanPhams);
//            return jsonData;
//
//        } catch (Exception e) {
//
//            e.printStackTrace();
//            return "";
//
//        }
//    }
//
//
//    //Todo code các model để lưu lại dữ liệu
//
//    @ModelAttribute("form")
//    public List<Form> getListForm(){
//
//        return formRepository.findAll();
//
//    }
//
//    @ModelAttribute("congDung")
//    public List<CongDung> getListCongDung(){
//
//        return congDungRepository.findAll();
//
//    }
//
//    @ModelAttribute("chatLieu")
//    public List<ChatLieu> getListChatLieu(){
//
//        return chatLieuRepository.findAll();
//
//    }
//
//    @ModelAttribute("huongDanBaoQuan")
//    public List<HuongDanBaoQuan> getListHuongDanBaoQuan(){
//
//        return huongDanBaoQuanRepository.findAll();
//
//    }
//
//    @ModelAttribute("lotGiay")
//    public List<LotGiay> getListLotGiay(){
//
//        return lotGiayRepository.findAll();
//
//    }
//
//    @ModelAttribute("coGiay")
//    public List<CoGiay> getListCoGiay(){
//
//        return coGiayRepository.findAll();
//
//    }
//
//    @ModelAttribute("deGiay")
//    public List<DeGiay> getListDeGiay(){
//
//        return deGiayRepository.findAll();
//
//    }
//
//    @ModelAttribute("dayGiay")
//    public List<DayGiay> getListDayGiay(){
//
//        return dayGiayRepository.findAll();
//
//    }
//
//    @ModelAttribute("trongLuong")
//    public List<TrongLuong> getListTrongLuong(){
//
//        return trongLuongRepository.findAll();
//
//    }
//
//    @ModelAttribute("thuongHieu")
//    public List<ThuongHieu> getListThuongHieu(){
//
//        return thuongHieuRepository.findAll();
//
//    }
//
//    @ModelAttribute("kieuBuoc")
//    public List<KieuBuoc> getListKieuBuoc(){
//
//        return kieuBuocRepository.findAll();
//
//    }
//
//    @ModelAttribute("dinhTanGiay")
//    public List<DinhTanGiay> getListDinhTanGiay(){
//
//        return dinhTanGiayRepository.findAll();
//
//    }
//
//    @ModelAttribute("size")
//    public List<Size> getListSize(){
//
//        return sizeRepository.findAll();
//    }
//
//    @ModelAttribute("mauSac")
//    public List<MauSac> getListMauSac(){
//
//        return mauSacRepository.findAll();
//
//    }
}
