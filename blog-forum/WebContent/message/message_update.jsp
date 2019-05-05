<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新个人信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="../css/dcalendar.picker.css" />
<link type="text/css" rel="stylesheet" href="../css/zzsc.css" />
<style>
	div {
		padding: 2px;
	}
</style>
</head>
<body>
<form name="updateForm" action="../MessageAdmin?action=updateMyMessage" method="post" onsubmit="return CheckForm();">     
	<div class="container">
		<div class="col-sm-offset-3 col-sm-6">
			<div class="row">
				<div class="form-group">
					<label for="username" class="control-label">用户名</label>
					<input type="text" name="username" id="username" value="<%=session.getAttribute("username") %>" class="form-control" readonly="readonly" />
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
				<div class="form-group">
					<label class="control-label">性别</label>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-default active"><input type="radio" name="sex" value="男" checked="checked" />男</label>
						<label class="btn btn-default"><input type="radio" name="sex" value="女" />女</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="birthday" class="control-label">生日</label>
					<input type="text" name="birthday" id="birthday" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label class="control-label">爱好</label>
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-default active"><input type="checkbox" name="hobby" value="运动" checked="checked" />运动</label>
						<label class="btn btn-default"><input type="checkbox" name="hobby" value="音乐" />音乐</label>
						<label class="btn btn-default"><input type="checkbox" name="hobby" value="影视" />影视</label>
						<label class="btn btn-default"><input type="checkbox" name="hobby" value="阅读" />阅读</label>
						<label class="btn btn-default"><input type="checkbox" name="hobby" value="技术宅" />技术宅</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="signature" class="col-sm-3 control-label">个性签名</label>
					<textarea rows="5" name="signature" id="signature" class="form-control"></textarea>		
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<a href="message_main.jsp" class="btn btn-warning form-control">
						<span class="glyphicon glyphicon-hand-left"></span>返回个人中心
					</a>
				</div>
				<div class="col-sm-6">
					<button type="submit" class="btn btn-success form-control" id="btn-register">
						更新个人信息<span class="glyphicon glyphicon-pencil"></span>
					</button>
				</div>
			</div>
		</div>
	</div>
</form>    

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/dcalendar.picker.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm(){
		if(document.updateForm.password.value==""){
			alert("密码不能为空！");
			document.updateForm.password.focus();
			return false;
		}
		if(document.updateForm.vpassword.value!=document.updateForm.password.value){
			alert("两次密码不一致！");
			document.updateForm.vpassword.focus();
			return false;
		}
		if(document.updateForm.question.value==""){
			alert("验证问题不能为空！");
			document.updateForm.question.focus();
			return false;
		}
		if(document.updateForm.answer.value==""){
			alert("问题答案不能为空！");
			document.updateForm.answer.focus();
			return false;
		}
		if(document.updateForm.birthday.value==""){
			alert("生日不能为空！");
			document.updateForm.birthday.focus();
			return false;
		}
		if(document.updateForm.signature.value==""){
			alert("个性签名不能为空！");
			document.updateForm.signature.focus();
			return false;
		}
	  	return true;  
	}
	$('#birthday').dcalendarpicker({
		format:'yyyy-mm-dd'
	}); 
</script>
</body>
</html>