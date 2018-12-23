package com.baizhi.service;


import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    List<Banner> queryAllBanner();

    void updateBanner(Banner banner);

    void deleteBanner(Banner banner);

    void insertBanner(Banner banner);
}
