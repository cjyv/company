<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
     <!-- Custom styles for this page -->
    <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
</head>
<body>
       <div id="content">
                <!-- Begin Page Content -->
                <div class="container-fluid">


			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">施設予約
								</h6>
<c:if test="${calendarFacilityList != null }">
<c:forEach items="${calendarFacilityList }" var="facility">
					
&nbsp&nbsp&nbsp ${facility.catalog}
&nbsp&nbsp&nbsp ${facility.runingTime} - ${facility.endingTime}
<br>

</c:forEach>
</c:if>

</div>
</div>


				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">Todo
								</h6>
<c:if test="${calendarTodoList != null }">
<c:forEach items="${calendarTodoList }" var="todo">
					
&nbsp&nbsp&nbsp ${todo.title}

<br>

</c:forEach>
</c:if>

</div>
</div>

	<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">メモ
								</h6>
<c:if test="${calendarMemoList != null }">
<c:forEach items="${calendarMemoList }" var="memo">
					
&nbsp&nbsp&nbsp ${memo.content}

<br>

</c:forEach>
</c:if>

</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>