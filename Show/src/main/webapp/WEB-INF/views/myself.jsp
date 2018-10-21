<%@ page import="com.fish.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/20
  Time: 下午4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
            font-family: 微软雅黑;
        }

       #container ul{
            padding: 0px !important;
            border: 1px solid #C4C4C4;
            border-radius: 5px;
            box-shadow: 2px 2px 5px 0px #C4C4C4;
        }
        #container ul a{
            border: none !important;
            text-align: center;
        }
        #container  ul li{
            width: 100%;
            border: none !important;
            text-align: center;
        }
        #container ul a:hover{
            color: white !important;
            background-color: #0062FF !important;
            box-shadow: 2px 2px 2px 0px #478EFF inset;
        }
        #container ul li:hover{
            color: white;
            cursor: pointer;
            background-color: #0062FF ;
            box-shadow: 3px 3px 1px 1px #00428D inset;
        }

        #left{
            border: 1px solid #C4C4C4;
            padding: 0px;
            border-radius: 10px;
            box-shadow: 2px 2px 5px 0px #C4C4C4;
            min-height: 450px;
        }
        #right-h3{
            background-color: #8FDAFF;
            margin: 1px;
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
            box-shadow: 0px 3px 1px 1px gray;
        }
        #right-row-1{
            padding: 0px;
            height: 100%;
            background-color: ;
        }
        #right-left{
            margin-top: 10px;
            padding: 0px;
            height: 100%;
        }
        #right-right-1{
            padding: 0px;
            height: 100%;
        }

        #right-row-2{
            display: none;
        }
        #right-row-3{
            display: none;
        }
        #right-row-4 {
            display: none;
        }

        #myImg{
            text-align: center;
        }
        #myImg img{
            width: 250px;
            height: 250px;
        }
    </style>
</head>
<body>
<%
    User user =(User) request.getSession().getAttribute("user");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1:引入头部--%>
<%--导航--%>
<jsp:include page="../common/header.jsp" />

<div class="container" id="container">
    <div class="row">
        <div class="container col-md-2">
            <div id="right">

                <div class="row">
                    <ul class="nav nav-pills nav-stacked list-group col-md-12 col-xs-6 ">
                        <li class="list-group-item">个人信息</li>
                        <li class="list-group-item">我的收藏</li>
                        <li class="list-group-item">我的关注</li>
                        <li class="list-group-item">我的粉丝</li>
                    </ul>
                    <ul class="list-group col-md-12 col-xs-6">
                        <a href="#" class="list-group-item">我的博客</a>
                        <a href="#" class="list-group-item">我的下载</a>
                        <a href="#" class="list-group-item">我的论坛</a>
                        <a href="#" class="list-group-item">我的学院</a>
                    </ul>
                </div>

            </div>
        </div>

        <div id="left" class="container col-md-10 panel panel-default">
            <h3 id="right-h3" class="panel-heading">个人信息</h3>
            <div id="right-row-1" class="row" style="margin: 0px;">
                <div id="right-left" class="col-md-3">
                    <div class="thumbnail" style="margin: 5px;">
                        <% if (user==null){%>
                            <img src="../../img/notlogin.jpg" class="img-circle">
                        <% }else{ %>
                             <img alt="" src="<%=basePath+user.getHead()%>">
                        <% }%>

                        <center><button style="margin: 0px;width: 100%;" class="btn btn-default"  data-toggle="modal" data-target="#myModal">修改头像</button></center>

                    </div>

                </div>
                <div id="right-right-1" class="col-md-9" style="padding: 15px;">
                    <div>
                        <p class="text-muted">ID:151241413</p>
                        <p>关注</p><p>粉丝</p>
                    </div>
                    <hr>
                    <div>
                        <p>昵称：</p>
                        <p>实名：</p>
                        <p>性别：</p>
                        <p>生日：</p>
                        <p>地区：</p>
                        <p>行业：</p>
                        <p>职位：</p>
                    </div>
                </div>
            </div>
            <div id="right-row-2">我的收藏</div>
            <div id="right-row-3">我的关注</div>
            <div id="right-row-4">我的粉丝</div>
        </div>

    </div>
</div>



<%--表单--%>
<form action="/show/upload.do" method="post" enctype="multipart/form-data" id="myForm" class="form">
    <input type="file" id="myFile" name="myFile" style="display: none">
</form>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    上传头像
                </h4>
            </div>
            <div class="modal-body text-center">
                <%--text-cente  bootstrap子元素居中--%>
                <span id="myImg">
                      <% if (user==null){%>
                            <img src="../../img/notlogin.jpg" class="img-circle">
                        <% }else{ %>
                             <img alt="" src="<%=basePath+user.getHead()%>" class="img-circle">
                        <% }%>
                </span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="$('#myFile').click();" >浏览
                </button>
                <button type="button" class="btn btn-primary" id="btn">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>



<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>


</body>


<script type="text/javascript">
    // 点击提交按钮事件
    $("#btn").on("click", function () {
        $('#myForm').submit();
    });

    //预览
    myFile.onchange=function(){
        var file=this.files[0] ;  // 获取input上传的图片数据;

        var url=window.URL.createObjectURL(file);  // 得到bolb对象路径，可当成普通的文件路径一样使用，赋值给src;

        document.getElementById("myImg").innerHTML="<img src='"+url+"' class='img-circle'/>";
    }

</script>
</html>
