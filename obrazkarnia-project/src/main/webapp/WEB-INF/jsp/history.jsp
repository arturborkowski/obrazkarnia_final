<%!int images;%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>

<script type="text/javascript">
	$(document).ready(function() {

		$('.fancybox').fancybox();
	});
</script>

<div class="container">

	<div class="row">

		<div class="col-lg-12">
			<div class="history">
				<h1 class="page-header">Historia wyszukiwania</h1>
			</div>
		</div>
		<%
			for (images = 1; images <= 6; images++) {
		%>
		<div class="col-lg-3 col-md-4 col-xs-6 thumb">
			<a class="fancybox" href="style/images/gallery/<%=images%>.jpg"
				data-fancybox-group="gallery"><img class="thumbnail"
				src="style/images/gallery/<%=images%>.jpg" alt=""
				style="width: 28rem; height: 22rem" /></a>
		</div>
		<%
			}
		%>
	</div>
</div>