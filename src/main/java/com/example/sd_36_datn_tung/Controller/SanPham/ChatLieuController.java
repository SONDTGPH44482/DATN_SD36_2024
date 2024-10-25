package com.example.sd_36_datn_tung.Controller.SanPham;


import com.example.sd_36_datn_tung.Model.ChatLieu;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.ChatLieuRepository;
import com.example.sd_36_datn_tung.Service.SanPham.ChatLieuService;
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
@RequestMapping("/chatLieu")
public class ChatLieuController {
    @Autowired
    private ChatLieuService chatLieuService;
    @Autowired
    private ChatLieuRepository chatLieuRepository;


    @GetMapping()
    public String form(){
        return "ChatLieu/index";
    }

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(name = "num",defaultValue = "0") Integer num) {
        Page<ChatLieu> clPage = chatLieuRepository.findAll(PageRequest.of(num,3));
        model.addAttribute("list", clPage.getContent());
        model.addAttribute("next",num);
        model.addAttribute("totalPages", clPage.getTotalPages());
        return "/ChatLieu/index";
    }
    @GetMapping("/search")
    public String searchByName(@RequestParam("tenChatLieu") String tenChatLieu, Model model) {
        List<ChatLieu> searchResults = chatLieuService.searchByTen(tenChatLieu);
        model.addAttribute("list", searchResults);
        return "/ChatLieu/index";
    }
    @GetMapping("/filter")
    public String filter(@RequestParam("trangThai") int trangThai, Model model) {
        List<ChatLieu> searchResults = chatLieuService.getAll();
        List<ChatLieu> list = new ArrayList<>();
        if(trangThai!=2){
            for (ChatLieu kieu : searchResults) {
                if(kieu.getTrangThai()==trangThai){
                    list.add(kieu);
                }

            }
        } else {
            for (ChatLieu kieu : searchResults) {
                list.add(kieu);
            }
        }
        model.addAttribute("list", list);
        return "/ChatLieu/index";
    }

    @GetMapping("/view-add")
    public String viewadd(Model model){
        model.addAttribute("chatLieu",new ChatLieu());
        return "ChatLieu/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("chatLieu") @Valid ChatLieu chatLieu,
                      BindingResult bindingResult,
                      Model model){

        if(bindingResult.hasErrors()){
            model.addAttribute("chatLieu",chatLieu);
            return "/ChatLieu/view-add";
        }else {
            chatLieuService.save(chatLieu);
            return "redirect:/chatLieu/hien-thi";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable UUID id){
        chatLieuService.delete(id);
        return "redirect:/chatLieu/hien-thi";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable UUID id, Model model){
        ChatLieu chatLieu = chatLieuService.getOne(id);
        model.addAttribute("chatLieu",chatLieu);
        return "ChatLieu/detail";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") String id,ChatLieu chatLieu){
        chatLieuService.save(chatLieu);
        return "redirect:/chatLieu/hien-thi";
    }


}
