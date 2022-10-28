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
						<form action="noticeInsert.do" method="post" enctype="multipart/form-data" >
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">タイトル</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="title">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">内容</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="12" name="content"></textarea>
							</div>
							<div>
								<label for="formFileLg" class="form-label">ファイル</label> <input
									class="form-control form-control-lg" id="formFileLg"
									type="file" name="file">
							</div>
							<hr>
							      <div style="text-align: center">
					<button style="width:60%;height: 60px;font-size: 35px" class="btn btn-primary  btn-icon-split" type="submit">追加</button>
					</div>
						</form>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->
		
		</div>
		<!-- End of Main Content -->
</body>
</html>