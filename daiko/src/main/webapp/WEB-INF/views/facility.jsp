<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>
	function facilitySchedule(startDay,facilityNo) {
		for (var t = 0; t <7; t++) {
			
		document.getElementsByClassName('test')[t].innerHTML="";
		}
		
		fetch("facilitySchedule?startDay=" + startDay+"&facilityNo="+facilityNo)
				.then(function(res) {
					return res.json();
				})
				.then(
						function(res) {
						console.log(res);
							
							let daystitle ="<span id='startDay'>" + res[0].startDay + "</span> ~ <span id='endDay'>"
									+ res[0].endDay +"</span>";
							document.getElementById('daystitle').innerHTML = daystitle;
		
						
							for (var i = 0; i < 7; i++) {
							document.getElementsByClassName('days')[i].style.backgroundColor="white";
								document.getElementById('days' + i).innerHTML="";
									
									
									
								document.getElementById('days' + i).innerHTML = res[0].days[i];
								if (res[0].days[i].includes("土")
										|| res[0].days[i].includes("日")) {
									document.getElementById('days' + i).parentNode.style.backgroundColor = "#F6C2C2";
								}
							}
						if(res.length>=2){
							for (var j = 0; j< res.length; j++) {
								const date = new Date(res[j+1].runingTime);
								var arrDayStr = ['日','月','火','水','木','金','土']
								let dateFormat = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate()+"("+arrDayStr[date.getDay()]+")";
								let dateTime = date.getHours();
								let endingTime = res[j+1].endingTime.split(':',1);
								
							for (var y = 0; y <= 6; y++) {
								const compare = "2022/"+document.getElementById('days' +y).innerHTML;
								
								if(dateFormat==compare){
								
									
								
								for (var h = 0; h <=24; h++) {
									
									for (var m = 0; m <= 24; m++) {
										if (dateTime==h && endingTime[0]==m) {
											
											
									document.getElementById("test"+y).innerHTML+="<div style='float:left;text-align:center;margin-left:5px;' onclick='detail("+res[j+1].seq+")'>"+dateTime+" ~ "+endingTime+"<br>"+res[j+1].catalog+"</div>";
										}
										
									}
								}
							}
							}
						}
						}

						})

	}
</script>

</head>
<body onload="facilitySchedule(null,${facilityNo})">
	<div id="content">
		<!-- Begin Page Content -->
		<div class="container-fluid">
		
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">施設予約</h1>
			<div class="card shadow mb-4">
				<div class="card-body">
					<div
						style="display: flex; justify-content: space-between; padding: 1rem 2rem; width: 500px">
						<button type="button" onclick="prev()" aria-hidden="true"
							style="border: none;">&laquo;</button>

						<h3 class='dateTitle' id="daystitle"></h3>
						<button type="button" onclick="next()" aria-hidden="true" style="border: none;">&raquo;</button>
					</div>
					<form>
						<table border="1" class="table table-bordered" id="dataTable"
							width="100%" cellspacing="0" >
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
									<td rowspan="1" nowrap="nowrap" class="days"><span id="days0"></span><a href='javascript:facilityForm(${facilityNo },0)'id="0"> <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style="width: 15px; margin-left: 5px"></a></td>
									<td  class="test" id="test0" colspan="112"></td>
								</tr>
								<tr >
									<td rowspan="1" nowrap="nowrap" class="days"><span  id="days1"></span><a href='javascript:facilityForm(${facilityNo },1)' id="1"> <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style="width: 15px; margin-left: 5px"></a></td>
									<td class="test" id="test1" colspan="112"></td>
								</tr>
								<tr>
									<td rowspan="1" nowrap="nowrap" class="days"><span  id="days2"></span><a href='javascript:facilityForm(${facilityNo },2)'id="2" > <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style='width: 15px; margin-left: 5px'></a></td>
									<td class="test" id="test2"  colspan="112"></td>
								</tr>
								<tr>
									<td rowspan="1" nowrap="nowrap" class="days"><span  id="days3"></span><a href='javascript:facilityForm(${facilityNo },3)'id="3" > <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style='width: 15px; margin-left: 5px'></a></td>
									<td class="test" id="test3" colspan="112"></td>
								</tr>
								<tr>
									<td rowspan="1" nowrap="nowrap" class="days"><span  id="days4"></span><a href='javascript:facilityForm(${facilityNo },4)'id="4" > <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style='width: 15px; margin-left: 5px'></a></td>
									<td class="test" id="test4" colspan="112"></td>
								</tr>
								<tr>
									<td rowspan="1" nowrap="nowrap" class="days"><span  id="days5"></span><a href='javascript:facilityForm(${facilityNo },5)'id="5" > <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style='width: 15px; margin-left: 5px'></a></td>
									<td class="test" id="test5" colspan="112"></td>
								</tr>
								<tr>
									<td rowspan="1" nowrap="nowrap" class="days"><span id="days6"></span><a href='javascript:facilityForm(${facilityNo },6)' id="6"> <img alt='登録'src='https://www.la-comic-illust.top/wp-content/uploads/2021/03/pencil.png'style='width: 15px; margin-left: 5px'></a></td>
									<td class="test" id="test6" colspan="112"></td>
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
	<script type="text/javascript">
		function prev() {
			let day = document.getElementById("startDay").innerHTML;
			let startDay = new Date(day);
		
			startDay.setDate(startDay.getDate()-1);
			let dateFormat = startDay.getFullYear()+"-"+(startDay.getMonth()+1)+"-"+startDay.getDate();
			facilitySchedule(dateFormat,${facilityNo});
			

		}
		function next() {
			let day = document.getElementById("startDay").innerHTML;
			let startDay = new Date(day);
		
			startDay.setDate(startDay.getDate()+1);
			let dateFormat = startDay.getFullYear()+"-"+(startDay.getMonth()+1)+"-"+startDay.getDate();
			facilitySchedule(dateFormat,${facilityNo});
		

		}
		function facilityForm(facilityNo,number) {
			
			var number = document.getElementById(number);
			var id =number.previousElementSibling.id;
			var day = "2022/"+document.getElementById(id).innerHTML;
		
			 var url = "facilityForm?facilityNo="+facilityNo+"&day="+day;
		     var name = "facilityForm";
		     var option = "width = 665, height = 600, top = 200, left = 200";
		     window.open(url, name, option);
			
			window.open(url,name,option);
		} 	
		

		
		
	</script>
	<script type="text/javascript">
	function detail(seq) {
		var url = "facilityDetail?seq="+seq;
	     var name = "facilityForm";
	     var option = "width = 665, height = 600, top = 200, left = 200";
	     window.open(url, name, option);
		
		window.open(url,name,option);
	}
	
	</script>
	

</body>
</html>