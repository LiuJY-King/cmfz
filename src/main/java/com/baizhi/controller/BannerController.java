package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("banner")
public class BannerController {
    @Autowired
    BannerService bannerService;
    @RequestMapping("queryAllBanner")
    @ResponseBody
    public List<Banner> queryAllBanner(int page,int rows){
        PageHelper.startPage(page,rows);
        List<Banner> banners = bannerService.queryAllBanner();
        return  banners;
    }
}
