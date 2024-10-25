package com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh;


import com.example.sd_36_datn_tung.Model.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ThuongHieuRepository extends JpaRepository<ThuongHieu, UUID> {

    Page<ThuongHieu> findByTenThuongHieuContaining(String ten, Pageable pageable);

}
