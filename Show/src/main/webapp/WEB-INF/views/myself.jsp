<%@ page import="com.fish.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/20
  Time: 下午4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
</head>
<body>

<h1>
    个人中心
</h1>

<h1>修改头像</h1>





<form action="/show/upload.do" method="post" enctype="multipart/form-data">
    选择头像<input type="file" name="myFile">
    <input type="submit" value="上传">
</form>


</body>
</html>
