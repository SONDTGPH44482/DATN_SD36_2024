package com.example.sd_36_datn_tung.Service.HoaDon;
import com.example.sd_36_datn_tung.Model.*;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoChiTietRepository;
import com.example.sd_36_datn_tung.Repository.HoaDon.HoaDonChiTietRepository;
import com.example.sd_36_datn_tung.Repository.HoaDon.HoaDonRepository;
import com.example.sd_36_datn_tung.Repository.KhachHang.KhachHangRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonService implements HoaDonServiceImpl{

    @Autowired
    HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hdctRepo;

    @Autowired
    private KhachHangRepository khRepo;

    @Autowired
    private GiayTheThaoChiTietRepository gttctRepo;

    @Override
    public HoaDon finByMa(String ma) {

        return hoaDonRepository.findByMa(ma);

    }

    @Override
    public Page<HoaDon> listHoaDonFindByKhachHangAndTrangThai(UUID idKhachHang, int trangThai, Integer pageNo, Integer size){
        Pageable pageable = PageRequest.of(pageNo,size);
        return hoaDonRepository.listHoaDonFindByKhachHangAndTrangThai(idKhachHang,trangThai,pageable);
    }
    @Override
    public HoaDon findId(UUID id){

        Optional<HoaDon> optionalHoaDon = hoaDonRepository.findById(id);
        return optionalHoaDon.orElse(null);

    }


    //Todo code update cho hóa đơn khi bị hủy
    @Override
    public void update(UUID id, HoaDon updateHoaDon){

        Optional<HoaDon>  optionalHoaDon = hoaDonRepository.findById(id);

        if(optionalHoaDon.isPresent()){

            HoaDon hoaDon = optionalHoaDon.get();
            hoaDon.setMaHoaDon(updateHoaDon.getMaHoaDon());
            hoaDon.setThanhTien(updateHoaDon.getThanhTien());
            hoaDon.setNgayTao(updateHoaDon.getNgayTao());
            hoaDon.setNgaySua(updateHoaDon.getNgaySua());
            hoaDon.setNgayThanhToan(updateHoaDon.getNgayThanhToan());
            hoaDon.setUser(updateHoaDon.getUser());
            hoaDon.setGhiChu(updateHoaDon.getGhiChu());
            hoaDon.setTrangThai(updateHoaDon.getTrangThai());

            hoaDonRepository.save(hoaDon);

        }

    }

    @Override
    public Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepository.listHoaDonFindByTrangThai(trangThai, pageable);

    }

    @Override
    public String tongSl(UUID id) {

        return hoaDonRepository.tongSl(id);

    }

    //Todo code bán hàng tại quầy
//    @Override
    public List<HoaDon> hoaDonCho() {
        return hoaDonRepository.findAllByTrangThaiAndHinhThucOrderByNgayTaoDesc(0, 1);
}
    public void removeHDCByID(UUID id){
        HoaDon hd = hoaDonRepository.findById(id).get();
        List<HoaDonChiTiet> listHDCT = hdctRepo.findAllByHoaDon(hd);
        for (HoaDonChiTiet hdct: listHDCT){
            hdctRepo.delete(hdct);
        }

        hoaDonRepository.delete(hd);
    }

    public HoaDon createHD(HoaDon hd){

        KhachHang kh = null;
        if (hd.getKhachHang() != null) {

            kh = khRepo.findById(hd.getKhachHang().getId()).get();

        }


        LocalTime localTime = LocalTime.now();
        hd.setKhachHang(kh);
        // int count = (int) hoaDonRepository.count();
        hd.setMaHoaDon("MaHD" + localTime.getHour() + localTime.getMinute() + localTime.getSecond());
        hd.setHinhThuc(1);
        hd.setGhiChu("N/A");
        hd.setNgayTao(LocalDateTime.now());
        hd.setNgaySua(LocalDateTime.now());
        hd.setPhiShip(new BigDecimal(0));
        hd.setMess("N/A");
        hd.setTrangThai(0);


        return hoaDonRepository.save(hd);

    }


    public String thanhToan(UUID id, String[] tt) {
        HoaDon hd = hoaDonRepository.findById(id).get();
        List<HoaDonChiTiet> listHdct = hdctRepo.findAllByHoaDon(hd);
        GiayTheThaoChiTiet gttct = null;
        int sum = 0;
        boolean check = false;
        String s = "Các sản phẩm: \n\n";
        for (HoaDonChiTiet hdct: listHdct) {
            int donGia = hdct.getDonGia().intValue();
            int soLuong = Integer.parseInt(hdct.getSoLuong());
            int tong = donGia * soLuong;
            sum += tong;
            gttct = gttctRepo.findById(hdct.getGiayTheThaoChiTiet().getId()).get();
            int sl = Integer.parseInt(gttct.getSoLuong()) - soLuong;
            if (sl < 0) {
                check = true;
                s += gttct.getGiayTheThao().getTenGiayTheThao()+"\n";
            }
            gttct.setSoLuong(String.valueOf(sl));
        }
        BigDecimal thanhTien = new BigDecimal(tt[0]);
        hd.setThanhTien(thanhTien);
        hd.setNgayThanhToan(LocalDateTime.now());
        hd.setNgaySua(LocalDateTime.now());
        if (hd == null) {
            return "Hóa đơn không tồn tại";
        }
        if (listHdct.size() == 0) {
            return "Không thể thanh toán vì không có sản phẩm nào.\nVui lòng chọn sản phẩm để thanh toán.";
        }
        if (check == true) {
            return s+"\nkhông thể thanh toán vì số lượng trong kho không đủ.\nVui lòng thay đổi số lượng hoặc chọn sản phẩm khác để thanh toán";
        }

        //Trạng thái hóa đơn là 4 là thanh toán thành công

        hd.setTrangThai(4);
        hd.setTrangThaiMoney(1);
        //1: là bán hàng tại quầy
        //2: là bán hàng online
        hd.setHinhThuc(1);
        hoaDonRepository.save(hd);
        return "Thanh toán thành công";

    }


      //Todo code lưu idUser vào hóa đơn

        public void luuIdUserVaoHoaDon(UUID hoaDonId, UUID idUser) {
            Optional<HoaDon> hoaDonOptional = hoaDonRepository.findById(hoaDonId);

            if (hoaDonOptional.isPresent()) {
                HoaDon hoaDon = hoaDonOptional.get();

                // Lấy đối tượng User từ idUser và lưu vào hóa đơn
                User user = new User();
                user.setId(idUser);
                hoaDon.setUser(user);

                // Lưu hóa đơn có chứa idUser vào cơ sở dữ liệu
                hoaDonRepository.save(hoaDon);
            } else {
                // Xử lý khi không tìm thấy hóa đơn
                throw new RuntimeException("Không tìm thấy hóa đơn với ID: " + hoaDonId);
            }
        }

        //Todo code xóa đơn hàng bị hủy cho trạng thái đơn hàng
        @Transactional
        public void deleteHoaDon(UUID hoaDonId) {
            // Step 1: Xóa tất cả chi tiết hóa đơn liên quan
            List<HoaDonChiTiet> chiTietList = hdctRepo.findByHoaDon_Id(hoaDonId);
            for (HoaDonChiTiet chiTiet : chiTietList) {

                hdctRepo.delete(chiTiet);

            }

            // Step 2: Xóa hóa đơn
            hoaDonRepository.deleteById(hoaDonId);
        }




}
