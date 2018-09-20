<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/19
  Time: 下午10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>FISH</title>

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../js/jquery.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../js/bootstrap.min.js"></script>
</head>
<body>

<!--导航头-->
<nav class="navbar navbar-inverse  navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">LOGO 首页</a>

            <!--&lt;!&ndash;缩放时的按钮&ndash;&gt;   data-toggle：指以什么事件类型触发，-->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#y-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="y-navbar-collapse">
            <ul class="nav navbar-nav navbar-right" style="margin-top:0;">

                <li><a href="/show/write.do"><span class="glyphicon glyphicon-question-sign"></span> 写文章</a></li>
            </ul>
        </div>
    </div>
</nav>


<section class="main">
    <div class="container">
        <c:forEach items="${messages}" var="msg">
            <div class="alt-item">
                <div class="alt-head">
                    <div class="alt-info">
                        <span>作者：<a href="">${msg.userName}</a></span>
                        <span>时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${msg.createTime}"/></span>
                    </div>
                </div>
                <div class="alt-content">
                    <h3>${msg.title}</h3>
                    <p>${msg.content}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</section>

</body>
</html>
