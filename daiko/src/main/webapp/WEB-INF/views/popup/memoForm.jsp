<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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


<div class="card text-center border-info">
  <div class="card-header bg-transparent border-info text-info">
 メモ
  </div>
  <div class="card-body">
  <form action="memoInsert.do" method="post">
  <textarea rows="5" cols="50" name="content"></textarea>
  <br>
 <br>
  <input type="date" name="start_time"> ~ <input type="date" name="end_time">
  <br>
  <input type="hidden" name="date" value="${map.date }">
  <br>
					<button type="submit" class="btn btn-success">登録</button>
					</form>
  </div>
  
</div>
</div>
</div>
</body>
</html>