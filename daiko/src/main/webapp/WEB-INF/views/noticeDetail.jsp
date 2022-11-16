<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="content">

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">お知らせ</h1>


			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th width="10%">${detail.seq }</th>
									<th width="60%">${detail.title}</th>
									<th width="15%">${detail.name}</th>
									<th width="15%">${detail.n_date}</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${detail.file != null}">
									<tr>
										<td colspan="4"><a
											href="fileDown?file=${detail.file}&realFileName=${detail.realFileName}"
											style="text-decoration: none; color: black">${detail.realFileName }</a>
										</td>
									</tr>
								</c:if>
								<tr>
									<td colspan="4">${detail.content}</td>

								</tr>

							</tbody>
						</table>
						<c:if test="${detail.e_number == e_number }">
							<div style="text-align: right;">
								<form name="fmt">
								<input type="hidden" name="seq" value="${detail.seq }">
								<c:if test="${detail.file !=null}">								
								<input type="hidden" name="oldFile" value="${detail.file }">
								</c:if>
								<button class="btn btn-success" type="button" onclick="update()">編集</button>
								<button class="btn btn-danger" type="button" onclick="Delete()">削除</button>
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
	<script type="text/javascript">
	function Delete(e) {
		const confirm = window.confirm("本当に削除しますか？");
		if (confirm) {
			var fmt = document.fmt;
			fmt.action="noticeDelete";
			fmt.method="post"
			fmt.submit();
		}else{
			e.preventdefault();
		}
		
		
	}	
	</script>
	<script type="text/javascript">
	function update(e) {
			var fmt = document.fmt;
			fmt.action="noticeInsert";
			fmt.method="get"
			fmt.submit();
	
		
	}	
	</script>
</body>
</html>