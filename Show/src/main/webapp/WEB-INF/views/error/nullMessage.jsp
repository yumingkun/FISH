<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/11/3
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>T空空如也</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../../css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="../../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../../css/main.css"/>
    <script src="../../../js/main.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        .nullImg{
           margin: 10px auto;
        }
    </style>
</head>
<body>
<%--引入头--%>
<jsp:include page="../../common/header.jsp"></jsp:include>

<img src="../../../img/null.png" class="nullImg">

<%--引入尾--%>
<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>
</html>
