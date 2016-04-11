<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getHeader("host")+path+"/";
request.setAttribute("url", request.getScheme()+"://"+request.getHeader("host")+request.getContextPath());
if(request.getAttribute("suburl")==null){
	request.setAttribute("suburl", request.getRequestURL().substring((basePath+"admin/").length()));
}
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  	<base href="<%=basePath%>">
  	<c:set var="webs" value="${init.webSite}" scope="session"></c:set>
	<head>
		<meta charset="utf-8" />
		<title>${webs.title} - 后台管理  ${stitle} </title>
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/jquery.gritter.css" />
		
		<link rel="shortcut icon" href="${url}/favicon.ico" />
		<script src="assets/js/jquery-2.0.3.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script src="assets/js/ace-extra.min.js"></script>
		<script src="assets/js/jquery.gritter.min.js"></script>
		<script src="${url}/admin/js/dashboard_set.js"></script>
	</head>
<body class="${webs.admin_dashboard_skin}">
		<div class="navbar navbar-default" id="navbar">

			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container ${webs.admin_dashboard_inside_container}" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="${url}" class="navbar-brand">
						<small>
							${webs.title}
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation" style="z-index: 1000">
					<ul class="nav ace-nav">
						<li class="green"  style="z-index: 1002">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-envelope"></i>
								<span class="badge badge-success">${session.comments.records}</span>
							</a>
		
							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-envelope-alt"></i>
									最近${fn:length(session.comments.rows)}条消息
								</li>
								<c:forEach items="${session.comments.rows}" var="comment">
								<li>
									<a target="_blank" href="${url}/post/${comment.logId}">
										<img class="msg-photo" src="${comment.header}">
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">${comment.userName}:</span>
												${comment.userComment}
											</span>
										</span>
									</a>
								</li>
								</c:forEach>
								<li>
									<a href="${url}/admin/comment">
										查看所有消息
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
						<li class="light-blue" style="z-index: 1002">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="${session.user.header}" alt="${session.user.userName}" />
								<span class="user-info">
									<small>管理员</small>${session.user.userName}
								</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close" >
								<li>
									<a href="${url}/admin/user">
										<i class="icon-user"></i>
										个人资料
									</a>
								</li>
								<li>
									<a href="${url}/admin/change_password">
										<i class="icon-key"></i>
										更改密码
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="${url}/admin/logout">
										<i class="icon-off"></i>
										退出
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>

		<div class="main-container ${webs.admin_dashboard_inside_container}" id="main-container">
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar ${webs.admin_dashboard_sidebar_collapser}" id="sidebar">
					<ul class="nav nav-list">
						<li <c:if test="${'index.jsp'==suburl}">class="active"</c:if>>
						
							<a href="${url}/admin/index">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>
						<li <c:if test="${'edit.jsp'==suburl}">class="active"</c:if>>
							<a href="${url}/admin/edit">
								<i class="icon-edit"></i>
								<span class="menu-text"> 文章撰写 </span>
							</a>
						</li>
						<li <c:if test="${'log.jsp'==suburl}">class="active"</c:if>>
							<a href="${url}/admin/log">
								<i class="icon-desktop"></i>
								<span class="menu-text"> 文章管理 </span>

							</a>
						</li>
						<li <c:if test="${'comment.jsp'==suburl}">class="active"</c:if>>
							<a href="${url}/admin/comment" class="dropdown-toggle">
								<i class="icon-comment"></i>
								<span class="menu-text"> 评论管理 </span>

								 
							</a>
						</li>
						<li <c:if test="${'website.jsp'==suburl or 'user.jsp'==suburl or 'template.jsp'==suburl or 'template_center.jsp'==suburl}">class="active open"</c:if>>
							<a href="#" class="dropdown-toggle">
								<i class="icon-cogs"></i>
								<span class="menu-text"> 设置  </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li <c:if test="${'user.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/user" <c:if test="${'user.jsp'==suburl}">class="active"</c:if>>
										<i class="icon-double-angle-right"></i>
										<span class="menu-text">个人信息</span>
									</a>
								</li>
								<li <c:if test="${'website.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/website" <c:if test="${'website.jsp'==suburl}">class="active"</c:if>>
										<i class="icon-double-angle-right"></i>
										<span class="menu-text">网站设置</span>
									</a>
								</li>
								<li <c:if test="${'template.jsp'==suburl or 'template_center.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/template" <c:if test="${'template.jsp'==suburl}">class="active"</c:if>>
										<i class="icon-double-angle-right"></i>
										<span class="menu-text">主题设置</span>
									</a>
								</li>
							</ul>
						</li>
						

						<li <c:if test="${'type.jsp'==suburl or 'tag.jsp'==suburl or  'plugin.jsp'==suburl or 'nav.jsp'==suburl or 'link.jsp'==suburl or 'plugin_center.jsp'==suburl}">class="active open"</c:if>>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text">
									其他
								</span>
								<b class="arrow icon-angle-down"></b>
							</a>
							<ul class="submenu">
								<li  <c:if test="${'type.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/type"  class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text">分类管理</span>
									</a>
								</li>
								<li  <c:if test="${'tag.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/tag"  class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text">查看标签</span>
									</a>
								</li>
								<li <c:if test="${'link.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/link" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text"> 链接管理 </span>
									</a>
								</li>
								<li <c:if test="${'plugin.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/plugin" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text"> 插件管理 </span>
									</a>
								</li>
								<li <c:if test="${'nav.jsp'==suburl}">class="active"</c:if>>
									<a href="${url}/admin/nav" class="dropdown-toggle">
										<i class="icon-double-angle-right"></i>
										<span class="menu-text"> 导航栏管理 </span>
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<c:choose>
						<c:when test="${webs.admin_dashboard_sidebar_collapser eq ''}">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
						</c:when>
						<c:otherwise>
						<i class="icon-double-angle-right" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="main-content">
					<div class="page-content">