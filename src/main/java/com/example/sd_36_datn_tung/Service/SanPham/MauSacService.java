package com.example.sd_36_datn_tung.Service.SanPham;
import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.MauSac;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.MauSacRepository;
import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class MauSacService {
    @Autowired
    private MauSacRepository mauSacRepository;
    @Autowired
    private GiayTheThaoService gttService;


    public List<MauSac> findMauSac(String tenMauSac) {
        if (tenMauSac != null) {
            return mauSacRepository.findByTenMauSac(tenMauSac);
        } else {
            return mauSacRepository.findAll();
        }
    }
    //ban hang
    public List<MauSac> getAllByIdGtt(UUID idGtt) {
        GiayTheThao gtt = gttService.getOne(idGtt);
        return mauSacRepository.findByGtt(gtt);
    }

}
