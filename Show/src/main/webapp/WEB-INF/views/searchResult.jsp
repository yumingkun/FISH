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
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>
    <style >
        /*加载更多*/
        .more{
            margin-top: 100px;
            height: 40px;
            line-height: 40px;
            border-radius: 20px;
            background-color: #b0b8d2;
            text-align: center;
            color: white;
            font-size: 16px;
            font-weight:bold;

        }


        #nullImg{
            width: 200px;
            height: 140px;
            border: 2px solid #b9def0;
        }
    </style>


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

        </div>
        <!-- 左边分类END -->
        <!-- 中间内容 -->
        <div class="col-sm-7">

            <%--初始值--%>
            <div class="new-list mylist">
                <c:forEach items="${searchMessages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-4 .text-center" >
                            <c:if test="${message.src==null or message.src==''}">
                                <img src="../../img/nullsrc.png" id="nullImg" >
                            </c:if>
                            <c:if test="${message.src!=null}">
                                <img src="${message.src}">
                            </c:if>
                        </div>
                        <div class="col-xs-7">

                            <a href="/show/detail.do?id=${message.id}&userId=${message.userId}" class="title">${message.title}</a>
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
                <%--加载更多数据显示位置   --%>

            </div>

        </div>
        <!-- 中间内容END -->
        <!-- 右边内容 -->
        <div class="col-sm-3">


        </div>
        <!-- 右边内容END -->
    </div>
</div>


<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>



</body>




</html>
