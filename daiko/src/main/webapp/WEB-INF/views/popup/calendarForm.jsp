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


<div class="card text-center border-success" style="margin-bottom: 20px;margin-top: 20px">
  <div class="card-header bg-transparent border-success text-success">
   施設予約
  </div>
  <div class="card-body">
    	<c:if test="${calendarFacilityList != null }">
									<c:forEach items="${calendarFacilityList }" var="facility">
    <p class="card-text">${facility.catalog} &nbsp&nbsp&nbsp ${facility.runingTime} - ${facility.endingTime} </p>
    <hr class="border-success">
    </c:forEach>
								</c:if>
					
  </div>

</div>
<div class="card text-center border-primary" style="margin-bottom: 20px">
  <div class="card-header bg-transparent border-primary text-primary">
   Todo
  </div>
  <div class="card-body">
    		<c:if test="${calendarTodoList != null }">
										<c:forEach items="${calendarTodoList }" var="todo">
    <p class="card-text"> ${todo.title}</p>
        <hr class="border-primary">
    </c:forEach>
								</c:if>
					
  </div>
 
</div>


<div class="card text-center border-info">
  <div class="card-header bg-transparent border-info text-info">
 メモ <a href="memoinsert?date=${date }"><img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style="width: 15px; margin-left: 5px"></a>
  </div>
  <div class="card-body">
    <c:if test="${calendarMemoList != null }">
											<c:forEach items="${calendarMemoList }" var="memo">
    <p class="card-text">${memo.content} </p>
        <hr class="border-info">
    </c:forEach>
								</c:if>
					
  </div>
  
</div>

		
					
	
	
				
									</div>
								</div>
	
</body>
</html>