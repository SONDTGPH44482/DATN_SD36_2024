package com.example.sd_36_datn_tung.Service.KhachHang;
import com.example.sd_36_datn_tung.Model.KhachHang;
import com.example.sd_36_datn_tung.Repository.KhachHang.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class KhachHangService implements KhachHangImpl {

    @Autowired
    private KhachHangRepository khachHangRepository;
    //ban hang
    public List<KhachHang> findKhachHang(String tenKhachHang) {
        if (tenKhachHang != null) {
            return khachHangRepository.findByTenKhachHang(tenKhachHang);
        } else {
            return khachHangRepository.findAll();
        }
    }

    public Page<KhachHang> searchKH(String keyword, String tenKhachHang, String email, String matKhau, String gioiTinh, String ngaySinh, String soDienThoai, String diaChi, Pageable pageable){
        return khachHangRepository.searchKH(keyword, tenKhachHang, email, matKhau, gioiTinh, ngaySinh, soDienThoai, diaChi, pageable);
    }

    //Tìm trong giỏ hàng
    public KhachHang findById(UUID id){

        return khachHangRepository.findById(id).orElse(null);

    }

    //Tìm kiếm khách hàng theo id
    public KhachHang findByEmail(String email) {

        return khachHangRepository.findByEmail(email);

    }

    //Update lại thông tin của khách hàng
    @Override
    public void update(UUID id, KhachHang update){

        Optional<KhachHang> optionalKhachHang = khachHangRepository.findById(id);

        if (optionalKhachHang.isPresent()){

            KhachHang khachHang = optionalKhachHang.get();
            khachHang.setMaKhachHang(update.getMaKhachHang());
            khachHang.setTenKhachHang(update.getTenKhachHang());
            khachHang.setNgaySinh(update.getNgaySinh());
            khachHang.setDiaChi(update.getDiaChi());
            khachHang.setThanhPho(update.getThanhPho());
            khachHang.setHuyen(update.getHuyen());
            khachHang.setSoDienThoai(update.getSoDienThoai());
            khachHang.setEmail(update.getEmail());
            khachHang.setMatKhau(update.getMatKhau());
            khachHang.setTrangThai(update.getTrangThai());
            khachHangRepository.save(khachHang);
        }

    }

    //Todo code dành cho bán hàng tại quậy
    public List<KhachHang> getAll() {
        return khachHangRepository.findAll();
    }

}
