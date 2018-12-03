
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <%--&lt;%&ndash;整体css js&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css" href="../../css/main.css"/>--%>
    <%--<script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>--%>


    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
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
        #right-row-1{
            padding: 0px;
            height: 100%;
            /*background-color: ;*/
        }
        #right-left{
            margin-top: 10px;
            padding: 0px;
            height: 60%;
        }
        #right-right-1{
            padding: 0px;
            height: 90%;
        }


        #myImg{
            text-align: center;
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

    </style>
</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1:引入头部--%>
<jsp:include page="../common/header.jsp" />



<%--侧边栏--%>
<div class="container" id="container">
    <div class="row">
        <div class="container col-md-2" >
            <span class="glyphicon glyphicon-cog" id="too" style="font-size: 40px;margin-bottom: 10px"></span>
            <div id="right" class="myLeaf">
                <div class="row">
                    <ul class="nav nav-pills nav-stacked list-group col-md-12 col-xs-6 ">
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/user.do">个人中心</a></li>
                        <li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUserComment.do">我的评论</a></li>
                        <li class="list-group-item">我的关注</li>
                        <li class="list-group-item">我的粉丝</li>
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


        <div id="left" class="container col-md-8 panel panel-default" style="max-height: 600px"  >
            <h3 id="right-h3" class="panel-heading">个人中心</h3>
            <div id="right-row-1" class="row" style="margin: 0px;">
                <div id="right-left" class="col-md-3">
                    <div class="thumbnail" style="margin: 5px;">
                        <c:if test="${user!=null}">
                            <img alt="" src="<%=basePath%>${user.head}">
                        </c:if>

                        <c:if test="${user==null}">
                            <<img src="../../img/notlogin.jpg" class="img-circle">
                        </c:if>


                        <center><button style="margin: 0px;width: 100%;" class="btn btn-default"  data-toggle="modal" data-target="#myModal">修改头像</button></center>
                    </div>



                </div>
                <div id="right-right-1" class="col-md-9" style="padding: 15px;">
                    <div>
                        <%--修改用户信息--%>
                        <p class="text-muted">ID:${user.id}<a  href="#" style="float: right"><span class="glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModa2" style="font-size: 20px"></span></a></p>
                        <p>关注</p><p>粉丝</p>

                    </div>
                    <hr>
                    <div>
                        <p>用户名：${user.username}</p>
                        <p>邮箱：${user.email}</p>
                    </div>
                </div>

            </div>


        </div>
        <%--右边整体end--%>


        </div>



    </div>
</div>



<%--表单--%>
<form action="<%=request.getContextPath()%>/show/upload.do" method="post" enctype="multipart/form-data" id="myForm" class="form">
    <input type="file" id="myFile" name="myFile" style="display: none">
</form>


<!--修改头像 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="font-family:'Wawati SC'">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel" >
                    上传头像
                </h4>
            </div>
            <div class="modal-body text-center">
                <%--text-cente  bootstrap子元素居中--%>
                <span id="myImg">
                     <c:if test="${user!=null}">
                         <img alt="" src="<%=basePath%>${user.head}" class="img-circle">
                     </c:if>

                    <c:if test="${user==null}">
                        <<img src="../../img/notlogin.jpg" class="img-circle">
                    </c:if>
                </span>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="$('#myFile').click();" >浏览</button>
                <button type="button" class="btn btn-primary" id="btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<!--修改用户信息模态框（Modal） -->
<div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="font-family:'Wawati SC'">
        <div class="modal-content">
            <div class="modal-header"  >
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"  style="font-weight: 700;"> 修改用户信息</h4>
            </div>

            <div class="modal-body text-center" >
                <!--修改用户信息表单-->
                <form id="updateform" action="<%=request.getContextPath()%>/show/editUser.do?userId=${user.id}" method="post" style="text-align: left;">
                    <div class="form-group">
                        <label for="username" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="username" name="username" value="${user.username}">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" class="form-control" id="email" name="email" value="${user.email}">
                    </div>
                    <div class="form-group">
                        <label for="password" class="control-label">密码:</label>
                        <input type="password" class="form-control" id="password" name="password" value="${user.password}">
                    </div>
                </form>
                <!--修改用户信息表单end-->
            </div>

            <div class="modal-footer" >
                <!--点击提交表单-->
                <button type="button" class="btn btn-default" onclick="update_info()">提交 </button>
            </div>
        </div>
    </div>
</div>


<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>


</body>


<script type="text/javascript">

    $("#too").click(function(){
        $(".myLeaf").toggle(1000);


    });

    // 头像表单点击提交按钮事件
    $("#btn").on("click", function () {
        $('#myForm').submit();
    });

    //预览
    myFile.onchange=function(){
        var file=this.files[0] ;  // 获取input上传的图片数据;

        var url=window.URL.createObjectURL(file);  // 得到bolb对象路径，可当成普通的文件路径一样使用，赋值给src;

        document.getElementById("myImg").innerHTML="<img src='"+url+"' class='img-circle'/>";
    };

    $("#test").click(function () {
        alert("test");
        $("#myLeaf").css({ display:block});
    });


    //提交修改用户信息表单
    function update_info(){
        // alert("我是表单");
  	 $("#updateform").submit();
    }



</script>
</html>
