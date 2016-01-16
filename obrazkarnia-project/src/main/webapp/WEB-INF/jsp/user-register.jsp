<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>





<form:form commandName="user" cssClass="form-signin registrationForm">

	<c:if test='${param.success eq true}'>
		<div class="alert alert-success">
			Rejestracja się powiodła! <br /> Kliknij <a
				href='<spring:url value="/login.html" />'>tutaj</a>, aby się
			zalogować.
		</div>
	</c:if>
	<c:if test='${param.success eq false}'>
		<div class="alert alert-danger">Rejestracja nie powiodła się!</div>
	</c:if>

	<h2 class="form-signin-heading">Rejestracja</h2>

	<form:input path="name" placeholder="Nazwa użytkownika"
		cssClass="form-control" />
	<form:errors path="name" />

	<form:input path="email" placeholder="Email" cssClass="form-control" />
	<form:errors path="email" />

	<form:password path="password" placeholder="Hasło"
		cssClass="form-control" />
	<form:errors path="password" />

	<input type="password" name="confirmPassword" id="confirmPassword"
		placeholder="Powtórz hasło" class="form-control" />


	<button class="btn btn-lg btn-primary btn-block" name="submit"
		type="submit">Zarejestruj!</button>


</form:form>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".registrationForm")
								.validate(
										{
											rules : {
												name : {
													required : true,
													minlength : 3,
													remote : {
														url : "<spring:url value='/register/available.html' />",
														type : "get",
														data : {
															username : function() {
																return $(
																		"#name")
																		.val();
															}
														}
													}
												},
												email : {
													required : true,
													email : true
												},
												password : {
													required : true,
													minlength : 5
												},
												confirmPassword : {
													required : true,
													minlength : 5,
													equalTo : "#password"
												}
											},
											highlight : function(element) {
												$(element).closest(
														'.form-group')
														.removeClass(
																'has-success')
														.addClass('has-error');
											},
											unhighlight : function(element) {
												$(element)
														.closest('.form-group')
														.removeClass(
																'has-error')
														.addClass('has-success');
											},
											messages: {
												name: {
													remote: "Such username already exists!"
												}
											}
										});
					});
</script>