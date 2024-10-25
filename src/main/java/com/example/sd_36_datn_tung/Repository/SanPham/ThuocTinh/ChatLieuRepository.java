package com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh;

import com.example.sd_36_datn_tung.Model.ChatLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatLieuRepository extends JpaRepository<ChatLieu, UUID> {

    List<ChatLieu> findByTenChatLieuContainingOrderById(String tenChatLieu);

}
