<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.MultimediaFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到音乐天堂</title>
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
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>登录后，可以管理音频！</a>");
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
			<a href="../index.jsp" class="navbar-brand">博客天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">音乐天堂</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="audio_send.jsp"><span class="glyphicon glyphicon-arrow-up"></span>上传音乐</a></li>
				<li><a href="audio_mine.jsp"><span class="glyphicon glyphicon-user"></span>我的音乐</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
            	<li><%=welcome%></li>
        	</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<%
			List uploadAudioList = new  ArrayList();
			uploadAudioList = DAOFactory.getFileDAOInstance().searchFileByType("audio","all");
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
					<%out.print(file.getUploadTime());%>
					<a href="audio_detail.jsp?id=<%=file.getId() %>" class="pull-right" target="_blank">音乐详情</a>
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