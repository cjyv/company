<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">

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
  
			<form action="profileUpdate.do" method="post" enctype="multipart/form-data" name="profileForm">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">ID</label>
      <input type="text" class="form-control" name="e_id" id="inputEmail4"value="${profile.e_id}" disabled="disabled">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">名前</label>
      <input type="text" class="form-control" name="name" id="inputName4" value="${profile.name}">
    </div>
  </div>
    <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">パスワード変更 <span style="color: red;font-size: 5px">*変更のみ記入してください。</span></label>
      <input type="password" class="form-control" id="passwordChange1" name="passwordChange1">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">パスワード確認 <span style="color: red;font-size: 5px">*変更のみ記入してください。</span></label>
      <input type="password" class="form-control" id="passwordChange2" name="passwordChange2">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">住所</label>
    <input type="text" class="form-control" id="inputAddress" value="${profile.e_address }" name="e_address">
  </div>

    <div class="form-group">
      <label for="inputCity">電話番号</label>
        <div class="form-row">
       <div class="col-auto">
      <input  type="text" class="form-control" id="tellphone1" name="tellphone1" style="width: 100px" value="${tellphone1 }">
      </div>
            -<div class="col-auto">
      <input  type="text" class="form-control" id="tellphone2" name="tellphone2" style="width: 100px" value="${tellphone2 }">
      </div>
            - <div class="col-auto">
      <input  type="text" class="form-control" id="tellphone3" name="tellphone3" style="width: 100px" value="${tellphone3 }">
      </div>
      </div>
    
  </div>
     <div class="form-group">
     <c:choose>
     <c:when test="${profile.profile==null }" >
        <img style="width: 150px;margin-bottom: 30px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
      </c:when>
      <c:when test="${profile.profile!=null }">
       <img style="width: 150px;margin-bottom: 30px;" id="preview-image" src="resources/img/${profile.profile}">
      </c:when>
      </c:choose>
      <div class="custom-file">
    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name="file">
    <label class="custom-file-label" for="inputGroupFile01">プロフィール写真</label>
    <input type="hidden" name="oldProfile" value="${profile.profile }"> 
  </div>
      </div>
    <button type="submit" class="btn btn-primary">修正</button>
    
</form>
            
            </div>
            </div>
            </div>
            </div>
<script type="text/javascript">
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("inputGroupFile01")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
</script>
</body>
</html>