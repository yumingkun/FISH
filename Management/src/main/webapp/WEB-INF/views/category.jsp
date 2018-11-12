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
    <link rel="stylesheet" href="../../css/reset.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../..//css/bootstrap.css">
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

            <div >
                <div class="panel panel-warning">
                    <div class="panel-heading">添加专题</div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/manage/cddCategory.do">
                            <div class="form-group">
                                <div class="col-sm-8 ">
                                    <input type="text" name="gname" class="form-control" placeholder="输入你想要的专题">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 ">
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
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${categorys}" var="category">
                                    <tr>
                                        <td>${category.id}</td>
                                        <td>${category.gname} </td>
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





</body>
</html>