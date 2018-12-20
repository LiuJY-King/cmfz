package com.baizhi.controller;

import com.baizhi.entity.Menu;
import com.baizhi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("menu")
public class MenuController {
    @Autowired
    MenuService menuService;

    @RequestMapping("queryFirst")
    @ResponseBody
    public List<Menu> queryFirst() {
        List<Menu> menus = menuService.queryFirst();

        return menus;
    }
    @ResponseBody
    @RequestMapping("querySecond")
    public List<Menu> querySecond(Integer pid){
        List<Menu> menus = menuService.querySecond(pid);
        System.out.println("Menu==" + menus);
        return menus;
    }
}
