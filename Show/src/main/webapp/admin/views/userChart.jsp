<%--这是后台主页--%>
<%--这是后台主页--%>
<%--这是后台主页--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户图表</title>
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

        <div class="col-lg-7 col-lg-offset-1" >


            <canvas id="myChart" width="100" height="60"></canvas>

        </div>
        <div class="col-lg-1" ></div>
    </div>
</div>


</body>

<script type="text/javascript">

    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels:${usernameList},
            datasets: [{
                label: ' 文章数 ',
                data:${numList},
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
</script>

</html>