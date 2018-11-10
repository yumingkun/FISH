<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新建留言</title>
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <%--引入富文本框js css--%>
    <link rel="stylesheet" href="../../css/wangEditor.min.css">
    <script type="text/javascript" src="../../js/wangEditor.min.js"></script>
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            height: 400px;
        }
        #div2{
            height: 500px;
            border: none;
        }

    </style>

</head>
<body>
<%--1:引入头部--%>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container" style="background-color: #ebf6ff;padding-top: 20px;margin-bottom: 0px;border-radius: 10px">
    <%--<div class="page-header">--%>
        <%--<h3><small>新建留言</small></h3>--%>
    <%--</div>--%>
    <form class="form-horizontal" action="<%=request.getContextPath()%>/show/addMessage.do" method="post">
        <div class="form-group">
            <%--<label for="inputTitle" class="col-sm-2 control-label">标题 ：</label>--%>
            <div class="col-sm-12">
                <input name="title" class="form-control" id="inputTitle" placeholder="标题" style="background-color: #ebf6ff">
            </div>

            <div class="col-sm-12">
                <c:choose>
                    <c:when test="${result eq 1}">
                        <div class="alert alert-success">
                            <a href="#" class="close" data-dismiss="alert">&times;</a><strong>成功</strong>已经创建文章
                        </div>
                    </c:when>
                    <c:when test="${result eq 0}">
                        <div class="alert alert-danger">
                            <a href="#" class="close" data-dismiss="alert">&times;</a><strong>失败</strong>创建文章失败
                        </div>
                    </c:when>

                </c:choose>

            </div>


        </div>

        <div class="form-group">
            <%--<label  class="col-sm-2 control-label">内容 ：</label>--%>
            <%--使用富文本框------------------%>
            <div class="col-sm-12" >

                <div id="div1" class="toolbar"></div>
                <div style="padding: 5px 0; color: #ccc"></div>
                <div id="div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
                    <p >开始你的创作</p>
                </div>
                <input type="hidden" name="content" id="txt" />
            </div>
            <%--使用富文本框end------------------%>
        </div>
        <div class="form-group">
            <%--专题--%>
            <div class="col-sm-11">
                <select class="form-control" name="categoryId" style="background-color: #ebf6ff">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.gname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="col-sm-1">
                <button id="sub" class="btn btn-default">发布</button>
            </div>
        </div>
    </form>

</div>

<%--1:引入页尾--%>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor1 = new E('#div1', '#div2')
    // 自定义配置颜色（字体颜色、背景色）
    editor1.customConfig.colors = [
        '#6c7fd1',
        '#eeece0',
        '#1c487f',
        '#4d80bf',
        '#c24f4a',
        '#8baa4a',
        '#7b5ba1',
        '#46acc8',
        '#f9963b',
        '#ffffff'
    ];
    editor1.create();
    $("#sub").click(function(){
         var html= editor1.txt.html();
        // alert("13");
         var text=editor1.txt.text();
        $("#txt").val(html);
        $("#form").submit();
    })

</script>
</html>
