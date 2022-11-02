<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile</title>
</head>
<body>
  <div id="content">
	     <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">プロフィール</h1>
            <div class="card shadow mb-4">
            <div class="card-body">
  
					<div class="table-responsive">
						<form action="profileUpdate" method="post" enctype="multipart/form-data" >
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">名前</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="name" style="width: 100px">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">ID</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="name" style="width: 100px">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">パスワード変更</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="name" style="width: 100px">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">変更パスワード確認</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="name" style="width: 100px">
							</div>
							<div class="mb-3">
								<label for="exampleFormControlInput1" class="form-label">プロフィール写真</label>
								<input type="text" class="form-control"
									id="exampleFormControlInput1" name="name" style="width: 100px">
							</div>
							</form>
							</div>
            
            
            </div>
            </div>
            </div>
            </div>

</body>
</html>