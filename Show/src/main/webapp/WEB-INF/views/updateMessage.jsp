<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新建留言</title>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <%--引入富文本框js css--%>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/wangEditor.min.css">
    <script type="text/javascript" src="../../js/wangEditor.min.js"></script>

</head>
<body>
<%--1:引入头部--%>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="container">
    <%--<div class="page-header">--%>
    <%--<h3><small>新建留言</small></h3>--%>
    <%--</div>--%>
    <form class="form-horizontal" action="/show/addMessage.do" method="post">
        <div class="form-group">
            <label for="inputTitle" class="col-sm-2 control-label">标题 ：</label>
            <div class="col-sm-8">
                <input name="title" class="form-control" id="inputTitle" placeholder="title">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">内容 ：</label>
            <%--使用富文本框------------------%>
            <div class="col-sm-8">
                <div id="editor"></div>
                <input type="hidden" name="content" id="txt"/>
            </div>
            <%--使用富文本框end------------------%>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">发布留言</button>&nbsp;&nbsp;&nbsp;
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <a class="btn btn-default" href="/show/message.do">查看留言</a>
            </div>
        </div>
    </form>
</div>

<%--1:引入页尾--%>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('#editor') )
    editor.create();
    $("button").click(function(){
        var html= editor.txt.html();
        var text=editor.txt.text();
        $("#txt").val(html);
        $("#form").submit();
    })
</script>
</html>
