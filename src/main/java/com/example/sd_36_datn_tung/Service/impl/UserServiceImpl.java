package com.example.sd_36_datn_tung.Service.impl;



import com.example.sd_36_datn_tung.Model.User;

import java.util.UUID;

public interface UserServiceImpl {

    User findByEmail(String email);

    void update(UUID id, User update);


}
