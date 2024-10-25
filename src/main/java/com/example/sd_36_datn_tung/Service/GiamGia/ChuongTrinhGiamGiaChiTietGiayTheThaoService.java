package com.example.sd_36_datn_tung.Service.GiamGia;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietGiayTheThao;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaGiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Repository.GiamGia.ChuongTrinhGiamGiaChiTietGiayTheThaoRepository;
import com.example.sd_36_datn_tung.Service.impl.ChuongTrinhGiamGiaChiTietGiayTheThaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ChuongTrinhGiamGiaChiTietGiayTheThaoService implements ChuongTrinhGiamGiaChiTietGiayTheThaoImpl {

    @Autowired
    private ChuongTrinhGiamGiaChiTietGiayTheThaoRepository repo;

    @Override
    public void add(ChuongTrinhGiamGiaChiTietGiayTheThao gg) {
        this.repo.save(gg);
    }

    @Override
    public void update(ChuongTrinhGiamGiaChiTietGiayTheThao gg1, UUID id) {
        ChuongTrinhGiamGiaChiTietGiayTheThao gg2 = this.repo.findById(id).get();
        gg2.setChuongTrinhGiamGiaGiayTheThao(gg1.getChuongTrinhGiamGiaGiayTheThao());
        gg2.setGiayTheThao(gg1.getGiayTheThao());
        gg2.setSoTienDaGiam(gg1.getSoTienDaGiam());
        gg2.setGhiChu(gg1.getGhiChu());
        gg2.setNgayTao(gg1.getNgayTao());
        gg2.setNgaySua(gg1.getNgaySua());
        gg2.setTrangThai(gg1.getTrangThai());
        this.repo.save(gg2);
    }

    @Override
    public void deleteByCTGGandGTT(UUID gg, UUID gtt) {
        this.repo.deleteByChuongTrinhGiamGiaGiayTheThaoAndGiayTheThao(gg, gtt);
    }

    @Override
    public List<ChuongTrinhGiamGiaChiTietGiayTheThao> getAllByCTGG(ChuongTrinhGiamGiaGiayTheThao gg) {
        return this.repo.findAllByChuongTrinhGiamGiaGiayTheThao(gg);
    }


    @Override
    public List<ChuongTrinhGiamGiaChiTietGiayTheThao> getList() {
        return this.repo.findAll();
    }

    @Override
    public Page<ChuongTrinhGiamGiaChiTietGiayTheThao> pagination(Pageable pageable) {

        return this.repo.findAll(pageable);
    }

    @Override
    public ChuongTrinhGiamGiaChiTietGiayTheThao getByCTGGAndGTT(ChuongTrinhGiamGiaGiayTheThao gg, GiayTheThao gtt) {
        return this.repo.findByChuongTrinhGiamGiaGiayTheThaoAndGiayTheThao(gg, gtt);
    }

    @Override
    public void deleteById(UUID id) {
        this.repo.deleteById(id);
    }


    public ChuongTrinhGiamGiaChiTietGiayTheThao getByGiayTheThao(GiayTheThao gtt) {
        return repo.findByGiayTheThao(gtt);
    }
    public void SaveAll(List<ChuongTrinhGiamGiaChiTietGiayTheThao> list){
        this.repo.saveAll(list);
    }
    public List<GiayTheThao> getAllGiayTheThaoByChuongTrinhGiamGia(ChuongTrinhGiamGiaGiayTheThao gg){
        return repo.findAllGiayTheThaobyChuongTrinhGiamGia(gg);
    }
}
