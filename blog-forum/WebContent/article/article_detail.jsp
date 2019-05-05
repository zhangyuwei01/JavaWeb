<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Article,com.zyw.vo.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章详情</title>
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
	String id = request.getParameter("id");
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>登录后，可以点评文章！</a>");
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
			<a class="navbar-brand">美文天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">文章详情</a>
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
	<%
		Article article = DAOFactory.getArticeDAOInstance().searchByID(Integer.parseInt(id));
		//计算评论数
		List commentList = new  ArrayList();
		commentList = DAOFactory.getArticeDAOInstance().searchAllComment(Integer.parseInt(id));
	%>
		<div class='panel panel-info'>
			<div class='panel-heading'>
				<h3 class='panel-title'><%out.print(article.getTitle());%></h3>
			</div>
			<div class='panel-body'>
				<small>
					作者：<%out.print(article.getMessageUsername());%><br>
					分类：<%out.print(article.getCatalogs());%><br>
					发表时间：<%out.print(article.getPublishTime());%>
				</small>
				<hr>&nbsp;&nbsp;&nbsp;&nbsp;<%out.print(article.getContent());%>
			</div>
		</div>
	 	
	 	<!-- 评论区 -->
		<div class='panel panel-default'>
			<div class='panel-heading'><%out.print(commentList.size());%>个评论</div>
			<ul class='list-group'>
	<%
		if(commentList.size()==0){
	%>
			<li class='list-group-item text-center'>暂无评论，快抢沙发！</li>
	<%
		}
		else{
			int j = 1;//评论的楼层数
			for(int i=0;i<commentList.size();i++){
				Comment comment = null;
				comment = (Comment) commentList.get(i);
	
	%>
			<li class='list-group-item'>
				<%out.print(comment.getMessageUsername());%>
				<small><%out.print(comment.getCommentTime());%>
				<p class='pull-right'><%out.print(j++);%>楼</p>
				</small>
				<br><%out.print(comment.getReply());%>
		    </li>
	<% 
			}
		}
	%>
			</ul>
		</div>
		
		<!-- 发表评论 -->
	 	<form name="commentForm" action="../ArticleAdmin?action=sendComment&articleId=<%=id %>" method="post" onsubmit="return CheckForm();">
			<div class="form-group">
				<label for="reply" class="control-label">我要点评</label>
				<textarea rows="5" name="reply" id="reply" class="form-control" placeholder="说点什么吧！"></textarea>
			</div>
			<button type="submit" class="btn btn-success form-control">
				发表评论<span class="glyphicon glyphicon-send"></span>
			</button>
		</form>
	</div>
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm(){
		if(document.commentForm.reply.value==""){
			alert("点评内容不能为空！");
			document.commentForm.reply.focus();
			return false;
		}
	}
</script>
</body>
</html>