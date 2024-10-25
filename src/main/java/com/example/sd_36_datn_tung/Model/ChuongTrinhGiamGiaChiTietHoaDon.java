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
@Table(name = "ChuongTrinhGiamGiaChiTietHoaDon")
public class ChuongTrinhGiamGiaChiTietHoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_ChuongTrinhGiamGiaChiTietHoaDon")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_ChuongTrinhGiamGiaHoaDon")
    private ChuongTrinhGiamGiaHoaDon ctggHD;

    @ManyToOne()
    @JoinColumn(name = "Id_HoaDon", referencedColumnName="Id_HoaDon")
    private HoaDon hd;

    @Column(name = "SoTienDaGiam")
    private BigDecimal soTienDaGiam;

    @Column(name = "GhiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;



}
