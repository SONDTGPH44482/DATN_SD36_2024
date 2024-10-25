package com.example.sd_36_datn_tung.Service.impl;


import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaGiayTheThao;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

public interface ChuongTrinhGiamGiaGiayTheThaoImpl {

    public void add(ChuongTrinhGiamGiaGiayTheThao gg);

    public void update(ChuongTrinhGiamGiaGiayTheThao gg, UUID id);

    public void addAll(MultipartFile file) throws IOException;

    public ChuongTrinhGiamGiaGiayTheThao getOne(UUID id);

    public List<ChuongTrinhGiamGiaGiayTheThao> getList();

    public Page<ChuongTrinhGiamGiaGiayTheThao> pagination(Pageable pageable);

    public Page<ChuongTrinhGiamGiaGiayTheThao> search(Pageable pageable, String name);

    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTrangThai(Pageable pageable, int name);

    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTrangThaiAndDate(Pageable pageable, int tt, String nbd, String nkt);

    public void updateTrangThai();


    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTTChuaHetHan(Pageable pageable);


}
