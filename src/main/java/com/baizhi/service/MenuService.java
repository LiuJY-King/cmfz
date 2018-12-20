package com.baizhi.service;

import com.baizhi.entity.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> queryFirst();

    public List<Menu> querySecond(Integer pid);
}
