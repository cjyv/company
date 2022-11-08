<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	

fetch("todoList")
.then(function(res) {
	return res.json();
})
.then(function(res) {
	let str="";
	for (var i = 0; i < res.length; i++) {
		
  	 str+="<tr><td><input type='checkbox' class='check' value="+res[i].seq+"></td><td id='seq'  onclick=todoForm("+res[i].seq+")>"+res[i].seq+"</td><td id='title'  onclick=todoForm("+res[i].seq+")>"+res[i].title+"</td><td id='startTime' onclick=todoForm("+res[i].seq+")>"+res[i].T_dateTime+"</td><td id='endTime'onclick=todoForm("+res[i].seq+")>"+res[i].T_endTime+"</td><td id='state'onclick=todoForm("+res[i].seq+")>"+res[i].state+"</td></tr>"
	}
	document.getElementById("tbody").innerHTML=str;
	

  	
  });

</script>
</head>
<body>
	<div id="content">
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">ToDo</h1>
			<div class="card shadow mb-4">
				<div class="card-body">


					<div class="form-inline" style="width: 70%; float: left">
						<select name="searchType" id="searchType"
							class="custom-select custom-select-lg mb-2"
							style="width: 150px; height: 45px">
							<option value="">選択</option>
							<option value="mem_name">タイトル</option>
							<option value="board_subject">内容</option>
							<option value="board_subject||board_content">状況</option>
						</select> <input type="text" name="searchTxt" id="searchTxt"
							class="form-control mb-2" style="width: 300px; height: 45px">
						<input type="button" name="btn" class="btn btn-secondary mb-2"
							id="btn" value="検索">
					</div>

					<div class="btnDiv" style="text-align: right; margin-bottom: 15px">
						<button class="btn btn-primary" onclick="todoForm(0)">追加</button>
						<button class="btn btn-danger" type="button" onclick="checkDelete()">削除</button>
					</div>
					<div class="table-responsive">
						<table class="table table-hover" width="100%" cellspacing="0"
							style="text-align: center">
							<thead>
								<tr>
									<td width="5%"></td>
									<td width="10%">No.</td>
									<td width="45%">タイトル</td>
									<td width="15%">開始日</td>
									<td width="15%">終了予定日</td>
									<td width="10%">状況</td>
								</tr>
							</thead>
							<tbody id="tbody">
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

function todoForm(seq) {

	 var url = "todoForm?seq="+seq;
     var name = "todoForm";
     var option = "width = 665, height = 600, top = 200, left = 200"
     window.open(url, name, option);
	
	window.open(url,name,option);
} 

function checkDelete() {
	var list =document.querySelectorAll(".check");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			
		}
	}
}

</script>
</body>
</html>