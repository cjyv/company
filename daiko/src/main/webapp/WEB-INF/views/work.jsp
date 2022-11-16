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
function drawTable() {
if (${type}==1) {
	document.getElementById("thead").innerHTML="<tr><th>申請書</th><th>説明</th></tr>";
}
else if(${type}==2){
	document.getElementById("thead").innerHTML="<tr><th></th><th>件名</th><th>保存時期</th></tr>";
	fetch("list?type=2")
	.then(function(res) {
		return res.json();
	})
	.then(function(res) {
		console.log("test");
		document.getElementById("tbody").innerHTML= "test";
	})
}
else if(${type}==3){
	document.getElementById("thead").innerHTML="<tr><th>申請番号</th><th>件名</th><th>状態</th><th>承認経路</th><th>承認期限</th><th>申請日時</th></tr>";
}
else if(${type}==4){
	document.getElementById("thead").innerHTML="<tr><th></th><th>申請番号</th><th>件名</th><th>状態</th><th>承認経路</th><th>承認期限</th><th>申請日時</th></tr>";
}

else if(${type}==5){
	document.getElementById("thead").innerHTML="<tr><th>申請番号</th><th>件名</th><th>状態</th><th>承認経路</th><th>申請者</th><th>承認期限</th><th>申請日時</th></tr>";
}
else if(${type}==6){
	document.getElementById("thead").innerHTML="<tr><th></th><th>申請番号</th><th>件名</th><th>状態</th><th>承認経路</th><th>申請者</th><th>承認期限</th><th>申請日時</th></tr>";
}
}
</script>
</head>
<body onload="drawTable()">
	<div id="content">
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">ワークフロー</h1>
			<div class="card shadow mb-4">
				<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover" width="100%" cellspacing="0"
							style="text-align: center">
				<thead id="thead"></thead>
				<tbody id="tody">
				<c:if test="${type==1 }">
				<tr>
				<td><a href="#">休暇届</a></td>
				<td>事前に提出すること（やむを得ず事後となった場合も速やかに提出すること）</td>
				</tr>
					<tr>
				<td><a href="#">早出・深夜・休日勤務／コアタイム遅刻早退　申請書</a></td>
				<td>事前に提出すること（やむを得ず事後となった場合も速やかに提出すること）</td>
				</tr>
					<tr>
				<td><a href="#">一般（部内）稟議書『』</a></td>
				<td>３万円未満＋仮払出金申請書</td>
				</tr>
					<tr>
				<td><a href="#">特別稟議書『』</a></td>
				<td>５０万円以上＋仮払出金申請書</td>
				</tr>
					<tr>
				<td><a href="#">交際費稟議書『』</a></td>
				<td>一人あたりの金額が2,000円(税抜）を超える場合（会議費以外）＋仮払出金申請書</td>
				</tr>
					<tr>
				<td><a href="#">会議費申請書</a></td>
				<td>一人あたり@2,000円以内、仮払出金申請書　※申請時に未定の項目はその旨記載すること。（分かる範囲で）</td>
				</tr>
					<tr>
				<td><a href="#">出張申請書</a></td>
				<td>国内出張用</td>
				</tr>
					<tr>
				<td><a href="#">海外出張申請書</a></td>
				<td>海外出張用</td>
				</tr>
					<tr>
				<td><a href="#">交際費精算</a></td>
				<td>交際費精算書、報告書を添付してください。</td>
				</tr>
					<tr>
				<td><a href="#">会議費精算</a></td>
				<td>会議費精算書、報告書を添付してください。</td>
				</tr>
					<tr>
				<td><a href="#">出張旅費精算</a></td>
				<td>旅費精算書、報告書を添付してください。</td>
				</tr>
						<tr>
				<td><a href="#">近距離交通費・私有車業務使用　精算書</a></td>
				<td>近距離交通費精算書、私有車業務使用精算書を添付してください。</td>
				</tr>
						<tr>
				<td><a href="#">在宅勤務申請</a></td>
				<td>特別な事由により在宅勤務を希望する場合に申請</td>
				</tr>
						<tr>
				<td><a href="#">臨時的在宅勤務届</a></td>
				<td>臨時的措置（急きょ在宅勤務となる場合に使用してください）</td>
				</tr>
						<tr>
				<td><a href="#">イベント活動計画申請書</a></td>
				<td>イベント活動支援プログラムの申請書および必要資料を添付してください。※参加メンバーを必ず記載してください（リスト添付可）</td>
				</tr>
					<tr>
				<td><a href="#">イベント活動報告書兼活動補助費精算書</a></td>
				<td>イベント活動後、速やか（1ケ月以内）に提出してください。</td>
				</tr>
					<tr>
				<td><a href="#">PC設定チェックリスト</a></td>
				<td>新規購入したPCをキッティングした際に、設定に漏れがないかチェックリストを提出（添付）すること</td>
				</tr>
				</c:if>
				
				
				</tbody>
				</table>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>