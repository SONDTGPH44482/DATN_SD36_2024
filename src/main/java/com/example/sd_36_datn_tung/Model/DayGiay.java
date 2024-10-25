package com.example.sd_36_datn_tung.Model;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
@Entity
@Table(name = "DayGiay")
public class DayGiay {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_DayGiay")
    private UUID id;

    @NotBlank(message = "Không được để trống")
    @Column(name = "tenDayGiay")
    private String tenDayGiay;

    @Column(name = "chieuDaiDayGiay")
    private String chieuDaiDayGiay;

    @NotBlank(message = "Không được để trống")
    @Column(name = "ghiChu")
    private String ghiChu;

    @NotBlank(message = "Không được để trống")
    @Column(name = "ngayTao")
    private String ngayTao;

    @NotBlank(message = "Không được để trống")
    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

}
