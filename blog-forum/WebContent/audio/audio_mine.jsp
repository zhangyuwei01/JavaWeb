<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.MultimediaFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的音乐</title>
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
			<a href="audio_main.jsp" class="navbar-brand">音乐天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">我的音乐</a>
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
			List uploadAudioList = new  ArrayList();
			uploadAudioList = DAOFactory.getFileDAOInstance().searchFileByProperty((String)session.getAttribute("username"),"('mp3')");
			for(int i=0;i<uploadAudioList.size();i++){
				MultimediaFile file = null;
				file = (MultimediaFile) uploadAudioList.get(i);
		%>
		<div class="panel panel-success">
			<div class="panel-heading">
				<h2 class="panel-title"><%out.print(file.getFileName());%></h2>
			</div>
			<div class="panel-body">
				<small>
					<%out.print(file.getMessageUsername());%>&nbsp;&nbsp;上传于&nbsp;&nbsp;
					<%out.print(file.getUploadTime());%><br>
					<a href="../FileAdmin?action=deleteAudio&id=<%=file.getId() %>">删除</a>
					<a href="audio_detail.jsp?id=<%=file.getId() %>" class="pull-right" target="_blank">音乐详情</a>
				</small>
			</div>
		</div>
		<br>
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