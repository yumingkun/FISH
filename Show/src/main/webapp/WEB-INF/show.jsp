<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/17
  Time: 下午7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    .file_icon{
        width: 34px;
        height: 34px;
        display: flex;
        border-radius: 50%;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
</style>
<body>


<h1>${sessionScope.src}</h1>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<img alt="" src="<%=basePath %>${sessionScope.src}" class="file_icon">

<h1><%=basePath %>${sessionScope.src}</h1>

</body>
</html>
