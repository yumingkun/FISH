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
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入--%>

    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>


</head>
<body>
<%--1：标签锚点--%>
<a name="top"></a>

<%--导航--%>
<jsp:include page="../common/header.jsp" />
<!-- 导航END -->

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <!-- 左边分类 -->
        <div class="col-sm-2 hidden-xs">
            <div class="list-group side-bar">
                <a href="" class="list-group-item">综合</a>
                <a href="" class="list-group-item">电影</a>
                <a href="" class="list-group-item">电视剧</a>
                <a href="" class="list-group-item">明星</a>
                <a href="" class="list-group-item">科技</a>
                <a href="" class="list-group-item">社会</a>
                <a href="" class="list-group-item">游戏</a>
                <a href="" class="list-group-item">体育</a>
                <a href="" class="list-group-item">财经</a>
                <a href="" class="list-group-item">搞笑</a>
            </div>
        </div>
        <!-- 左边分类END -->
        <!-- 中间内容 -->
        <div class="col-sm-7">


            <div class="new-list">
                <c:forEach items="${messages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-4">
                            <img src="${message.src}" alt="">
                        </div>
                        <div class="col-xs-7">

                            <a href="/show/detail.do?id=${message.id}" class="title">${message.title}</a>
                            <div class="content">
                                <%--<p>${message.content}</p>--%>
                            </div>
                            <div class="info">
                                <span> <span class="avatar"><img src="../../img/logo.png"></span>猿梦</span> ⋅
                                <span>25k</span> ⋅
                                <span>${message.title}</span>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- 中间内容END -->
        <!-- 右边内容 -->
        <div class="col-sm-3">
            <div class="search-bar">
                <input class="form-control" placeholder="搜一下" type="search">
            </div>
            <div class="side-bar-card flag clearfix">
                <div class="col-xs-5">
                    <img src="img/1-1.png">
                </div>
                <div class="col-cs-7">
                    <div class="text-lg">有害信息举报专区</div>
                    <div>举报电话：12377</div>
                </div>
            </div>
            <div class="side-bar-card">
                <div class="card-title">24小时热闻</div>
                <div class="card-body">
                    <div class="list">
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右边内容END -->
    </div>
</div>


<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>

<%--1：回到顶部--%>
<a href="#top" title="返回顶部"  id="btn"></a>

</body>

</html>
