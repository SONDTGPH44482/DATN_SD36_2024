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
@Table(name = "ChuongTrinhGiamGiaChiTietGiayTheThao")
public class ChuongTrinhGiamGiaChiTietGiayTheThao {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_ChuongTrinhGiamGiaChiTietGiayTheThao")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_ChuongTrinhGiamGiaGiayTheThao", referencedColumnName = "Id_ChuongTrinhGiamGiaGiayTheThao")
    private ChuongTrinhGiamGiaGiayTheThao chuongTrinhGiamGiaGiayTheThao;

    @ManyToOne
    @JoinColumn(name = "Id_GiayTheThao", referencedColumnName = "Id_GiayTheThao")
    private GiayTheThao giayTheThao;

    @Column(name = "SoTienDaGiam")
    private BigDecimal soTienDaGiam;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "NgayTao")
    private String ngayTao;

    @Column(name = "NgaySua")
    private String ngaySua;

    @Column(name = "TrangThai")
    private int trangThai;


}
