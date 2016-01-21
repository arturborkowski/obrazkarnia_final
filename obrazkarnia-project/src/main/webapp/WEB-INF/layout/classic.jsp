<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>
<head>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<!--  Get current page for being active in menu -->
<tilesx:useAttribute name="current" />

<!-- Bootstrap basic css stylesheet -->
<link rel="stylesheet" href="../../style/css/bootstrap.min.css">

<!-- Bootstrap js file -->
<script src="../../style/js/bootstrap.min.js"></script>

<!-- AJAX for modal window  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Add jQuery library -->
<script src = "../../fancybox/jquery-1.10.1.min.js"></script>

<!-- Add fancyBox main JS and CSS files -->
<script src = "../../fancybox/source/jquery.fancybox.js"></script>
<link rel="stylesheet" href="../../fancybox/source/jquery.fancybox.css">

<!-- Add mousewheel plugin -->
<script src = "../../fancybox/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- jQuery Validation Plugin -->
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

 
 <!-- Custom CSS file definition -->
<spring:url value="/style/css/style.css" var="styleCss" />

<!-- Custom CSS -->
<link rel="stylesheet" href='${styleCss}'>

</head>
<body>

	<!-- Static navbar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href='<spring:url value="/" />'>Obrazkarnia</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="${current == 'index' ? 'active': ''}"><a
						href='<spring:url value="/" />'>Strona główna</a></li>
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li class="${current == 'users' ? 'active': ''}"><a
							href='<spring:url value="/users.html"/>'>Użytkownicy</a></li>
					</security:authorize>
					<security:authorize access="! isAuthenticated()">
						<li class="${current == 'register' ? 'active': ''}"><a
							href='<spring:url value="/register.html"/>'>Rejestracja</a></li>
						<li class="${current == 'login' ? 'active': ''}"><a
							href='<spring:url value="/login.html"/>'>Logowanie</a></li>
					</security:authorize>
					<security:authorize access="isAuthenticated()">
						<li class="${current == 'account' ? 'active': ''}"><a
							href='<spring:url value="/account.html"/>'>Profil</a></li>
						<li class="${current == 'history' ? 'active': ''}"><a
							href='<spring:url value="/history.html"/>'>Historia</a></li>
						<li class="${current == 'favourite' ? 'active': ''}"><a
							href='<spring:url value="/favourite.html"/>'>Ulubione</a></li>
						<li class="${current == 'logout' ? 'active': ''}"><a
							href='<spring:url value="/logout"/>'>Wyloguj się</a></li>
					</security:authorize>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid -->
	</nav>

	<!-- Start Logo Section -->
	<section id="logo-section" class="text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="logo text-center">
						<h1>Obrazkarnia</h1>
						<span>Wyszukiwarka obrazów</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Logo Section -->

	<!-- Start Main Body Section -->
	<div class="mainbody-section text-center">

		<tiles:insertAttribute name="body" />

	</div>

	<!-- End Main Body Section -->
	
	<br />
	<br />
	<center>
		<tiles:insertAttribute name="footer" />
	</center>
	</div>
</body>
</html>