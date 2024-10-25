package com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh;


import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SizeRepository extends JpaRepository<Size, UUID> {
    @Query("SELECT s FROM Size s where s in (select gttct.size from GiayTheThaoChiTiet gttct where gttct.giayTheThao =:gtt)")
    public List<Size> getSizeByGtt(GiayTheThao gtt);
}
