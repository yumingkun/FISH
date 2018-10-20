<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/20
  Time: 下午5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>FISH</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../..//css/normalize.min.css">
    <link rel="stylesheet" href="../../css/login_register.css">


</head>

<body>
    <%--实现记住我--%>
    <%
        String username = "";
        String password = "";
        Cookie [] cookies = request.getCookies();
        for (int i = 0; i <cookies.length ; i++) {
            Cookie cookie = cookies[i];
            if ("username".equals(cookie.getName())){
                username=cookie.getValue();
            }else if("password".equals(cookie.getName())){
                password=cookie.getValue();
            }
        }


    %>

    <div class="form">
        <!--1：切换登录注册按钮-->
        <ul class="tab-group">
            <li class="tab active"><a href="#">REGISTER</a></li>
            <li class="tab"><a href="#">LOGIN</a></li>
        </ul>
        <!--1：需要切换的面板-->
        <div class="tab-content">
            <!--2：注册面板-->
            <div id="register">
                <h1>Register <%=(request.getAttribute("msg_r")==null) ? ("") : (request.getAttribute("msg_r")) %></h1>

                <form action="/show/register.do" method="post">

                    <div class="top-row">
                        <div class="field-wrap">
                            <label>Name</label>
                            <input type="text" required autocomplete="off" name="username" />
                        </div>
                    </div>

                    <div class="field-wrap">
                        <label>Email Address</label>
                        <input type="email"required autocomplete="off" name="email"/>
                    </div>

                    <div class="field-wrap">
                        <label>Set A Password</label>
                        <input type="password"required autocomplete="off" name="password"/>
                    </div>

                    <button type="submit" class="button button-block"/>Get Started</button>

                </form>

            </div>
            <!--2：登录面板-->
            <div id="login">
                <h1>Login <%=(request.getAttribute("msg_l")==null) ? ("") : (request.getAttribute("msg_l")) %></h1>

                <form action="/show/login.do" method="post">
                    <div class="field-wrap">
                        <label>Name</label>
                        <input  type="text"required autocomplete="off" name="username" value="<%=username%>"/>
                    </div>
                    <div class="field-wrap">
                        <label>Password</label>
                        <input type="password"required autocomplete="off" name="password" value="<%=password%>"/>
                    </div>
                    <p>
                        <input type="checkbox" value="ok" name="ok" >
                        <label>Remember Me</label>
                    </p>
                    <button type="submit" class="button button-block"/>Log In</button>
                </form>

            </div>

        </div>
    </div>

</body>
<script src='../../js/jquery.min.js'></script>

<%--实现登录注册面板的切换--%>
<script type="text/javascript">
    //获取切换面板
    var tabs=document.getElementsByClassName("tab");
    //获取显示和隐藏的div
    var register=document.getElementById("register");
    var login=document.getElementById("login");
    //显示注册
    tabs[0].onclick=function () {
        register.style.display="block";
        login.style.display="none";
    };
    //显示登录
    tabs[1].onclick=function () {
        register.style.display="none";
        login.style.display="block";
    }


</script>

</html>
