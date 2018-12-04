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
		// 工具提示
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
	</script>
	<style type="text/css">
		*{
			margin: 0px;
			padding: 0px;
		}

		#container ul{
			padding: 0px ;
			width: 90%;
			border: 1px solid #C4C4C4;
			border-radius: 5px;

			/*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
		}
		#container ul a{
			color: black;
			border: none ;
			text-align: center;
		}
		#container  ul li{
			width: 100%;
			border: none ;
			text-align: center;
		}
		/*#container ul .list-group-item a{*/
		/*display: block;*/
		/*height: 20px;*/
		/*margin-top: -10px;*/
		/*color:gray ;*/
		/*}*/
		#container ul a:hover{
			color: white ;
			background-color: #b0b8d2;
			/*box-shadow: 2px 2px 2px 0px #478EFF inset;*/
		}
		#container ul li:hover{
			color: white;
			cursor: pointer;
			background-color: #b0b8d2;
			/*box-shadow: 3px 3px 1px 1px #00428D inset;*/
		}

		#left{
			border: 1px solid #C4C4C4;
			padding: 0px;
			border-radius: 10px;
			/*box-shadow: 1px 2px 3px 0px #C4C4C4;*/
			min-height: 300px;
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


		/*左边选项默认为不显示*/
		.myLeaf{
			display:block;
		}

		/*轮播图*/
		.myCarousel h1{
			display: none;
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
		<%--左边--%>
		<div class="col-md-2" >
			<span class="glyphicon glyphicon-cog" id="too" style="font-size: 40px;margin-bottom: 10px"></span>
			<div id="right" class="myLeaf">
				<div class="row">
					<ul class="nav nav-pills nav-stacked list-group col-md-12 col-xs-6 ">
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/user.do">个人中心</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUserComment.do">我的评论</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFollow.do">我的关注</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toFan.do">我的粉丝</a></li>
						<li class="list-group-item"><a href="<%=request.getContextPath()%>/show/toUploadDoc.do">我的文件</a></li>

					</ul>


					<ul class="list-group col-md-12 col-xs-6">
						<a href="<%=request.getContextPath()%>/show/myMessage.do" class="list-group-item">我的博客</a>
						<a href="<%=request.getContextPath()%>/show/showTrashMessage.do" class="list-group-item"><span class="glyphicon glyphicon-trash"></span> 回收站</a>
						<%--<a href="#" class="list-group-item">我的论坛</a>--%>
						<%--<a href="#" class="list-group-item">我的学院</a>--%>
					</ul>
				</div>

			</div>
		</div>

		<%--右边--%>
		<div id="left" class="col-md-10 panel panel-default"   >
			<h3 id="right-h3" class="panel-heading">我的文件<span class="glyphicon glyphicon-plus" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap"></span></h3>
			<div class="container-fluid">
				<!-- 提示 -->
				<c:choose >
					<c:when test="${doc ==1 }">
						<div class="alert alert-dismissible alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Well done!</strong>  <a href="#" class="alert-link">上传成功</a>.
						</div>
					</c:when>
					<c:when test="${doc ==2 }">
						<div class="alert alert-dismissible alert-info">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Well done!</strong>  <a href="#" class="alert-link">上传失败</a>.
						</div>
					</c:when>
					<c:when test="${doc ==3 }">
						<div class="alert alert-dismissible alert-info">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Well done!</strong>  <a href="#" class="alert-link">删除成功</a>.
						</div>
					</c:when>
					<c:when test="${doc ==4 }">
						<div class="alert alert-dismissible alert-info">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<strong>Well done!</strong>  <a href="#" class="alert-link">删除失败</a>.
						</div>
					</c:when>

				</c:choose>
				<%--表格--%>
				<div class="row">
					<table class="table table-hover">
						<thead>
						<tr class="table-primary">
							<th scope="col">是否分享</th>
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
								<td>
									<c:choose >
										<c:when test="${doc.isshare eq 1}">
											<a href="<%=request.getContextPath()%>/show/isShare?share=0&docId=${doc.id}" class="btn btn-success btn-sm">已分享</a>
										</c:when>
										<c:otherwise>
											<a href="<%=request.getContextPath()%>/show/isShare?share=1&docId=${doc.id}" class="btn btn-warning btn-sm">未分享</a>
										</c:otherwise>

									</c:choose>
								</td>
								<td scope="row">${doc.filename}</td>
								<td>${doc.filesize}</td>
								<td>${doc.filetype}</td>
								<td>${doc.memo}</td>
								<td>${fn:substring(doc.uploaddate, 0, 10)}</td>
								<td>${doc.count}</td>
								<td>
									<a href="<%=request.getContextPath()%>/show/deleteDoc.do?id=${doc.id}" data-toggle="tooltip" data-placement="top" title="删除文件？"><span class="glyphicon glyphicon-trash glyphico"> </span></a>
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



<%--模态框--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">上传文件</h4>
			</div>
			<div class="modal-body">
				<%--表单--%>
				<form action="<%=request.getContextPath()%>/show/uploadDoc.do" enctype="multipart/form-data" method="post" id="docForm">
					<div class="form-group">
						<%--<label for="exampleInputFile">上传文件</label>--%>
						<input type="file"  name="filename">
					</div>

					<div class="form-group">
							<div class="checkbox">
								<label>
									<input type="checkbox" name="isshare" value="1"> 是否分享
								</label>
							</div>
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">描述</label>
						<textarea class="form-control" id="message-text"  name="memo"></textarea>
					</div>
				</form>
				<%--表单end--%>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="sub()">上传</button>
			</div>
		</div>
	</div>
</div>


<%--页脚--%>
<jsp:include page="../common/footer.jsp" />
<%--页脚end--%>

</body>

<script type="text/javascript">
	// 提交文件表单
	function sub() {
		$("#docForm").submit();
    }


</script>
</html> 