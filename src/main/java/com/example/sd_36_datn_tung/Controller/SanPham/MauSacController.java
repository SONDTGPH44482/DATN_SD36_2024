package com.example.sd_36_datn_tung.Controller.SanPham;



import com.example.sd_36_datn_tung.Model.MauSac;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.MauSacRepository;
import com.example.sd_36_datn_tung.Service.SanPham.MauSacService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller

@RequestMapping("/MauSac")

public class MauSacController {

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private MauSacRepository mauSacRepository;

    @Autowired
    ServletContext context;

    @GetMapping("/hien-thi")
    public String listShowViewMauSac(Model model,
                                     HttpSession session,
                                     @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                     @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize
    ) {

        //Todo code tab trạng thái và phân trang
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        Page<MauSac> page = mauSacRepository.findAll(pageable);
        //listPage sẽ dùng cho trạng thái giầy thể thao kích hoạt hay chưa
        model.addAttribute("totalPage", page.getTotalPages());
        model.addAttribute("listPage", page.getContent());

        List<Integer> pageNumbers = getPageNumbers(page, pageNum);
        model.addAttribute("pageNumbers", pageNumbers);
        model.addAttribute("currentPage", pageNum);


        // Lấy danh sách giày thể thao từ cơ sở dữ liệu
        List<MauSac> listPageFind = mauSacRepository.findAll();
        model.addAttribute("listPageFind", listPageFind);

        return "/MauSac/index";
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


    private boolean tenMauSacCheckTrung(String tenMauSac) {
        for (MauSac mauSac : mauSacRepository.findAll()) {
            if (mauSac.getTenMauSac().equalsIgnoreCase(tenMauSac)) {
                return true;
            }
        }
        return false;
    }


    @GetMapping("/view-create")
    public String createPage(Model model) {
        model.addAttribute("mauSac", new MauSac());
        return "/MauSac/create";
    }


    @PostMapping("/create")
    public String create(Model model, @ModelAttribute("mauSac") MauSac mauSac, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return "/create";
        }

        if (mauSac.getTenMauSac() == null || mauSac.getTenMauSac().isEmpty() || mauSac.getTenMauSac().trim().length() == 0) {
            model.addAttribute("checkMauSacNotNull", "Tên màu sắc không được để trống");
            return "/MauSac/create";
        }

        if (mauSac.getTenMauSac().matches("^\\d.*") || !mauSac.getTenMauSac().matches(".*[a-zA-Z].*")) {
            model.addAttribute("checkMauSacHopLe", "Tên màu sắc không hợp lệ");
            return "/MauSac/create";
        }

        LocalDate ngayTao = LocalDate.now();
        LocalDate ngaySua = LocalDate.now();

        String ngayTaoDate = ngayTao.toString();
        String ngaySuaDate = ngaySua.toString();

        mauSac.setNgayTao(ngayTaoDate);
        mauSac.setNgaySua(ngaySuaDate);

        mauSacRepository.save(mauSac);
        attributes.addFlashAttribute("message", "Thêm thành công!");
        return "redirect:/MauSac/index";
    }

    @GetMapping("/edit/{id}")
    public String editPage(Model model, @PathVariable UUID id) {
        MauSac mauSac = mauSacRepository.findById(id).orElse(null);
        if (mauSac == null) {
            model.addAttribute("messageFind", "Không tìm thấy id có mã: " + id);
            return "/MauSac/index";
        }

        model.addAttribute("mauSac", mauSacRepository.findById(id).orElse(null));
        return "/MauSac/edit";
    }

    @GetMapping("/MauSac/search")
    public String searchMauSac(@RequestParam(value = "tenMauSac", required = false) String tenMauSac, Model model) {
        List<MauSac> listPageFind;
        if (tenMauSac != null) {
            listPageFind = mauSacService.findMauSac(tenMauSac);
            model.addAttribute("listPageFind", listPageFind);
            if (!listPageFind.isEmpty()) {
                model.addAttribute("messageFindDone", "Tìm thấy dữ liệu");
            } else {
                model.addAttribute("messageFindError", "Không tìm thấy dữ liệu");
            }
        } else {
            model.addAttribute("messageFind", "Bạn hãy nhập tên màu sắc muốn tìm kiếm!");
        }
        return "/MauSac/index";
    }

    @RequestMapping("/MauSac/delete/{id}")
    public String delete(@PathVariable("id") MauSac mauSac) {
        mauSacRepository.delete(mauSac);
        return "redirect:/MauSac/hien-thi";
    }


    //Todo code list tên màu săc
    @ModelAttribute("tenMauSac")
    public List<MauSac> getListMauSac() {
        return mauSacRepository.findAll();
    }


}
