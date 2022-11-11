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
						<form action="noticeInsert.do" method="post" name="fmt" id="fmt" enctype="multipart/form-data"  onsubmit="return check()">
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
		
		<script type="text/javascript">
		function check(e) {
			var confirm = window.confirm("この内容をお知らせに追加しますか？");
			/*	
				var title = document.getElementById("title").value;
				var content = document.getElementById("content").value;
				var T_dateTime = document.getElementById("T_dateTime").value;
				var T_endTime = document.getElementById("T_endTime").value;
				var state = document.getElementById("state").value;
			 */
			var title = fmt.title.value;
			var content = fmt.content.value;
			
	

			if (confirm) {
				if (title == null || title == "") {
					alert("タイトルを記入してください。");
					fmt.title.focus();
					return false;
				} else if (content == null || content == "") {
					alert("内容を記入してください。");
					fmt.content.focus();
					e.preventdefault();
					return false;
				} 

				return true;

			} else {
				return false;
			}
		}
		
		</script>
</body>
</html>