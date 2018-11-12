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
    <title>回收站</title>
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


        #ul-right{
            padding-right: 0px !important;
            border: 1px solid #C4C4C4;
            border-radius: 2px;
            box-shadow: 1px 1px 1px 0px #C4C4C4;
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
            /*border: 1px solid #C4C4C4;*/
            border: 3px solid rgba(83, 85, 136, 0.1);
            padding: 0px;
            border-radius: 4px;
            /*box-shadow: 1px 1px 1px 1px #C4C4C4;*/
            min-height: 450px;
            padding: 0;
            margin: 0;
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


        /*去除一些头部引入的样式*/
        #showSearch{
            display: none;
        }

        /*文章图片大小*/
        .theSize img{
            height: 80px;
            width: 120px;
            border: 2px solid #c8f0b9;
        }

        /*提示信息*/
        #tishi{
            display: none;
            width: 40%;

            float: right;

        }
        #tishi .alert{
            margin: 0;

        }

        /*轮播预览样式*/
        #myImg img{

            width: 300px;
            height:160px;
        }

        /*图片展示样式*/
        #showImg img{
            margin-top: 30px;
            margin-bottom: 30px;
            width: 280px;
            height:170px;
            display: inline-block;
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


<div class="container">
    <div class="row">

        <div id="left" class="col-md-12  panel panel-group">

            <h1 style="text-align: center;font-family: 'Wawati SC';font-weight: bold;color: gray">THE轮播图</h1>

            <%--中间地带--%>
            <div class="panel-body form-inline" style="background-color: #c8f0b9;height: 80px">

                <%--放入提示--%>
                <div id="tishi">
                    <div class="alert  alert-success" role="alert"  id="myColor">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong><span class="glyphicon   glyphicon-volume-up"></span></strong>  <span id="ti">操作提示</span>
                    </div>
                </div>
            </div>

            <%--右边选项--%>
            <div id="article" class="panel-body"  >
                <%--轮播--%>
                <div class="new-list tab-pane fade in active" id="showImg">

                    <%--展示轮播--%>
                    <c:forEach items="${carousels}" var="carousel">
                        <img src="<%=basePath%>${carousel.imgLoc}"  class="thumbnail">
                    </c:forEach>


                    <%--返回按钮和提交按钮--%>
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="<%=request.getContextPath()%>/show/user.do"><button class="btn btn-default   btn-lg" style="margin-top: 10px;"><span class="glyphicon glyphicon-backward"></span></button></a>
                            </div>
                            <div class="col-lg-2 col-lg-offset-4" >
                                <%--提交--%>
                                <button style="margin: 0px;width: 100%;" class="btn btn-default"  data-toggle="modal" data-target="#myModal">选择图片</button>
                            </div>
                        </div>


                </div>

            </div>
        </div>

        <%--这部分不显示，弹出--%>
        <div>
            <%--这是不显示的-------------------------%>
            <%--表单--%>
            <form action="<%=request.getContextPath()%>/show/carousel.do" method="post" enctype="multipart/form-data" id="myForm" class="form">
                <input type="file" id="myFile" name="myFile" style="display: none">
            </form>


            <!--轮播图 模态框（Modal） -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" style="font-family:'Wawati SC'">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel" >
                                更换此轮播图
                            </h4>
                        </div>
                        <div class="modal-body text-center">
                            <%--text-cente  bootstrap子元素居中--%>
                            <span id="myImg">
                                <%--预览的轮播图位置--%>
                            </span>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" onclick="$('#myFile').click();" >浏览</button>
                            <button type="button" class="btn btn-primary" id="btn">提交</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</div>


<%--尾--%>
<jsp:include page="../common/footer.jsp" />

</body>

<script type="text/javascript">
    // 头像表单点击提交按钮事件
    $("#btn").on("click", function () {
        $('#myForm').submit();
    });

    //预览
    myFile.onchange=function(){
        var file=this.files[0] ;  // 获取input上传的图片数据;

        var url=window.URL.createObjectURL(file);  // 得到bolb对象路径，可当成普通的文件路径一样使用，赋值给src;

        document.getElementById("myImg").innerHTML="<img src='"+url+"' />";
    };

    $("#test").click(function () {
        alert("test");
        $("#myLeaf").css({ display:block});
    });

</script>
</html>