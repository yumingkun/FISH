
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

        .mylist .new-list-item img{
            width: 130px;
            height: 90px;
            border: 2px solid #b9def0;
            transition: all 0.5s;
        }
        .mylist .new-list-item img:hover{

            box-shadow: 10px 10px 20px gainsboro ;
        }


        #nullImg{
            width: 200px;
            height: 140px;
            border: 2px solid #b9def0;
        }
        .info{
            margin-top: 40px;
        }
        /*背景*/
        .back{
            text-align: center;
            padding-top: 80px;
            height: 200px;
            width: 100%;
            margin: 10px auto;
            /*border: 1px solid red;*/
            background: url("../../img/back.png") no-repeat center ;
           background-size: contain;

            /*background-size: cover;*/
        }
        .back span{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 60px;
            font-weight: bold;
            color: #afb6ce;
        }

        /*结果*/
        .theResult{
            margin-top:10px;
            width: 100%;
            font-family: "Wawati SC";
            text-align: center;
            font-size: 17px;
            font-weight: 800;
            color: #26263d;

        }
        .theResult span{
            color: #b0b8d2;
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
        <div class="col-sm-3 hidden-xs">

        </div>
        <!-- 左边分类END -->
        <!-- 中间内容 -->
        <div class="col-sm-6">

            <%--背景--%>
            <div class="back"><span>${num}</span></div>

            <%--结果--%>
            <div class="theResult"><span class="glyphicon glyphicon-menu-right"></span> RESULT <span class="glyphicon glyphicon-menu-left"></span></div>
            <hr/>
                <%--初始值--%>
            <%--<h1>${searchNum}</h1>--%>
            <div class="new-list mylist">
                <c:forEach items="${searchMessages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-4 .text-center" >
                            <c:if test="${message.src==null or message.src==''}">
                                <img src="../../img/nullsrc.png" id="nullImg"  >
                            </c:if>
                            <c:if test="${message.src!=null}">
                                <img src="${message.src}" class="thumbnail">
                            </c:if>
                        </div>
                        <div class="col-xs-7">

                            <a href="<%=request.getContextPath()%>/show/detail.do?id=${message.id}&userId=${message.userId}" class="title">${message.title}</a>
                            <div class="content">
                                    <%--<p>${message.content}</p>--%>

                            </div>
                            <div class="info">
                                <span class="glyphicon glyphicon-tag" style="color: #a5d1a4"></span>
                                <span>${message.category.gname}</span>
                                <span class="glyphicon glyphicon-user" style="color: #b6bfd9"></span>
                                <span>${message.userName} </span>
                                <span class="glyphicon glyphicon-heart" style="color: #d17687"></span>
                                <span>${message.laud}</span>

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
