<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css" />
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        // 工具提示
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
        }

        a,a:hover,a:active{
            text-decoration: none;
            color: #92adff;
        }
        #container ul{
            padding: 0px ;
            width: 90%;
            border: 1px solid #C4C4C4;
            border-radius: 5px;

            /*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
        }
        #container ul a{
            color: black;
            border: none ;
            text-align: center;
        }
        #container  ul li{
            width: 100%;
            border: none ;
            text-align: center;
        }
        /*#container ul .list-group-item a{*/
        /*display: block;*/
        /*height: 20px;*/
        /*margin-top: -10px;*/
        /*color:gray ;*/
        /*}*/
        #container ul a:hover{
            color: white ;
            background-color: #b0b8d2;
            /*box-shadow: 2px 2px 2px 0px #478EFF inset;*/
        }
        #container ul li:hover{
            color: white;
            cursor: pointer;
            background-color: #b0b8d2;
            /*box-shadow: 3px 3px 1px 1px #00428D inset;*/
        }

        #left{
            border: 1px solid #C4C4C4;
            padding: 0px;
            border-radius: 10px;
            /*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
            min-height: 300px;
        }
        #right-h3{
            font-family: "Wawati SC";
            background-color: #f0f4ff;
            font-weight: bold;
            /*margin: 1px;*/
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
        }
        #right-h3 span{
            display: inline-block;
            float: right;
        }

        #myImg img{
            width: 250px;
            height: 250px;
        }


        /*左边选项默认为不显示*/
        .myLeaf{
            display:block;
        }

        /*轮播图*/
        .myCarousel h1{
            display: none;
        }

        /*评论*/
        .myComment1 a{
            display: inline-block;
            float: right;
        }
        .myComment1 .com{
            color: #898bd0;
        }
        .myComment2 p{
            margin-left: 15px;
        }

        /*我的关注的头像*/
        #myFollow img{
            height: 120px;
            width: 120px;
            border-radius: 10px;
        }


    </style>

</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!-- 导航 -->
<%--1:引入头部--%>
<jsp:include page="../common/header.jsp" />
<!-- 导航end -->


<!-- 提示end -->

<%--内容--%>
<div class="container" id="container">
    <div class="row">
        <%--左边--%>
        <div class="col-md-2" >
            <span class="glyphicon glyphicon-cog" id="too" style="font-size: 40px;margin-bottom: 10px"></span>
            <div id="right" class="myLeaf">
                <div class="row">
                    <ul class="nav nav-pills nav-stacked list-group col-md-12 col-xs-6 ">
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/user.do">个人中心</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUserComment.do">我的评论</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFollow.do">我的关注</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFan.do">我的粉丝</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUploadDoc.do">我的文件</a></li>
                    </ul>


                    <ul class="list-group col-md-12 col-xs-6">
                        <a href="<%=request.getContextPath()%>/show/myMessage.do" class="list-group-item">我的博客</a>
                        <a href="<%=request.getContextPath()%>/show/showTrashMessage.do" class="list-group-item"><span class="glyphicon glyphicon-trash"></span> 回收站</a>
                        <%--<a href="#" class="list-group-item">我的论坛</a>--%>
                        <%--<a href="#" class="list-group-item">我的学院</a>--%>
                    </ul>
                </div>

            </div>
        </div>

        <%--右边--%>
        <div id="left" class="col-md-10 panel panel-default"   >
            <h3 id="right-h3" class="panel-heading">我的粉丝</h3>
            <div class="container-fluid">

                <div class="row">
                    <c:forEach items="${userfans}" var="userfans">
                        <div class="col-md-2">
                            <div class="thumbnail" id="myFollow">
                                <img src="<%=basePath%>${userfans.head}" alt="...">
                                <div class="caption">
                                    <p><a href="<%=request.getContextPath()%>/show/myFanMessage.do?fanId=${userfans.id}">${userfans.username}</a></p>
                                    <p>${userfans.email}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>


            </div>

        </div>

    </div>




    <%--页脚--%>
    <jsp:include page="../common/footer.jsp" />
    <%--页脚end--%>

</body>


</html>