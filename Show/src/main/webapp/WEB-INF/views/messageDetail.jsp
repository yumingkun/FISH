<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/25
  Time: 下午4:04
  To change this template use File | Settings | File Templates.
--%>
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
    <%--矢量图标--%>
    <script src="../../icont/iconfont.js"></script>
    <link rel="stylesheet" type="text/css" href="../../icont/iconfont.css"/>

    <style type="text/css">
        /*icon设置*/
        .icon {
            width: 3em; height: 3em;
            vertical-align: -0.15em;
            fill: currentColor;
            overflow: hidden;
        }

        /*所有的图片样式*/
        img{
            border-radius: 10px;
        }
        .container .title{
            font-family: "Wawati SC";
            text-align: center;
            font-size: 50px;
            font-weight: 800;
            color: gray;
        }
        .container .content p{
            text-align: left;
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 16px;
            font-family: “Arial”,”Microsoft YaHei”,”黑体”,”宋体”,sans-serif;
        }

        /*作者信息*/
        .container ul.myself{
            width: 100%;
            height: 60px;
            /*border: 1px solid red;*/
            display: inline-block;
            list-style: none;
            padding: 0;
            margin: 0;
            /*border: 1px solid red;*/
        }
        .container ul.myself li{
            width: 60px;
            height: 60px;
            /*border: 1px solid red;*/
            float: left;
            /*border: 1px solid red;*/
        }


        /*作者头像*/
        .container ul.myself li img{
            width: 50px;
            height: 50px;
            line-height: 50px;
            border-radius: 50%;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 2px solid #5c83b7;
        }

        .container ul.myself li .username{
            font-size: 15px;
            color: gray;
        }



        /*结束*/

        .theEnd{
            margin-top: 60px;
            width: 100%;
            font-family: "Wawati SC";
            text-align: center;
            font-size: 17px;
            font-weight: 800;
            color: #26263d;

        }
        .theEnd span{
            color: #b0b8d2;
        }


        /*喜欢和分享*/
        .like-active{
            width: 100%;
            margin: 40px 0;
            /*border:1px solid red;*/
            overflow: hidden;

        }

        /*喜欢*/
        .like-active #like{
            float: left;
            border: 1px solid #ea6f5a;
            padding: 15px 25px;
            border-radius: 40px;
            display: inline-block;
        }
        .like-active #like a{
            color: #ea6f5a;
        }

        /*分享*/
        .like-active .share{
            float: right;
        }
    </style>

</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%--1:引入头部--%>
<jsp:include page="../common/header.jsp"></jsp:include>
<%--1:文章详情主体--%>
<div class="container">

    <div class="col-md-3"></div>
    <!-- 左边文章 -->
    <div class="col-md-6">
        <h1  class="title">${message.title}</h1>

        <ul class="myself">
                <c:if test="${user!=null}">
                    <li><img alt="" src="<%=basePath%>${user.head}"></li>
                    <li><span class="username">${user.username}</span></li>
                </c:if>

                <c:if test="${user==null}">
                    <img src="../../img/notlogin.jpg" class="img-circle">
                </c:if>
        </ul>

        <%--内容--%>
        <div  class="content">
            ${message.content}
        </div>




        <%--结束--%>
        <div class="theEnd"><hr><span class="glyphicon glyphicon-menu-right"></span> THE END <span class="glyphicon glyphicon-menu-left"></span></div>


        <%--喜欢和分享--%>
        <div class="like-active">

            <div id="like">
                <a href="">
                    <span class="glyphicon glyphicon-heart"></span>
                    喜欢  |  66
                </a>
            </div>
            <div class="share-active share">
                <div class="bdsharebuttonbox"  >
                    <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友" style="background: url('../../img/QQ.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信" style="background: url('../../img/weixin.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                </div>
            </div>
        </div>





    </div>

    <div class="col-md-3"></div>
    <!-- 左边文章END -->

    <%--<!-- 右侧边栏 -->--%>
    <%--<div class="col-md-4">--%>
        <%--<div class="side-bar-card">--%>
            <%--<div class="card-title">相关推荐</div>--%>
            <%--<div class="card-body">--%>
                <%--<div class="list">--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="item clearfix">--%>
                        <%--<div class="col-xs-5 no-padding-h">--%>
                            <%--<img src="https://dummyimage.com/1000x700/666/000000" alt="666">--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-7">--%>
                            <%--<div class="title">Quam dolorem, accusamus autem suscipit dolor esse.</div>--%>
                            <%--<div class="desc">15k阅读 1k评论</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="side-bar-card">--%>
            <%--<div class="card-title">24小时热闻</div>--%>
            <%--<div class="card-body">--%>
                <%--<div class="list">--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                    <%--<div class="item">--%>
                        <%--<div class="title">Lorem ipsum dolor sit amet, consectetur adipisicing</div>--%>
                        <%--<div class="desc">15k阅读 1k评论</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!-- 右侧边栏END -->--%>


</div>


<%--1:引入页尾--%>
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
    // 分享
    window._bd_share_config={common:{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},share:{},image:{"viewList":["qzone","sqq","tsina","weixin"],"viewText":"分享到：","viewSize":"16"},selectShare:{"bdContainerClass":null,"bdSelectMiniList":["qzone","sqq","tsina","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];


</script>

</html>
