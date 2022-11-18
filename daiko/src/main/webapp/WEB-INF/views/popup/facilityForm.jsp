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
<h3>
<c:choose>
<c:when test="${map.facilityNo==1 }">【daiko】平塚ビル 1階_大会議室（30席）</c:when>
<c:when test="${map.facilityNo==2 }">【daiko】平塚ビル 1階_小会議室（６席））</c:when>
<c:when test="${map.facilityNo==3 }">【daiko】平塚ビル 来客用駐車場[No.18]</c:when>
<c:when test="${map.facilityNo==4 }">【daiko】平塚ビル 来客用駐車場[No.19]</c:when>
<c:when test="${map.facilityNo==5 }">【daiko】大興ビル 2階_会議室）</c:when>
<c:when test="${map.facilityNo==6 }">【daiko】大興ビル 来客用駐車場[No.1011]</c:when>
<c:when test="${map.facilityNo==7 }">【daiko】御茶ノ水 中会議室（6席）</c:when>
<c:when test="${map.facilityNo==8 }">【daiko】福岡事業所会議室</c:when>
<c:when test="${map.facilityNo==9 }">【iws】ZOOM（No.1）</c:when>
<c:when test="${map.facilityNo==10 }">【iws】ZOOM（No.2)</c:when>
<c:when test="${map.facilityNo==11 }">【iws】広島2F 受付スペース</c:when>
<c:when test="${map.facilityNo==12 }">【iws】広島2F 会議室</c:when>
</c:choose>
</h3>
<form action="facilityInsert" method="post" name="fmt" onsubmit="return add()">
<table>
<tr>
<th>年月日</th>
<td>${map.day}
<input type="hidden" name="runningDay" value="${map.day}">
<input type="hidden" name="facilityNo" value="${map.facilityNo }">
<input type="hidden" name="seq" value="${map.seq }">
</td>

</tr>
<tr>
<th>分類</th>
<td><select name="catalog">
<option value="null">選択</option>
<option value="会議" <c:if test="${map.catalog == '会議' }">selected</c:if>>会議</option>
<option value="研修" <c:if test="${map.catalog == '研修' }">selected</c:if>>研修</option>
<option value="接客" <c:if test="${map.catalog == '接客' }">selected</c:if>>接客</option>
<option value="営業活動" <c:if test="${map.catalog == '営業活動' }">selected</c:if>>営業活動</option>
<option value="面談" <c:if test="${map.catalog == '面談' }">selected</c:if>>面談</option>
<option value="採用面接" <c:if test="${map.catalog == '採用面接' }">selected</c:if>>採用面接</option>
<option value="新卒採用説明会" <c:if test="${map.catalog == '新卒採用説明会' }">selected</c:if>>新卒採用説明会</option>

</select>   </td>
</tr>
<tr>
<th>使用時間</th>

<td><input type="time" name="time" value="${map.time }">~<input type="time" name="endingTime" value="${map.endingTime}">  </td>

</tr>
<tr>
<th>備考</th>
<td>
<textarea rows="10" cols="50" name="reference">${map.reference}</textarea>
</td>
</tr>

</table>
<c:choose>
<c:when test="${map.time==null }">
<button class="btn btn-primary" type="submit">申請</button>
</c:when>
<c:when test="${map.e_number == e_number }">
<button class="btn btn-success" type="button" onclick="update()">編集</button><button class="btn btn-danger" type="button"onclick="Delete()">削除</button>
</c:when>
</c:choose>
</form>
<script type="text/javascript">
function add() {
	var reference = fmt.reference.value;
	var time = fmt.time.value;
	var endingTime = fmt.endingTime.value;
	var catalog = fmt.catalog.value;
	var confirm = window.confirm("この内容で予約しますか？");
	if (confirm) {
		 if (catalog == null || catalog == "null") {
			alert("分類を記入してください。");
			fmt.catalog.focus();
			return false;
		} 
		
		else if (time == null || time == "") {
			alert("開始時間を記入してください。");
			fmt.time.focus();
			return false;
		} 
		
		else if (endingTime == null || endingTime == "") {
			alert("終了時間を記入してください。");
			fmt.endingTime.focus();
			return false;
		} 
		 
		else if (reference == null || reference == "") {
				alert("内容を記入してください。");
				fmt.reference.focus();
				return false;
			} 
		return true;
}

}
</script>
<script type="text/javascript">
function Delete(e) {
	const confirm = window.confirm("本当に削除しますか？");
	if (confirm) {
		var fmt = document.fmt;
		fmt.action="facilityDelete";
		fmt.method="post"
		fmt.submit();
	}else{
		e.preventdefault();
	}
}

</script>
<script type="text/javascript">
function update(e) {
	const confirm = window.confirm("内容編集しますか？");
		var fmt = document.fmt;
		fmt.action="facilityUpdate";
		fmt.method="post"
	var reference = fmt.reference.value;
	var time = fmt.time.value;
	var endingTime = fmt.endingTime.value;
	var catalog = fmt.catalog.value;
	if (confirm) {
		 if (catalog == null || catalog == "null") {
			alert("分類を記入してください。");
			fmt.catalog.focus();
			e.preventdefault();
		} 
		
		else if (time == null || time == "") {
			alert("開始時間を記入してください。");
			fmt.time.focus();
			e.preventdefault();
		} 
	
		else if (endingTime == null || endingTime == "") {
			alert("終了時間を記入してください。");
			fmt.endingTime.focus();
			e.preventdefault();
		}
		else if (reference == null || reference == "" || reference=="null") {
			alert("内容を記入してください。");
			fmt.reference.focus();
			e.preventdefault();
		} 
		
		else{
		
			fmt.submit();
		}
	
	}else{
		e.preventdefault();
	}
}
</script>

</body>
</html>