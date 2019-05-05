<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList,java.util.List,com.zyw.factory.DAOFactory,com.zyw.vo.Luck"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到休闲时光</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="text/css" rel="stylesheet" href="../bootstrap/css/bootstrap.min.css" />

<style type="text/css">
	body{
		padding-top:70px;
		padding-buttom:50px;
	}
	caption{
		font-style:italic;
		font-size:30px;
		font-weight:bold;
		text-align:center;
		color:red;
	}
	footer{
		margin-top:50px;
	}
</style>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	StringBuffer welcome = new StringBuffer();
	if(username==null){
		welcome.append("<a>登录后，可以进行游戏并与网友PK！</a>");
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
			<a class="navbar-brand">休闲时光</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
	            <li><a href="game_dzp.jsp">大转盘</a></li>
	            <li><a href="#" data-toggle="modal" data-target="#gameRule_choujiang">玩法</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"> 
            	<li><%=welcome %></li>
        	</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<div id="showLuck">
			<table class="table table-striped table-bordered">
				<caption>幸运榜（Top50）</caption>
				<thead>
					<tr>
					   <th>用户名</th>
					   <th>抽奖方式</th>
					   <th>奖品</th>
					   <th>抽奖时间</th>
					</tr>
				</thead>
				<tbody>
				  	<%
					  	List luckList = new ArrayList();
						luckList = DAOFactory.getGameDAOInstance().selectChouJiang();
						if(luckList.size()<51){
							for(int i=0;i<luckList.size();i++){
								Luck luck = null;
								luck = (Luck) luckList.get(i);
					%>
								<tr>
									<td><%out.print(luck.getMessageUsername());%></td>
									<td><%out.print(luck.getMode());%></td>
									<td><%out.print(luck.getContent());%></td>
									<td><%out.print(luck.getLuckTime());%></td>
								</tr>
					<% 
							}
						}
						else{
							for(int i=0;i<50;i++){
								Luck luck = null;
								luck = (Luck) luckList.get(i);
					%>
								<tr>
									<td><%out.print(luck.getMessageUsername());%></td>
									<td><%out.print(luck.getMode());%></td>
									<td><%out.print(luck.getContent());%></td>
									<td><%out.print(luck.getLuckTime());%></td>
								</tr>
					<% 
							}
						}
					%>
				</tbody>
			</table>
			<footer>
				<a href="#top" class="pull-right"><span class="glyphicon glyphicon-chevron-up"></span>回到顶部</a>
			</footer>
		</div>
	</div><!-- 偏移结束 -->
</div><!-- 容器结束 -->

<!-- 模态框（Modal）抽奖 -->
<div class="modal fade" id="gameRule_choujiang">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">幸运抽奖玩法说明</h4>
			</div>
			<div class="modal-body">
				1、抽奖方式分为两种：刮刮乐和大转盘。<br>
				2、用户50条最新的抽奖记录，会按照抽奖时间的倒序显示在幸运榜上。<br>
				3、最后祝您好运连连，天天抽大奖！
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<script type="text/javascript" src="../js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>