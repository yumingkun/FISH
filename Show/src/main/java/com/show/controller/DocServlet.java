package com.show.controller;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fish.bean.Category;
import com.fish.bean.Doc;
import com.fish.bean.User;
import com.fish.service.CategoryService;
import com.fish.service.DocService;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;


@WebServlet({"/show/toUploadDoc.do","/show/uploadDoc.do","/show/deleteDoc.do","/show/downDoc.do","/show/isShare"})
public class DocServlet extends HttpServlet {
	private DocService docService=new DocService();
    ServletConfig servletconfig;
    @Override
	public void init(ServletConfig config) throws ServletException {
		this.servletconfig=config;
	}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 User user=(User) request.getSession().getAttribute("user");
    	 if ("/show/toUploadDoc.do".equals(request.getServletPath())) {//去上传文件那个页面
			 List<Doc> docs=docService.getDocListByUsername(user.getUsername());
			 request.setAttribute("docs", docs);
             request.getRequestDispatcher("/WEB-INF/views/upload.jsp").forward(request, response);
             
		}else if ("/show/uploadDoc.do".equals(request.getServletPath())) {//form 表单上传文件提交


	    	// 1实例化一个SmartUpload对象
	    	SmartUpload su=new SmartUpload();

	    	
	    	/*2.初始化一个SmartUpload对象*/
			su.initialize(servletconfig,request,response);
		 
			//3设置文件上传的限制
			su.setAllowedFilesList("doc,docx,txt,jpg,gif,png,zip,sql,jar,dll,JPG,exe,war,gif,jpg,jpeg,png,bmp,swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
			su.setMaxFileSize(3*1024*1024);
			su.setTotalMaxFileSize(12*1024*1024);
			/*4使用upload上传*/
			try {
				 
				su.upload();
			} catch (Exception e2) {
				e2.printStackTrace();
				request.setAttribute("doc",2);//上传失败
				request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
				return;
			}
			Request myRequest=su.getRequest();
			/*5文件保存*/
			 
			Files files=su.getFiles();
			File file=files.getFile(0);
			String extFile=file.getFileExt();
			String mainFile=file.getFileName();
			String savePath="upload/"+mainFile;

	//           eclipse重新部署之后，项目状态就会被清空(你的上传文件夹就会被删除)，但是如果不是重新部署，只是重启服务器的话，你的图片目录还会在。
			 String uploadPath =servletconfig.getServletContext().getRealPath("/")+"upload/";
	//            /Users/mingkunyu/tool/apache-tomcat-8.5.32/wtpwebapps/Yuu/upload/
			 java.io.File f=new java.io.File(uploadPath);
			 if (!f.exists()) {//没有此目录就新建一个目录
				 f.mkdirs();
			 }
			
			//6封装数据
			//filename,savepath,filesize,catalog,filetype,memo,isshare,username,uploaddate
			Doc doc=new Doc();
			doc.setFilename(file.getFileName());
			doc.setSavepath(savePath);
			doc.setFilesize(file.getSize());
			doc.setFiletype(file.getFileExt());
			doc.setMemo(myRequest.getParameter("memo"));
			doc.setIsshare(myRequest.getParameter("isshare"));
			doc.setUsername(user.getUsername());
		
			//创建日期格式化对象   因为DateFormat类为抽象类 所以不能new
	        DateFormat bf = new SimpleDateFormat("yyyy-MM-dd E a HH:mm:ss");//多态
	        Date date=new Date();
			String format = bf.format(date);//格式化 bf.format(date);
			doc.setUploaddate(format);
			//end
 
			int saveResult=docService.save(doc);
			if (saveResult>0) {
		           request.setAttribute("doc",1);//上传成功
				   request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
			}else {
				request.setAttribute("doc",2);//上传失败
				request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
			}
			try {
				file.saveAs(savePath);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
				
		}else if ("/show/deleteDoc.do".equals(request.getServletPath())){
			 int id=Integer.parseInt(request.getParameter("id"));
			 int result=docService.deleteDoc(id);
			 if (result>0) {

				 request.setAttribute("doc",3);//删除成功
				 request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
			 }else {
				 request.setAttribute("doc",4);//删除失败
				 request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
			 }
		 }else if ("/show/downDoc.do".equals(request.getServletPath())){
			 SmartUpload su=new SmartUpload();
			 String savepath=request.getParameter("savepath");
			 docService.addDownNum(savepath);
			 System.out.println("保存路径"+savepath);
			 su.initialize(servletconfig,request,response);
			 su.setContentDisposition(null);
			 try {
				 su.downloadFile("/"+savepath);
//				 request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);

			 } catch (SmartUploadException e) {
				 e.printStackTrace();
			 }
		 }else if ("/show/isShare".equals(request.getServletPath())){
    	 	String share=request.getParameter("share");
    	 	int docId=Integer.parseInt(request.getParameter("docId"));

    	 	int result=docService.uploadShare(share,docId);
			request.getRequestDispatcher("/show/toUploadDoc.do").forward(request, response);
		 }
    	
		 
    }
 


}