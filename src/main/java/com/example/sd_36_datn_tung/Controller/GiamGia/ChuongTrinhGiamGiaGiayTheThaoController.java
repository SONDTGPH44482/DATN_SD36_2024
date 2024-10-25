package com.example.sd_36_datn_tung.Controller.GiamGia;



import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietGiayTheThao;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaGiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaChiTietGiayTheThaoService;
import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaGiayTheThaoService;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoChiTietService;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("chuongTrinhGiamGia/sanPham")
public class ChuongTrinhGiamGiaGiayTheThaoController {

    @Autowired
    private ChuongTrinhGiamGiaGiayTheThaoService serviceSP;

    @Autowired
    private ChuongTrinhGiamGiaChiTietGiayTheThaoService serviceCTSP;

    @Autowired
    private GiayTheThaoService service;

    @Autowired
    private GiayTheThaoChiTietService gttctService;

    private ChuongTrinhGiamGiaGiayTheThao ctggSP = new ChuongTrinhGiamGiaGiayTheThao();

    @GetMapping("")
    public String getGiamGiaSP(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);

        this.serviceSP.updateTrangThai();
        model.addAttribute("list", serviceSP.filterByTTChuaHetHan(pageable));
        model.addAttribute("title", "Chương trình khuyến mại sản phẩm");
        model.addAttribute("link", "sanPham");
        model.addAttribute("read", "sanPham?");
        model.addAttribute("hinhThuc", "Giảm giá sản phẩm");
        return "giamGia/sanPham/indexSP";
    }

    @GetMapping("search")
    public String searchSP(Model model, @RequestParam(name = "page", defaultValue = "1") int page,
                           @RequestParam("name") String name) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("list", this.serviceSP.search(pageable, name));
        model.addAttribute("read", "sanPham/search?name=" + name + "&");
        model.addAttribute("link", "sanPham");
        model.addAttribute("title", "Chương trình khuyến mại sản phẩm");
        model.addAttribute("hinhThuc", "Giảm giá sản phẩm");
        return "giamGia/sanPham/indexSP";
    }

    @GetMapping("filter")
    public String filterHD(Model model, @RequestParam(name = "page", defaultValue = "1") int page,
                           @RequestParam("trangThai") int trangThai,
                           @RequestParam("ngayBatDau") String ngayBatDau,
                           @RequestParam("ngayKetThuc") String ngayKetThuc) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("list", this.serviceSP.filterByTrangThai(pageable, trangThai));
        // model.addAttribute("read", "hoaDon/search?name="+name+"&");
        model.addAttribute("read", "sanPham/filter?trangThai=" + trangThai + "&");

        if (ngayBatDau.length() <= 0 && ngayKetThuc.length() <= 0) {
            model.addAttribute("list", this.serviceSP.filterByTrangThai(pageable, trangThai));
            model.addAttribute("read", "sanPham/filter?trangThai=" + trangThai + "&");
        } else {
            model.addAttribute("list",
                    this.serviceSP.filterByTrangThaiAndDate(pageable, trangThai, ngayBatDau, ngayKetThuc));
            model.addAttribute("read", "sanPham/filter?trangThai=" + trangThai + "&" + "ngayBatDau=" + ngayBatDau + "&"
                    + "ngayKetThuc=" + ngayKetThuc + "&");
        }

        model.addAttribute("link", "sanPham");
        model.addAttribute("title", "Chương trình khuyến mại sản phẩm");
        model.addAttribute("hinhThuc", "Giảm giá sản phẩm");
        return "giamGia/sanPham/indexSP";
    }

    @GetMapping("updateForm")
    public String getupdateFormSP(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaGiayTheThao ctgg = this.serviceSP.getOne(id);
        ctgg.setNgaySua(LocalDate.now().toString());
        model.addAttribute("ctggSP", ctgg);
        model.addAttribute("action", "");
        model.addAttribute("button", "Sửa");
        return "giamGia/sanPham/updateSP";
    }

    @PostMapping("updateForm")
    public String updateFormSP(@ModelAttribute("ctggSP") ChuongTrinhGiamGiaGiayTheThao gg,
                               @RequestParam("id") UUID id) {

        this.serviceSP.update(gg, id);
        return "redirect:/chuongTrinhGiamGia/sanPham";
    }

    @GetMapping("createForm")
    public String getGiamGia(Model model) {
        ctggSP.setNgayTao(LocalDate.now().toString());
        ctggSP.setNgaySua(LocalDate.now().toString());
        ctggSP.setTrangThai(1);
        // model.addAttribute("list", this.service.getAll());
        model.addAttribute("ctggSP", ctggSP);
        // model.addAttribute("ctggCTSP", ctggCTSP);
        model.addAttribute("action", "");
        model.addAttribute("button", "Thêm");
        return "giamGia/sanPham/updateSP";
    }

    @PostMapping("createForm")
    public String add(@ModelAttribute("ctggSP") ChuongTrinhGiamGiaGiayTheThao gg) {
        this.serviceSP.add(gg);
        return "redirect:/chuongTrinhGiamGia/sanPham";
    }

    @GetMapping("detail")
    public String detail(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaGiayTheThao ctggSP = this.serviceSP.getOne(id);
        List<ChuongTrinhGiamGiaChiTietGiayTheThao> list = this.serviceCTSP.getAllByCTGG(ctggSP);
        model.addAttribute("ctggSP", ctggSP);
        model.addAttribute("list", list);
        model.addAttribute("id", id);
        return "giamGia/sanPham/detail";
    }

    @GetMapping("detailSP")
    public String detailProductHistory(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaGiayTheThao ctggSP = this.serviceSP.getOne(id);
        List<ChuongTrinhGiamGiaChiTietGiayTheThao> list = this.serviceCTSP.getAllByCTGG(ctggSP);
        model.addAttribute("ctggSP", ctggSP);
        model.addAttribute("list", list);
        model.addAttribute("id", id);
        return "giamGia/sanPham/detailSP";
    }

    @GetMapping("apply")
    public String apply(@RequestParam("id") UUID id, Model model) {
        ChuongTrinhGiamGiaGiayTheThao ctggSP = this.serviceSP.getOne(id);
        List<GiayTheThao> list = this.service.getAllWithoutInCTGGCTSP(id);
        model.addAttribute("ctggSP", ctggSP);
        model.addAttribute("list", list);
        model.addAttribute("id", id);
        return "giamGia/sanPham/apply";
    }

//    @PostMapping("apply")
//    public String applyProduct(@RequestParam("id") UUID id, @RequestBody List<String> list, Model model) {
//        ChuongTrinhGiamGiaGiayTheThao ctggGiayTheThao = this.serviceSP.getOne(id);
//        System.out.println("Phần trăm giảm: " + ctggGiayTheThao.getPhanTramGiam());
//
//        for (String str : list) {
//            UUID idProduct = UUID.fromString(str);
//            GiayTheThao product = this.service.getOne(idProduct);
//
//            Double giaBan = Double.parseDouble(product.getGiaBan());
//            BigDecimal soTienDaGiam = BigDecimal
//                    .valueOf(giaBan * ctggGiayTheThao.getPhanTramGiam() / 100);
//            product.setSoTienDaGiam(soTienDaGiam);
//            service.update(product);
//            ChuongTrinhGiamGiaChiTietGiayTheThao ctggCTProduct = new ChuongTrinhGiamGiaChiTietGiayTheThao();
//            ctggCTProduct.setChuongTrinhGiamGiaGiayTheThao(ctggGiayTheThao);
//            ctggCTProduct.setGiayTheThao(product);
//            ctggCTProduct.setSoTienDaGiam(soTienDaGiam);
//            ctggCTProduct.setGhiChu("N/A");
//            ctggCTProduct.setNgayTao(LocalDate.now().toString());
//            ctggCTProduct.setNgaySua(LocalDate.now().toString());
//            ctggCTProduct.setTrangThai(1);
//            this.serviceCTSP.add(ctggCTProduct);
//
//        }
//
//
//
//        return "redirect:/chuongTrinhGiamGia/sanPham";
//    }

    @PostMapping("unapply")
    public String unapplyProduct(@RequestParam("id") UUID id, @RequestBody List<String> list, Model model) {
        ChuongTrinhGiamGiaGiayTheThao ctggGiayTheThao = this.serviceSP.getOne(id);

        if (list.size() > 0) {
            for (String str : list) {
                UUID idProduct = UUID.fromString(str);
                GiayTheThao product = this.service.getOne(idProduct);
                product.setSoTienDaGiam(new BigDecimal(0));
                service.update(product);
                ChuongTrinhGiamGiaChiTietGiayTheThao ctgg = this.serviceCTSP.getByCTGGAndGTT(ctggGiayTheThao, product);
                this.serviceCTSP.deleteById(ctgg.getId());
            }

        }


        return "giamGia/sanPham/detail";
    }

    @PostMapping("/importExcel")
    public String impotExcel(@RequestParam("file") MultipartFile file) {
        try {
            this.serviceSP.addAll(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/chuongTrinhGiamGia/sanPham";
    }

    @GetMapping("/history")
    public String history(Model model, @RequestParam(name = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("list", this.serviceSP.filterByTrangThai(pageable, -1));
        model.addAttribute("link", "sanPham");
        model.addAttribute("read", "sanPham/history?");
        return "giamGia/sanPham/history";
    }
}
