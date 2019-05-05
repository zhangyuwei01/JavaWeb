<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传音乐</title>
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
			<a href="audio_main.jsp" class="navbar-brand">音乐天堂</a>
			<a class="navbar-brand">/</a>
			<a class="navbar-brand">上传音乐</a>
		</div>
		<div class="collapse navbar-collapse" id="example-navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="#" data-toggle="modal" data-target="#alert">温馨提示</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a><%=session.getAttribute("username") %>，您好！</a></li>
			</ul>
		</div>
	</div><!-- 容器结束 -->
</nav><!-- 导航栏结束 -->

<div class="container">
	<div class="col-sm-offset-3 col-sm-6">
		<form name="uploadAudioForm" action="../UploadAudioAdmin" method="post" enctype="multipart/form-data" onsubmit="return CheckForm();">
			<div class="form-group">
				<label for="fileName" class="control-label">音乐名称</label>
				<div class="input-group">
					<span class="input-group-addon"><span class="glyphicon glyphicon-header"></span></span> 
					<input type="file" id="fileName" name="fileName" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="username" class="control-label">音乐上传者</label>
				<div class="input-group">
					<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span> 
					<input type="text" name="username" id="username" value="<%=session.getAttribute("username") %>" readonly="true" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success form-control">
					上传<span class="glyphicon glyphicon-arrow-up"></span>
				</button>
			</div>
		</form>
	</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="alert">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">上传音频须知</h4>
			</div>
			<div class="modal-body">
				1、请上传积极健康的音乐。<br>
				2、音乐上传格式要求是：mp3
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
		var file = $("#fileName").val();
		var fileType = getFileType(file);
		  
		function getFileType(o){
		    var pos=o.lastIndexOf(".");
		    return o.substring(pos+1);  
		}
		
		if(document.uploadAudioForm.fileName.value==""){
			alert("请选择上传的音乐！");
			return false;
		}else if(fileType!="mp3"){
			alert("格式错误！");
			return false;
		}
		else{
			return true;
		}
	}
</script>
</body>
</html>