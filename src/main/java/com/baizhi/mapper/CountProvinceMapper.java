package com.baizhi.mapper;

import com.baizhi.entity.CountProvince;
import com.baizhi.entity.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface CountProvinceMapper extends Mapper<User> {
    List<CountProvince> queryCountBySex(Integer sex);
}
