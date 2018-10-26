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

</head>
<body>


<div class="col-sm-7">


    <div class="new-list">
        <c:forEach items="${myMessages}" var="message">
            <div class="new-list-item clearfix">
                <div class="col-xs-4">
                    <img src="${message.src}" alt="">
                </div>
                <div class="col-xs-7">

                    <a href="/show/detail.do?id=${message.id}" class="title">${message.title}</a>
                    <div class="content">
                            <%--<p>${message.content}</p>--%>
                    </div>
                    <div class="info">
                        <span> <span class="avatar"><img src="../../img/logo.png"></span>猿梦</span> ⋅
                        <span>25k</span> ⋅
                        <span>${message.title}</span>
                    </div>

                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
