<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 달력 */
.rap {
 
  padding: 0 1.4rem;
  margin-top: .2rem;
}

.dateHead {
  margin-bottom: .4rem;
}

.dateHead div {
  background: #4e73df;
  color: #fff;
  text-align: center;
}

.grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  grid-gap: 5px;
}

.grid div {
  padding: .6rem;
  font-size: .9rem;
  cursor: pointer;
}

.dateBoard div {
  color: #222;
  font-weight: bold;
  min-height: 6rem;
  padding: .6rem .8rem;
  border-radius: .6rem;
  border: 1px solid #eee;
}

.noColor {
  background: #eee;
}

.header {
  display: flex;
  justify-content: space-between;
  padding: 1rem 2rem;
}



.prevDay {
 display: block;
 width: 20px;
 height: 20px;
 border: 3px solid #000;
 border-width: 3px 3px 0 0;
 cursor: pointer;
  transform: rotate(-135deg);
}

.nextDay {
 display: block;
 width: 20px;
 height: 20px;
 border: 3px solid #000;
 border-width: 3px 3px 0 0;
 cursor: pointer;
  transform: rotate(45deg);
}

/* ---- */

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

* {
  margin: 0;
  padding: 0;
  list-style: none;
  box-sizing: border-box;  
  font-family: Pretendard;
}


</style>
</head>
<body>
	<div id="content">
		<!-- Begin Page Content -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">カレンダー</h1>
			<div class="card shadow mb-4">
				<div class="card-body">
			<div class='rap'>
				<div class="header">
       <div class="btn prevDay"></div>
      <h2 class='dateTitle'></h2>
      <div class="btn nextDay"></div>
    </div>
    
    <div class="grid dateHead">
      <div>日</div>
      <div>月</div>
      <div>火</div>
      <div>水</div>
      <div>木</div>
      <div>金</div>
      <div>土</div>
    </div>

    <div class="grid dateBoard"></div>
				</div>
				
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	const makeCalendar = (date) => {
		  // 현재의 년도와 월 받아오기
		  const nowYear = new Date(date).getFullYear();
		  const nowMonth = new Date(date).getMonth() + 1;

		  // 한달전의 마지막 요일
		  const prevDay = new Date(nowYear, nowMonth - 1, 1).getDay();

		  // 현재 월의 마지막 날 구하기
		  const lastDay = new Date(nowYear, nowMonth, 0).getDate();

		  // 남은 박스만큼 다음달 날짜 표시
		  const limitDay = prevDay + lastDay;
		  const nextDay = Math.ceil(limitDay / 7) * 7;

		  let htmlDummy = '';

		  // 한달전 날짜 표시하기
		  for (let i = 0; i < prevDay; i++) {
		    htmlDummy += `<div class="noColor"></div>`;
		  }

		  // 이번달 날짜 표시하기
		  for (let i = 1; i <= lastDay; i++) {    
		    htmlDummy += "<div  onclick='test("+i+","+nowMonth+","+nowYear+")'>"+i+"</div>";
		  }

		  // 다음달 날짜 표시하기
		  for (let i = limitDay; i < nextDay; i++) {
		    htmlDummy += `<div class="noColor"></div>`;
		  }

		  document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
		  document.querySelector(`.dateTitle`).innerHTML = nowYear+"年 "+nowMonth+"月";
		}


		const date = new Date();

		makeCalendar(date);

		// 이전달 이동
		document.querySelector(`.prevDay`).onclick = () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
		}

		// 다음달 이동
		document.querySelector(`.nextDay`).onclick = () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
		}
		
		
		
		
	</script>
	<script type="text/javascript">
	function test(day,month,year) {
		console.log(year+"-"+month+"-"+day);
	}
	</script>
</body>
</html>