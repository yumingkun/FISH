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
    <link rel="stylesheet" href="../../css/reset.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/Chart.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../..//css/bootstrap.css">
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
            <canvas id="myChart" width="100" height="60"></canvas>


            <%--<canvas id="c1" width="100px" height="60px"></canvas>--%>
        </div>
        <div class="col-lg-1" ></div>
    </div>
</div>


</body>

<script type="text/javascript">
    <%--var myData=[];--%>
    <%--var myName=[];--%>
    <%--function getChart() {--%>
        <%--$.ajax({--%>
            <%--type: "get",--%>
            <%--url: "<%=request.getContextPath()%>/manage/showChart.do",--%>
            <%--dataType: "json",--%>
            <%--success: function (data) {--%>
                <%--$.each(data, function (i, item) {--%>
                    <%--myName.push(item.username);--%>
                    <%--myData.push(item.num);--%>

                <%--});--%>
            <%--}--%>


        <%--});--%>

        <%--var ctx_c1=$("#c1");--%>
        <%--config_c1={--%>
            <%--type: 'bar',--%>
            <%--data: {--%>
                <%--labels:myName ,--%>
                <%--datasets: [{--%>
                    <%--label: '# of Votes',--%>
                    <%--data: myData,--%>
                    <%--backgroundColor: [--%>
                        <%--'rgba(255, 99, 132, 0.2)',--%>
                        <%--'rgba(54, 162, 235, 0.2)',--%>
                        <%--'rgba(255, 206, 86, 0.2)',--%>
                        <%--'rgba(75, 192, 192, 0.2)',--%>
                        <%--'rgba(153, 102, 255, 0.2)',--%>
                        <%--'rgba(255, 159, 64, 0.2)'--%>
                    <%--],--%>
                    <%--borderColor: [--%>
                        <%--'rgba(255,99,132,1)',--%>
                        <%--'rgba(54, 162, 235, 1)',--%>
                        <%--'rgba(255, 206, 86, 1)',--%>
                        <%--'rgba(75, 192, 192, 1)',--%>
                        <%--'rgba(153, 102, 255, 1)',--%>
                        <%--'rgba(255, 159, 64, 1)'--%>
                    <%--],--%>
                    <%--borderWidth: 1--%>
                <%--}]--%>
            <%--},--%>
            <%--options: { //动画--%>
                <%--scales: {--%>
                    <%--yAxes: [{--%>
                        <%--ticks: {--%>
                            <%--beginAtZero:true--%>
                        <%--}--%>
                    <%--}]--%>
                <%--}--%>
            <%--}--%>
        <%--};--%>

        <%--var c1 = new Chart(ctx_c1, config_c1);--%>




        //
        // [12, 19, 3, 5, 2, 3],
    // }
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels:${usernameList},
            datasets: [{
                label: ' FISH',
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