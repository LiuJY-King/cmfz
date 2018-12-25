package com.baizhi.service;

import com.baizhi.entity.CountProvince;
import com.baizhi.mapper.CountProvinceMapper;
import com.baizhi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    CountProvinceMapper countProvinceMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Map<String, Object> queryUserCount() {
        HashMap<String, Object> map = new HashMap<String,Object>();


        int count1 = userMapper.queryUserCount(7);
        int count2 = userMapper.queryUserCount(14);
        int count3 = userMapper.queryUserCount(21);
        int count4 = userMapper.queryUserCount(60);

        int[] ints = {count1, count2, count3, count4};

        map.put("counts",ints);

        map.put("intervals",new String[]{"近1周","近2周","近3周","近两个月"});

        return map;
    }

    @Override
    public List<CountProvince> queryCountBySex(Integer sex) {
        List<CountProvince> list = countProvinceMapper.queryCountBySex(sex);

        return list;
    }

}
