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
@Table(name = "HoaDonChiTiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_HoaDonChiTiet")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_HoaDon")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "Id_GiayTheThaoChiTiet")
    private GiayTheThaoChiTiet giayTheThaoChiTiet;

    @Column(name = "soLuong")
    private String soLuong;

    @Column(name = "donGia")
    private BigDecimal donGia;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private LocalDateTime ngayTao;

    @Column(name = "ngaySua")
    private LocalDateTime ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
