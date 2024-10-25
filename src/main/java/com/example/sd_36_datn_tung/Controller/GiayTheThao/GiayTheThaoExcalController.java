package com.example.sd_36_datn_tung.Controller.GiayTheThao;

import com.example.sd_36_datn_tung.Model.GiayTheThaoChiTiet;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.util.List;

public class GiayTheThaoExcalController {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<GiayTheThaoChiTiet> giayTheThaoChiTietList;

    public GiayTheThaoExcalController(List<GiayTheThaoChiTiet> giayTheThaoChiTietList){

        this.giayTheThaoChiTietList = giayTheThaoChiTietList;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Product");

    }

    private void WriteHeaderRow(){

        Row row = sheet.createRow(0);

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        Cell cell = row.createCell(0);
        cell.setCellValue("Tên giầy thể thao");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("Giá bán");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("Số lượng");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("Size");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("Màu sắc");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("Công dụng");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("Thương hiệu");
        cell.setCellStyle(style);


    }

    private void WriteDateRow(){

        int rowCount = 1;

        CellStyle style = workbook.createCellStyle();
        XSSFFont font = workbook.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for(GiayTheThaoChiTiet giayTheThaoChiTiet : giayTheThaoChiTietList){

            Row row = sheet.createRow(rowCount++);

            Cell cell = row.createCell(0);
            cell.setCellValue(giayTheThaoChiTiet.getGiayTheThao().getTenGiayTheThao());
            sheet.autoSizeColumn(0);
            cell.setCellStyle(style);

            cell = row.createCell(1);
            cell.setCellValue(giayTheThaoChiTiet.getGiayTheThao().getGiaBan());
            sheet.autoSizeColumn(1);
            cell.setCellStyle(style);

            cell = row.createCell(2);
            cell.setCellValue(giayTheThaoChiTiet.getSoLuong());
            sheet.autoSizeColumn(2);
            cell.setCellStyle(style);

            cell = row.createCell(3);
            cell.setCellValue(giayTheThaoChiTiet.getSize().getSize());
            sheet.autoSizeColumn(3);
            cell.setCellStyle(style);

            cell = row.createCell(4);
            cell.setCellValue(giayTheThaoChiTiet.getMauSac().getTenMauSac());
            sheet.autoSizeColumn(4);
            cell.setCellStyle(style);

            cell = row.createCell(5);
//            cell.setCellValue(giayTheThaoChiTiet.getGiayTheThao().getCongDung().getTenCongDung());
            sheet.autoSizeColumn(5);
            cell.setCellStyle(style);

            cell = row.createCell(6);
            cell.setCellValue(giayTheThaoChiTiet.getGiayTheThao().getThuongHieu().getTenThuongHieu());
            sheet.autoSizeColumn(6);
            cell.setCellStyle(style);


        }

    }

    //Khi Web server đáp ứng (response) yêu cầu của HTTP request. Một response thông thường bao gồm trạng thái (status), header, blank line, và document.
    public void export(HttpServletResponse response)throws IOException {

        WriteHeaderRow();
        WriteDateRow();

        ServletOutputStream outputStream= response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();

    }


}

