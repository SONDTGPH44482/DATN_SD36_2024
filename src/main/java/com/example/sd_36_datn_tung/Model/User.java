package com.example.sd_36_datn_tung.Model;


import com.example.sd_36_datn_tung.Model.Enum.RoleEnum;
import jakarta.persistence.*;
import lombok.*;

import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
@Table(name ="Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "Id_User")
    private UUID id;

    @Column(name = "maUser")
    private String maUser;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "email")
    private  String email	;

    @Column(name = "Url_Image")
    private String link;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "matKhau")
    private  String matKhau	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "tenUser")
    private  String tenUser	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "gioiTinh")
    private  String gioiTinh;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "ngaySinh")
    private String ngaySinh	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "maCCCD")
    private  String maCCCD	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "hoKhau")
    private  String hoKhau	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "soDienThoai")
    private  String soDienThoai	;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "diaChi")
    private  String diaChi;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "ghiChu")
    private String ghiChu;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "ngayTao")
    private String ngayTao;

//    @NotBlank(message = "Không được để trống")
    @Column(name = "ngaySua")
    private String ngaySua;

    @Column(name = "trangThai")
    private int trangThai;

    //Todo code phân quyền bên Admin
    @Enumerated(EnumType.STRING)
    private RoleEnum role;

}
