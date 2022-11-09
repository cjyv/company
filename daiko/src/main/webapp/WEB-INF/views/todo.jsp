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

	
function todoList(searchType,searchTxt) {
	

fetch("todoList?searchType="+searchType+"&searchTxt="+searchTxt)
.then(function(res) {
	return res.json();
})
.then(function(res) {
	let str="";
	document.getElementById("tbody").innerHTML="";
	for (var i = 0; i < res.length; i++) {
		
  	 str+="<tr><td><input type='checkbox' class='check' name = 'check' value="+res[i].seq+"></td><td id='seq' onclick=todoForm("+res[i].seq+")>"+res[i].seq+"</td><td id='title'  onclick=todoForm("+res[i].seq+")>"+res[i].title+"</td><td id='startTime' onclick=todoForm("+res[i].seq+")>"+res[i].T_dateTime+"</td><td id='endTime'onclick=todoForm("+res[i].seq+")>"+res[i].T_endTime+"</td><td id='state'onclick=todoForm("+res[i].seq+")>"+res[i].state+"</td></tr>"
	}
	document.getElementById("tbody").innerHTML=str;
	

  	
  });
}
</script>
</head>
<body onload="todoList(null,null)">
	<div id="content">
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">ToDo</h1>
			<div class="card shadow mb-4">
				<div class="card-body">

						<form name="searchForm" id="searchForm">
					<div class="form-inline" style="width: 70%; float: left">
						<select name="searchType" id="searchType"
							class="custom-select custom-select-lg mb-2"
							style="width: 150px; height: 45px">
							<option value="null">選択</option>
							<option value="title">タイトル</option>
							<option value="content">内容</option>
							<option value="state">状況</option>
							<option value="day">日付</option>
						</select> <input type="text" name="searchTxt" id="searchTxt"
							class="form-control mb-2" style="width: 300px; height: 45px">
						<input type="button" onclick="search()" name="btn" class="btn btn-secondary mb-2"
							id="btn" value="検索">
					</div>
</form>
					<div class="btnDiv" style="text-align: right; margin-bottom: 15px">
						<button class="btn btn-primary" type="button" onclick="todoForm(0)">追加</button>
						<button class="btn btn-danger" type="button" onclick="checkDelete()">削除</button>
					</div>
					<div class="table-responsive">
					<form name="tfm">
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
						</form>
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
	var cofirm = window.confirm("削除しますか？");
	if (cofirm) {
		
	
	
	var list = document.querySelectorAll(".check");
	var checkList=[];
	for (var i = 0; i < list.length; i++) {
		if(list[i].checked){
			checkList.push(list[i]);
			console.log(checkList);
		}
	}
	if(checkList.length!=0){
		var tfm = document.tfm;
		tfm.method = "post";
		tfm.action = "todoDelete";
		tfm.submit();
	}else{
		alert("削除する項目をチェックしてください。");
	}
	}
	
}

function search() {
var searchType= searchForm.searchType.value;
var searchTxt = searchForm.searchTxt.value;

todoList(searchType,searchTxt);


	/*
	var searchForm = document.searchForm;
	searchForm.method="get";
	searchForm.action = "todoSearch";
	searchForm.submit();
	*/
}

</script>
</body>
</html>