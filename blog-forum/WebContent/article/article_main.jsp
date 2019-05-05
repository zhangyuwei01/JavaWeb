<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Article,com.zyw.vo.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到美文天堂</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<style type="text/css">
	body {
		padding-top: 100px;
		padding-bottom: 50px;
	}
</style>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>登录后，可以管理文章！</a>");
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
			<a class="navbar-brand">美文天堂</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="article_search.jsp"><span class="glyphicon glyphicon-search"></span>搜文章</a></li>
				<li><a href="article_send.jsp"><span class="glyphicon glyphicon-send"></span>发文章</a></li>
				<li><a href="article_mine.jsp"><span class="glyphicon glyphicon-user"></span>我的文章</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
            	<li><%=welcome %></li>
        	</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<%
		List articleList = new  ArrayList();
		articleList = DAOFactory.getArticeDAOInstance().searchAllArticle("all");
		for(int i=0;i<articleList.size();i++){
			Article article = null;
			article = (Article) articleList.get(i);
			//计算评论数
			List commentList = new  ArrayList();
			commentList = DAOFactory.getArticeDAOInstance().searchAllComment(article.getId());
		%>
			<div class='panel panel-info'>
				<div class='panel-heading'>
					<h3 class='panel-title'><%out.print(article.getTitle());%></h3>
					</a>
				</div>
				<div class='panel-body'>
					<small>
						<%out.print(article.getMessageUsername());%>&nbsp;&nbsp;发表于&nbsp;&nbsp;
						<%out.print(article.getPublishTime());%><br>
						<span class="glyphicon glyphicon-comment"></span>&nbsp;<%out.print(commentList.size());%>
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
	</div><!-- 偏移结束 -->
</div><!-- 容器结束 -->

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>