<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/23
  Time: 上午11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入--%>

    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!-- 导航 -->
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
                <li><a href="#">社会</a></li>
            </ul>
            <ul class="navbar-right nav navbar-nav">
                <li><a href=""><% if (request.getSession().getAttribute("user")==null){%>请登录<%};%></a></li>
                <li><a href="/show/write.do"><span class="glyphicon glyphicon-edit"></span> 写文章</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
