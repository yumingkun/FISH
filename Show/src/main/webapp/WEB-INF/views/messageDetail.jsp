<%@ page import="com.fish.bean.User" %><%--
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


    <style type="text/css">
        a:hover,a:active{
            text-decoration: none;
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
            margin-top: 50px;
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
            transition: all 0.5s ease-in-out;
        }
        .like-active #like:hover{
            border: 1px solid #6c7fd1;
        }
        .like-active #like a{
           color: #ea6f5a;

        }

        /*分享*/
        .like-active .share{
            float: right;
        }


        /*评论样式*/
        .commment{
            width: 100%;
        }

        .commment .textarea{
            height: 160px;
            width: 450px;
            border: 3px solid rgba(83, 85, 136, 0.1);
        }
        .commment  .textarea textarea{
            width: 100%;
            height: 100px;
            /*去除默认样式*/
            resize:none;
            outline: none;
            border-style:none;
            border-bottom: 2px solid rgba(83, 85, 136, 0.1);

        }
        /*发表评论人的头像*/
        .commment  .commment_img img{
            width: 50px;
            height: 50px;
            border-radius: 50px;

        }

        .commment .btn{
            width: 120px;
            background: #6c7fd1;
            color: #fff;
            float: right;
            border-radius:20px;
            margin-top: 10px;
            margin-right: 5px;

        }
        .commment .btn:hover{
            color: #fff;
        }

        /*网友评论部分*/
        .commment .div1{
            font-family: "Wawati SC";
            width: 100%;
            height: 50px;
            line-height: 50px;
            margin-bottom: 20px;
            /*border: 1px solid red;*/
        }
        .commment .div1 .span1{
            font-weight: 800;
            font-size: 25px;
        }
        .commment .div1 .span2{
            font-size: 15px;
            color: gray;
        }
        /*评论数*/
        .commment .div1 .span3{
            color: #6c7fd1;
            font-weight: 800;
            float: right;
            transition: all 0.5s;
        }
        .commment .div1 .span3:hover{
            color: #d15059;
            font-size: 18px;
        }

        /*全部评论*/

        .div2{
            font-family: "Wawati SC";
            width: 100%;
            height: 50px;
            line-height: 50px;
            margin-top:20px;
        }

         .div2 .span4{
            font-weight: 800;
            font-size: 25px;
        }

         .div2 .span5{
            color: #6c7fd1;
            font-weight: 800;
            float: right;
        }

        /*评论*/
        .allComment .containts{
            margin-top: 10px;
           border-bottom: 1px solid #f7f6ff;
            padding-bottom: 10px;
        }
        .allComment .containts .myHead{
            width: 100%;
            height: 50px;
            /*border: 1px solid red;*/
            margin-bottom: 5px;
        }
        .allComment .containts .myHead div{

            display:inline-block;
        }

        .allComment .containts .myHead img{
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .allComment .containts .myHead div .time{
            margin-left: 300px;
        }
        .allComment .containts .myBody{
            margin-left: 50px;
        }




    </style>

</head>
<body>
<%

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

//    通过会话获得当前用户的头像和信息
    User user =(User) request.getSession().getAttribute("user");

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
                <%--作者信息--%>
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

            <div id="like" onclick="addLuad()">
                <a >
                    <span class="glyphicon glyphicon-heart"></span>
                    <span id="myLaudNum"> ${message.laud}</span>
                </a>
            </div>
            <div class="share-active share">
                <div class="bdsharebuttonbox"  >
                    <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友" style="background: url('../../img/QQ.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信" style="background: url('../../img/weixin.png') no-repeat 0,0;background-size:cover;width: 45px;height: 45px;"></a>
                </div>
            </div>
        </div>

        <hr>

        <%--写评论--%>

        <section class="commment ">
            <%--网友评论--%>
            <div class="div1"><span class="span1">网友评论</span><span class="span2">文明上网，理性发言，违者打死</span>   <span class="span3">条评论</span><span class="span3 mySpan3">${countComment}</span></div>

            <%--评论头像以及评论框--%>

            <div class="row" >
                <div class="col-md-2 commment_img">
                    <c:if test="${user!=null}">
                        <img src="<%=basePath+user.getHead()%>" >
                    </c:if>

                    <c:if test="${user==null}">
                        <img src="../../img/notlogin.jpg">
                    </c:if>
                </div>
                    <%--写评论--%>
                <div class="col-md-10  textarea" >
                    <textarea  class="text_send" id="text_send"></textarea>
                    <div class="btn" onclick="comment()" >发布评论</div>
                </div>
            </div>



        </section>

        <div class="div2"><span class="span4">全部评论</span>   <span class="span5">最新</span></div>

        <section class="allComment">
              <%--添加节点--%>
            <span class="insert"></span>

              <%--全部评论展示   --%>
               <c:if test="${allComment!=null}">
                   <c:forEach items="${allComment}" var="comment">
                       <div class="containts">
                           <div class="myHead">
                               <img src="<%=basePath%>${comment.user.head}">
                               <div><span>${comment.user.username}</span> <span class="time">${comment.create_time}</span></div>
                           </div>
                           <div class="myBody">
                                   ${comment.contrent}
                                   <%--Comment{id=0, userId=7, messageId=13, contrent='我是评论', laud=0, create_time=2018-11-06 16:23:06.0}]--%>
                                   <%--这个我的实体类写错了，不想改了，应该为content--%>
                           </div>
                       </div>
                   </c:forEach>
               </c:if>
               <%--<c:if test="${allComment==null}">   </c:if>--%>

        </section>




    </div>

    <div class="col-md-3"></div>



</div>


<%--1:引入页尾--%>
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
    // 分享
    window._bd_share_config={common:{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},share:{},image:{"viewList":["qzone","sqq","tsina","weixin"],"viewText":"分享到：","viewSize":"16"},selectShare:{"bdContainerClass":null,"bdSelectMiniList":["qzone","sqq","tsina","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];



    function time(){
        function time(s) {
            return s < 10 ? '0' + s: s;
        }
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        var s=myDate.getSeconds();
        return year+'-'+time(month)+"-"+time(date)+" "+time(h)+':'+time(m)+":"+time(s)+".0";
    }



    // 这一部分有bug 即使插入成功，总是进入error
    //点击发布评论增加节点(这一部分有bug 即使插入成功，总是进入error)
    var num=${countComment};//获取当前评论数
    function comment(){
        num++;//每次点击评论，评论总数+1
        $(".mySpan3").text(num);//评论+1


        var now = time();
        //获取评论信息
        var text_send = $(".text_send").val();
        if(text_send ==""){
            return false;
        }
        var str=`
               <div class="containts">
                   <div class="myHead">
                       <img src="<%=basePath+user.getHead()%>">
                       <div><span><%=user.getUsername()%></span> <span class="time">`+now+`</span></div>
                   </div>
                   <div class="myBody">
                            `+text_send+`
                           <%--Comment{id=0, userId=7, messageId=13, contrent='我是评论', laud=0, create_time=2018-11-06 16:23:06.0}]--%>
                           <%--这个我的实体类写错了，不想改了，应该为content--%>
                   </div>
               </div>

        `;
        $(".insert").before(str);
        $.ajax({
            type:"post",
            async: true,//
            url:"<%=request.getContextPath()%>/show/addComment.do?messageId="+${message.id},
            data:{"content":text_send},
            success:function(){
                $(".insert").before(str);
            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                // $(".allComment").append("失败");
            },


        });


        $(".text_send").val("");
    }

    var num=${message.laud};
    function addLuad() {
        $.ajax({
            type:"post",
            async: true,//
            url:"<%=request.getContextPath()%>/show/addLaud.do?messageId="+${message.id},
            success:function(){
                num++;
                $("#myLaudNum").text(num);

            },
            error:function( XMLHttpRequest, textStatus, errorThrown){
                // $(".allComment").append("失败");
            },


        });
    }



</script>

</html>
