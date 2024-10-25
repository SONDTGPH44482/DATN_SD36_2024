package com.example.sd_36_datn_tung.Service.impl;


import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public interface ChuongTrinhGiamGiaHoaDonImpl {

    public void add(ChuongTrinhGiamGiaHoaDon gg);

    public void addAll(MultipartFile file) throws IOException;

    public void update(ChuongTrinhGiamGiaHoaDon gg, UUID id);

    public ChuongTrinhGiamGiaHoaDon getOne(UUID id);

    public List<ChuongTrinhGiamGiaHoaDon> getList();

    public Page<ChuongTrinhGiamGiaHoaDon> pagination(Pageable pageable);

    public Page<ChuongTrinhGiamGiaHoaDon> search(Pageable pageable, String name);

    public Page<ChuongTrinhGiamGiaHoaDon> filterByTrangThai(Pageable pageable, int name);

    public Page<ChuongTrinhGiamGiaHoaDon> filterByTrangThaiAndDate(Pageable pageable, int tt, String nbd, String nkt);

    public void updateTrangThai();

    public Page<ChuongTrinhGiamGiaHoaDon> filterByTTChuaHetHan(Pageable pageable);


    //Todo code thanh toán áp dụng cho chương trình giảm giá hóa đơn
    List<ChuongTrinhGiamGiaHoaDon> findBySlandTt(String sl, BigDecimal tt);



}
