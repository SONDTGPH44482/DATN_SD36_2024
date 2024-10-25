package com.example.sd_36_datn_tung.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
@Table(name = "GiayTheThao")
public class GiayTheThao {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_GiayTheThao")
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "Id_ChatLieu")
    private ChatLieu chatLieu;

    @ManyToOne
    @JoinColumn(name = "Id_LotGiay")
    private LotGiay lotGiay;

    @ManyToOne
    @JoinColumn(name = "Id_DayGiay")
    private DayGiay dayGiay;

    @ManyToOne
    @JoinColumn(name = "Id_ThuongHieu")
    private ThuongHieu thuongHieu;

    @Column(name = "tenGiayTheThao")
    private String tenGiayTheThao;

    @Column(name = "giaBan")
    private String giaBan;

    @Column(name = "moTa")
    private String moTa;

    @Column(name = "ghiChu")
    private String ghiChu;

    @Column(name = "ngayTao")
    private String ngayTao;

    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

    @Column(name = "SoTienGiamGia")
    private BigDecimal soTienDaGiam;

    //Todo join list Image
    @JsonIgnore
    @OneToMany(mappedBy = "giayTheThao", fetch = FetchType.EAGER)
    List<Image> image;

    public String getAnhDau() {
        if (image != null && !image.isEmpty()) {
            return image.get(0).getLink();
        }
        // Thay bằng đường dẫn ảnh mặc định hoặc thông báo khác khi không có ảnh
        return "Đường dẫn ảnh mặc định khi không có ảnh";
    }


}
