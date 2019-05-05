<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码（显示结果）</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<style>
	body{
		padding-top:50px;
	}
	div {
		padding: 10px;
	}
	caption{
	    font-size:40px;
		font-style:italic;
		font-weight:bold;
		color:blue;
		text-align:center;
	}
</style>
</head>
<body>
<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<div class="row">
			<table class="table table-hover table-bordered">
				<caption>查询结果</caption>
			    <tbody>
			    	<tr>
				        <td>用户名：</td><td><%=session.getAttribute("username") %></td>
			        </tr>
			      	<tr>
				        <td>密码：</td><td><%=session.getAttribute("password") %>&nbsp;<span class="label label-danger">牢记</span></td>
			        </tr>
			    </tbody>
			</table>
		</div>
		<div class="row">
			<a href="../index.jsp" class="btn btn-success btn-block">我已经记住密码！</a>
		</div>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>