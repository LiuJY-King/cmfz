package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping("queryAll")
    public List<Admin> queryAll() {
        List<Admin> admins = adminService.queryAll();
        return admins;
    }

    @RequestMapping("login")
    @ResponseBody
    public String login(String name, String password, String enCode, HttpSession session) {
        String code = (String) session.getAttribute("code");
        if (!code.equals(enCode)) return "验证码错误！";
        String str = adminService.login(name, password);
        if (str.equals("ok"))
            session.setAttribute("adminName", name);
        return str;
    }
}
