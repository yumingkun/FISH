<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/25
  Time: 下午10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    .navbar{
       box-shadow: 0px 2px 2px #cccccc;
        /*border: 1px solid red;*/
    }
    .navbar .navbar-header img{
        width: 50px;
        height: 50px;
        margin-top: 0px;
        /*border: 1px solid red;*/
    }
</style>

<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
                <a href="<%=request.getContextPath()%>/manage/toShowChart.do"><img alt="Brand" src="../../img/logo.png"></a>
        </div>
    </div>
</nav>
