<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Article,com.zyw.vo.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到文章搜索</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<style type="text/css">
	body {
		padding-top: 80px;
		padding-bottom: 50px;
	}	
</style>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>登录后，可以搜索文章！</a>");
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
			<a href="article_main.jsp" class="navbar-brand">美文天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">文章搜索</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right"> 
				<li><%=welcome %></li>
			</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<!-- 标签 -->
		<ul class="nav nav-tabs" role="tablist" id="tab-list">
			<li class="active"><a href="#showArticle" role="tab" data-toggle="tab">文章搜索结果</a></li>
			<li><a href="#title" role="tab" data-toggle="tab">按标题查询</a></li>
			<li><a href="#catalogs" role="tab" data-toggle="tab">按分类查询</a></li>
			<li><a href="#username" role="tab" data-toggle="tab">按作者查询</a></li>
			<li><a href="#content" role="tab" data-toggle="tab">按内容查询</a></li>
		</ul>
		<!-- 标签的内容 -->
		<div class="tab-content">
			<div class="tab-pane active" id="showArticle">
				<div class="row feature">
					<br><br>
		<%
			List articleList=(List)session.getAttribute("list");
			if(articleList==null){
		%>
				<div class='alert alert-info'>按照查询规则搜索出的文章会在这里显示！</div>
		<%  }
			else if(articleList.size()==0){
		%>
				<div class='alert alert-danger'>没有相关内容！</div>
		<% 
			}
			else{
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
						</div>
						<div class='panel-body'>
							<small>
							<%out.print(article.getMessageUsername());%>&nbsp;发表于&nbsp;
							<%out.print(article.getPublishTime());%><br>
							<span class="glyphicon glyphicon-comment"></span>&nbsp;<%out.print(commentList.size());%>
							<a href="article_detail.jsp?id=<%=article.getId() %>" class="pull-right" target="_blank">文章详情</a>
							</small>
						</div>
					</div>
		<%
				}
			}
		%>
				</div>
			</div>
			<div class="tab-pane" id="title">
				<div class="row feature">
					<br>
					<form name="titleForm" action="../ArticleAdmin?action=searchByTitle" method="post" onsubmit="return CheckForm1();">
						<div class="form-group">
							<input type="text" name="title" placeholder="请输入标题关键字" class="form-control" />
						</div>
						<button type="submit" class="btn btn-info form-control">
							搜标题<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
			</div>
			<div class="tab-pane" id="catalogs">
				<div class="row feature">
					<br>
					<form name="catalogsForm" action="../ArticleAdmin?action=searchByCatalogs" method="post">
						<div class="form-group">
							<select name="catalogs" class="form-control">
								<option value="科技">科技</option>
								<option value="生活">生活</option>
								<option value="运动">运动</option>
								<option value="校园">校园</option>
								<option value="社会">社会</option>
								<option value="家庭">家庭</option>
							</select>
						</div>
						<button type="submit" class="btn btn-info form-control">
							搜分类<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
			</div>
			<div class="tab-pane" id="username">
				<div class="row feature">
					<br>
					<form name="usernameForm" action="../ArticleAdmin?action=searchByUsername" method="post" onsubmit="return CheckForm2();">
						<div class="form-group">
							<input type="text" name="username" placeholder="请输入作者关键字" class="form-control" />
						</div>
						<button type="submit" class="btn btn-info form-control">
							搜作者<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
			</div>
			<div class="tab-pane" id="content">
				<div class="row feature">
					<br>
					<form name="contentForm" action="../ArticleAdmin?action=searchByContent" method="post" onsubmit="return CheckForm3();">
						<div class="form-group">
							<input type="text" name="content" placeholder="请输入内容关键字" class="form-control" />
						</div>
						<button type="submit" class="btn btn-info form-control">
							搜内容<span class="glyphicon glyphicon-search"></span>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div><!-- 偏移结束 -->
</div><!-- 容器结束 -->

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm1(){
		if(document.titleForm.title.value==""){
			alert("标题不能为空！");
			document.titleForm.title.focus();
			return false;
		}
	}
	function CheckForm2(){
		if(document.usernameForm.username.value==""){
			alert("作者不能为空！");
			document.usernameForm.username.focus();
			return false;
		}
		return true;
	}
	function CheckForm3(){
		if(document.contentForm.content.value==""){
			alert("内容不能为空！");
			document.contentForm.content.focus();
			return false;
		}
	  	return true;
	}
</script>
</body>
</html>