<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于博客天堂</title>
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
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>未登录！</a>");
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
			<a href="index.jsp" class="navbar-brand">博客天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">关于</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#" data-toggle="modal" data-target="#alert">温馨提示</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
            	<li><%=welcome %></li>
        	</ul>
		</div>
	</div>
</nav>
	
<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<div class="row">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">V 3.2.0.20180813（当前版本） 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、增加用户多地登录验证。<span class="label label-danger">重要更新</span><br>
				</div>
			</div>
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 3.2.0.20170516 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、将首页上的所有的外部“友情链接”全部改为本网站内部的网页链接，增强网站内部的连通性。<span class="label label-danger">重要更新</span><br>
					2、首页增加“最新图片Top10”、“最新音乐Top10”、“最新视频Top10”。<span class="label label-success">新增</span><br>
					3、新增“我的图片”、“我的音乐”、“我的视频”子模块，用户可以查看和删除自己的多媒体文件。<span class="label label-success">新增</span><br>
					4、新增“图片详情”、“音乐详情”、“视频详情”功能。<span class="label label-success">新增</span><br>
					5、新增“修改文章”功能。<span class="label label-success">新增</span><br>
					6、重做“休闲时光”，使用极简模式抽奖，提高用户体验度。<br>
					7、用户登录后、留言后、发表评论后弹出的“发表成功”的提示框被取消，提高用户体验度。
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 3.1.1.20170412 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、重做导航栏，增加面包屑导航。<span class="label label-danger">重要更新</span><br>
					2、将所有页面的用户登录状态信息放到导航栏的右侧。<br>
					3、将网站首页导航栏的所有字体图标删除，看起来更加简约美观。<br>
					4、将上传图片、音乐和视频的页面独立出来，提高用户上传文件的体验。<br>
					5、将用户登录页面删除，取而代之的是一个模态框。<br>
					6、优化所有页面的提示框，并使标题居中，显示效果更加人性化。
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 3.1.0.20170316 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、修改所有页面的名称，使实现不同功能模块的页面更有逻辑性。<span class="label label-danger">重要更新</span><br>
					2、新增上传图片功能，用户登录后可以上传图片。<span class="label label-success">新增</span><br>
					3、新增上传音乐功能，用户登录后可以上传音频文件。<span class="label label-success">新增</span><br>
					4、新增上传视频功能，用户登录后可以上传视频文件。<span class="label label-success">新增</span><br>
					5、优化“美图天堂”的图片显示样式，使用户体验度变高。
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 3.0.0.20161111 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、修改网站的整体架构，修改页面之间的逻辑关系，大大增强了网页的可读性与实用性。<span class="label label-danger">重要更新</span><br>
					2、利用filter过滤器增加了网页的访问权限。<span class="label label-success">新增</span><br>
					3、将“查看用户信息”归入“个人中心”，用户可以更好的管理自己的信息。<br>
					4、利用DAO模式修改项目架构。<br>
					5、将代码进行重构和类方法封装，大大减少了代码的冗余度。<br>
					6、修改并优化所有按钮的名称。
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 2.1.1.20161101 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、修复了手机游戏不能与网友PK的漏洞。<br>
					2、优化幸运值与刮刮乐模块的功能内容与主题风格。<br>
					3、为了配合微信开发，增加了“我的空间”和“留言板”的访问权限，必须用户登录后才可以使用。<br>
					4、利用MVC模式修改项目架构。<br>
					5、给所有的按钮增加小图标，看起来更加美观。<br>
					6、优化所有页面的提示框。
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 2.1.0.20161015 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、增加美文天堂“留言板”模块，增加用户留言功能。<span class="label label-success">新增</span><br>
					2、增加“手机游戏”和“幸运值”的权限，必须用户先登录再使用。<span class="label label-success">新增</span><br>
					3、增加手游“英雄榜”，实时显示成绩排行在前50名的用户。<span class="label label-success">新增</span><br>
					4、增加幸运值“幸运榜”，实时显示前50位用户的抽奖状态。<span class="label label-success">新增</span><br>
					5、移动“手机游戏”和“幸运值”模块到“美文天堂”。<br>
					6、修改用户发表发表时间，由12小时计时改为24小时计时。<br>
					7、优化所有网页的模态框。<br>
					8、转移“历史版本”中的所有信息到新的页面。
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">V 2.0.0.20161012 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、修改并美化空间主页和评论页面的主题风格，利用Bootstrap框架改变主页的全部样式。<span class="label label-danger">重要更新</span><br>
					2、新增文章主页查看“我的文章”功能。<span class="label label-success">新增</span><br>
					3、新增欢迎页“历史版本”模块。<span class="label label-success">新增</span><br>
					4、新增欢迎页“幸运值”模块。<span class="label label-success">新增</span><br>
					5、新增欢迎页“手机游戏”模块。<span class="label label-success">新增</span><br>
					6、优化文章的删除权限，用户只有通过文章主页进入“我的空间”后才可以删除文章。<br>
					7、改变“美文天堂”和“我的空间”两个页面的逻辑关系，优化两个页面的导航栏内容。<br>
					8、修复发表文章时允许发表空值的漏洞。
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="modal-title">V 1.1.0.20161010 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、增加“找回密码”功能。<span class="label label-success">新增</span><br>
					2、增加发表文章或评论后，弹出发表成功的提示框。<span class="label label-success">新增</span><br>
					3、优化登录页面，使移动端的页面看起来更美观。<br>
					4、修改完善所有网页的标题title。
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="modal-title">V 1.0.0.20161009 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、删除图片、音频、视频等多媒体元素，简化网站的内容，只保留了文章元素。<span class="label label-danger">重要更新</span><br>
					2、新增欢迎页“版本”功能。<span class="label label-success">新增</span><br>
					3、新增文章主页“最新文章”模块。<span class="label label-success">新增</span><br>
					4、新增文章主页“个人信息”模块。<span class="label label-success">新增</span><br>
					5、优化注册功能，保证注册的信息有效。<br>
					6、优化个人空间主页。
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="modal-title">V 0.0.0.20160701 更新日志：</h4>
				</div>
				<div class="panel-body">
					1、建立一个网上个人发布以及信息欣赏平台。<br>
					2、用户可以注册、登录、发表文章。<br>
					3、用户可以观看并浏览管理员定期更新的图片、音频和视频等多媒体资源。
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="alert">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title text-center" id="myModalLabel">关于</h4>
			</div>
			<div class="modal-body">
				1、网站版本号格式如下：V 主版本号 .子版本号.修正版本号.网站发布时间<br>
				2、项目的第一个版本号是：V 0.0.0<br>
				3、当项目在进行了局部修改或 bug修正时，主版本号和子版本号都不变，修正版本号加 1<br>
				4、当项目在原有的基础上增加了部分功能时，主版本号不变，子版本号加 1，修正版本号复位为 0，因而可以被忽略掉<br>
				5、当项目在进行了重大修改或局部修正累积较多，而导致项目整体发生全局变化时，主版本号加 1
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>