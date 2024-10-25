package com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh;

import com.example.sd_36_datn_tung.Model.LotGiay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;


@Repository
public interface LotGiayRepository extends JpaRepository<LotGiay, UUID> {
}
