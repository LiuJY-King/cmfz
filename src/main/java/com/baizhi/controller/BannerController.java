package com.baizhi.controller;

import com.baizhi.dto.BannerPageDto;
import com.baizhi.entity.Banner;
import com.baizhi.mapper.BannerMapper;
import com.baizhi.service.BannerService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("banner")
public class BannerController {
    @Autowired
    BannerService bannerService;
    @Autowired
    BannerMapper bannerMapper;
    @RequestMapping("queryAllBanner")
    @ResponseBody
    public BannerPageDto queryAllBanner(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<Banner> banners = bannerMapper.selectAll();
//        System.out.println("============"+banners);
        return new BannerPageDto(bannerMapper.selectCount(new Banner()), banners);
    }

    @RequestMapping("update")
    @ResponseBody
    public void updateBanner(Banner banner) {
        bannerService.updateBanner(banner);
    }

    @RequestMapping("delete")
    @ResponseBody
    public void deleteBanner(Banner banner) {
        bannerService.deleteBanner(banner);
    }

    @RequestMapping("insertBanner")
    public void insertBanner(Banner banner, HttpSession session, MultipartFile file1) throws IllegalStateException, IOException {
        banner.setPubDate(new Date());
        System.out.println(banner);
        String path = session.getServletContext().getRealPath("/image");
        String filename = file1.getOriginalFilename();
        long time = new Date().getTime();
        String newName = time + filename;

        File descFile = new File(path + "/" + newName);
        file1.transferTo(descFile);
        banner.setImgPath("/image/" + newName);
        System.out.println(banner);
        bannerService.insertBanner(banner);
    }
}
