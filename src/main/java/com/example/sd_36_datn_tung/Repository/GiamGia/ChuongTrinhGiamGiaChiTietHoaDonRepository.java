package com.example.sd_36_datn_tung.Repository.GiamGia;



import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietHoaDon;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChuongTrinhGiamGiaChiTietHoaDonRepository extends JpaRepository<ChuongTrinhGiamGiaChiTietHoaDon, UUID> {

    List<ChuongTrinhGiamGiaChiTietHoaDon> findAllByCtggHD(ChuongTrinhGiamGiaHoaDon ctggHD);
    @Query("select c from ChuongTrinhGiamGiaChiTietHoaDon c join HoaDon h on c.id=h.id where h.trangThai = 1")
    List<ChuongTrinhGiamGiaChiTietHoaDon> getAllByTrangThaiHD();


}
