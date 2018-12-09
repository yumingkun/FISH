<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>文件上传</title>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.css" />
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">

    </script>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
        }

        #right-h3{
            font-family: "Wawati SC";
            background-color: #f0f4ff;
            font-weight: bold;
            /*margin: 1px;*/
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
        }
        #right-h3 span{
            display: inline-block;
            float: right;
        }

        #myImg img{
            width: 250px;
            height: 250px;
        }




    </style>

</head>
<body>

<!-- 导航 -->
<%--1:引入头部--%>
<jsp:include page="../common/header.jsp" />
<!-- 导航end -->


<!-- 提示end -->

<%--内容--%>
<div class="container" id="container">
    <div class="row">
            <h3 id="right-h3" class="panel-heading">文件中心</h3>
            <div class="container-fluid">
                <%--表格--%>
                <div class="row">
                    <table class="table table-hover">
                        <thead>
                        <tr class="table-primary">
                            <th scope="col">上传者</th>
                            <th scope="col">文件名</th>
                            <th scope="col">文件大小</th>
                            <th scope="col">文件类型</th>
                            <th scope="col">备注</th>
                            <th scope="col">上传时间</th>
                            <th scope="col">下载次数</th>
                            <th scope="col">操作</th>

                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${docs}" var="doc">
                            <tr class="table-default">
                                <td scope="row">${doc.username}</td>
                                <td >${doc.filename}</td>
                                <td>${doc.filesize}</td>
                                <td>${doc.filetype}</td>
                                <td>${doc.memo}</td>
                                <td>${fn:substring(doc.uploaddate, 0, 10)}</td>
                                <td>${doc.count}</td>
                                <td>
                                    <a href="<%=request.getContextPath()%>/show/downDoc.do?savepath=${doc.savepath}" data-toggle="tooltip" data-placement="top" title="下载文件"><span class="glyphicon glyphicon-download"> </span></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%--表格end--%>
            </div>
            <%--右边整体end--%>


        </div>

    </div>



    <%--页脚--%>
    <jsp:include page="../common/footer.jsp" />
    <%--页脚end--%>

</body>

</html>