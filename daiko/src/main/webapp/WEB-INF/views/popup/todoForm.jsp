<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Custom styles for this page -->
<link href="resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body>
	<div id="content">

		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- DataTales Example -->
			<div class="card shadow mb-5">
				<div class="card-body">
					<div class="table-responsive">
						<form id="fmt" name="fmt" 
							style="width: 500px; height: 500px">
							<div class="mb-3">
							<input type="hidden" name="seq" value="${detail.seq }">
							<c:if test="${detail.referenceFile != null}">
							<input type="hidden" name="oldFile" value="${detail.referenceFile }">
							</c:if>
								<label for="exampleFormControlInput1" class="form-label">タイトル</label>
								<input type="text" class="form-control" id="title" name="title"
									value="${detail.title }">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">開始日</label>
								<input type="date" class="form-control" id="T_dateTime"
									name="T_dateTime" value="${detail.T_dateTime }">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">終了予定日</label>
								<input type="date" class="form-control" id="T_endTime"
									name="T_endTime" value="${detail.T_endTime }">
							</div>
							<c:if test="${detail.referenceFile !=null}">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">添付ファイル</label>
									<br> <a
										href="fileDown?file=${detail.referenceFile}&realFileName=${detail.realFileName}"
										style="text-decoration: none; color: black">${detail.realFileName }</a>
									<hr>
								</div>
							</c:if>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">内容</label>
								<textarea class="form-control" id="content" rows="12"
									name="content">${detail.content} </textarea>
							</div>
							<div>
								<label for="formFileLg" class="form-label">ファイル</label> <input
									class="form-control form-control-lg" id="referenceFile"
									type="file" name="referenceFile">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">状況</label>
								<select name="state" id="state"
									class="custom-select custom-select-lg mb-2">
									<option value="">選択</option>
									<option value="保留"
										<c:if test="${detail.state == '保留' }">selected</c:if>>保留</option>
									<option value="対応中"
										<c:if test="${detail.state == '対応中' }">selected</c:if>>対応中</option>
									<option value="対応済"
										<c:if test="${detail.state == '対応済' }">selected</c:if>>対応済</option>
								</select>

							</div>
							<hr>
							<div style="text-align: center">
								<c:choose>
									<c:when test="${detail !=null }">
										<button style="width: 60%; height: 60px; font-size: 35px"
											class="btn btn-success  btn-icon-split" type="button" onclick="update()">編集</button>
									</c:when>
									<c:when test="${detail ==null }">
										<button style="width: 60%; height: 60px; font-size: 35px"
											class="btn btn-primary  btn-icon-split" type="button"
											onclick="add()">追加</button>

									</c:when>
								</c:choose>
							</div>
						</form>
					</div>
				</div>
</div>
			</div>
			<!-- /.container-fluid -->

		</div>
		<!-- End of Main Content -->

		<script type="text/javascript">
			function add(e) {
				var form = document.fmt
				form.action="todoInsert";
				form.target="_self";
				form.method="post";
					form.enctype="multipart/form-data";
				var confirm = window.confirm("この内容をToDoに追加しますか？");
				/*	
					var title = document.getElementById("title").value;
					var content = document.getElementById("content").value;
					var T_dateTime = document.getElementById("T_dateTime").value;
					var T_endTime = document.getElementById("T_endTime").value;
					var state = document.getElementById("state").value;
				 */
				var title = fmt.title.value;
				var content = fmt.content.value;
				var T_dateTime = fmt.T_dateTime.value;
				var T_endTime = fmt.T_endTime.value;
				var state = fmt.state.value;

				if (confirm) {
					if (title == null || title == "") {
						alert("タイトルを記入してください。");
						fmt.title.focus();
						e.preventdefault();
					} else if (content == null || content == "") {
						alert("内容を記入してください。");
						fmt.content.focus();
						e.preventdefault();
					} else if (T_dateTime == null || T_dateTime == "") {
						alert("開始日を記入してください。");
						fmt.T_dateTime.focus();
						e.preventdefault();
					} else if (T_endTime == null || T_endTime == "") {
						alert("終了予定日を記入してください。");
						fmt.T_endTime.focus();
						e.preventdefault();
					}else if (T_dateTime > T_endTime) {
						alert("終了予定日は開始日の前日は登録出来ません。");
						fmt.T_endTime.focus();
						e.preventdefault();
					} 

					else if (state == null || state == "") {
						alert("状況を記入してください。");
						fmt.state.focus();
						e.preventdefault();
					} else {
						document.fmt.submit();
					
						
					
					}

				} else {
					e.preventdefault();
				}
			}
		</script>
		<script type="text/javascript">
		function update(e) {
			var form = document.fmt
			form.action="todoUpdate";
			form.target="_self";
			form.method="post";
				form.enctype="multipart/form-data";
			var confirm = window.confirm("この内容で修正しますか？");
			/*	
				var title = document.getElementById("title").value;
				var content = document.getElementById("content").value;
				var T_dateTime = document.getElementById("T_dateTime").value;
				var T_endTime = document.getElementById("T_endTime").value;
				var state = document.getElementById("state").value;
			 */
			var title = fmt.title.value;
			var content = fmt.content.value;
			var T_dateTime = fmt.T_dateTime.value;
			var T_endTime = fmt.T_endTime.value;
			var state = fmt.state.value;

			if (confirm) {
				if (title == null || title == "") {
					alert("タイトルを記入してください。");
					fmt.title.focus();
					e.preventdefault();
				} else if (content == null || content == "") {
					alert("内容を記入してください。");
					fmt.content.focus();
					e.preventdefault();
				} else if (T_dateTime == null || T_dateTime == "") {
					alert("開始日を記入してください。");
					fmt.T_dateTime.focus();
					e.preventdefault();
				} else if (T_endTime == null || T_endTime == "") {
					alert("終了予定日を記入してください。");
					fmt.T_endTime.focus();
					e.preventdefault();
				}else if (T_dateTime > T_endTime) {
					alert("終了予定日は開始日の前日は登録出来ません。");
					fmt.T_endTime.focus();
					e.preventdefault();
				} 

				else if (state == null || state == "") {
					alert("状況を記入してください。");
					fmt.state.focus();
					e.preventdefault();
				} else {
					document.fmt.submit();
				
					
				
				}

			} else {
				e.preventdefault();
			}
		}
		
		
		</script>
</body>
</html>