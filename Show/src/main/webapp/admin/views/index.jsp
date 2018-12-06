<%--这是后台主页--%>
<%--这是后台主页--%>
<%--这是后台主页--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台首页(欢迎页)</title>
    <%--引入需要的js css--%>



    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/reset.css">
    <script src="<%=request.getContextPath()%>/admin/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/Chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/admin/js/bootstrap.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/bootstrap.css">


    <%--时钟--%>
    <link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/admin/css/main.css"/>
    <script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/admin/js/jquery.thooClock.js"></script>
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

        <div class="col-lg-7 col-lg-offset-2" >

            <%--<button class="btn btn-default" onclick="getChart()">获取</button>--%>
            <div class="htmleaf-container">
                <header class="htmleaf-header">

                </header>
                <div class="container">
                    <div id="myclock"></div>

                </div>
            </div>



            <%--<canvas id="c1" width="100px" height="60px"></canvas>--%>
        </div>
        <div class="col-lg-1" ></div>
    </div>
</div>


</body>

<script language="javascript">

    var intVal, myclock;

    $(window).resize(function(){
        window.location.reload()
    });

    $(document).ready(function(){

        var audioElement = new Audio("");

        //clock plugin constructor
        $('#myclock').thooClock({
            size:$(document).height()/1.4,
            onAlarm:function(){
                //all that happens onAlarm
                $('#alarm1').show();
                alarmBackground(0);
                //audio element just for alarm sound
                document.body.appendChild(audioElement);
                var canPlayType = audioElement.canPlayType("audio/ogg");
                if(canPlayType.match(/maybe|probably/i)) {
                    audioElement.src = 'alarm.ogg';
                } else {
                    audioElement.src = 'alarm.mp3';
                }
                // erst abspielen wenn genug vom mp3 geladen wurde
                audioElement.addEventListener('canplay', function() {
                    audioElement.loop = true;
                    audioElement.play();
                }, false);
            },
            showNumerals:true,
            brandText:'THOOYORK',
            brandText2:'Germany',
            onEverySecond:function(){
                //callback that should be fired every second
            },
            //alarmTime:'15:10',
            offAlarm:function(){
                $('#alarm1').hide();
                audioElement.pause();
                clearTimeout(intVal);
                $('body').css('background-color','#FCFCFC');
            }
        });

    });



    $('#turnOffAlarm').click(function(){
        $.fn.thooClock.clearAlarm();
    });


    $('#set').click(function(){
        var inp = $('#altime').val();
        $.fn.thooClock.setAlarm(inp);
    });


    function alarmBackground(y){
        var color;
        if(y===1){
            color = '#CC0000';
            y=0;
        }
        else{
            color = '#FCFCFC';
            y+=1;
        }
        $('body').css('background-color',color);
        intVal = setTimeout(function(){alarmBackground(y);},100);
    }
</script>

</html>