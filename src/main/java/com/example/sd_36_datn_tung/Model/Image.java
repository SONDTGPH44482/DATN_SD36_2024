package com.example.sd_36_datn_tung.Model;

import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "Image")
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_Image")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_GiayTheThao")
    private GiayTheThao giayTheThao;

    @Column(name = "Url_Image")
    private String link;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;


}
