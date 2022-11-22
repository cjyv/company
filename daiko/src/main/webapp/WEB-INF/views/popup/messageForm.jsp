<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript">
function messageList(b_e_number) {
	fetch("messageList?b_e_number="+b_e_number)
	.then(function(res) {
		return res.json();
	})
	.then(function(res) {
		let str="";
		
		for (var i = 0; i < res.length; i++) {
			if (res[i].b_e_number==b_e_number) {
			
				str+="<br><div style='float:right'><img style='width=30px;height:15px' class='img-profile rounded-circle' src='resources/img/"+res[i].profile+"'><p>"+res[i].message+"</p></div><br>"
			}else{
			str+="<br><div style='float:left'><img style='width=30px;height:15px' class='img-profile rounded-circle' src='resources/img/"+res[i].profile+"'><p>"+res[i].message+"</p></div><br>"
			}
			
		}
		document.getElementById("messageBody").innerHTML=str;
	});
}
</script>
</head>
<body style="background-color: #9bbbd4" onload="messageList(${b_e_number})">
<div style="width: 100%;height: 100%;">
<div style="width: 100%;height:80%; margin-bottom: 100px;"id="messageBody">
<!--  
<c:forEach items="${messageList }" var="message">
${message.seq }
</c:forEach>
-->
</div>

<div style="width: 665px;height: 100px; position: fixed;bottom: 10px;left:5px;margin-top: 50px">
<input style="float: left;width: 78.5%;height: 100px">
<button style="float: right;width: 20%;height: 105px">転送</button>
</div>
</div>
</body>
</html>