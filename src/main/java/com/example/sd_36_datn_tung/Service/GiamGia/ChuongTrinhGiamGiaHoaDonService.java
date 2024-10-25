package com.example.sd_36_datn_tung.Service.GiamGia;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaHoaDon;
import com.example.sd_36_datn_tung.Repository.GiamGia.ChuongTrinhGiamGiaHoaDonRepository;
import com.example.sd_36_datn_tung.Service.impl.ChuongTrinhGiamGiaHoaDonImpl;
import lombok.SneakyThrows;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ChuongTrinhGiamGiaHoaDonService implements ChuongTrinhGiamGiaHoaDonImpl {

    @Autowired
    private ChuongTrinhGiamGiaHoaDonRepository repo;

    @Override
    public void add(ChuongTrinhGiamGiaHoaDon gg){

        this.repo.save(gg);

    }

    @Override
    public void addAll(MultipartFile file) throws IOException {
        List<ChuongTrinhGiamGiaHoaDon> list = new ArrayList<>();
        try(InputStream in = file.getInputStream()){
            Workbook workbook = new XSSFWorkbook(in);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                ChuongTrinhGiamGiaHoaDon ctgg = new ChuongTrinhGiamGiaHoaDon();
                ctgg.setTenChuongTrinh(row.getCell(0).getStringCellValue());
                ctgg.setPhanTramGiam(String.valueOf(row.getCell(1).getNumericCellValue()));
                ctgg.setSoLuongSanPham(String.valueOf(row.getCell(2).getNumericCellValue()));
                ctgg.setSoTienHoaDon(new BigDecimal(row.getCell(3).getNumericCellValue()));
                ctgg.setNgayBatDau(sdf.format(row.getCell(4).getDateCellValue()));
                ctgg.setNgayKetThuc(sdf.format(row.getCell(5).getDateCellValue()));
                ctgg.setGhiChu(row.getCell(6).getStringCellValue());
                ctgg.setNgayTao(sdf.format(row.getCell(7).getDateCellValue()));
                ctgg.setNgaySua(sdf.format(row.getCell(8).getDateCellValue()));
                ctgg.setTrangThai((int) row.getCell(9).getNumericCellValue());
                list.add(ctgg);
            }
            workbook.close();
        }
        this.repo.saveAll(list);
    }

    @Override
    public void update(ChuongTrinhGiamGiaHoaDon gg, UUID id) {
        gg.setId(id);
        this.repo.save(gg);
    }

    @Override
    public List<ChuongTrinhGiamGiaHoaDon> getList() {
        // TODO Auto-generated method stub
        return this.repo.findAll();
    }

    @Override
    public Page<ChuongTrinhGiamGiaHoaDon> search(Pageable pageable, String name) {

        return this.repo.findByTenChuongTrinhContaining(name, pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaHoaDon> filterByTrangThai(Pageable pageable, int name) {
        if(name == 2){
            return this.repo.filterByTTChuaHetHan(pageable);
        }
        return this.repo.findAllByTrangThai(name, pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaHoaDon> filterByTrangThaiAndDate(Pageable pageable, int tt, String nbd, String nkt) {
        if(tt == 2){
            return this.repo.filterByDate(nbd, nkt, pageable);
        }
        return this.repo.filterByTrangThaiAndDate(tt, nbd, nkt, pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaHoaDon> pagination(Pageable pageable) {
        return this.repo.findAll(pageable);
    }

    @Override
    public ChuongTrinhGiamGiaHoaDon getOne(UUID id) {
        return this.repo.findById(id).get();
    }





    @Override
    public Page<ChuongTrinhGiamGiaHoaDon> filterByTTChuaHetHan(Pageable pageable) {

        Page<ChuongTrinhGiamGiaHoaDon> page2 = this.repo.filterByTTChuaHetHan(pageable);
        return page2;
    }

    //Todo code cho hóa đơn áp dụng khuyễn mãi

    @Override
    public List<ChuongTrinhGiamGiaHoaDon> findBySlandTt(String sl, BigDecimal tt) {

        return repo.findBySlandTt(sl, tt);

    }


    @SneakyThrows
    @Override
    public void updateTrangThai() {
        List<ChuongTrinhGiamGiaHoaDon> list = this.repo.findAll();
        List<ChuongTrinhGiamGiaHoaDon> newList = new ArrayList<>();
        List<ChuongTrinhGiamGiaHoaDon> listKichHoat = new ArrayList<>();

        LocalDate currentDate = LocalDate.now();
        for (ChuongTrinhGiamGiaHoaDon gg : list) {
            if (gg.getTrangThai() != -1) {
                LocalDate date = LocalDate.parse(gg.getNgayKetThuc());
                int comparasion = date.compareTo(currentDate);
                System.out.println("Ten chuong trinh: " + gg.getTenChuongTrinh() + "Ngay ket thuc: " + date
                        + ", Ngay hien tai: " + currentDate);
                if (comparasion < 0) {
                    gg.setTrangThai(-1);
                    System.out.println("Các trạng thái đã sửa: " + gg.getTenChuongTrinh());
                    newList.add(gg);
                }
            }

            if (gg.getTrangThai() == 0) {
                LocalDate d = LocalDate.parse(gg.getNgayBatDau());
                int comparasion2 = d.compareTo(currentDate);
                if (comparasion2 <= 0) {
                    gg.setTrangThai(1);
                    listKichHoat.add(gg);
                }
            }

        }
        this.repo.saveAll(newList);
        this.repo.saveAll(listKichHoat);
    }

    public List<ChuongTrinhGiamGiaHoaDon> getAllBySlTT(String sl, BigDecimal tt) {
        return repo.findAllBySLTongTienAndTT(sl, tt);
    }
}
