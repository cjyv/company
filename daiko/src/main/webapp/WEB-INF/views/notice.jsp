<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
   <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">お知らせ</h1>
               

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th width="10%">番号</th>
                                            <th width="60%">タイトル</th>
                                            <th width="15%">作成者</th>
                                            <th width="15%">日付</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${noticeList}" var="notice">
                                    
                                        <tr onclick="location.href='noticeDetail?noticeNumber=${notice.seq}'">
                                            <td>${notice.seq}</td>
                                            <td>${notice.title }</td>
                                            <td>${notice.name}</td>
                                            <td>${notice.n_date}</td>
                                        </tr>
                        
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div style="text-align: right">
					<button style="width: 80px" class="btn btn-primary  btn-icon-split" onclick="location.href='noticeInsert'">追加</button>
					</div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
</body>
</html>