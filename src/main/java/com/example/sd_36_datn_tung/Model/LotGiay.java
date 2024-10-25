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
@Table(name = "LotGiay")
public class LotGiay {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_LotGiay")
    private UUID id;

    @Column(name = "tenLotGiay")
    private String tenLotGiay;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
