package com.example.sd_36_datn_tung.Service.GiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThaoChiTiet;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GiayTheThaoChiTietService {

    @Autowired
    private GiayTheThaoChiTietRepository repo;

    //Todo code bán hàng tại quầy
    public List<GiayTheThaoChiTiet> getAll(){

        return repo.findAll();

    }

    public List<GiayTheThaoChiTiet> searchByName(String name) {
        System.out.println("Name: "+name);
        return repo.findAllByNameProduct(name);
    }
//dung de khoi tao mau sac and size
    public GiayTheThaoChiTiet getByGttMsSize(UUID idGtt, UUID idMauSac, UUID idSize) {

        return repo.findByGiayTheThaoAndSizeAndMauSac(idGtt, idSize, idMauSac);
    }
    public void saveAll(List<GiayTheThaoChiTiet> list) {
        repo.saveAll(list);
    }
    public List<GiayTheThaoChiTiet> getAllByGiayTheThao(GiayTheThao gtt) {
        return repo.findByGiayTheThao(gtt);
    }
}
