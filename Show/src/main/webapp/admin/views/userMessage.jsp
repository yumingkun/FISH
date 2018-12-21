<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/26
  Time: 下午1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>文章管理</title>
    <%--引入所需js css--%>
    <link rel="stylesheet" href="../css/reset.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../..//css/bootstrap.css">
    <style type="text/css">

        .theTitle{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 50px;
            font-weight: 800;
            color: gray;
        }

        /*预览图图片*/
        #modal-body{
            overflow: auto;
        }

        #modal-body img{
            width: 400px;
            clear: both;
            margin-bottom: 20px;
            border-radius: 20px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
</head>
<body>

<%--引入头部--%>
<jsp:include page="common/header.jsp"></jsp:include>


<div class="container-fluid" >
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
        <div class="col-lg-7">
            <p class="theTitle">文章管理</p>



            <%--private  int id;           //id--%>
            <%--private int userId;        //评论者ID--%>
            <%--private  String title;     //标题--%>
            <%--private String content;    //内容--%>
            <%--private Date createTime;   //创建时间--%>
            <%--private int laud;          //点赞数量--%>
            <%--private String src;        //文章提取出的第一张图片--%>
            <%--private Category category; //文章分类--%>
            <%--private int auditing;      //审核状态--%>

            <%--private String userName;   //--%>


            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>作者</th>
                    <th>标题</th>
                    <th>分类</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${messages}" var="message" >
                    <tr id="${message.id}">
                        <td>${message.id}</td>
                        <td>${message.userName}</td>
                        <td>${message.title}</td>
                        <td>${message.category.gname}</td>
                        <td>${message.createTime}</td>
                        <td>
                            <a type="button" class="btn btn-default btn-sm"  data-toggle="modal" data-target=".bs-example-modal-lg" onclick='skim("${message.title}","${message.id}")'>
                               预览
                            </a>


                            <button class="btn btn-info btn-sm" onclick="updateAuditing('${message.id}')">通过</button>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </div>
    </div>
</div>

<!-- 文章预览弹出框Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">

                </h4>
            </div>
            <div class="modal-body" id="modal-body">
                。。。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    function skim(title,id) {
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/manage/getMessage.do?messageId="+id,
            success:function(data){
                    $("#myModalLabel").html(title);
                    $("#modal-body").html(data);

            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
               alert("预览失败")
            },


        });
    }

    function updateAuditing(id) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/manage/updateAuditing?messageId="+id,
            success:function(data){
                 alert(data);
                 $("#"+id).hide(1000);
            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                alert("审核失败")
            },


        });
    }

</script>

</body>
</html>
