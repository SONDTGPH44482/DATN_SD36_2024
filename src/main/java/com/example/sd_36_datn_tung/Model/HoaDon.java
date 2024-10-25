package com.example.sd_36_datn_tung.Model;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "HoaDon")
public class HoaDon {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_HoaDon")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_KhachHang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "Id_User")
    private User user;

    @Column(name = "maHoaDon")
    private String maHoaDon;

    @Column(name = "thanhTien")
    private BigDecimal thanhTien;

    @Column(name = "phiShip")
    private BigDecimal phiShip;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "mess")
    private String mess;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngayThanhToan")
    private LocalDateTime ngayThanhToan;

    @Column(name = "ngaySua")
    private LocalDateTime ngaySua;

    @Column(name = "hinhThuc")
    private int hinhThuc;

    @Column(name = "hinhThucThanhToan")
    private int hinhThucThanhToan;

    @Column(name = "trangThaiMoney")
    private int trangThaiMoney;

    @Column(name = "trangThai")
    private int trangThai;

}