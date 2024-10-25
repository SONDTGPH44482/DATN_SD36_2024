package com.example.sd_36_datn_tung.Service.impl;





import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietHoaDon;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;

import java.util.List;

public interface ChuongTrinhGiamGiaChiTietHoaDonImpl {

    public List<ChuongTrinhGiamGiaChiTietHoaDon> getById(ChuongTrinhGiamGiaHoaDon ctggHD);
    public List<ChuongTrinhGiamGiaChiTietHoaDon> getAllByTrangThaiHD();

}
