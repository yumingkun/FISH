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

<div class="form">

    <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
    </ul>

    <div class="tab-content">
        <div id="signup">
            <h1>Sign Up for Free</h1>

            <form action="/show/register.do" method="post">

                <div class="field-wrap">
                        <label>UserName</label>
                        <input type="text" name="username" required autocomplete="off" />
                </div>

                <div class="field-wrap">
                    <label>Email</label>
                    <input type="email"required name="email" autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>Password</label>
                    <input type="password"required  name="password" autocomplete="off"/>
                </div>

                <button type="submit" class="button button-block"/>Get Started</button>

            </form>

        </div>

        <div id="login">
            <h1>Welcome Back!</h1>

            <form action="/show/login.do" method="post">

                <div class="field-wrap">
                    <label>UserName</label>
                    <input type="text" name="username" required autocomplete="off" />
                </div>

                <div class="field-wrap">
                    <label>Password</label>
                    <input type="password" name="password" required autocomplete="off"/>
                </div>

                <p class="forgot"><a href="#">Forgot Password?</a></p>

                <button type="submit" class="button button-block"/>Log In</button>

            </form>

        </div>

    </div><!-- tab-content -->

</div> <!-- /form -->
<script src='../../js/jquery.min.js'></script>

<script  src="../../js/login_register.js"></script>

</body>
</html>
