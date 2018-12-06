package com.fish.service;


import com.fish.bean.Category;
import com.fish.dao.CategoryDao;
import com.fish.vo.CategoryVo;

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


    /**
     * 删除专题的同时把文章类别设置成0：无
     * @param id
     * @return
     */
    public int deleteCategory(int id){
        return categoryDao.deleteCategory(id);
    }

    /**
     * 修改专题名称
     * @param
     * @return
     */
    public int upldateCategory(Category category){
        return categoryDao.upldateCategory(category);
    }

    /**
     * 获取每个专题对应的文章个数
     * @return
     */
    public List<CategoryVo> getCategoryVo(){
        return categoryDao.getCategoryVo();
    }
}
