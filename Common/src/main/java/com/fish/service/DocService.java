package com.fish.service;

import java.util.List;

import com.fish.bean.Doc;
import com.fish.dao.DocDao;


public class DocService {
    private DocDao docDao;

    public DocService() {
        docDao = new DocDao();
    }

    /**
     * 上传新的文件
     *
     * @return
     */
    public int save(Doc doc) {
        return docDao.save(doc);
    }


    /**
     * 查询所有文件
     *
     * @return
     */
    public List<Doc> getDocList() {
        return docDao.getDocList();
    }

    /**
     * 根据用户username查询用户所有文件
     */
    public List<Doc> getDocListByUsername(String username) {
        return docDao.getDocListByUsername(username);
    }

    /**
     * 根据id删除文件
     *
     * @param id
     * @return
     */
    public int deleteDoc(int id) {
        return docDao.deleteDoc(id);
    }


    /**
     * 前台根据关键词，查找文件
     *
     * @param search
     * @return
     */
    public List<Doc> searchFile(String search) {
        return docDao.searchFile(search);
    }

    /**
     * 每次下载增加下载量
     *
     * @param savepath
     * @return
     */
    public int addDownNum(String savepath) {
        return docDao.addDownNum(savepath);
    }

    /**
     * 更新分享状态
     *
     * @return
     */
    public int uploadShare(String share, int id) {
        return docDao.uploadShare(share,id);
    }
}