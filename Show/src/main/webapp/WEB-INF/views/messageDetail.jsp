<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/25
  Time: 下午4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新建留言</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <%--引入富文本框js css--%>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/wangEditor.min.css">
    <script type="text/javascript" src="../../js/wangEditor.min.js"></script>

</head>
<body>
<%--1:引入头部--%>
<jsp:include page="../common/header.jsp"></jsp:include>
<%--1:文章详情主体--%>
<div class="container">
    <!-- 左边文章 -->
    <div class="col-md-8">
        <h1 >${message.title}</h1>
        <div >
            ${message.content}
        </div>
    </div>
    <!-- 左边文章END -->

    <%--<!-- 右侧边栏 -->--%>
    <%--<div class="col-md-4">--%>
        <%--<div class="side-bar-card">--%>
            <%--<div class="card-title">相关推荐</div>--%>
            <%--<div class="card-body">--%>
                <%--<div class="list">--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="side-bar-card">--%>
            <%--<div class="card-title">24小时热闻</div>--%>
            <%--<div class="card-body">--%>
                <%--<div class="list">--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!-- 右侧边栏END -->--%>

</div>

<%--1:引入页尾--%>
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>
