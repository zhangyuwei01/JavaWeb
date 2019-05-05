<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.zyw.factory.DAOFactory,com.zyw.vo.MultimediaFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图片详情</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<style type="text/css">
	body {
		padding-top: 100px;
		padding-bottom: 50px;
	}
	img{
		width:100%;
		height:auto;
	}
</style>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>未登录！</a>");
	}
	else{
		welcome.append("<a>"+username+"，您好！</a>");
	}
%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
				<span class="sr-only">切换导航</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand">博客天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">美图天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">图片详情</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right"> 
            	<li><%=welcome%></li>
        	</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->
<%
	int id = Integer.parseInt(request.getParameter("id"));
	MultimediaFile file = DAOFactory.getFileDAOInstance().searchByID(id);
%>
<div class="container">
	<div class="col-sm-offset-2 col-sm-8">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h2 class="panel-title"><%out.print(file.getFileName());%></h2>
			</div>
			<div class="panel-body">
				<img id="previewImg" src="../../upload/image/<%=file.getFileName()%>" />
			</div>
			<div class="panel-footer">
				<%out.print(file.getMessageUsername());%>&nbsp;&nbsp;上传于&nbsp;&nbsp;
				<%out.print(file.getUploadTime());%>
				<p class="pull-right">图片大小：<%out.print(file.getFileSize());%></p>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>