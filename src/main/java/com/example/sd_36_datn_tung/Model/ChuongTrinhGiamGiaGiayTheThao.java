package com.example.sd_36_datn_tung.Model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "ChuongTrinhGiamGiaGiayTheThao")
public class ChuongTrinhGiamGiaGiayTheThao {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_ChuongTrinhGiamGiaGiayTheThao")
    private UUID id;

    @Column(name = "tenChuongTrinhGiamGia")
    private String tenChuongTrinh;

    @Column(name = "phanTramGiam")
    private int phanTramGiam;

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
