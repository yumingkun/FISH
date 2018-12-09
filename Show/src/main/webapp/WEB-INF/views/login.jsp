<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/12/1
  Time: 10:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
    <!--引入bootstrap-->
    <link rel="stylesheet"   href="../../css/bootstrap-theme.css">
    <script type="text/javascript"   src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript"  src="../../js/bootstrap.js"></script>
    <!--引入登录样式-->
    <link rel="stylesheet"  href="../../css/login.css">
</head>
<body>


<form id="loginform" action="<%=request.getContextPath()%>/show/login.do" method="post">
    <canvas id="canvas" width="500" height="170" ></canvas>
    <h1>LOGIN</h1>
    <div class="form-group" >
        <label for="Username">Username</label>
        <input type="text" class="form-control" name="username" id="Username" placeholder="Username"  required pattern="^[a-zA-Z0-9\u4e00-\u9fa5]{4,12}$" title="4到12位">
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control"  name="password" id="exampleInputPassword1" placeholder="Password" required pattern="^[a-zA-Z0-9]{6,12}" title="6到10位英文或数字">
    </div>
    <div class="form-group">
        <a href="<%=request.getContextPath()%>/show/toRegister"> Go Register</a>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-md-1">
                <button type="submit" class="btn btn-default">Sign in</button>
            </div>
        </div>
    </div>
</form>


</body>

<script>
    var canvas=document.getElementById("canvas");
    var cxt=canvas.getContext("2d");


    // 右线
    cxt.beginPath();
    cxt.moveTo(250,10);	//移动至开始点
    cxt.lineTo(490,150);
    cxt.shadowColor="#c0c9e4";
    cxt.lineWidth=4;
    cxt.strokeStyle='#FFFFFF';
    cxt.lineJoin='round';//　lineJoin 属性,可以设置线的交汇处的样式
    cxt.lineCap='round'; //lineCap 属性，定义线条的端点。
    cxt.shadowBlur=15;// shadowBlur	设置或返回用于阴影的模糊级别。
    cxt.shadowOffsetX=3; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    // cxt.shadowOffsetY=3;   // shadowOffsetY	设置或返回阴影与形状的垂直距离。
    cxt.globalAlpha=0.3;//透明度
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画


    // 左线
    cxt.beginPath();
    cxt.moveTo(250,10);	//移动至开始点
    cxt.lineTo(10,150);
    cxt.shadowColor='#bec8e3';
    cxt.shadowBlur=15;
    cxt.shadowOffsetX=3;
    // cxt.shadowOffsetY=-3;
    cxt.strokeStyle='#FFFFFF';
    cxt.lineJoin='round';//　lineJoin 属性,可以设置线的交汇处的样式
    cxt.lineCap='round'; //lineCap 属性，定义线条的端点
    cxt.globalAlpha=0.3;//透明度
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画



    // 上圆
    cxt.beginPath();
    cxt.arc(250,15,5,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画

    // 左圆
    cxt.beginPath();
    cxt.arc(10,150,3,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画

    // 右圆
    cxt.beginPath();
    cxt.arc(490,150,3,0,2*Math.PI);
    cxt.globalAlpha=0.4;//透明度
    cxt.shadowBlur=0;
    cxt.shadowOffsetX=0; // shadowOffsetX	设置或返回阴影与形状的水平距离。
    cxt.shadowOffsetY=0;
    cxt.stroke();
    cxt.closePath();//填充或闭合 需要先闭合路径才能画
</script>

</html>
