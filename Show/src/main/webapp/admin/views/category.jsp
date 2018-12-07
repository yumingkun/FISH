<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/11/7
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%--这是后--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>专题管理</title>
    <%--引入需要的js css--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/reset.css">
    <script src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/bootstrap.css">
    <style>
        .theTitle{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 50px;
            font-weight: 800;
            color: gray;
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
        <div class="col-lg-7">
            <p class="theTitle">专题管理</p>
            <c:choose>
                <c:when test="${result eq 1}">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>删除成功</strong>
                    </div>
                </c:when>
                <c:when test="${update eq 1}">
                    <div class="alert alert-info alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>更新成功</strong>
                    </div>
                </c:when>
            </c:choose>

            <div >
                <div class="panel panel-warning">
                    <div class="panel-heading">添加专题</div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/manage/cddCategory.do">
                            <div class="form-group">
                                <div class="col-sm-8 ">
                                    <input type="text" name="gname" class="form-control" placeholder="输入你想要的专题">
                                </div>

                                <div class="col-sm-2">
                                    <input type="submit" class="btn btn-default" value="提交"/>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

            <div>
                <div class="panel panel-info">
                    <div class="panel-heading">专题列表</div>
                    <div class="panel-body">
                        <%--响应式表格--%>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>专题编号</th>
                                        <th>专题名称</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${categorys}" var="category" varStatus="status">
                                    <tr>
                                        <td>${status.index }</td>
                                        <td>${category.gname} </td>
                                        <td>
                                            <c:if test="${category.id  ne  '0'}">
                                                <a  href="<%=request.getContextPath()%>/manage/deleteById.do?id=${category.id}" class="btn btn-default btn-sm">删除</a>
                                                <a  href="#" class="btn btn-default btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" onclick="updateCategory('${category.id}','${category.gname}')">修改</a>
                                            </c:if>

                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>





        </div>
    </div>
</div>


<%--模态框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">修改专题</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="<%=request.getContextPath()%>/manage/updateById.do" id="updateCategoryFrom">
                    <div class="form-group">
                        <label for="gname2" class="control-label">专题名:</label>
                        <input type="hidden" name="gid" id="gid2" value="" >
                        <input type="text" class="form-control" id="gname2" name="gname" value="">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-info" onclick="sub2()" >提交</button>
            </div>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
    function updateCategory(id,gname) {
        $("#gname2").attr("value",gname);
        $("#gid2").attr("value",id);
    }
    function sub2() {
        $("#updateCategoryFrom").submit();
    }




</script>
</html>