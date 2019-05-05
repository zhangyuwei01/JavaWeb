<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Article,com.zyw.vo.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的文章</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />

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
			<a href="article_main.jsp" class="navbar-brand">美文天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">我的文章</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a><%=session.getAttribute("username") %>，您好！</a></li>
			</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
	<%
		List articleList = new  ArrayList();
		articleList = DAOFactory.getArticeDAOInstance().searchByLikeProperty("username", (String)session.getAttribute("username"));
		for(int i=0;i<articleList.size();i++){
			Article article = null;
			article = (Article) articleList.get(i);
			//计算评论数
			List commentList = new  ArrayList();
			commentList = DAOFactory.getArticeDAOInstance().searchAllComment(article.getId());
	%>
		<div class='panel panel-info'>
			<div class='panel-heading'>
				<h3 class='panel-title'><%out.print(article.getTitle()); %></h3>
			</div>
			<div class='panel-body'>
				<small>
					<%out.print(article.getMessageUsername()); %>&nbsp;发表于&nbsp;
					<%out.print(article.getPublishTime()); %><br>
					<span class='glyphicon glyphicon-comment'></span>&nbsp;
					<%out.print(commentList.size()); %><br>
					<a href="article_update.jsp?id=<%=article.getId() %>">修改</a>
					|
					<a href="../ArticleAdmin?action=deleteArticle&id=<%=article.getId() %>">删除</a>
					<a href="article_detail.jsp?id=<%=article.getId() %>" class="pull-right" target="_blank">文章详情</a>
				</small>
			</div>
		</div>
	<%
		} 
	%>
		<footer>
			<a href="#top" class="pull-right"><span class="glyphicon glyphicon-chevron-up"></span>回到顶部</a>
		</footer>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>