package com.example.sd_36_datn_tung.Controller.SanPham;



import com.example.sd_36_datn_tung.Model.DayGiay;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.DayGiayRepository;
import com.example.sd_36_datn_tung.Service.SanPham.DayGiayService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/dayGiay")
public class DayGiayController {
    @Autowired
    private DayGiayService dayGiayService;
    @Autowired
    private DayGiayRepository dayGiayRepository;


    @GetMapping()
    public String form(){

        return "KieuBuoc/index";

    }

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(name = "num",defaultValue = "0") Integer num) {
        Page<DayGiay> dayGiayPage = dayGiayRepository.findAll(PageRequest.of(num,3));
        model.addAttribute("list", dayGiayPage.getContent());
        model.addAttribute("next",num);
        model.addAttribute("totalPages", dayGiayPage.getTotalPages());
        return "/DayGiay/index";
    }
    @GetMapping("/search")
    public String searchByName(@RequestParam("tenDayGiay") String tenDayGiay, Model model) {
        List<DayGiay> searchResults = dayGiayService.searchByTen(tenDayGiay);
        model.addAttribute("list", searchResults);
        return "/DayGiay/index";
    }
    @GetMapping("/filter")
    public String filter(@RequestParam("trangThai") int trangThai, Model model) {
        List<DayGiay> searchResults = dayGiayService.getAll();
        List<DayGiay> list = new ArrayList<>();
        if(trangThai!=2){
            for (DayGiay kieu : searchResults) {
                if(kieu.getTrangThai()==trangThai){
                    list.add(kieu);
                }

            }
        } else {
            for (DayGiay kieu : searchResults) {
                list.add(kieu);
            }
        }
        model.addAttribute("list", list);
        return "/DayGiay/index";
    }
    @GetMapping("/view-add")
    public String viewadd(Model model){
        model.addAttribute("dayGiay",new DayGiay());
        return "DayGiay/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("dayGiay") @Valid DayGiay dayGiay,
                      BindingResult bindingResult,
                      Model model){

        if(bindingResult.hasErrors()){
            model.addAttribute("dayGiay",dayGiay);
            return "/DayGiay/view-add";
        }else {
            dayGiayService.save(dayGiay);
            return "redirect:/dayGiay/hien-thi";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable UUID id){
        dayGiayService.delete(id);
        return "redirect:/dayGiay/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable UUID id, Model model){
        DayGiay dayGiay = dayGiayService.getOne(id);
        model.addAttribute("dayGiay",dayGiay);
        return "DayGiay/detail";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") String id, DayGiay dayGiay){
        dayGiayService.save(dayGiay);
        return "redirect:/dayGiay/hien-thi";
    }

}
