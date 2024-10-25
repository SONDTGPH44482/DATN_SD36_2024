package com.example.sd_36_datn_tung.Repository.GiamGia;

import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Repository
public interface ChuongTrinhGiamGiaHoaDonRepository extends JpaRepository<ChuongTrinhGiamGiaHoaDon,UUID> {





    //Tìm kiếm tổng hợp

    List<ChuongTrinhGiamGiaHoaDon> findChuongTrinhGiamGiaHoaDonByTenChuongTrinhAndSoTienHoaDonAndPhanTramGiamAndSoLuongSanPham(String tenChuongTrinh, BigDecimal soTienHoaDon, String phanTramGiam, String soLuongSanPham);

    //Tìm kiếm theo từng mục nhỏ
    List<ChuongTrinhGiamGiaHoaDon> findChuongTrinhGiamGiaHoaDonByTenChuongTrinh(String tenChuongTrinh);

    List<ChuongTrinhGiamGiaHoaDon> findChuongTrinhGiamGiaHoaDonBySoTienHoaDon(BigDecimal soTienHoaDon);

    List<ChuongTrinhGiamGiaHoaDon> findChuongTrinhGiamGiaHoaDonByPhanTramGiam(String phanTramGiam);

    List<ChuongTrinhGiamGiaHoaDon> findChuongTrinhGiamGiaHoaDonBySoLuongSanPham(String soLuongSanPham);

    List<ChuongTrinhGiamGiaHoaDon> findAllByTenChuongTrinhAndPhanTramGiamAndSoLuongSanPhamAndSoTienHoaDon(String tenChuongTrinh, String phanTramGiam, String soLuongSanPham, BigDecimal soTienHoaDon);

    Page<ChuongTrinhGiamGiaHoaDon> findByTenChuongTrinhContaining(String name, Pageable pageable);

    Page<ChuongTrinhGiamGiaHoaDon> findAllByTrangThai(int tt, Pageable pageable);
    @Query("SELECT gg FROM ChuongTrinhGiamGiaHoaDon gg WHERE gg.trangThai = :trangThai AND gg.ngayBatDau >= :ngayBatDau AND gg.ngayKetThuc <= :ngayKetThuc")
    Page<ChuongTrinhGiamGiaHoaDon> filterByTrangThaiAndDate(@Param("trangThai") int tt, @Param("ngayBatDau") String nbd,
                                                            @Param("ngayKetThuc") String nkt, Pageable pageable);
    @Query("SELECT gg FROM ChuongTrinhGiamGiaHoaDon gg WHERE gg.ngayBatDau >= :ngayBatDau AND gg.ngayKetThuc <= :ngayKetThuc and gg.trangThai not in (select ctgg.trangThai from ChuongTrinhGiamGiaHoaDon ctgg where ctgg.trangThai=-1)")
    Page<ChuongTrinhGiamGiaHoaDon> filterByDate(@Param("ngayBatDau") String nbd, @Param("ngayKetThuc") String nkt, Pageable pageable);

    @Query("select gg from ChuongTrinhGiamGiaHoaDon gg where gg.trangThai not in (select ctgg.trangThai from ChuongTrinhGiamGiaHoaDon ctgg where ctgg.trangThai=-1)")
    Page<ChuongTrinhGiamGiaHoaDon> filterByTTChuaHetHan(Pageable pageable);


    //Todo code giảm giá hóa đơn bên repo
    @Query("SELECT hd FROM ChuongTrinhGiamGiaHoaDon hd WHERE hd.soLuongSanPham <= ?1 and hd.soTienHoaDon <= ?2")
    List<ChuongTrinhGiamGiaHoaDon> findBySlandTt(String sl, BigDecimal tt);

    @Query("Select hd from ChuongTrinhGiamGiaHoaDon hd where hd.soLuongSanPham <= :sl and hd.soTienHoaDon <= :tt and hd.trangThai != -1")
    List<ChuongTrinhGiamGiaHoaDon> findAllBySLTongTienAndTT(@Param("sl") String soLuong, @Param("tt") BigDecimal tongTien);
}
