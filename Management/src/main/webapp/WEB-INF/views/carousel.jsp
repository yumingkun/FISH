<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/11/10
  Time: 7:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>轮播管理</title>
    <%--引入需要的js css--%>
    <link rel="stylesheet" href="../../css/reset.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/Chart.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../..//css/bootstrap.css">

    <style>
        /*轮播预览样式*/
        #myImg img{
            width: 300px;
            height:160px;
        }
    </style>
</head>
<body>
<%--引入头部--%>
<jsp:include page="common/header.jsp"></jsp:include>


<div class="container-fluid">
    <div class="row">
        <div class="col-lg-2" >
            <div class="row">
                <%--引入搜索--%>
                <jsp:include page="common/search.jsp"></jsp:include>
            </div>
            <div class="row">
                <%--引入侧边栏--%>
                <jsp:include page="common/side.jsp"></jsp:include>
            </div>
        </div>
        <div class="col-lg-1" ></div>
        <div class="col-lg-9" >

            <button style="margin: 0px;width: 100%;" class="btn btn-default"  data-toggle="modal" data-target="#myModal">修改头像</button>

            <%--表单--%>
            <form action="<%=request.getContextPath()%>/manage/carousel.do" method="post" enctype="multipart/form-data" id="myForm" class="form">
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
