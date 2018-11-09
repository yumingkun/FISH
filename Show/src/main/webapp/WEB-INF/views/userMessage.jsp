<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/10/26
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--当前用户所有文章的页面--%>
<!DOCTYPE html>
<html>
<head>
    <title>我的博客</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>

    <%--引入富文本框js css--%>
    <script type="text/javascript" src="../../js/jquery.min.js"></script>
    <link rel="stylesheet" href="../../css/wangEditor.min.css">
    <script type="text/javascript" src="../../js/wangEditor.min.js"></script>

    <style type="text/css">

        #ul-right{
            padding-right: 0px !important;
            border: 1px solid #C4C4C4;
            border-radius: 2px;
            box-shadow: 1px 1px 1px 0px #C4C4C4;
        }
        #ul-right a{
            border: none !important;
            text-align: center;
        }
        #ul-right li{
            width: 100%;
            border: none !important;
            text-align: center;
        }
        #ul-right a:hover{
            color: white !important;
            cursor: pointer;
            background-color: #0062FF !important;
            box-shadow: 2px 2px 2px 0px #478EFF inset;
        }
        #ul-right li:hover{
            color: white;
            cursor: pointer;
            background-color: #0062FF ;
            box-shadow: 3px 3px 1px 1px #00428D inset;
        }
        #right{

        }
        #left{
            border: 3px solid rgba(83, 85, 136, 0.1);
            padding: 0px;
            border-radius: 4px;
            /*box-shadow: 1px 1px 1px 1px #C4C4C4;*/
            min-height: 450px;
            padding: 0;
            margin: 0;
        }
        #left-h3{
            background-color: #8FDAFF;
            margin: 1px;
            margin-top: 0px;
            border-top-right-radius: 9px;
            border-top-left-radius: 9px;
            border: 0px;
            box-shadow: 0px 3px 1px 1px gray;
        }
        #left-row{
            padding: 0px;
            height: 100%;
            /*background-color: ;*/
        }
        #article a{
            text-decoration-style: none;
        }
        #article a,#article a:link,#article a:visited,#article a:hover,#article a:active{
            text-decoration: none;
            color:inherit;
        }


        /*去除一些头部引入的样式*/
        #showSearch{
            display: none;
        }

        /*文章图片大小控制*/
        .theUserImg img{
            height: 80px;
            width: 120px;
            border: 2px solid #b9def0;
        }

        /*提示信息*/
        #tishi{
            display: none;
            width: 40%;

            float: right;

        }
        #tishi .alert{
            margin: 0;

        }


        /*富文本*/
        .toolbar {
            /*border: 1px solid #ccc;*/
        }
        .text {
            /*border: 1px solid #ccc;*/
            height: 700px;
        }

    </style>
</head>
<body>


<%--导航--%>
<jsp:include page="../common/header.jsp" />


<div class="container-fluid ">
    <div class="row">
        <form action="<%=request.getContextPath()%>/show/myMessage.do" METHOD="post" id="refishTrash" style="display: none"></form>

        <div class="col-md-5">

            <div id="left" class="  panel panel-group">

                <h1 style="text-align: center;font-family: 'Wawati SC';font-weight: bold;color: gray">我的博客</h1>


                <%--中间地带--%>
                <div class="panel-body form-inline" style="background-color: #acb0d0;height: 80px">
                    <form style="float: left;margin-top: 10px" >
                        <input class="form-control" type="text" name="" placeholder="请输入搜索关键字">
                        <input class="form-control" type="submit" value="搜索">
                    </form>

                    <%--放入提示--%>
                    <div id="tishi">
                        <div class="alert alert-info alert-dismissible" role="alert">
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              <strong><span class="glyphicon   glyphicon-volume-up"></span> </strong>成功放入回收站
                        </div>
                    </div>
                </div>


                <%--右边选项--%>
                <div id="article" class="panel-body"  >

                    <%--选项卡--%>
                    <div id="myTabContent" class="tab-content">


                        <%--文章列表--%>
                        <div class="new-list tab-pane fade in active"  id="thehome">
                            <c:forEach items="${myMessages}" var="message">
                                <%--标记jq要删除的节点--%>
                                <div class="new-list-item clearfix row" id="${message.id}">
                                    <div class="col-xs-3 theUserImg" >
                                        <c:if test="${message.src==null or message.src==''}">
                                            <img src="../../img/nullsrc.png" id="nullImg" >
                                        </c:if>
                                        <c:if test="${message.src!=null and message.src!=''}">
                                            <img src="${message.src}">
                                        </c:if>
                                    </div>
                                    <div class="col-xs-6">

                                        <a href="/show/detail.do?id=${message.id}&userId=${message.userId}" class="title">${message.title}</a>
                                            <%--<div class="content" style="text-overflow:ellipsis;white-space:nowrap;overflow:hidden;width:200px;height: 70px">--%>
                                            <%--<p>${message.content}</p>--%>
                                            <%--</div>--%>
                                        <div class="info" style="margin-top: 30px">
                                            <span class="glyphicon glyphicon-tag" style="color: #6c7fd1"></span>
                                            <span>${message.category.gname}</span>
                                            <span id="getTitle">${message.title}</span>
                                        </div>

                                    </div>
                                        <%--修改--%>
                                    <div class="col-xs-1 "> <span class="glyphicon glyphicon-edit" onclick="getTheMessage('${message.id}')"></span></div>
                                        <%--放入回收站--%>
                                    <div class="col-xs-1"><span class="glyphicon glyphicon-trash" style="color: firebrick" id="trash" onclick="trash(${message.id})"></span></div>
                                </div>
                            </c:forEach>
                            <a href="<%=request.getContextPath()%>/show/user.do"><button class="btn btn-default   btn-lg" style="margin-top: 10px;"><span class="glyphicon glyphicon-backward"></span></button></a>
                        </div>
                    </div>
                    <%--选项卡end--%>

                </div>
            </div>
        </div>

        <%--修改文章--%>
        <div class="col-md-7" style="z-index: 1; border: 3px solid rgba(83, 85, 136, 0.1);padding: 0;margin: 0">
            <h1 style="text-align: center;font-family: 'Wawati SC';font-weight: bold;color: gray">修改文章</h1>


            <form class="form-horizontal" action="<%=request.getContextPath()%>/show/updateMessage.do" method="post" style="width: 100%">
                <div class="form-group">
                    <%--<label for="inputTitle" class="col-sm-1 control-label">标题</label>--%>
                    <div class="col-sm-12 ">
                        <input name="title" class="form-control" id="inputTitle" placeholder="标题" value="" >
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <label style="color: gainsboro">   &nbsp; &nbsp; &nbsp;选择专题</label>
                        <select class="form-control">
                            <c:forEach items="${categories}" var="category">
                                <option>${category.gname}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <%--<label for="name">可多选的选择列表</label>--%>
                    <%--<select multiple class="form-control">--%>
                        <%--<option>1</option>--%>
                        <%--<option>2</option>--%>
                        <%--<option>3</option>--%>
                        <%--<option>4</option>--%>
                        <%--<option>5</option>--%>
                    <%--</select>--%>
                </div>

                <div class="form-group">
                    <%--<label  class="col-sm-1 control-label">内容</label>--%>
                    <%--使用富文本框------------------%>
                    <div class="col-sm-12">

                        <div id="div1" class="toolbar"></div>
                        <div style="padding: 5px 0; color: #ccc"> &nbsp; &nbsp; &nbsp;文章详情如下</div>
                        <div id="div2" class="text"> <!--可使用 min-height 实现编辑区域自动增加高度-->
                            <%--<h1>点击文章修改按钮</h1>--%>
                        </div>

                        <%--<div id="editor"></div>--%>
                        <%--<input type="hidden" name="content" id="txt"/>--%>
                    </div>
                    <%--使用富文本框end------------------%>
                </div>
                <div class="form-group">
                    <div class=" col-sm-2 col-sm-offset-10">
                        <a class="btn btn-default" href="<%=request.getContextPath()%>/show/message.do">保存修改</a>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>


<%--尾--%>
<jsp:include page="../common/footer.jsp" />

</body>

<script type="text/javascript">
    // 点击把文章放入回收站
    function trash(id){
        // alert(id);
        // alert("123");


        $.ajax({
            type:"get",
            url:"<%=request.getContextPath()%>/show/trash.do?id="+id,
            dataType:"text",
            success:function(data){
                $("#"+id).hide(1000);
                $("#tishi").show(1000).delay(2000).hide(3000);
            }
        });


    }


    // 写文章的富文本框
    var E = window.wangEditor;
    var editor = new E('#div1', '#div2');
    editor.create();
    //创建编辑器之后，使用editor.txt.html(...)设置编辑器内容
    $("button").click(function(){
        var html= editor.txt.html();
        var text=editor.txt.text();
        $("#txt").val(html);
        $("#form").submit();
    });


    function getTheMessage(messageId) {
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/show/getMessageId.do?messageId="+messageId,
            dataType:"json",
            success:function(data){
                $.each(data,function(i,message){
                     $("#inputTitle").attr("value",message.title);
                     editor.txt.html(message.content);
                });

            }
        });
    }

</script>

</html>
