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
						<form action="noticeInsert.do" method="post"
							enctype="multipart/form-data" style="width: 500px;height: 500px">
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">タイトル</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="title"
									value="${detail.title }">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">開始日</label>
								<input type="date" class="form-control"
									id="exampleFormControlInput1" name="startDay"
									value="${detail.T_dateTime }">
								<input type="time" class="form-control"
									id="exampleFormControlInput1" name="startTime"
									value="${detail.startTime }">
							</div>
								<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">終了予定日</label>
								<input type="date" class="form-control"
									id="exampleFormControlInput1" name="endDay"
									value="${detail.T_endTime }">
									<input type="time" class="form-control"
									id="exampleFormControlInput1" name="endTime"
									value="${detail.endTime }">
							</div>
							<c:if test="${detail.referenceFile !=null}">
								<div class="mb-3">
									<label for="exampleFormControlInput1" class="form-label">添付ファイル</label>
									<br> <a
										href="fileDown?file=${detail.referenceFile}&realFileName=${detail.referenceFile}"
										style="text-decoration: none; color: black">${detail.referenceFile }</a>
									<hr>
								</div>
							</c:if>
							<div class="mb-3">
								<label for="exampleFormControlTextarea1" class="form-label">内容</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="12" name="content">${detail.content} </textarea>
							</div>
							<div>
								<label for="formFileLg" class="form-label">ファイル</label> <input
									class="form-control form-control-lg" id="formFileLg"
									type="file" name="file">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">状況</label>
								<select name="state" id="state"
							class="custom-select custom-select-lg mb-2">
							<option value="">選択</option>	
							<option value="保留"  <c:if test="${detail.state == '保留' }">selected</c:if>  >保留</option>
							<option value="対応中" <c:if test="${detail.state == '対応中' }">selected</c:if>>対応中</option>
							<option value="対応済" <c:if test="${detail.state == '対応済' }">selected</c:if>>対応済</option>
						</select> 
								
							</div>
							<hr>
							<div style="text-align: center">
								<c:choose>
									<c:when test="${detail !=null }">
										<button style="width: 60%; height: 60px; font-size: 35px"
											class="btn btn-success  btn-icon-split" type="submit">編集</button>
									</c:when>
									<c:when test="${detail ==null }">
										<button style="width: 60%; height: 60px; font-size: 35px"
											class="btn btn-primary  btn-icon-split" type="submit">追加</button>

									</c:when>
								</c:choose>
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