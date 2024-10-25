package com.example.sd_36_datn_tung.filter;




import com.example.sd_36_datn_tung.Model.Enum.RoleEnum;
import com.example.sd_36_datn_tung.Model.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class adminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(

            HttpServletRequest request,
            HttpServletResponse response,
            Object handler

    )throws Exception{

        Object object = request.getSession().getAttribute("userLog");//Lưu địa chỉ đăng nhập
        User user = (User) object;

        //Danh cho tài khoản ADMIN
        if (user == null){

            //Chưa login
            response.sendRedirect(request.getContextPath() + "/UserLog/login");
            return false;

        }
        //Check quyền đăng nhập
        if(user.getRole() != RoleEnum.ADMIN){

            response.setStatus(403);
            response.sendRedirect(request.getContextPath() + "/UserLog/showLogTaiKhoanKhongApDung");
            return false;

        }

        return true;

    }


    @Override
    public void postHandle(

            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView

    ) throws Exception {

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);

    }


    @Override
    public void afterCompletion(

            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            Exception ex

    )throws Exception {

        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);

    }


}
