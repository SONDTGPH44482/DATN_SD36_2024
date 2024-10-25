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
@Table(name = "GioHangChiTiet")
public class GioHangChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_GioHangChiTiet")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_GiayTheThaoChiTiet")
    private GiayTheThaoChiTiet giayTheThaoChiTiet;

    @ManyToOne
    @JoinColumn(name = "Id_GioHang")
    private GioHang gioHang;

    @Column(name = "soLuong")
    private String soLuong;

    @Column(name = "donGia")
    private BigDecimal donGia;

    @Column(name = "donGiaKhiGiam")
    private BigDecimal donGiaKhiGiam;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
