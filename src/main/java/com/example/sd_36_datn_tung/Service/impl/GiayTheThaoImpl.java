package com.example.sd_36_datn_tung.Service.impl;



import com.example.sd_36_datn_tung.Model.GiayTheThao;

import java.util.List;
import java.util.UUID;

public interface GiayTheThaoImpl {

    public List<GiayTheThao> getAll();

    public List<GiayTheThao> getAllWithoutInCTGGCTSP(UUID id);

    public GiayTheThao getOne(UUID id);

}
