<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<title>注册</title>
<style>
	body{
		padding-top:5px;
	}
	div {
		padding: 5px;
	}
</style>
</head>
<body>
<form name="registerForm" action="../MessageAdmin?action=register" method="post" onsubmit="return CheckForm();">     
	<div class="container">
		<div class="col-sm-offset-3 col-sm-6">
			<div class="row">
				<div class="form-group">
					<label for="username" class="control-label">用户名</label>
					<input type="text" name="username" id="username" placeholder="请输入用户名（20字符以内）" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="password" class="control-label">密码</label>
					<input type="password" name="password" id="password" placeholder="请输入密码（8位）" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="vpassword" class="control-label">确认密码</label>
					<input type="password" name="vpassword" id="vpassword" placeholder="请确认密码（两次输入必须一致）" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="question" class="control-label">验证问题</label>
					<input type="text" name="question" id="question" placeholder="用于找回密码（40字符以内）" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="answer" class="control-label">问题答案</label>
					<input type="text" name="answer" id="answer" placeholder="用于找回密码（20字符以内）" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<a href="index.jsp" class="btn btn-warning form-control">
						<span class="glyphicon glyphicon-hand-left"></span>已有账号！去登录
					</a>
				</div>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-success form-control">
						注册<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</form>    

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm(){
		if(document.registerForm.username.value==""){
			alert("用户名不能为空！");
			document.registerForm.username.focus();
			return false;
		}
		if(document.registerForm.password.value==""){
			alert("密码不能为空！");
			document.registerForm.password.focus();
			return false;
		}
		if(document.registerForm.vpassword.value!=document.registerForm.password.value){
			alert("两次密码不一致！");
			document.registerForm.vpassword.focus();
			return false;
		}
		if(document.registerForm.question.value==""){
			alert("验证问题不能为空！");
			document.registerForm.question.focus();
			return false;
		}
		if(document.registerForm.answer.value==""){
			alert("问题答案不能为空！");
			document.registerForm.answer.focus();
			return false;
		}
	  	return true;  
	}
</script>
</body>
</html>