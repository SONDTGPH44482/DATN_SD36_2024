package com.example.sd_36_datn_tung.Service.SanPham;
import com.example.sd_36_datn_tung.Model.ChatLieu;
import com.example.sd_36_datn_tung.Repository.SanPham.ThuocTinh.ChatLieuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ChatLieuService {
    @Autowired
    private ChatLieuRepository chatLieuRepository;

    public List<ChatLieu> getAll() {
        return chatLieuRepository.findAll();
    }

    public ChatLieu getOne(UUID id) {
        return chatLieuRepository.findById(id).orElse(null);
    }

    public void save(ChatLieu chatLieu) {
        this.chatLieuRepository.save(chatLieu);
    }

    public void delete(UUID id) {
        this.chatLieuRepository.deleteById(id);
    }

    public List<ChatLieu> searchByTen(String tenChatLieu) {
        return chatLieuRepository.findByTenChatLieuContainingOrderById(tenChatLieu);
    }

}
