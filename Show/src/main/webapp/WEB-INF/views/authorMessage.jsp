
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
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%--导航--%>
<jsp:include page="../common/header.jsp" />
<!-- 导航END -->

<div class="container">
    <div class="row">


        <div class="col-md-8 col-lg-offset-1">
            <div class="mylist">
                <c:forEach items="${messages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-3 .text-center" >
                            <img src="${message.src}" class="thumbnail">
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

        <div class="col-md-3">
            <div class="thumbnail" style="box-shadow: 2px 2px 5px silver">
                <img src="<%=basePath%>${user.head}" alt="..." style="border-radius: 50px;border: 4px solid #dcf7ff">
                <div class="caption" style="text-align: center">
                    <h4>作者：${user.username}</h4>
                    <!--<p>...</p>
                    <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                </div>
            </div>
        </div>


    </div>
</div>



<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>



</body>




</html>
