<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>


</script>

</head>
	<body>
	   <div id="content">
	     <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">施設予約</h1>
            <div class="card shadow mb-4">
            <div class="card-body"> 
		<form>
			<table border="1" class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
				<tr class="timeFont">
				<td>&nbsp;</td>
				<td align="center" colspan="12">8</td>
				<td align="center" colspan="12">9</td>
				<td align="center" colspan="12">10</td>
				<td align="center" colspan="12">11</td>
				<td align="center" colspan="12">12</td>
				<td align="center" colspan="12">13</td>
				<td align="center" colspan="12">14</td>
				<td align="center" colspan="12">15</td>
				<td align="center" colspan="12">16</td>
				<td align="center" colspan="12">17</td>
				</tr>
				</thead>
				<tbody id="tbody">
				<tr>
				<td rowspan="1" nowrap="nowrap"><span>10/31</span><a data-toggle="modal"  data-target="#exampleModal">
				<img alt="登録" src="https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png"style="width: 15px;margin-left: 5px"></a></td>
				<td colspan="112"></td>
				</tr>
				<tr>
		       	<td rowspan="1" nowrap="nowrap">11/01</td>
				<td colspan="112"></td>
				</tr>
				<tr>
				<td rowspan="1" nowrap="nowrap">11/02</td>
				<td colspan="112"></td>
				</tr>
				<tr>
				<td rowspan="1" nowrap="nowrap">11/03</td>
				<td colspan="112"></td>
				</tr>
				<tr>
				<td rowspan="1" nowrap="nowrap">11/04</td>
				<td colspan="112"></td>
				</tr>
				<tr>
				<td rowspan="1" nowrap="nowrap">11/05</td>
				<td colspan="112"></td>
				</tr>
				<tr>
				<td rowspan="1" nowrap="nowrap">11/06</td>
				<td colspan="112"></td>	
				</tr>
				</tbody>
				<tfoot>
				<tr class="timeFont">
				<td>&nbsp;</td>
				<td align="center" colspan="12">8</td>
				<td align="center" colspan="12">9</td>
				<td align="center" colspan="12">10</td>
				<td align="center" colspan="12">11</td>
				<td align="center" colspan="12">12</td>
				<td align="center" colspan="12">13</td>
				<td align="center" colspan="12">14</td>
				<td align="center" colspan="12">15</td>
				<td align="center" colspan="12">16</td>
				<td align="center" colspan="12">17</td>
				</tr>
				</tfoot>	
			</table>
		</form>
		</div>
		</div>
		</div>
		</div>
		
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
      <c:choose>
      <c:when test="${facilityNo == 1 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】平塚ビル 1階_大会議室（30席）</h5>
        </c:when>
      <c:when test="${facilityNo == 2 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】平塚ビル 1階_小会議室（６席)</h5>
        </c:when>
      <c:when test="${facilityNo == 3 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】平塚ビル 来客用駐車場[No.18]</h5>
        </c:when>
      <c:when test="${facilityNo == 4}">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】平塚ビル 来客用駐車場[No.19]</h5>
        </c:when>
      <c:when test="${facilityNo == 5 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】大興ビル 2階_会議室</h5>
        </c:when>
      <c:when test="${facilityNo == 6 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】大興ビル 来客用駐車場[No.1011]</h5>
        </c:when>
      <c:when test="${facilityNo == 7 }">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】御茶ノ水 中会議室（6席）</h5>
        </c:when>
      <c:when test="${facilityNo == 8}">
        <h5 class="modal-title" id="exampleModalLabel">【daiko】福岡事業所会議室 </h5>
        </c:when>
      <c:when test="${facilityNo == 9 }">
        <h5 class="modal-title" id="exampleModalLabel">【iws】ZOOM（No.1）</h5>
        </c:when>
      <c:when test="${facilityNo == 10}">
        <h5 class="modal-title" id="exampleModalLabel">【iws】ZOOM（No.2)</h5>
        </c:when>
      <c:when test="${facilityNo == 11 }">
        <h5 class="modal-title" id="exampleModalLabel">【iws】広島2F 受付スペース</h5>
        </c:when>
      <c:when test="${facilityNo == 12}">
        <h5 class="modal-title" id="exampleModalLabel">【iws】広島2F 会議室</h5>
        </c:when>
        </c:choose>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table style="border: 1px solid black">
        <tr>
        <td>年月日</td><td></td>
        </tr>
        <tr>
        <td>時刻</td><td></td>
        </tr>
        <tr>
        <td>分類</td><td></td>
        </tr>
        <tr>
        <td>備考</td><td></td>
        </tr>
        
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	</body>
</html>