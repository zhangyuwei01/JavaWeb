<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Article,com.zyw.vo.Comment,com.zyw.vo.MultimediaFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到博客天堂</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<style type="text/css">
	body {
		padding-top: 50px;
		padding-bottom: 50px;
	}
	caption{
	    font-size:40px;
		font-style:italic;
		font-weight:bold;
		color:orange;
		text-align:center;
	}
	.carousel {
		height: 500px;
		background-color: #000;
		margin-bottom: 50px;
	}
	.carousel .item {
		height: 500px;
		background-color: #000;
	}
	.carousel img {
		width: 100%;
	}
	.carousel-caption p {
		margin-bottom: 20px;
		font-size: 20px;
		line-height: 1.8;
	}
	#myContainer .col-sm-4 {
		text-align: center;
	}
	#myContainer img {
		width: 100%;
	}
	hr {
		margin: 60px;
	}
</style>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a href='#' data-toggle='modal' data-target='#users_login'>登录，体验更多精彩！</a>");
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
			<a href="index.jsp" class="navbar-brand">博客天堂</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="article/article_main.jsp">美文天堂</a></li>
				<li><a href="image/image_main.jsp">美图天堂</a></li>
				<li><a href="audio/audio_main.jsp">音乐天堂</a></li>
				<li><a href="video/video_main.jsp">视频天堂</a></li>
				<li><a href="game/game_main.jsp">休闲时光</a></li>
				<li><a href="note/note_main.jsp">留言板</a></li>
				<li><a href="message/message_main.jsp">个人中心</a></li>
				<li><a href="about.jsp">关于</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
           		<li><%=welcome%></li>
        	</ul>
		</div>
	</div>
</nav>
	
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="images/t1.jpg" alt="First slide">
			<div class="carousel-caption">
				<h1>文章</h1>
				<p>可以增长见识，净化心灵，拓展思路</p>
				<p><a class="btn btn-lg btn-info" href="article/article_main.jsp">去阅读</a></p>
			</div>
		</div>
		<div class="item">
			<img src="images/t2.jpg" alt="Second slide">
			<div class="carousel-caption">
				<h1>图片</h1>
				<p>可以记录生活，保存经典，供人欣赏</p>
				<p><a class="btn btn-lg btn-warning" href="image/image_main.jsp">去欣赏</a></p>
			</div>
		</div>
		<div class="item">
			<img src="images/t3.jpg" alt="Third slide">
			<div class="carousel-caption">
				<h1>音乐</h1>
				<p>可以舒缓身心，陶冶情操，增强记忆</p>
				<p><a class="btn btn-lg btn-success" href="audio/audio_main.jsp">去听听</a></p>
			</div>
		</div>
		<div class="item">
			<img src="images/t4.jpg" alt="Forth slide">
			<div class="carousel-caption">
				<h1>视频</h1>
				<p>可以开拓视野，提高品位，丰富情感</p>
				<p><a class="btn btn-lg btn-primary" href="video/video_main.jsp">去看看</a></p>
			</div>
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" role="button" data-slide="prev"> 
		<span class="glyphicon glyphicon-chevron-left"></span>
		<span class="sr-only">Previous</span>
	</a> 
	<a class="carousel-control right" href="#myCarousel" role="button" data-slide="next"> 
		<span class="glyphicon glyphicon-chevron-right"></span> 
		<span class="sr-only">Next</span>
	</a>
</div>
<hr>

<!-- 最新文章+最新图片 -->
<div class="container">
	<div class="col-sm-6">
		<table class="table table-hover">
			<caption>最新文章Top10</caption>
			<tbody>
			<%
				List articleList = new  ArrayList();
					articleList = DAOFactory.getArticeDAOInstance().searchAllArticle("top10");
					for(int i=0;i<articleList.size();i++){
						Article article = null;
						article = (Article) articleList.get(i);
						//计算评论数
						List commentList = new  ArrayList();
						commentList = DAOFactory.getArticeDAOInstance().searchAllComment(article.getId());
			%>
				<tr>
					<td><a href="article/article_detail.jsp?id=<%=article.getId()%>" target="_blank"><%
						out.print(article.getTitle());
					%></a></td>
					<td><span class="glyphicon glyphicon-comment"></span>&nbsp;<%
						out.print(commentList.size());
					%></td>
					<td><%
						out.print(article.getPublishTime());
					%></td>
					<td><span class="label label-danger">新</span></td>
				</tr>
			<%
				}
			%>
			</tbody>	
		</table>
	</div>
	<div class="col-sm-6">
		<table class="table table-hover">
			<caption>最新图片Top10</caption>
			<tbody>
			<%
				List uploadImageList = new  ArrayList();
					uploadImageList = DAOFactory.getFileDAOInstance().searchFileByType("image","top10");
					for(int i=0;i<uploadImageList.size();i++){
					MultimediaFile file = null;
					file = (MultimediaFile) uploadImageList.get(i);
			%>
				<tr>
					<td><a href="image/image_detail.jsp?id=<%=file.getId()%>" target="_blank"><%
						out.print(file.getFileName());
					%></a></td>
					<td><%
						out.print(file.getFileSize());
					%></td>
					<td><%
						out.print(file.getUploadTime());
					%></td>
					<td><span class="label label-danger">新</span></td>
				</tr>
			<%
				}
			%>
			</tbody>	
		</table>
	</div>
</div>
<hr>

<!-- 最新音频+最新视频 -->
<div class="container">
	<div class="col-sm-6">
		<table class="table table-hover">
			<caption>最新音乐Top10</caption>
			<tbody>
			<%
				List uploadAudioList = new  ArrayList();
				uploadAudioList = DAOFactory.getFileDAOInstance().searchFileByType("audio","top10");
				for(int i=0;i<uploadAudioList.size();i++){
					MultimediaFile file = null;
					file = (MultimediaFile) uploadAudioList.get(i);
			%>
				<tr>
					<td><a href="audio/audio_detail.jsp?id=<%=file.getId()%>" target="_blank"><%
						out.print(file.getFileName());
					%></a></td>
					<td><%
						out.print(file.getFileSize());
					%></td>
					<td><%
						out.print(file.getUploadTime());
					%></td>
					<td><span class="label label-danger">新</span></td>
				</tr>
			<%
				}
			%>
			</tbody>	
		</table>
	</div>
	<div class="col-sm-6">
		<table class="table table-hover">
			<caption>最新视频Top10</caption>
			<tbody>
			<%
				List uploadVideoList = new  ArrayList();
				uploadVideoList = DAOFactory.getFileDAOInstance().searchFileByType("video","top10");
				for(int i=0;i<uploadVideoList.size();i++){
					MultimediaFile file = null;
					file = (MultimediaFile) uploadVideoList.get(i);
			%>
				<tr>
					<td><a href="video/video_detail.jsp?id=<%=file.getId() %>" target="_blank"><%out.print(file.getFileName());%></a></td>
					<td><%out.print(file.getFileSize());%></td>
					<td><%out.print(file.getUploadTime());%></td>
					<td><span class="label label-danger">新</span></td>
				</tr>
			<%
				}
			%>
			</tbody>	
		</table>
	</div>
</div>
<hr>

<div class="container" id="myContainer">
	<div class="row">
		<div class="col-sm-4">
			<img class="img-circle" src="images/t5.jpg" />
			<h1>感觉无聊没意思？</h1>
			<p>点击此处去抽奖娱乐放松一下吧！</p>
			<p><a class="btn btn-lg btn-default" href="game/game_main.jsp">去抽奖</a></p>
		</div>
		<div class="col-sm-4">
			<img class="img-circle" src="images/t6.jpg" />
			<h1>有话对我们说？</h1>
			<p>点击此处留下你的建议！</p>
			<p><a class="btn btn-lg btn-warning" href="note/note_main.jsp">去留言</a></p>
		</div>
		<div class="col-sm-4">
			<img class="img-circle" src="images/t7.jpg" />
			<h1>个人信息怎么看？</h1>
			<p>点击此处去查看并修改你的信息！</p>
			<p><a class="btn btn-lg btn-danger" href="messsage/message_main.jsp">去查看</a></p>
		</div>
	</div>
<hr>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-6">
			<footer>
				<a href="#top" class="pull-right"><span class="glyphicon glyphicon-chevron-up"></span>回到顶部</a>
				<p>@2017 太原理工大学 计算机科学与技术学院 | Designed by 张玉伟</p>	
			</footer>
		</div>
	</div>
</div>

<!-- 模态框（Modal）登录 -->
<div class="modal fade" id="users_login">
	<div class="modal-dialog">
		<div class="col-sm-offset-1 col-sm-10">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title text-center" id="myModalLabel">用户身份验证</h4>
				</div>
				<div class="modal-body">
					<form name="loginForm" action="MessageAdmin?action=login" method="post" onsubmit="return CheckForm();">
						<div class="row col-sm-12">
							<div class="form-group">
								<label for="username" class="control-label">用户名</label>
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
									<input type="text" name="username" id="username" placeholder="请输入用户名" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row col-sm-12">
							<div class="form-group">
								<label for="password" class="control-label">密码</label>
								<div class="input-group">
									<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
									<input type="password" name="password" id="password" placeholder="请输入密码" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<button type="button" class="btn btn-warning form-control" data-dismiss="modal">
									<span class="glyphicon glyphicon-hand-left"></span>返回
								</button>
							</div>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success form-control">
									登录<span class="glyphicon glyphicon-log-in"></span>
								</button>
							</div>	
						</div>
					</form>
				</div> <!-- body -->
				<div class="modal-footer">
					<div class="col-sm-6">
						没有账号？<a href="message/message_register.jsp">注册</a>！
					</div>
					<div class="col-sm-6">
						忘记密码？<a href="message/message_findWithUsername.jsp">找回</a>！
					</div>
				</div>
			</div> <!-- content -->
		</div>
	</div> <!-- dialog -->
</div>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function CheckForm(){
		if(document.loginForm.username.value==""){
			alert("用户名不能为空！");
			document.loginForm.username.focus();
			return false;
		}
		if(document.loginForm.password.value==""){
			alert("密码不能为空！");
			document.loginForm.password.focus();
			return false;
		}
		return true;
	}
</script>
</body>
</html>