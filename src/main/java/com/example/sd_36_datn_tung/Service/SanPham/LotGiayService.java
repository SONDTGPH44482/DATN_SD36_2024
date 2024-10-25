package com.example.sd_36_datn_tung.Service.SanPham;

import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.LotGiayRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LotGiayService {
    @Autowired
    private LotGiayRepository lotGiayRepository;
}
