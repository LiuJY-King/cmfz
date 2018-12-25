package com.baizhi.controller;

import com.baizhi.entity.CountProvince;
import com.baizhi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("queryCount")
    public Map<String, Object> queryCount() {
        Map<String, Object> map = userService.queryUserCount();
        return map;
    }
    @RequestMapping("queryCountMan")
    public List<CountProvince> queryCountMan() {
        List<CountProvince> list = userService.queryCountBySex(1);
        return list;
    }
    @RequestMapping("queryCountWomen")
    public List<CountProvince> queryCountWomen() {
        List<CountProvince> list = userService.queryCountBySex(0);
        return list;
    }
}
