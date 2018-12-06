<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/25
  Time: 下午10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
    .navbar{
       box-shadow: 0px 2px 2px #cccccc;
        /*border: 1px solid red;*/
    }
    .navbar .navbar-header{
        width: 100%;
    }
    .navbar .navbar-header img{
        width: 50px;
        height: 50px;
        margin-top: 0px;
        /*border: 1px solid red;*/
    }
    /*头像大小*/
    .navbar .navbar-header .file_icon{
        height: 50px;
        width: 50px;
        border-radius: 8px;
    }
    #ident{
        color: #92adff;
        font-size: 15px;
        font-weight: bold;
    }
    #nav{
        float: right;
    }



</style>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<nav class="navbar">
    <div class="container">
        <div class="navbar-header">
                <a href="<%=request.getContextPath()%>/show/toLogin.do"><img alt="Brand" src="../../img/logo.png"></a>

                <%--下拉菜单--%>
                <ul class="navbar-right nav navbar-nav" id="nav">
                    <li  >
                        <img alt="" src="<%=basePath%>${sessionScope.manageUser.head}" class="file_icon">
                    </li>
                    <li>
                        <ul class="nav navbar-nav" >
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    ${sessionScope.manageUser.username}
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <c:choose>
                                            <c:when test="${sessionScope.manageUser.power eq 2}">
                                                <a id="ident" >系统管理员</a>
                                            </c:when>
                                            <c:when test="${sessionScope.manageUser.power eq 1}">
                                                <a id="ident" >管理员</a>
                                            </c:when>
                                        </c:choose>
                                    </li>

                                    <li class="divider"></li>
                                    <li><a href="<%=request.getContextPath()%>/manage/quit.do"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                </ul>
        </div>

    </div>
</nav>
