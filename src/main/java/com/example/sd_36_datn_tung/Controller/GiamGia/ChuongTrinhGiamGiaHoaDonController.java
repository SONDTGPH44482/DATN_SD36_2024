package com.example.sd_36_datn_tung.Controller.GiamGia;


import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietHoaDon;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;
import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaChiTietHoaDonService;
import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("chuongTrinhGiamGia/hoaDon")
public class ChuongTrinhGiamGiaHoaDonController {

    @Autowired
    private ChuongTrinhGiamGiaHoaDonService serviceHD;

    @Autowired
    private ChuongTrinhGiamGiaChiTietHoaDonService serviceCTHD;

    private ChuongTrinhGiamGiaHoaDon ctggHD = new ChuongTrinhGiamGiaHoaDon();

    @GetMapping("")
    public String getGiamGiaHD(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        this.serviceHD.updateTrangThai();
        Page<ChuongTrinhGiamGiaHoaDon> pageList = serviceHD.filterByTTChuaHetHan(pageable);

        model.addAttribute("list", pageList);
        model.addAttribute("title", "Chương trình khuyến mại hóa đơn");
        model.addAttribute("link", "hoaDon");
        model.addAttribute("read", "hoaDon?");
        model.addAttribute("hinhThuc", "Hóa đơn - Giảm giá hóa đơn");
        return "giamGia/hoaDon/indexHD";
    }

    @GetMapping("search")
    public String searchHD(Model model, @RequestParam(name = "page", defaultValue = "1") int page,
                           @RequestParam("name") String name) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("list", this.serviceHD.search(pageable, name.trim()));
        model.addAttribute("read", "hoaDon/search?name=" + name + "&");
        model.addAttribute("link", "hoaDon");
        model.addAttribute("title", "Chương trình khuyến mại hóa đơn");
        model.addAttribute("hinhThuc", "Hóa đơn - Giảm giá hóa đơn");

        return "giamGia/hoaDon/indexHD";
    }

    @GetMapping("filter")
    public String filterHD(Model model, @RequestParam(name = "page", defaultValue = "1") int page,
                           @RequestParam("trangThai") int trangThai,
                           @RequestParam("ngayBatDau") String ngayBatDau,
                           @RequestParam("ngayKetThuc") String ngayKetThuc) {

        Pageable pageable = PageRequest.of(page - 1, 10);

        if (ngayBatDau.length() <= 0 && ngayKetThuc.length() <= 0) {
            model.addAttribute("list", this.serviceHD.filterByTrangThai(pageable, trangThai));
            model.addAttribute("read", "hoaDon/filter?trangThai=" + trangThai + "&"+ "ngayBatDau="  + "&"
                    + "ngayKetThuc=" +"&");
        } else {
            model.addAttribute("list", this.serviceHD.filterByTrangThaiAndDate(pageable, trangThai, ngayBatDau, ngayKetThuc));
            model.addAttribute("read", "hoaDon/filter?trangThai=" + trangThai + "&" + "ngayBatDau=" + ngayBatDau + "&"
                    + "ngayKetThuc=" + ngayKetThuc+"&");
        }

        model.addAttribute("link", "hoaDon");
        model.addAttribute("title", "Chương trình khuyến mại hóa đơn");
        model.addAttribute("hinhThuc", "Hóa đơn - Giảm giá hóa đơn");
        return "giamGia/hoaDon/indexHD";
    }

    @GetMapping("updateForm")
    public String updateFormHD(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaHoaDon hd = this.serviceHD.getOne(id);
        hd.setNgaySua(LocalDate.now().toString());
        
        model.addAttribute("ctggHD", hd);
        model.addAttribute("button", "Sửa");
        return "giamGia/hoaDon/updateHD";
    }

    @PostMapping("updateForm")
    public String update(@ModelAttribute("ctggHD") ChuongTrinhGiamGiaHoaDon gg, @RequestParam("id") UUID id) {
        this.serviceHD.update(gg, id);
        return "redirect:/chuongTrinhGiamGia/hoaDon";
    }

    @GetMapping("createForm")
    public String getGiamGia(Model model) {
        ctggHD.setNgayTao(LocalDate.now().toString());
        ctggHD.setNgaySua(LocalDate.now().toString());
        ctggHD.setTrangThai(1);
        model.addAttribute("ctggHD", ctggHD);
        model.addAttribute("action", "createForm");
        model.addAttribute("button", "Thêm");
        return "giamGia/hoaDon/updateHD";
    }

    @PostMapping("createForm")
    public String add(@ModelAttribute("ctggHD") ChuongTrinhGiamGiaHoaDon gg) {
        this.serviceHD.add(gg);
        return "redirect:/chuongTrinhGiamGia/hoaDon";
    }

    @GetMapping("detail")
    public String detail(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaHoaDon ctggHD = this.serviceHD.getOne(id);
        List<ChuongTrinhGiamGiaChiTietHoaDon> list = this.serviceCTHD.getById(ctggHD);
        model.addAttribute("ctggHD", ctggHD);
        model.addAttribute("list", list);
        return "giamGia/hoaDon/detail";
    }

    @PostMapping("/importExcel")
    public String impotExcel(@RequestParam("file") MultipartFile file) {
        try {
            this.serviceHD.addAll(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/chuongTrinhGiamGia/hoaDon";
    }

    @GetMapping("history")
    public String getHistory(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("list", this.serviceHD.filterByTrangThai(pageable, -1));
        model.addAttribute("link", "hoaDon");
        model.addAttribute("read", "hoaDon/history?");
        return "giamGia/hoaDon/history";
    }

}
