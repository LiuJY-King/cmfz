package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.mapper.BannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    BannerMapper bannerMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Banner> queryAllBanner() {
        List<Banner> banners = bannerMapper.selectAll();
        return banners;
    }

    @Override
    public void updateBanner(Banner banner) {
        bannerMapper.updateByPrimaryKey(banner);
    }

    @Override
    public void deleteBanner(Banner banner) {
        bannerMapper.delete(banner);
    }

    @Override
    public void insertBanner(Banner banner) {
        bannerMapper.insert(banner);
    }
}
