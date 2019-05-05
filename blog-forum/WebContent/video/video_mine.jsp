<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.MultimediaFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的视频</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<style type="text/css">
	body {
		padding-top: 70px;
		padding-bottom: 50px;
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
			<a href="video_main.jsp" class="navbar-brand">视频天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">我的视频</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a><%=session.getAttribute("username")%>，您好！</a></li>
			</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<%
			List uploadVideoList = new  ArrayList();
			uploadVideoList = DAOFactory.getFileDAOInstance().searchFileByProperty((String)session.getAttribute("username"),"('mp4','mkv','avi')");
			for(int i=0;i<uploadVideoList.size();i++){
				MultimediaFile file = null;
				file = (MultimediaFile) uploadVideoList.get(i);
		%>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title"><%out.print(file.getFileName());%></h2>
				</div>
				<div class="panel-body">
					<small>
						<%out.print(file.getMessageUsername());%>&nbsp;&nbsp;上传于&nbsp;&nbsp;
						<%out.print(file.getUploadTime());%><br>
						<a href="../FileAdmin?action=deleteVideo&id=<%=file.getId() %>">删除</a>
						<a href="video_detail.jsp?id=<%=file.getId() %>" class="pull-right" target="_blank">视频详情</a>
					</small>
				</div>
			</div>
		<% 
			}
		%>		
		
		<footer>
			<a href="#top" class="pull-right"><span class="glyphicon glyphicon-chevron-up"></span>回到顶部</a>
		</footer>
	</div><!-- 偏移结束 -->
</div><!-- 容器结束 -->

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>