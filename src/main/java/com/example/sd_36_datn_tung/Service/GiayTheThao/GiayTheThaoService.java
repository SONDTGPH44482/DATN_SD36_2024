package com.example.sd_36_datn_tung.Service.GiayTheThao;


import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoRepository;
import com.example.sd_36_datn_tung.Service.impl.GiayTheThaoImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GiayTheThaoService implements GiayTheThaoImpl {

    @Autowired
    private GiayTheThaoRepository giayTheThaoRepository;
//tim kiem cac giay thể thao
    public List<GiayTheThao> findGiayTheThao(String tenGiayTheThao){

        if(tenGiayTheThao !=null){

            return giayTheThaoRepository.findByTenGiayTheThao(tenGiayTheThao);

        }else{

             return giayTheThaoRepository.findAll();

        }

    }
//view sp ra ban hang
    @Override
    public List<GiayTheThao> getAll() {

        return this.giayTheThaoRepository.findAll();
    }

    @Override
    public List<GiayTheThao> getAllWithoutInCTGGCTSP(UUID id) {
        return this.giayTheThaoRepository.getAllWithoutInCTGGCTSP();
    }

    @Override
    public GiayTheThao getOne(UUID id) {
        return this.giayTheThaoRepository.findById(id).get();
    }


    public int countGttInCtgg() {
        return this.giayTheThaoRepository.countGttInCtgg();
    }
    public void update(GiayTheThao gtt){
        giayTheThaoRepository.save(gtt);
    }
}
