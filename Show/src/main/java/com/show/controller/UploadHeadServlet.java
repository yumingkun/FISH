package com.show.controller;


import com.fish.bean.User;
import com.fish.service.UserService;
import com.jspsmart.upload.*;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import org.apache.log4j.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import java.io.IOException;
import java.util.Date;

@WebServlet("/show/upload.do")
public class UploadHeadServlet extends HttpServlet {

    private static Logger logger = Logger.getLogger(UploadHeadServlet.class);
    private UserService userService;


    ServletConfig servletConfig;

//    初始化servletConfig对象
    public void init(ServletConfig config) throws ServletException {
        userService=new UserService();
        this.servletConfig=config;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SmartUpload su=new SmartUpload();//1：创建一个SmartUpload对象
        su.initialize(servletConfig,request,response);//2：初始化SmartUpload对象

        su.setAllowedFilesList("png,jpg,jpeg");//3:设置文件上传的限制
        su.setMaxFileSize(3*1024*1024);    //4：se设置单个文件最大字节数

        try{
            su.upload();//5:使用upload上传
        }catch (SmartUploadException e){
            e.printStackTrace();
        }

        //6:获取时间，作为文件名
        Date curDate=new Date();
        long d=curDate.getTime();



        //7:获取全部上传文件
        Files files=su.getFiles();
        //8:获取指定位置的文件文件
        File file=files.getFile(0);

        //9;获取文件的后缀名
        String extFile=file.getFileExt();
        //10:获取时间，作为文件名
        String mainFile=String.valueOf(d);


        //11:上传到服务器的根目录下
//        String uploadPath =servletConfig.getServletContext().getRealPath("/");
        String  uploadPath="/Users/mingkunyu/upload/";
        String filePath=uploadPath +mainFile+"."+extFile;



        logger.info(filePath);

        try{
            file.saveAs(filePath); //上传文件另存到tomcat部署的项目文件夹中，
        }catch (SmartUploadException e){
            System.out.printf(filePath+"---------------------------------------");
            e.printStackTrace();

        }

        System.out.printf(filePath+"---------------------------------------");


//        上传文件名到数据库
        User user=(User)request.getSession().getAttribute("user");
        int  id=user.getId();
        String url="upload/"+mainFile+"."+extFile;
        if ( userService.addHead(url,id)){
            System.out.printf("上传头像成功====================");
//          上传头像之后更新session中的头像地址
            user.setHead(url);
            request.getSession().setAttribute("user",user);
            request.getRequestDispatcher("/show/user.do").forward(request,response);
//            request.getSession().setAttribute("src",mainFile+"."+extFile);
        }else{
            System.out.printf("上传头像失败=======================");
        }


    }

}
