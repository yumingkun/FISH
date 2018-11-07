package com.fish.service;


import com.fish.bean.Category;
import com.fish.dao.CategoryDao;

import java.util.List;

/**
 * 分类
 */
public class CategoryService {
    private CategoryDao categoryDao;

    public CategoryService(){
        categoryDao=new CategoryDao();
    }

    /**
     * 后台查询所有的分类
     * @return
     */
    public List<Category> getCategoryList(){
        return categoryDao.getCategoryList();
    }

    /**
     *  添加新类别
     * @param gname
     * @return
     */
    public Boolean addCategory(String gname){
        return categoryDao.addCategory(gname);
    }
}
