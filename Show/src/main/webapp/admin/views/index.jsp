<%--这是后台主页--%>
<%--这是后台主页--%>
<%--这是后台主页--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>后台首页(欢迎页)</title>
    <%--引入需要的js css--%>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/reset.css">
    <script src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/bootstrap.css">
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

        <div class="col-lg-9" >

            <%--<button class="btn btn-default" onclick="getChart()">获取</button>--%>
            <h1>我是首页</h1>


            <%--<canvas id="c1" width="100px" height="60px"></canvas>--%>
        </div>
        <div class="col-lg-1" ></div>
    </div>
</div>


</body>

<script type="text/javascript">

</script>

</html>