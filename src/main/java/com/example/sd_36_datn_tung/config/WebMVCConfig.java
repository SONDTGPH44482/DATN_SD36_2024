package com.example.sd_36_datn_tung.config;


import com.example.sd_36_datn_tung.filter.LogGinInterceptor;
import com.example.sd_36_datn_tung.filter.adminInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class WebMVCConfig implements WebMvcConfigurer {

	//Cấu hình cho file ảnh
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
          .addResourceHandler("/resources/**")
          .addResourceLocations("/resources/");
        registry
        .addResourceHandler("/upload/**")
        .addResourceLocations("/upload/");
    }


    //Todo code quên mật khẩu khách hàng



    //Todo code phân quyền cho bên Admin

    @Autowired
    LogGinInterceptor logGinInterceptor;

    @Autowired
    adminInterceptor adminInterceptor;

    public void addInterceptors(InterceptorRegistry registry){

        //Member
        registry.addInterceptor(logGinInterceptor)
                .addPathPatterns(
                        //Trang chủ
                        "/TrangChu/Admin/home",
                        "/BanHangTaiQuay",
                        //Giầy thể thao
                        "/GiayTheThao/listGiayTheThao",
                        //Khách hàng
                        "/KhachHang/list",
                        //Phiếu giao hàng
                        "/PhieuGiaoHang/listPhieuGiaoHang",
                        //Xác nhận thông tin đơn hàng
                        "/Admin/xacNhanDonHangKhachHangAll",
                        "/Admin/xacNhanDonHangKhachHang",
                        "/Admin/XacNhanHoaDonDangDongGoi",
                        "/Admin/HoaDon/XacNhanHoaDonKhachHangDangGiao",
                        "/Admin/HoaDon/XacNhanHoaDonGiaoHangThanhCongHoanThanh",
                        //Thay đổi thông tin cá nhân
                        "/TrangChu/ThongTinCaNhan/Admin"


                );

        //Dành cho Admin
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns(
                        //Todo gắn link check phân quyền admin
                        //Giầy thể thao
                        "/BanHangTaiQuay",
                        "/GiayTheThao/create",
                        "/GiayTheThao/update/{id}",
                        "/GiayTheThao/exportPDF",
                        "/GiayTheThao/exportExcal",
                        //Nhân viên hoặc user
                        "/user/view-add",
                        "/user/hien-thi",
                        "/user/detail/{id}",
                        //Màu sắc
                        "/MauSac/list",
                        "/MauSac/view-create",
                        "/MauSac/edit/{id}",
                        "/MauSac/search",
                        "/MauSac/delete/{id}",
                        //Bảng size
                        "/Size/hien-thi",
                        "/Size/view-add",
                        "/Size/delete/{id}",
                        "/Size/detail/{id}",
                        //Bảng khuyễn mại
                        "/chuongTrinhGiamGia/sanPham",
                        "/chuongTrinhGiamGia/sanPham/createForm",
                        "/chuongTrinhGiamGia/hoaDon",
                        "/chuongTrinhGiamGia/hoaDon/createForm",
                        "/chuongTrinhGiamGia/hoaDon/history",
                        //Thống kê
                        "/thongKeChuanData",
                        //Cổ giầy
                        "/CoGiay/list",
                        "/CoGiay/view-create",
                        "/CoGiay/edit/{id}",
                        "/CoGiay/search",
                        "/CoGiay/delete/{id}",
                        //Kiểu buộc
                        "/kieuBuoc/hien-thi",
                        "/kieuBuoc/view-add",
                        "/kieuBuoc/search",
                        "/kieuBuoc/detail/{id}",
                        //Chất liệu
                        "/chatLieu/hien-thi",
                        "/chatLieu/view-add",
                        "/chatLieu/detail/{id}",
                        //Công dụng
                        "/congDung/hien-thi",
                        "/congDung/view-add",
                        "/congDung/detail/{id}",
                        //Dây giầy
                        "/dayGiay/hien-thi",
                        "/dayGiay/view-add",
                        "/dayGiay/detail/{id}",
                        //Đế giầy
                        "/deGiay",
                        "/deGiay/create",
                        "deGiay/edit/{id}",
                        //Đinh tán giầy
                        "/dinhTanGiay/hien-thi",
                        "/dinhTanGiay/view-add",
                        "/dinhTanGiay/detail/{id}",
                        //Thương hiệu
                        "/thuongHieu",
                        "/thuongHieu/create",
                        "/thuongHieu/edit/{id}",
                        //Trọng lượng
                        "/trongLuong/hien-thi",
                        "/trongLuong/view-add",
                        "/trongLuong/detail/{id}",
                        //Form
                        "/form/hien-thi",
                        "/form/view-add",
                        "/form/detail/{id}",
                        //Chất liệu
                        "/chatLieu/hien-thi",
                        "/chatLieu/view-add",
                        "/chatLieu/detail/{id}",
                        //Hướng dẫn bảo quản
                        "/HuongDanBaoQuan/list",
                        "HuongDanBaoQuan/edit/{id}",
                        "/HuongDanBaoQuan/delete/{id}",
                        //Lót giầy
                        "LotGiay/list",
                        "/LotGiay/create",
                        "/LotGiay/edit/{id}",
                        "/LotGiay/delete/{id}",
                        //Xóa đơn hàng khi hủy
                        "/Admin/HoaDon/DonHangBiHuy"

                        );

    }





}
