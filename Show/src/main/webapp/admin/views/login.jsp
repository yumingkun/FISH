<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>登录</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/login.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/admin/css/bootswatch.css">

	</head>
	<body>

		<form id="loginform" action="<%=request.getContextPath()%>/manage/login.do" method="post">
			<h1>LOGIN${result}</h1>

			<div class="form-group" >
				<label for="Username">Username</label>
				<input type="text" class="form-control" name="username" id="Username" placeholder="Username"  required pattern="^[a-zA-Z0-9\u4e00-\u9fa5]{6,12}$" title="6到12位">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input type="password" class="form-control"  name="password" id="exampleInputPassword1" placeholder="Password" required pattern="^[a-zA-Z0-9]{4,12}" title="6到12位英文或数字">
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-md-1">
						<button type="submit" class="btn btn-default">Sign in</button>
					</div>
				</div>
			</div>
		</form>

	</body>
</html>