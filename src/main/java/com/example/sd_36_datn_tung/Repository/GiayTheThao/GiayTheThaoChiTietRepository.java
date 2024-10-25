package com.example.sd_36_datn_tung.Repository.GiayTheThao;

import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.GiayTheThaoChiTiet;
import com.example.sd_36_datn_tung.Model.MauSac;
import com.example.sd_36_datn_tung.Model.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GiayTheThaoChiTietRepository extends JpaRepository<GiayTheThaoChiTiet, UUID> {

    @Query("select giayTheThaoChiTiet from GiayTheThaoChiTiet giayTheThaoChiTiet where giayTheThaoChiTiet.giayTheThao.id=?1")
    List<GiayTheThaoChiTiet> getAllById(UUID id);

    List<GiayTheThaoChiTiet> findByGiayTheThaoAndMauSacAndSize(GiayTheThao giayTheThao, MauSac mauSac, Size size);

    //Todo code tìm size số lượng màu sắc
    @Query("select p from GiayTheThaoChiTiet p where p.giayTheThao.id = ?1 and p.mauSac.id = ?2 and p.size.id = ?3")
    GiayTheThaoChiTiet findIdByIdGiayTheThaoMauSacSize(UUID id, UUID idMauSac, UUID idSize);


    List<GiayTheThaoChiTiet> findByGiayTheThao(GiayTheThao giayTheThao);


    @Query("SELECT id FROM GiayTheThaoChiTiet WHERE giayTheThao.id = :giayTheThaoId AND size.id = :sizeId AND mauSac.id = :mauSacId")
    UUID findIdByGiayTheThaoAndSizeAndMauSac(UUID giayTheThaoId, UUID sizeId, UUID mauSacId);


    @Query("SELECT gtc FROM GiayTheThaoChiTiet gtc WHERE gtc.giayTheThao.id = :giayTheThaoId AND gtc.size.id = :sizeId AND gtc.mauSac.id = :mauSacId")
    GiayTheThaoChiTiet findByGiayTheThaoAndSizeAndMauSac(UUID giayTheThaoId, UUID sizeId, UUID mauSacId);


    //Todo code tổng số lượng sản phẩm có trong kho
    @Query("SELECT SUM(sp.soLuong) FROM GiayTheThaoChiTiet sp")
    Integer sumSoLuong();


    @Query("select p from GiayTheThaoChiTiet p where p.giayTheThao.id = ?1 and p.mauSac.id = ?2 and p.size.id = ?3")
    GiayTheThaoChiTiet findIdByIdGiayTheThaoMsSize(UUID id, UUID idMauSac, UUID idSize);

    @Query("SELECT gttct FROM GiayTheThaoChiTiet gttct JOIN gttct.giayTheThao gtt WHERE gtt.tenGiayTheThao =:ten ")
    List<GiayTheThaoChiTiet> findAllByNameProduct(@Param("ten") String name);



}
