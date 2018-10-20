package com.fish.vo;

import java.util.List;

public class PageVO<T> {
    // 1 page 页码 用户指定
    private int page;
    // 2 recordOfPage 每页记录数量 用户指定
    private int recordOfPage;
    // 3 pageCount 总页数 计算得到
    private int pageCount;
    // 4 recordCount 总记录数量 select count(*)
    private int recordCount;
    // 5 list 当前页的集合 select * from items limit
    private List<T> list;

    // 6  生成get set

    public int getPage() {
        return page;
    }

    public int getRecordOfPage() {
        return recordOfPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public int getRecordCount() {
        return recordCount;
    }

    public List<T> getList() {
        return list;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setRecordOfPage(int recordOfPage) {
        this.recordOfPage = recordOfPage;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public void setRecordCount(int recordCount) {
        this.recordCount = recordCount;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
