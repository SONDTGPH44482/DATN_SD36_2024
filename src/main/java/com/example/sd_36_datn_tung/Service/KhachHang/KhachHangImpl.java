package com.example.sd_36_datn_tung.Service.KhachHang;




import com.example.sd_36_datn_tung.Model.KhachHang;

import java.util.UUID;

public interface KhachHangImpl {

    KhachHang findById(UUID id);

    KhachHang findByEmail(String email);

    void update(UUID id, KhachHang update);

}
