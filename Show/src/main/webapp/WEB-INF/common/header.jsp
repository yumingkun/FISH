<%@ page import="com.fish.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/23
  Time: 上午11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style type="text/css">
    .file_icon{
        width: 34px;
        height: 34px;
        line-height: 34px;
        display: flex;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        margin-top: 8px;
        border: 2px solid #5c83b7;
    }
</style>

<!-- 导航 -->
<%
    User user =(User) request.getSession().getAttribute("user");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<div class="navbar navbar-default header" id="headerAnimate"  >
    <div class="container">
        <div class="navbar-header">
            <a href="index.html" class="navbar-brand"></a>
        </div>
        <label id="toggle-label" class="visible-xs-inline-block  " for="toggle-checkbox">MENU</label>
        <input id="toggle-checkbox" class="hidden" type="checkbox" />
        <div class="hidden-xs">
            <ul class="nav navbar-nav">
                <li><a href="#">首页</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">数读</a></li>

            </ul>
            <ul class="navbar-right nav navbar-nav">
                <% if (user!=null){%>
                    <li><img alt="" src="<%=basePath+user.getHead()%>" class="file_icon"></li>
                    <li>
                        <%--下拉菜单--%>
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <%=user.getUsername()%>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="/show/myself.do">个人中心</a></li>
                                    <li><a href="#">暂无</a></li>
                                    <li><a href="#">暂无</a></li>
                                    <li class="divider"></li>
                                    <li><a href="/show/quit.do">退出</a></li>
                                </ul>
                            </li>
                        </ul>
                        <%--end下拉菜单--%>
                    </li>

                <%}else{%>
                <li><img alt="" src="../../img/notlogin.jpg" class="file_icon"></li>
                <%};%>
                <li><a href="/show/write.do"><span class="glyphicon glyphicon-edit"></span> 写文章</a></li>
            </ul>
        </div>
    </div>
</div>

