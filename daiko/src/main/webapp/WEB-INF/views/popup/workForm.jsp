<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${map==null}">
<form action="workInsert" name="fmt" method="post">
<h3>${title}</h3>
<input type="hidden" name="title" value="${title}">
<table id="worktable">
<tr>
<th>申請者</th>
<td>${name}
<input type="hidden" name="a_name" value="${name }">
</td>
</tr>
<tr>
<th>申請日</th>
<td> ${now}
<input type="hidden" name="start_time" value="${now }">
</td>
</tr>
<tr>
<th>承認期限日</th>
<td><input type="date" name="end_time"></td>
</tr>
<tr>
<th>確認者</th>
<td>
<select name="intermediate_e_number">
<c:forEach items="${employeeList}" var="employee">
<option value="${employee.e_number}">${employee.name}</option>
</c:forEach>
</select>

</td>
</tr>
<tr>
<th>承認者</th>
<td>
<select name="b_e_number">
<c:forEach items="${employeeList}" var="employee">
<option value="${employee.e_number}">${employee.name}</option>
</c:forEach>
</select>

</td>
</tr>
</table>

<button>申請</button>


</form>
</c:when>
<c:when test="${map!=null }">
<form   name="fmt">
<h3>${map.title}</h3>
<input type="hidden" name="title" value="${map.title}">
<input type="hidden" name="seq" value="${map.seq }">
<table id="worktable">
<tr>
<th>申請者</th>
<td>${map.a_name}
<input type="hidden" name="a_name" value="${map.a_name }">
</td>
</tr>
<tr>
<th>申請日</th>
<td>
<input type="text" name="start_time" value="${map.start_time} " disabled="disabled" >
</td>
</tr>
<tr>
<th>承認期限日</th>
<td><input type="text" name="end_time" value=" ${map.end_time}" disabled="disabled"></td>
</tr>
<tr>
<th>確認者</th>
<td>

${map.intermediate_name }

</td>
</tr>
<tr>
<th>承認者</th>
<td>
${map.b_name }

</td>
</tr>
<tr>
<th>状況</th>
<td><input type="text" disabled="disabled"  value=" ${map.state }">
<input type="hidden" name="state" value="${map.state }">
</td>
</tr>
</table>

<input type="hidden" name="judgment">
<button onclick="confirms(1)">承認</button>
<button onclick="confirms(2)">拒否</button>

</form>
</c:when>
</c:choose>
<script type="text/javascript">
function confirms(judgment,e) {
var form = document.fmt


if (judgment==1) {
var confirm = window.confirm("この申請を承認しますか？");
	if (confirm) {
	
	form.judgment.value="承認";
	

	form.action="workUpdate";
	form.method="post";
		document.fmt.submit();
	}
	else{
		alert("承認失敗しました。");

		window.close();
	}
	
}else{
	var confirm = window.confirm("この申請を拒否しますか？");
	if (confirm) {

		form.judgment.value="拒否";
		form.action="workUpdate";
		form.method="post";
			document.fmt.submit();
	}
	else{
		alert("拒否失敗しました。");
		window.close();
	}
}	
	
}

</script>

</body>
</html>