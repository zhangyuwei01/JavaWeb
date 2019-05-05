<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="com.zyw.factory.DAOFactory,com.zyw.vo.Message"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />
<style>
	body{
		padding-top:70px;
	}
	caption{
	    font-size:40px;
		font-style:italic;
		font-weight:bold;
		color:red;
		text-align:center;
	}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a href="../index.jsp" class="navbar-brand">博客天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">个人中心</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="../MessageAdmin?action=destroy"><span class="glyphicon glyphicon-off"></span>注销，安全退出</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
            	<li><a><%=session.getAttribute("username") %>，您好！</a></li>
        	</ul>
		</div>
	</div>
</nav>

<%
	Message msg = DAOFactory.getMessageDAOInstance().query((String)session.getAttribute("username"));
%>

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<table class='table table-hover table-bordered'>
			<caption>我的个人信息</caption>
			<tbody>
				<tr><td>会员ID：</td><td><%out.print(msg.getId());%></td></tr>
				<tr><td>会员名：</td><td><%out.print(msg.getUsername());%></td></tr>
				<tr><td>性别：</td><td>
					<%if(msg.getSex()==null){out.print("（未填写）");}
					  else{out.print(msg.getSex());}
					%></td></tr>
				<tr><td>生日：</td><td>
					<%if(msg.getSex()==null){out.print("（未填写）");}
					  else{out.print(msg.getBirthday());}%></td></tr>
				<tr><td>爱好：</td><td>
					<%if(msg.getSex()==null){out.print("（未填写）");}
				    else{out.print(msg.getHobby());}%></td></tr>
				<tr><td>个性签名：</td><td>
					<%if(msg.getSex()==null){out.print("（未填写）");}
				      else{out.print(msg.getSignature());}%></td></tr>
				<tr><td>信息更新时间：</td><td><%out.print(msg.getRegisterTime());%></td></tr><br>
			</tbody>
		</table>
		<a href='message_update.jsp' class='btn btn-danger btn-block'>点我！完善或修改个人信息</a>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>