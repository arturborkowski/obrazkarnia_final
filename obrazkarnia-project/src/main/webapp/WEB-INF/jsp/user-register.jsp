<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<form:form commandName="user" cssClass="form-signin">

	<c:if test='${param.success eq true}'>
		<div class="alert alert-success">Rejestracja się powiodła!
			<br /> Kliknij <a href='<spring:url value="/login.html" />'>tutaj</a>, aby się zalogować.
		</div>
	</c:if>
	<c:if test='${param.success eq false}'>
		<div class="alert alert-danger">Rejestracja nie powiodła się!</div>
	</c:if>
	

	<h2 class="form-signin-heading">Rejestracja</h2>
	<form:input path="name" placeholder="Nazwa użytkownika"
		cssClass="form-control" required="required" />
	<form:input path="email" placeholder="Email" cssClass="form-control"
		required="required" />
	<form:password path="password" placeholder="Hasło"
		cssClass="form-control" required="required" />
	<form:password path="confirmPassword" placeholder="Powtórz hasło"
		cssClass="form-control" required="required" />
	<button class="btn btn-lg btn-primary btn-block" name="submit"
		type="submit">Zarejestruj!</button>


</form:form>