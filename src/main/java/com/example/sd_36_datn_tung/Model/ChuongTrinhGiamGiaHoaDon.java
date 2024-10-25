package com.example.sd_36_datn_tung.Model;


import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "ChuongTrinhGiamGiaHoaDon")
public class ChuongTrinhGiamGiaHoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_ChuongTrinhGiamGiaHoaDon")
    private UUID id;

    @Column(name = "tenChuongTrinh")
    private String tenChuongTrinh;

    @Column(name = "phanTramGiam")
    private String phanTramGiam;

    @Column(name = "soLuongSanPham")
    private String soLuongSanPham;

    @Column(name = "soTienHoaDon")
    private BigDecimal soTienHoaDon;

    @Column(name = "ngayBatDau")
    private String ngayBatDau;

    @Column(name = "ngayKetThuc")
    private String ngayKetThuc;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
