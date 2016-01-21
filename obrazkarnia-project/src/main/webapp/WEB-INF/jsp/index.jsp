<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<br />
<br />

<div class="container">
	<div class="searchbar text-center">
		<form role="form" action='<spring:url value="/search.html" />' method="POST">
			<div class="input-group">
				<input name="tag" class="form-control input-search"> <span
					class="input-group-btn">
					<button class="btn btn-search" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</span>
			</div>
			<!-- /input-group -->
			</form>

	</div>
</div>

<br />
<br />
<br />
<br />