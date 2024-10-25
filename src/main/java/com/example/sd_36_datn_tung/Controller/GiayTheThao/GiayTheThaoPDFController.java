package com.example.sd_36_datn_tung.Controller.GiayTheThao;

import com.example.sd_36_datn_tung.Model.GiayTheThaoChiTiet;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.util.List;

public class GiayTheThaoPDFController {

    private List<GiayTheThaoChiTiet> giayTheThaoChiTietList;

    public GiayTheThaoPDFController(List<GiayTheThaoChiTiet> giayTheThaoChiTietList) {

        this.giayTheThaoChiTietList = giayTheThaoChiTietList;

    }


    public void WriteTableHeader(PdfPTable table) {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.GRAY);
        cell.setPadding(3);

        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("Tên giày thể thao", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Giá bán", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Số lượng", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Size", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Màu sắc", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Công dụng", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Thương hiệu", font));
        table.addCell(cell);

    }

   public void WriteTableData(PdfPTable table){

        for (GiayTheThaoChiTiet giayTheThaoChiTiet : giayTheThaoChiTietList){

            table.addCell(giayTheThaoChiTiet.getGiayTheThao().getTenGiayTheThao());
            table.addCell(giayTheThaoChiTiet.getGiayTheThao().getGiaBan());
            table.addCell(giayTheThaoChiTiet.getSoLuong());
            table.addCell(giayTheThaoChiTiet.getSize().getSize());
            table.addCell(giayTheThaoChiTiet.getMauSac().getTenMauSac());
//            table.addCell(giayTheThaoChiTiet.getGiayTheThao().getCongDung().getTenCongDung());
            table.addCell(giayTheThaoChiTiet.getGiayTheThao().getThuongHieu().getTenThuongHieu());

        }
   }

   public void export(HttpServletResponse response) throws DocumentException,IOException {

        Document document = new Document(PageSize.A2);

        PdfWriter.getInstance(document,response.getOutputStream());
        document.open();
        document.add(new Paragraph("List danh sách giầy thể thao"));
        PdfPTable table = new PdfPTable(7);
        table.setWidthPercentage(100);
        table.setSpacingBefore(15);

        WriteTableHeader(table);
        WriteTableData(table);

        document.add(table);
        document.close();

   }

}

