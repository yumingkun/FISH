<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/8/26
  Time: 上午10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--自动跳转--%>
    <meta http-equiv="refresh" content="0;url=<%request.getContextPath();%>/show/message.do">
</head>

<form action="upload.do" method="post" enctype="multipart/form-data">
    选择头像<input type="file" name="myFile">
    <input type="submit" value="上传">
</form>

</html>
