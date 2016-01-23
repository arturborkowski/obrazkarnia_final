<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/taglib.jsp"%>



<h1><c:out value="${user.name}" /></h1>



<br />
<br />

<script type="text/javascript">
	$(document).ready(function() {

		// select first tab on load
		$('.nav-tabs a:first').tab('show');

		// prevents removing after clickin the button but triggers the modal window with confirmation
		$(".triggerRemove").click(function(e) {
			e.preventDefault();
			$("#modalRemove .removeBtn").attr("href", $(this).attr("href"));
			$("#modalRemove").modal();
		});

	});
</script>





<div>

	<!-- BLOG TAB PANES NAVIGATION -->

	<ul class="nav nav-tabs" role="tablist">
		<c:forEach items="${user.blogs}" var="blog">

			<li><a href="#blog_${blog.id}" aria-controls="home" role="tab"
				data-toggle="tab"><c:out value="${blog.name}" /></a></li>

		</c:forEach>
	</ul>

	<!-- END OF BLOG TAB PANES NAVIGATION -->


	<!-- TAB PANES CONTENT-->

	<div class="tab-content">
		<c:forEach items="${user.blogs}" var="blog">
			<div role="tabpanel" class="tab-pane" id="blog_${blog.id}">
				<h1><c:out value="${blog.name}" /></h1>
				<p>
					<a href='<spring:url value="/blog/remove/${blog.id}.html" />'
						class="btn btn-danger triggerRemove">remove blog</a> 
					<br /> 
					<a href="${blog.url}"><c:out value="${blog.url}" /></a>
				</p>

				<table class="table table-bordered table-hover ">
					<thead>
						<tr>
							<th>Title</th>
							<th>Link</th>
							<th>Date Published</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${blog.items}" var="item">
							<tr>
								<td><c:out value="${item.title}" /></td>
								<td><a href="${item.link}"><c:out value="${item.link}" /></a></td>
								<td><c:out value="${item.publishedDate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>

	<!-- END OF BLOG SELECTION TAB PANES -->


	<!-- REMOVAL CONFIRMATION MODAL WINDOW -->

	<div class="modal fade" id="modalRemove" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Remove blog</h4>
				</div>
				<div class="modal-body">Are you sure you want to remove this
					blog?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					<a href="" class="btn btn-danger removeBtn">Remove</a>
				</div>
			</div>
		</div>
	</div>

	<!-- END OF REMOVAL CONFIRMATION WINDOW -->

</div>

