<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/19
  Time: 下午10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <title>FISH</title>
    <%--清除浏览器默认样式--%>
    <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
    <%--引入bootstrap--%>
    <script src="../../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="../../css/bootstrap.min.css">

    <%--整体css js--%>
    <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
    <script src="../../js/main.js" type="text/javascript" charset="utf-8"></script>


    <style >
        /*加载更多*/
        .more{
            margin-top: 100px;
            height: 40px;
            line-height: 40px;
            border-radius: 20px;
            background-color: #b0b8d2;
            text-align: center;
            color: white;
            font-size: 16px;
            font-weight:bold;

        }


         #nullImg{
             width: 200px;
             height: 140px;
             border: 2px solid #b9def0;
        }

        /*总计数*/
        .myAlert{
            background-color: rgba(235, 246, 255, 0.5);
            margin-top: 20px;
            width: 100%;
            font-family: "Wawati SC";
            text-align: center;
            font-size: 17px;
            font-weight: 800;
            color: #26263d;
        }

    </style>


</head>
<body>
<%--1：标签锚点--%>
<a name="top"></a>

<%--导航--%>
<jsp:include page="../common/header.jsp" />
<!-- 导航END -->

<!-- 主内容 -->
<div class="container">
    <div class="row">
        <!-- 左边分类 -->
        <div class="col-sm-2 hidden-xs">
            <div class="list-group side-bar">
                <a class="list-group-item"><span class="glyphicon glyphicon-fire"></span>  热门专题</a>
                <c:forEach items="${categories}" var="category">
                    <%--<td>${category.id}</td>--%>
                    <a href="<%=request.getContextPath()%>/show/oneCategory.do?cid=${category.id}" class="list-group-item">${category.gname}</a>
                </c:forEach>

            </div>
        </div>
        <!-- 左边分类END -->
        <!-- 中间内容 -->
        <div class="col-sm-7">

            <%--初始值--%>
            <div class="new-list mylist">
                <c:forEach items="${messages}" var="message">
                    <div class="new-list-item clearfix">
                        <div class="col-xs-4 .text-center" >
                            <c:if test="${message.src==null or message.src==''}">
                                <img src="../../img/nullsrc.png" id="nullImg" >
                            </c:if>
                            <c:if test="${message.src!=null}">
                                <img src="${message.src}">
                            </c:if>
                        </div>
                        <div class="col-xs-7">

                            <a href="/show/detail.do?id=${message.id}&userId=${message.userId}" class="title">${message.title}</a>
                            <%--<div class="content">--%>
                                    <%--&lt;%&ndash;<p>${message.content}</p>&ndash;%&gt;--%>

                            <%--</div>--%>
                            <div class="info">
                                <span class="glyphicon glyphicon-tag" style="color: #6c7fd1"></span>
                                <span>${message.category.gname}</span>
                                <span>${message.title}</span>
                            </div>


                        </div>
                    </div>
                </c:forEach>

                <%--加载更多数据显示位置   --%>
            </div>

            <!-- 加载更多 -->
                <c:if test="${show==1}">
                    <div class="alert myAlert" role="alert">${count}</div>
                </c:if>

                <c:if test="${show!=1}">
                    <div class="more" onclick="page()">
                        加载更多
                    </div>
                </c:if>

        </div>
        <!-- 中间内容END -->
        <!-- 右边内容 -->
        <div class="col-sm-3">
            <div class="side-bar-card flag clearfix">
                <div class="col-xs-5">
                    <img src="../../img/tel.jpeg">
                </div>
                <div class="col-cs-7">
                    <div class="text-lg">有害信息举报专区</div>
                    <div>举报电话：110</div>
                </div>
            </div>
            <div class="side-bar-card">
                <div class="card-title">24小时热闻</div>
                <div class="card-body">
                    <div class="list">
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                        <div class="item">
                            <div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>
                            <div class="desc">15k阅读 1k评论</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 右边内容END -->
    </div>
</div>


<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>

<%--1：回到顶部--%>
<a title="返回顶部"  id="btn" ></a>

</body>

<script type="text/javascript">
    // 实现加载更多
    var clickNum = 0;//点击次数
    function page(){
        clickNum++;
        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/show/more.do?clickNum="+clickNum,
            dataType:"json",
            success:function(data){
                var str="";
                $.each(data,function(i,message){
                    var src=message.src?message.src:"../../img/nullsrc.png";
                    var tyle=message.src?"":"style=\"width: 200px;height: 140px;border: 2px solid #b9def0\"";
                    str+=`
                         <div class="new-list-item clearfix">
                            <div class="col-xs-4">
                                <img src='`+src+`' alt="" `+tyle+`>
                            </div>
                            <div class="col-xs-7">

                                <a href="/show/detail.do?id=`+message.id+`&userId=`+message.userId+`" class="title">`+message.title+`</a>
                                <div class="content">
                                        <%--<p>${message.content}</p>--%>
                                </div>
                                <div class="info">
                                    <span> <span class="avatar"><img src="../../img/logo.png"></span>猿梦</span> ⋅
                                    <span>25k</span> ⋅
                                    <span>`+message.title+`</span>
                                </div>

                            </div>
                        </div>

                    `;
                });

             $(".mylist").append(str);

            }
        });
    }



    //回到顶部
    //1：jQuery.fn是jQuery的原型对象也可以写成 $.fn
    //2：添加myScrollTo方法到jQuery原型($.fn)
    jQuery.fn.myScrollTo = function(speed) {
        var targetOffset = $(this).offset().top;
        console.log(targetOffset);//去除默认样式后是 0
        //$(this).offset()：获得位移对象（此时其实啥也没做）
        //$(this).offset().top：获得位移高度
        $('html,body').stop().animate({scrollTop: targetOffset}, speed);
        return this;
    };

    // 使用自定义的方法
    $("#btn").click(function(){
        $("body").myScrollTo(500);//调用，并传入速度
        return false;//阻止默认事件
    });

</script>


</html>
