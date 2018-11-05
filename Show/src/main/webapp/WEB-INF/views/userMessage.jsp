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
            border: 1px solid #C4C4C4;
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

    </style>
</head>
<body>


<%--导航--%>
<jsp:include page="../common/header.jsp" />


<div class="container">
    <div class="row">


        <div class="col-md-1"></div>
        <form action="<%=request.getContextPath()%>/show/myMessage.do" METHOD="post" id="refishTrash" style="display: none"></form>

        <div class="col-md-10">

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
                              <strong><span class="glyphicon   glyphicon-volume-up"></span> </strong> 此文章已经成功放入回收站
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
                                            <span> <span class="avatar"><img src="../../img/logo.png"></span>猿梦</span> ⋅
                                            <span>25k</span> ⋅
                                            <span>${message.title}</span>
                                        </div>

                                    </div>
                                        <%--修改--%>
                                    <div class="col-xs-1 "><span class="glyphicon glyphicon-edit"></span>  </div>
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

        <div class="col-md-1"></div>
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





</script>

</html>
