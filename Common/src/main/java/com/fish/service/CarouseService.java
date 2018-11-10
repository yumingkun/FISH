package com.fish.service;

import com.fish.bean.Carousel;
import com.fish.dao.CarouselDao;

import java.util.List;

public class CarouseService {
    private CarouselDao carouselDao;

    public CarouseService(){
        carouselDao=new CarouselDao();
    }
    /**
     * 添加轮播图片地址
     * @return
     */
    public int addCarousel(String uploadUrl){
        return carouselDao.addCarousel(uploadUrl);
    }

    /**
     * 得到所有轮播图信息
     * @return
     */
    public List<Carousel> getCarouselList(){
        return carouselDao.getCarouselList();
    }
}
