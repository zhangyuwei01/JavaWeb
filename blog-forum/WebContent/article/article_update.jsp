<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="com.zyw.factory.DAOFactory,com.zyw.vo.Article"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改文章</title>
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
			<a class="navbar-brand">修改文章</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a><%=session.getAttribute("username") %>，您好！</a></li>
			</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<%	
	int id = Integer.parseInt(request.getParameter("id"));
	Article article = DAOFactory.getArticeDAOInstance().searchByID(id);
%>

<form name="updateArticleForm" action="../ArticleAdmin?action=updateArticle&id=<%=article.getId() %>" method="post" onsubmit="return CheckForm();">     
	<div class="container">
		<div class="col-sm-offset-3 col-sm-6">
			<div class="row">
				<div class="form-group">
					<label for="title" class="control-label">文章标题</label>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-header"></span></span> 
						<input type="text" name="title" id="title" value="<%out.print(article.getTitle());%>" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="username" class="control-label">文章作者</label>
					<div class="input-group">
						<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span> 
						<input type="text" name="username" id="username" value="<%=session.getAttribute("username") %>" readonly="true" class="form-control" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="catalogs" class="control-label">文章分类</label>
					<select name="catalogs" id="catalogs" class="form-control">
						<option value="科技">科技</option>
						<option value="生活">生活</option>
						<option value="运动">运动</option>
						<option value="校园">校园</option>
						<option value="社会">社会</option>
						<option value="家庭">家庭</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="content" class="control-label">文章内容</label>
					<textarea rows="10" name="content" id="content" class="form-control"><%out.print(article.getContent());%></textarea>
				</div>
			</div>
			<div class="row">
				<button type="submit" class="btn btn-danger form-control">
					修改文章<span class="glyphicon glyphicon-send"></span>
				</button>
			</div>
		</div>
	</div>
</form> 

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm(){
		if(document.updateArticleForm.title.value==""){
			alert("文章标题不能为空！");
			document.updateArticleForm.title.focus();
			return false;
		}
		if(document.updateArticleForm.content.value==""){
			alert("文章内容不能为空！");
			document.updateArticleForm.content.focus();
			return false;
		}
	  	return true;  
	}
</script>
</body>
</html>