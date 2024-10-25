package com.example.sd_36_datn_tung.Repository.GiayTheThao;



import com.example.sd_36_datn_tung.Model.GiayTheThao;
import com.example.sd_36_datn_tung.Model.Image;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ImageRepository extends JpaRepository<Image, UUID> {

    @Query("select image from Image image where image.giayTheThao.id=?1")
    //Lấy Id của Image để tìm sản phẩm
    List<Image> getImageByIdGiayTheThao(UUID id);

    Image findImageByLinkAndGiayTheThao(String link, GiayTheThao giayTheThao);

    List<Image> findImageById(UUID id);

    List<Image> findImageByGiayTheThao(GiayTheThao giayTheThao);


    @Transactional
    @Modifying
    @Query("DELETE FROM Image i WHERE i.id = :imageId")
    void deleteImageAndGiayTheThao(UUID imageId);


}
