package com.baizhi.service;

import com.baizhi.entity.Admin;
import com.baizhi.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Admin> queryAll() {
        List<Admin> admins = adminMapper.selectAll();
        return admins;
    }

    @Override
    public String login(String name, String password) {
        Admin admin = new Admin();
        try {
            admin.setName(name);
            admin = adminMapper.selectOne(admin);
            if (admin == null) {
                throw new RuntimeException("账号错误");
            }
            if (!admin.getPassword().equals(password)) {
                throw new RuntimeException("密码错误");
            }
            return "ok";
        } catch (Exception e) {
            return e.getMessage();
        }
    }
}
