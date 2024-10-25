package com.example.sd_36_datn_tung.Controller.SanPham;


import com.example.sd_36_datn_tung.Model.User;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.UserRepository;
import com.example.sd_36_datn_tung.Service.SanPham.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    //Todo code check trùng email
    private boolean emailCheckTrung(String email){

        for (User user : userRepository.findAll()){

            if(user.getEmail().equalsIgnoreCase(email)){

                return true;//Email đã tồn tại

            }
        }

        return false;

    }

    @GetMapping()
    public String form(){

        return "User/index";

    }

    @GetMapping("/hien-thi")
    public String hienThi(Model model, @RequestParam(name = "num",defaultValue = "0") Integer num) {
        Page<User> userPage = userRepository.findAll(PageRequest.of(num,3));
        model.addAttribute("list", userPage.getContent());
        model.addAttribute("next",num);
        model.addAttribute("totalPages", userPage.getTotalPages());
        return "/User/index";
    }
    @GetMapping("/search")
    public String searchByName(@RequestParam("ten") String ten, Model model) {
        List<User> searchResults = userService.searchByTen(ten);
        model.addAttribute("list", searchResults);
        return "/User/index";
    }
    @GetMapping("/loc")
    public String loc(@RequestParam("trangThai") Integer trangThai, Model model) {
        List<User> searchResults = userService.searchByTrangThai(trangThai);
        model.addAttribute("list", searchResults);
        return "/User/index";
    }

    @GetMapping("/view-add")
    public String viewadd(Model model){
        model.addAttribute("user",new User());
        return "User/view-add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("user") @Valid User user,
                      BindingResult bindingResult,
                      Model model){

        if(bindingResult.hasErrors()){

            model.addAttribute("user",user);
            return "User/view-add";

        }else {

            //Check trống dữ liệu

            //Check trống
            if(user.getEmail() == null
                    || user.getEmail().trim().length()==0
                    || user.getEmail().isEmpty()){

                model.addAttribute("erEmail","Không được để trống email");
                return "User/view-add";

            }

            if(!user.getEmail().endsWith("@gmail.com")){

                model.addAttribute("erEmail1", "Email phải có đuôi @gmail.com");
                return "User/view-add";

            }

            //Check tên email nhập kí tự số đầu tiên
            if (user.getEmail().matches("^\\d.*") ||
                    !user.getEmail().matches(".*[a-zA-Z].*")) {
                model.addAttribute("erCheckEmailSo", "Tên Email  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
                return "User/view-add";

            }

            Pattern pattern = Pattern.compile("^[^-0-9].*");
            Matcher matcher = pattern.matcher(user.getEmail());

            if (!matcher.matches()) {

                model.addAttribute("erCheckEmail", "Email thao không hợp lệ!");
                return "User/view-add";

            }

            //Check trùng email
            if(emailCheckTrung(user.getEmail())){

                model.addAttribute("erCheckEmailTrung","Xin lỗi email này đã tồn tại !");
                return "User/view-add";

            }

            //Check mật khẩu
            if(user.getMatKhau() == null ||
                    user.getEmail().trim().length() ==0
                    || user.getEmail().isEmpty()){

                model.addAttribute("checkPass","Mật khẩu không được để trống !");
                return "User/view-add";

            }

            if(user.getMatKhau().trim().length() < 6){

                model.addAttribute("checkPasslengh","Mật khẩu phải lớn hơn 5 ký tự !");
                return "User/view-add";

            }

            //Check tên user

            if(user.getTenUser() == null ||
                    user.getTenUser().trim().length()==0
                    || user.getTenUser().isEmpty()){

                model.addAttribute("tenUser","Không được để trống tên user");
                return "User/view-add";

            }

            if (user.getTenUser().matches("^\\d.*") ||
                    !user.getTenUser().matches(".*[a-zA-Z].*")) {
                model.addAttribute("erCheckTen", "Tên phải là chữ");
                return "User/view-add";

            }

            //Check số điện thoại

            if(user.getSoDienThoai() == null
                    || user.getSoDienThoai().trim().length()==0
                    || user.getSoDienThoai().isEmpty()){

                model.addAttribute("erCheckSĐT","Không được để trống số điện thoại !");
                return "User/view-add";

            }

            try{

                int soDienThoai = Integer.parseInt(user.getSoDienThoai());

                if(soDienThoai < 0){

                    model.addAttribute("erCheckSĐTString","Số điện thoại không được nhỏ hơn 0");
                    return "User/view-add";

                }

            }catch (NumberFormatException e){

                e.printStackTrace();
                model.addAttribute("erCheckSĐTStringNumber","Số điện thoại không được là chữ !");
                return "User/view-add";

            }

            String phoneNumberRegex = "^0\\d{9}$";

            if (!user.getSoDienThoai().matches(phoneNumberRegex)) {

                model.addAttribute("erLogSoDienThoaiNumber", "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại bắt đầu bằng số 0 và có độ dài là 10 số.");
                return "User/view-add";

            }

            if(user.getDiaChi()== null
                    || user.getDiaChi().trim().length() ==0
                    || user.getDiaChi().isEmpty()){

                model.addAttribute("erCheckDiaChiNull","Địa chỉ không được để trống !");
                return "User/view-add";

            }

            if (user.getDiaChi().matches("^\\d.*") ||
                    !user.getDiaChi().matches(".*[a-zA-Z].*")) {

                model.addAttribute("erCheckDiaChiSo", "Địa chỉ  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
                return "User/view-add";

            }

            LocalTime localTime = LocalTime.now();
            LocalDate ngayTao = LocalDate.now();
            String ngayTaoDate = ngayTao.toString();

            user.setNgayTao(ngayTaoDate);
            user.setMaUser("maUser"+ localTime.getHour() + localTime.getMinute() + localTime.getSecond());

            userService.save(user);
            return "redirect:/user/hien-thi";
        }
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable UUID id){
        userService.delete(id);
        return "redirect:/user/hien-thi";
    }


    @GetMapping("/detail/{id}")
    public String detail(@PathVariable UUID id, Model model){
        User user = userService.getOne(id);
        model.addAttribute("user",user);
        return "User/detail";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable("id") UUID id,User user,Model model){

        //Todo code check

        if(user.getMatKhau() == null ||
                user.getEmail().trim().length() ==0
                || user.getEmail().isEmpty()){

            model.addAttribute("checkPass","Mật khẩu không được để trống !");
            return "User/detail";

        }

        if(user.getMatKhau().trim().length() < 6){

            model.addAttribute("checkPasslengh","Mật khẩu phải lớn hơn 5 ký tự !");
            return "User/detail";

        }

        //Check tên user

        if(user.getTenUser() == null ||
                user.getTenUser().trim().length()==0
                || user.getTenUser().isEmpty()){

            model.addAttribute("tenUser","Không được để trống tên user");
            return "User/detail";

        }

        if (user.getTenUser().matches("^\\d.*") ||
                !user.getTenUser().matches(".*[a-zA-Z].*")) {
            model.addAttribute("erCheckTen", "Tên phải là chữ");
            return "User/detail";

        }

        //Check số điện thoại

        if(user.getSoDienThoai() == null
                || user.getSoDienThoai().trim().length()==0
                || user.getSoDienThoai().isEmpty()){

            model.addAttribute("erCheckSĐT","Không được để trống số điện thoại !");
            return "User/detail";

        }

        try{

            int soDienThoai = Integer.parseInt(user.getSoDienThoai());

            if(soDienThoai < 0){

                model.addAttribute("erCheckSĐTString","Số điện thoại không được nhỏ hơn 0");
                return "User/detail";

            }

        }catch (Exception e){

            e.printStackTrace();
            return "User/detail";

        }

        String phoneNumberRegex = "^0\\d{9}$";

        if (!user.getSoDienThoai().matches(phoneNumberRegex)) {

            model.addAttribute("erLogSoDienThoaiNumber", "Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại bắt đầu bằng số 0 và có độ dài là 10 số.");
            return "User/detail";

        }

        if(user.getDiaChi()== null
                || user.getDiaChi().trim().length() ==0
                || user.getDiaChi().isEmpty()){

            model.addAttribute("erCheckDiaChiNull","Địa chỉ không được để trống !");
            return "User/detail";

        }

        if (user.getDiaChi().matches("^\\d.*") ||
                !user.getDiaChi().matches(".*[a-zA-Z].*")) {

            model.addAttribute("erCheckDiaChiSo", "Địa chỉ  không hợp lệ!, Phải bắt đầu bằng chữ cái đầu tiên!");
            return "User/detail";

        }

        userService.save(user);
        return "redirect:/user/hien-thi";
    }


}
