package com.baizhi.service;

import com.baizhi.entity.Admin;

import java.util.List;

public interface AdminService {
    public List<Admin> queryAll();

    public String login(String name, String password);
}
