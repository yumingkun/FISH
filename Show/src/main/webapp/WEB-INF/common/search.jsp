<%--
  Created by IntelliJ IDEA.
  User: mingkunyu
  Date: 2018/9/27
  Time: 下午9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
        .search{
            position: relative;
            top: -20px;
            float: left;
            height: 56px;
            line-height: 56px;
            padding: 0 20px;
        }

        .search input{
            border-radius: 40px;
            border: 0;
            outline: none;
            background: #f6f6f6;
            width: 100px;
            height: 38px;
            padding: 0 40px 0 20px;
        }
        .search .search-btn {
            position: absolute;
            top: 4px;
            right: 25px;
            border-radius: 100px;
            width: 30px;
            height: 30px;
        }
        .search i {
            position: absolute;
            top: 6px;
            right: 7px;
            font-size: 18px;
        }

    </style>

<div class="search">
    <form action="<%=request.getContextPath()%>/show/search.do" method="post" accept-charset="utf-8" id="searchForm">
        <input type="text" placeholder="搜索" id="myInput" name="search">
        <a class="search-btn" href=""><i class="glyphicon  glyphicon-search"></i></a>
    </form>
</div>

<%--搜索框的js--%>
<script type="text/javascript">
    //搜索框动画
    var Input = $('form input');
    Input.focusin(function (){
        $('.search-btn').css({
            "background":"#535588",
            "color":"#fff"
        });
        Input.animate({width:200});
    });

    Input.focusout(function (){
        $('.search-btn').css({
            "background":"",
            "color":"#333"
        });
        Input.animate({width:100});
    });
    //回车提交表单
    $("#myInput").keyup(function(e){//当按下按键时，运行函数
        if(e.which=="13"){//e.which对应的输入字符, 13对应Enter键
            $('#searchForm').submit();
        }
    });

</script>