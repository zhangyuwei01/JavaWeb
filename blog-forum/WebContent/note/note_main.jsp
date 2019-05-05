<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Note"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到留言板</title>
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
		welcome.append("<a>登录，可以留言！</a>");
	}
	else{
		welcome.append("<a>"+username+"，欢迎您！</a>");
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
			<a class="navbar-brand">留言板</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#" data-toggle="modal" data-target="#alert">温馨提示</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
            	<li><%=welcome %></li>
        	</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->


<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<form name="noteForm" action="../NoteAdmin?action=sendNote" method="post" onsubmit="return CheckForm();">
			<div class="form-group">
				<label for="word" class="control-label">留言</label>
				<textarea rows="5" name="word" id="word" class="form-control" placeholder="留下你想说的话！"></textarea>
			</div>
			<button type="submit" class="btn btn-success form-control">
				发表留言<span class="glyphicon glyphicon-send"></span>
			</button>
		</form>
		<br>
		<%
			List noteList = new  ArrayList();
			noteList = DAOFactory.getNoteDAOInstance().searchAllNote();
			for(int i=0;i<noteList.size();i++){
				Note note = null;
				note = (Note) noteList.get(i);
		%>
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h2 class="panel-title"><%out.print(note.getMessageUsername());%></h2>
						<small><%out.print(note.getNoteTime());%></small>
					</div>
					<div class="panel-body">
						<%out.print(note.getWord());%>
					</div>
					<div class="panel-footer text-right">
						<%out.print(note.getId());%>楼
					</div>
				</div>
		<% 
			}
		%>
	</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="alert">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">留言须知</h4>
			</div>
			<div class="modal-body">
				1、留言板模块，为所有会员开放。<br>
				2、留言内容可以是给网站开发者的建议，力求今后的网站版本能更加完美。<br>
				3、留言内容也可以是对生活的记录，在这里留下生活的痕迹，记录生活的点点滴滴。<br>
				4、留言内容务必文明用语，使用积极健康的言论。
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">	
	function CheckForm(){
		if(document.noteForm.word.value==""){
			alert("留言内容不能为空！");
			document.noteForm.word.focus();
			return false;
		}
	}
</script>
</body>
</html>