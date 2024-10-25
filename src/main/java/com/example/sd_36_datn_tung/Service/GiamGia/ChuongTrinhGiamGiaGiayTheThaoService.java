package com.example.sd_36_datn_tung.Service.GiamGia;



import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaChiTietGiayTheThao;
import com.example.sd_36_datn_tung.Model.ChuongTrinhGiamGiaGiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Repository.GiamGia.ChuongTrinhGiamGiaGiayTheThaoRepository;
import com.example.sd_36_datn_tung.Repository.GiayTheThao.GiayTheThaoRepository;
import com.example.sd_36_datn_tung.Service.impl.ChuongTrinhGiamGiaGiayTheThaoImpl;
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
public class ChuongTrinhGiamGiaGiayTheThaoService implements ChuongTrinhGiamGiaGiayTheThaoImpl {

    @Autowired
    private ChuongTrinhGiamGiaGiayTheThaoRepository repo;

    @Autowired
    private GiayTheThaoRepository gttrepo;

    @Autowired
    private ChuongTrinhGiamGiaChiTietGiayTheThaoService ctggChiTiet;

    @Override
    public void add(ChuongTrinhGiamGiaGiayTheThao gg) {
        this.repo.save(gg);
    }

    @Autowired
    private ChuongTrinhGiamGiaChiTietGiayTheThaoService serviceCTSP;

    @Override
    public void update(ChuongTrinhGiamGiaGiayTheThao gg, UUID id) {
        gg.setId(id);

        if (gg.getTrangThai() == -1) {
            List<ChuongTrinhGiamGiaChiTietGiayTheThao> list = serviceCTSP.getAllByCTGG(gg);
            List<ChuongTrinhGiamGiaChiTietGiayTheThao> list2 = new ArrayList<>();
            for (ChuongTrinhGiamGiaChiTietGiayTheThao a : list) {
                ChuongTrinhGiamGiaChiTietGiayTheThao ctggs = a;
                ctggs.setTrangThai(-1);
                list2.add(ctggs);

            }
            List<GiayTheThao> giayTheThaos = ctggChiTiet.getAllGiayTheThaoByChuongTrinhGiamGia(gg);
            for (GiayTheThao gtt:giayTheThaos){
                gtt.setSoTienDaGiam(new BigDecimal(0));
                System.out.println(gtt.getSoTienDaGiam());
            }
            gttrepo.saveAll(giayTheThaos);
            serviceCTSP.SaveAll(list2);
        } else {
            List<ChuongTrinhGiamGiaChiTietGiayTheThao> listCtgg = serviceCTSP.getAllByCTGG(gg);
            List<ChuongTrinhGiamGiaChiTietGiayTheThao> listCtgg2 = new ArrayList<>();
            for (ChuongTrinhGiamGiaChiTietGiayTheThao a : listCtgg) {
                ChuongTrinhGiamGiaChiTietGiayTheThao ctggs = a;
                ctggs.setTrangThai(1);
                listCtgg2.add(ctggs);
            }
            serviceCTSP.SaveAll(listCtgg2);
        }
        List<ChuongTrinhGiamGiaChiTietGiayTheThao> list = serviceCTSP.getAllByCTGG(gg);
        List<ChuongTrinhGiamGiaChiTietGiayTheThao> list2 = new ArrayList<>();
        for (ChuongTrinhGiamGiaChiTietGiayTheThao a : list) {
            ChuongTrinhGiamGiaChiTietGiayTheThao ctggs = a;
            double giaBan = Double.parseDouble(ctggs.getGiayTheThao().getGiaBan());
            double phanTramGiam = gg.getPhanTramGiam() / 100.0;

            ctggs.setSoTienDaGiam(new BigDecimal( phanTramGiam * giaBan));
            list2.add(ctggs);
        }
        serviceCTSP.SaveAll(list2);


        this.repo.save(gg);
    }
    @Override
    public void addAll(MultipartFile file) throws IOException {
        List<ChuongTrinhGiamGiaGiayTheThao> list = new ArrayList<>();
        try(InputStream in = file.getInputStream()){
            Workbook workbook = new XSSFWorkbook(in);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Sheet sheet = workbook.getSheetAt(0);
            for (Row row : sheet) {
                ChuongTrinhGiamGiaGiayTheThao ctgg = new ChuongTrinhGiamGiaGiayTheThao();
                ctgg.setTenChuongTrinh(row.getCell(0).getStringCellValue());
                ctgg.setPhanTramGiam((int) row.getCell(1).getNumericCellValue());
                ctgg.setNgayBatDau(sdf.format(row.getCell(2).getDateCellValue()));
                ctgg.setNgayKetThuc(sdf.format(row.getCell(3).getDateCellValue()));
                ctgg.setGhiChu(row.getCell(4).getStringCellValue());
                ctgg.setNgayTao(sdf.format(row.getCell(5).getDateCellValue()));
                ctgg.setNgaySua(sdf.format(row.getCell(6).getDateCellValue()));
                ctgg.setTrangThai((int) row.getCell(7).getNumericCellValue());
                list.add(ctgg);
            }
            workbook.close();
        }
        this.repo.saveAll(list);
    }

    @Override
    public ChuongTrinhGiamGiaGiayTheThao getOne(UUID id) {
        return this.repo.findById(id).get();
    }

    @Override
    public List<ChuongTrinhGiamGiaGiayTheThao> getList() {
        return this.repo.findAll();
    }

    @Override
    public Page<ChuongTrinhGiamGiaGiayTheThao> search(Pageable pageable, String name) {
        return this.repo.findByTenChuongTrinhContaining(name, pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTrangThai(Pageable pageable, int name) {
        if(name == 2){
            return this.repo.findAll(pageable);
        }
        return this.repo.findAllByTrangThai(name, pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaGiayTheThao> pagination(Pageable pageable) {
        return this.repo.findAll(pageable);
    }

    @Override
    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTrangThaiAndDate(Pageable pageable, int tt, String nbd,
                                                                        String nkt) {
        if (tt == 2) {
            return this.repo.filterByDate(nbd, nkt, pageable);
        }
        return this.repo.filterByTrangThaiAndDate(tt, nbd, nkt, pageable);
    }


    @SneakyThrows
    @Override
    public void updateTrangThai() {
        List<ChuongTrinhGiamGiaGiayTheThao> list = this.repo.findAll();
        List<ChuongTrinhGiamGiaGiayTheThao> newList = new ArrayList<>();
        List<ChuongTrinhGiamGiaGiayTheThao> listKichHoat = new ArrayList<>();

        LocalDate currentDate = LocalDate.now();
        for (ChuongTrinhGiamGiaGiayTheThao gg : list) {
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

    @Override
    public Page<ChuongTrinhGiamGiaGiayTheThao> filterByTTChuaHetHan(Pageable pageable) {
        Page<ChuongTrinhGiamGiaGiayTheThao> page2 = this.repo.filterByTTChuaHetHan(pageable);
        return page2;
    }



}
