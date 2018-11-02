<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/26
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--当前用户所有文章的页面--%>
<!DOCTYPE html>
<html>
<head>
    <title>个人博客</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            font-family: 微软雅黑;
        }

        #ul-right{
            padding-right: 0px !important;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            box-shadow: 2px 2px 5px 0px #C4C4C4;
        }
        #ul-right a{
            border: none !important;
            text-align: center;
        }
        #ul-right li{
            width: 100%;
            border: none !important;
            text-align: center;
        }
        #ul-right a:hover{
            color: white !important;
            cursor: pointer;
            background-color: #0062FF !important;
            box-shadow: 2px 2px 2px 0px #478EFF inset;
        }
        #ul-right li:hover{
            color: white;
            cursor: pointer;
            background-color: #0062FF ;
            box-shadow: 3px 3px 1px 1px #00428D inset;
        }
        #right{

        }
        #left{
            border: 1px solid #C4C4C4;
            padding: 0px;
            border-radius: 10px;
            box-shadow: 2px 2px 5px 0px #C4C4C4;
            min-height: 450px;
        }
        #left-h3{
            background-color: #8FDAFF;
            margin: 1px;
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
            box-shadow: 0px 3px 1px 1px gray;
        }
        #left-row{
            padding: 0px;
            height: 100%;
            /*background-color: ;*/
        }
        #article a{
            text-decoration-style: none;
        }
        #article a,#article a:link,#article a:visited,#article a:hover,#article a:active{
            text-decoration: none;
            color:inherit;
        }


    </style>
</head>
<body>

<div style="height: 80px"></div>
<div class="container">
    <div class="row">
        <div class="container col-md-2">
            <div id="right">

                <div class="row">
                    <div class=" col-md-12 col-xs-6" style="padding: 0px;">
                        <ul id="ul-right" class="list-group col-md-12 col-xs-12">
                            <a href="#" class="list-group-item">主页</a>
                        </ul>
                        <ul id="ul-right" class="list-group col-md-12 col-xs-12">
                            <a class="list-group-item">Markdown编辑器</a>
                            <a class="list-group-item">富文本编辑器</a>
                        </ul>
                    </div>


                    <ul id="ul-right" class="list-group col-md-12 col-xs-6">
                        <span class="list-group-item-heading text-muted">内容</span>
                        <a href="#" class="list-group-item">文章管理</a>
                        <a href="#" class="list-group-item">专栏管理</a>
                        <a href="#" class="list-group-item">评论管理</a>
                        <a href="#" class="list-group-item">个人分类管理</a>
                        <span class="list-group-item-heading text-muted">设置</span>
                        <a href="#" class="list-group-item">博客管理</a>
                        <a href="#" class="list-group-item">栏目管理</a>

                    </ul>
                </div>

            </div>
        </div>

        <div id="left" class="container col-md-10 panel panel-group">

            <ul class="nav nav-tabs page-header">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">AAAA</a></li>
                <li><a href="#">BBBB</a></li>
                <li><a href="#">CCCC</a></li>
            </ul>

            <form class="panel-body form-inline" style="background-color: gray;">
                发布时间：
                <div class="form-group">
                    <select class="form-control">
                        <option>1</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control">
                        <option>1</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control">
                        <option>1</option>
                    </select>
                </div>
                <input class="form-control" type="text" name="" placeholder="请输入搜索关键字">
                <input class="form-control" type="submit" value="搜索">
            </form>

            <div id="article" class="panel-footer">
                <%--文章列表--%>
                <div class="new-list">
                    <c:forEach items="${myMessages}" var="message">
                        <div class="new-list-item clearfix">
                            <div class="col-xs-3" >
                                <img src="${message.src}" alt="" style="height:80px;width: 120px">
                            </div>
                            <div class="col-xs-6">

                                <a href="/show/detail.do?id=${message.id}&userId=${message.userId}" class="title">${message.title}</a>
                                <%--<div class="content" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;width:200px;height: 70px">--%>
                                        <%--<p>${message.content}</p>--%>
                                <%--</div>--%>
                                <div class="info" style="margin-top: 30px">
                                    <span> <span class="avatar"><img src="../../img/logo.png"></span>猿梦</span> ⋅
                                    <span>25k</span> ⋅
                                    <span>${message.title}</span>
                                </div>

                            </div>
                            <%--修改--%>
                            <div class="col-xs-1 "><span class="glyphicon glyphicon-edit"></span>  </div>
                           <%--放入回收站--%>
                            <div class="col-xs-1"><span class="glyphicon glyphicon-trash" style="color: firebrick"></span></div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="col-sm-7">



</div>

</body>
</html>
