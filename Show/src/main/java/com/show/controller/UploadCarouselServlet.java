package com.show.controller;

import com.fish.bean.Carousel;
import com.fish.service.CarouseService;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import org.apache.log4j.Logger;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet({"/show/toCarousel.do","/show/carousel.do"})
public class UploadCarouselServlet extends HttpServlet {
    private static Logger logger = Logger.getLogger(UploadCarouselServlet.class);
    private CarouseService carouseService;



    ServletConfig servletConfig;

    //    初始化servletConfig对象
    public void init(ServletConfig config) throws ServletException {

        this.servletConfig=config;
        carouseService=new CarouseService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //去轮播图那个页面
        if ("/show/toCarousel.do".equals(request.getServletPath())){
            List<Carousel> carouselList =carouseService.getCarouselList();
            request.setAttribute("carousels",carouselList);
            request.getRequestDispatcher("/WEB-INF/views/carousel.jsp").forward(request,response);

        //上传轮播图片
        }else if ("/show/carousel.do".equals(request.getServletPath())){

            SmartUpload su=new SmartUpload();
            su.initialize(servletConfig,request,response);//  2：初始化SmartUpload对象

            su.setMaxFileSize(3*1024*1024);    //4：设置单个文件最大字节数
            su.setAllowedFilesList("png,jpg,jpeg");//3:设置文件上传的限制

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


//           绝对路径
//           String uploadPath =servletConfig.getServletContext().getRealPath("/");
//           服务器的根目录下 /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/

//           使用相对路径
            String saveUrl="carousel/";//此目录需要新建
            String filePath=saveUrl+mainFile+"."+extFile;
//           服务器的upload目录下  /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/upload/1540285990824.jpg


//           eclipse重新部署之后，项目状态就会被清空(你的上传图片文件夹就会被删除)，但是如果不是重新部署，只是重启服务器的话，你的图片目录还会在。
            String uploadPath =servletConfig.getServletContext().getRealPath("/")+saveUrl;
//            /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/upload/
            java.io.File f=new java.io.File(uploadPath);
            if (!f.exists()) {//没有此目录就新建一个目录
                f.mkdirs();
            }


            try{
                file.saveAs(filePath); //文件另存到tomcat部署的项目文件夹中，不是当前项目物理位置
            }catch (SmartUploadException e){
                System.out.printf(filePath+"---------------------------------------");
                e.printStackTrace();

            }

//            logger.info(uploadPath);
//          数据库储存文件路径和文件名
            int resultNum=carouseService.addCarousel(filePath);
            if (resultNum>0){
                request.getRequestDispatcher("/show/toCarousel.do").forward(request,response);
                return;
            }

            request.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(request,response);
        }




    }
}
