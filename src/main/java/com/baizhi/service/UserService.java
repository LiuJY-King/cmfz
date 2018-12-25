package com.baizhi.service;

import com.baizhi.entity.CountProvince;

import java.util.List;
import java.util.Map;

public interface UserService {
    Map<String, Object> queryUserCount();

    List<CountProvince> queryCountBySex(Integer sex);
}
