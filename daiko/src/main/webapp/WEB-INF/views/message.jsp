<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content">

		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">メッセージ</h1>
    

			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-body">
				<div class="table-responsive">
                                <table class="table table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="20%">社員番号</th>
                                            <th width="50%">社員名</th>
                                            <th width="30%">部署</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${employeeList}" var="employeeList">
                                    
                                        <tr onclick="messageForm(${employeeList.e_number})">
                                            <td>${employeeList.e_number}</td>
                                            <td>${employeeList.name }</td>
                                            <td>${employeeList.department}</td>
                                        </tr>
                        
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
function messageForm(e_number) {
	 var url = "messageForm?b_e_number="+e_number;
     var name = "messageForm";
     var option = "width = 665, height = 600, top = 200, left = 200";
     window.open(url, name, option);
	
	window.open(url,name,option);
}
</script>
</body>
</html>