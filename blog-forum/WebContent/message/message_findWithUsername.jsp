<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码（用户名）</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<style>
	body{
		padding-top:70px;
	}
	div {
		padding: 5px;
	}
</style>
</head>
<body>
<form name="findPwdForm" action="../MessageAdmin?action=findPwd_username" method="post" onsubmit="return CheckForm();">
	<div class="container">
		<div class="col-sm-offset-3 col-sm-6">
			<div class="row">
				<div class="form-group">
					<label for="username" class="control-label">用户名</label> 
					<input type="text" name="username" id="username" placeholder="请输入您的用户名！" class="form-control" />
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-6">
						<a href="../index.jsp" class="btn btn-warning form-control">
							<span class="glyphicon glyphicon-hand-left"></span>想起密码！去登录
						</a>
					</div>
					<div class="col-sm-6">
						<button type="submit" class="btn btn-success form-control">
							查询<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
				</div>
			</div>
		</div>	
	</div>
</form>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function CheckForm(){
		if(document.findPwdForm.username.value==""){
			alert("用户名不能为空！");
			document.findPwdForm.username.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>