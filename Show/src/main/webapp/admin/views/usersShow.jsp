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
    <title>用户管理</title>
    <%--引入所需js css--%>
    <link rel="stylesheet" href="../css/reset.css">
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../..//css/bootstrap.css">
    <style type="text/css">
        /*分页的位置*/
        .pagination{
            position: fixed;
            /*没有父元素的相对定位，则以浏览器为绝对定位*/

            bottom: 20px;
        }
        .theTitle{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 50px;
            font-weight: 800;
            color: gray;
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
            <%--右侧表格--%>
            <c:choose>
                <c:when test="${delete eq 1}">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>删除成功</strong>
                    </div>
                </c:when>
                <c:when test="${delete eq 0}">
                    <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong>删除失败</strong>
                    </div>
                </c:when>
            </c:choose>
            <p class="theTitle">用户管理</p>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>
                            <button style="background-color: #d17660;color: white" class="btn btn-sm" data-toggle="tooltip" data-placement="top" title="确定删除吗？" onclick="sub(${user.id})">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <%--分页--%>
             <div class="row">
                 <div class="col-lg-6 col-lg-offset-5" >
                     <ul class="pagination">
                         <c:choose>
                             <c:when test="${requestScope.pageVO.page eq 1}">
                                 <li  class="disabled">
                                     <a title="上一页" href="javascript:void(0);">
                                         <span aria-hidden="true">&laquo;</span>
                                     </a>
                                 </li>
                             </c:when>
                             <c:otherwise>
                                 <li>
                                     <a title="上一页" href="javascript:doPage(${requestScope.pageVO.page - 1});">
                                         <span aria-hidden="true">&laquo;</span>
                                     </a>
                                 </li>
                             </c:otherwise>
                         </c:choose>

                         <c:forEach begin="1" end="${requestScope.pageVO.pageCount }" var="index">
                             <c:choose>
                                 <c:when test="${index eq requestScope.pageVO.page }">
                                     <li class="active"><a  href="javascript:doPage(${index });">${index}</a></li>
                                 </c:when>
                                 <c:otherwise>
                                     <li><a href="javascript:doPage(${index });">${index}</a></li>
                                 </c:otherwise>
                             </c:choose>
                         </c:forEach>

                         <c:choose>
                             <c:when test="${requestScope.pageVO.page eq requestScope.pageVO.pageCount }">
                                 <li  class="disabled">
                                     <a title="下一页" href="javascript:void(0);">
                                         <span aria-hidden="true">&raquo;</span>
                                     </a>
                                 </li>
                             </c:when>
                             <c:otherwise>
                                 <li>
                                     <a title="下一页" href="javascript:doPage(${requestScope.pageVO.page + 1});">
                                         <span aria-hidden="true">&raquo;</span>
                                     </a>
                                 </li>
                             </c:otherwise>
                         </c:choose>
                     </ul>
                 </div>
             </div>
            <form action="<%=request.getContextPath()%>/manage/getUsers.do" id="pageForm" method="post">
                <input type="hidden" id="page" name="page" value="1">
            </form>
            <%--分页end--%>
        </div>
    </div>
</div>

<form id="manForm" action="<%=request.getContextPath()%>/manage/delete.do" method="post" style="display: none">
        <input type="hidden" id="userId" name="userId" value="">
</form>

<script type="text/javascript">
    function doPage(n){
        document.getElementById("page").value=n;
        document.getElementById("pageForm").submit();
    }

    // 提交删除
    function sub(id) {
        $("#manForm #userId").attr("value",id);
        // $("#manForm #userId").attr(name,id);
        $("#manForm").submit();
    }
</script>

</body>
</html>
