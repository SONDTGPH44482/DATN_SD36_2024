package com.example.sd_36_datn_tung.Controller.User;


import com.example.sd_36_datn_tung.Model.User;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.UserRepository;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.UUID;

@Controller
@RequestMapping(value = "/UserLog")
public class DangNhapUserController {

    @Autowired
    private UserRepository userRepository;


    @Autowired
    ServletContext context;

    //Todo code check trùng email
    private boolean emailCheckTrung(String email){

        for (User user : userRepository.findAll()){

            if(user.getEmail().equalsIgnoreCase(email)){

                return true;//Email đã tồn tại

            }

        }

        return false;

    }

    //Todo code login cho user
    @GetMapping(value = "/login")
    public String showLoginForm(Model model){

        model.addAttribute("user",new User());
        return "/templates/Admin/Layouts/DangNhap/Login";

    }

    @PostMapping(value = "/login")
    public String saveLoginForm(

            @Valid
            @ModelAttribute("user") User user,
            Model model,
            BindingResult result,
            RedirectAttributes attributes,
            HttpSession session){

        if(result.hasErrors()){

            System.out.println("Đăng nhập thất bại, lỗi");
            return "/templates/Admin/Layouts/DangNhap/Login";

        }

        User userData = userRepository.findByEmailAndAndMatKhau(user.getEmail(),user.getMatKhau());

        //Đăng nhập thành công
        if(userData != null && userData.getTrangThai() == 0){

            String maUser = userData.getMaUser();
            System.out.println("Đăng nhập thành công !");
            session.setAttribute("userLog",userData);
            session.setAttribute("maUser",maUser);
            UUID idUser = userData.getId();
            session.setAttribute("idUser",idUser);


            return "redirect:/UserLog/showSweetAlertLoginAdminSuccess";

        }else if(userData != null && userData.getTrangThai() == 1){

            System.out.println("Tài khoản này đã không còn hoạt động");
            model.addAttribute("messageTrangThai","Tài khoản này đã không còn hoạt động!");
            return "/templates/Admin/Layouts/DangNhap/Login";

        }

            model.addAttribute("messageErol","Email hoặc mật khẩu không đúng hoặc Tài khoản này chưa được tạo!");
            return "/templates/Admin/Layouts/DangNhap/Login";


    }

    //Todo code check login

    @GetMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate(); //Hủy toàn bộ phiên làm việc

        return "redirect:/UserLog/login";

    }


    //Todo code log đăng nhập thành công

    @GetMapping("/showSweetAlertLoginAdminSuccess")
    public String showSweetAlertLogLoginAdmin() {

        return "/templates/Users/Layouts/Log/DangNhapAdminLog";

    }


    //Todo code log check thông báo tài khoản của bạn không được áp dụng cho chức năng này
    @GetMapping("/showLogTaiKhoanKhongApDung")
    public String viewTaiKhoanKhongDuocApDung(Model model){

        return "/templates/Users/Layouts/Log/DangNhapAdminLogTaiKhoan";

    }

}
