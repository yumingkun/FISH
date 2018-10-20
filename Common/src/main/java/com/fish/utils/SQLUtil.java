package com.fish.utils;

//分页查询使用的工具类
public class SQLUtil {

    /**
     * 动态生成分页查询的Limit子句
     * @param page 当前页码
     * @param recordOfPage 每页记录数量
     * @re
     * turn limit子句（select id,username,password,email  from users limit 0,5）
     */
    public static String getLimit(int page, int recordOfPage) {
        return " limit " + ((page - 1) * recordOfPage) + "," + recordOfPage;
    }
    /*
     * 	测试
     *
     * */
//	 public static void main(String[] args) {
//		System.out.println(getLimit(1, 5));
//		System.out.println(getLimit(2, 5));
//		System.out.println(getLimit(3, 5));
//		System.out.println(getLimit(4, 5));
//		System.out.println(getLimit(5, 5));
//	}
//	 limit 0,5
//	 limit 5,5
//	 limit 10,5
//	 limit 15,5
//	 limit 20,5



}
