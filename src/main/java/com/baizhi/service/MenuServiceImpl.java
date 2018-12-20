package com.baizhi.service;

import com.baizhi.entity.Menu;
import com.baizhi.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> queryFirst() {
//        List<Menu> menus = menuMapper.queryFirst();
        Menu menu = new Menu();
        menu.setParent_id(0);
        List<Menu> menus = menuMapper.select(menu);
        return menus;
    }

    @Override
    public List<Menu> querySecond() {
        return null;
    }
}
