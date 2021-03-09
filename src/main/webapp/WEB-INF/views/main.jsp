<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>Latte_main</title>
</head>
<style type="text/css">
   a:link {text-decoration: none; color: #333333;}
   a:visited {text-decoration: none; color: #333333;}
   a:active {text-decoration: none; color: #333333;}
   a:hover {text-decoration: underline; color: red;}
   a#moreContent {font-size: 12px; color: blue; float: right;}
	#weather-img{
		width: 100%;
   }
   #cur-temp-label{
		display: inline-block;
		font-size: 15px;
   }
   #current-temp{
		display: inline-block;
		font-size: 30px;
	    color:blue; 
	    font-weight:bold
   }
	#temp-item{
		margin-left: 150px;
	}
</style>
<body>
	<div class="container">
		<div class="col-12">
		<%@ include file="/WEB-INF/common/navbar.jsp" %>
		</div>
		<div class="row mt-4" style="width: 1110px;">
			<div class="col-12">
				<div class="row">
					<div class="col-7">
						<div class="card">
							<div class="card-header">베스트 이슈</div>
						</div>
						<div class="card-body border">

							<h6 class="card-title">실시간 좋아요 Top 7</h6>
							<a id="moreContent" href="/board/index.do?catno=100">더보기 >></a>

							<table class="table" id="board-table">
								<thead>
									<colgroup>
										<col width="20%">
										<col width="*">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<tr>
										<th>이미지</th>
										<th>제목</th>
										<th>작성자</th>
										<th>조회수</th>
									</tr>
								<tbody>
								<c:forEach var="board" items="${boards}" begin="0" end="6">
									<tr>
										<c:if test="${empty board.imageFilename }">
										<td>
											<a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}">
											<img class="img-thumbnail" src="/resources/images/noimage.png"></a>
										</td>
										</c:if>
										<c:if test="${not empty board.imageFilename }">
										<td><a
											href="/board/detail.do?boardNo=${board.no }&catno=${board.categoryNo}"
											class="href"><img class="img-thumbnail"
											src="/resources/images/${board.imageFilename }" alt=""></a>
										</td>
										</c:if>
										<td>
											<a href="/board/detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href"> 
											<span style="font-size: 15px;">${board.title}</span></a>
											<span style="color: red;">[${board.commentCnt}]</span> <br>
										</td>
										<td>${board.nickname }</td>
										<td>${board.hitCnt} <br> 
											${board.likeCnt } &#128077;
											${board.dislikeCnt} &#128078;
										</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div>
					<div class="col-5">
						<div class="card">
							<div class="card-header">뉴스</div>
						</div>
						<div class="card-body border">

							<h6 class="card-title">오늘의 날씨</h6>
							<div style="text-align:center">
								<input type="text" name="city" id="search-city" value="seoul" style="width:180px; height:24px; vertical-align:top" placeholder="도시를  입력하세요">
								<button id="search-weather" onclick="searchWeather()">날씨 검색</button> 
							</div>
							
							<div class="row" id="search-result">
								<div class="col-5" style="display: inline-block;">
									<img class="weather-item" id="weather-img"alt="weather-img" src="">
								</div>
								<div class="col-6" style="display: inline-block;">
									<label class="weather-item mt-5" id="cur-temp-label">현재온도</label>
									<p class="weather-item mb-1" id="current-temp"></p>
									<p class="weather-item ml-5" id="description"></p>
								</div>
							</div>
							<div class="row">
									<p id="temp-item">최저 : <label id="temp-max"></label> / 최고 : <label id="temp-min"></label></p>
							</div>
						</div>
						<div class="card-body border">
							<h6 class="card-title">오늘의 뉴스</h6>

							<div class="card-text">
								<p>연예/스포츠<a id="moreContent" href="/news/EntSports.do">연예/스포츠 뉴스 더보기 ></a></p>
								<ul id="contents-1">
									
								</ul>
								<p>사회/경제<a id="moreContent" href="/news/Economy.do">사회/경제 뉴스 더보기 ></a></p>
								<ul id="contents-2">
									
								</ul>
								<p>IT과학<a id="moreContent" href="/news/itScience.do">it/과학 뉴스 더보기 ></a></p>
								<ul id="contents-3">
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var areaList =['seoul'];
		$.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + $("#search-city").val() + "&appid=e36da81b031737c5fa6f29d386decd41&units=metric&lang=kr", function(result) {
			var imgSrc = "http://openweathermap.org/img/w/" + result.weather[0].icon + ".png";
			$('#weather-img').attr('src',imgSrc);
			$('#current-temp').append(Math.floor(result.main.temp)+'º');
			$('#temp-min').append(Math.floor(result.main.temp_min)+'º');
			$('#temp-max').append(Math.floor(result.main.temp_max)+'º');
			$('#description').append(result.weather[0].description);
			//result.weather[0].icon
			

			var ct = result.dt;
			
			function convertTime(t) {
				var ot = new Date(t*1000);
				// Fri Mar 05 2021 15:03:50 GMT+0900 (대한민국 표준시)
				var hr = ot.getHours();
				var m = ot.getMinutes();
				
				return hr+':'+m;
				

			for (var index = 0; index <= 2; index++) {
				/* var title = "<p>" + sports.items[index].title + "</p>" */
	 			var content = "<li> <a href='" + sports.items[index].link + "'>" + sports.items[index].title + "</a></li>" 
				$("#contents-1").append(content);

			}
			
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);
		};
	 });
		
	// 날씨 검색하기		
	
	function searchWeather() {
		$('#current-temp').text('');
		$('#temp-min').text('');
		$('#temp-max').text('');
		$('#description').text('');
		
		 $.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + $("#search-city").val() 
				 + "&appid=e36da81b031737c5fa6f29d386decd41&units=metric&lang=kr", function(result) {
			var imgSrc = "http://openweathermap.org/img/w/" + result.weather[0].icon + ".png";
			$('#weather-img').attr('src',imgSrc);
			$('#current-temp').append(Math.floor(result.main.temp)+'º');
			$('#temp-min').append(Math.floor(result.main.temp_min)+'º');
			$('#temp-max').append(Math.floor(result.main.temp_max)+'º');
			$('#description').append(result.weather[0].description);
			
		 })
	}
		
		
		

	// 스포츠
	axios.get("http://localhost/board/api/news/" +"연예"+"스포츠").then(function(response) {
		var sports = response.data;
		

		for (var index = 0; index <= 1; index++) {
			/* var title = "<p>" + sports.items[index].title + "</p>" */
 			var content = "<li> <a href='" + sports.items[index].link + "'>" + sports.items[index].title + "</a></li>" 
			$("#contents-1").append(content);
		}
	})
	
	// 경제
	axios.get("http://localhost/board/api/news/" + "경제").then(function(response) {
		var economy = response.data;
		/* var url = "http://localhost/news/detail.do"; */
		for (var index = 0; index <= 1; index++) {
			var title = "<li> <a href='" + economy.items[index].link + "'>" + economy.items[index].title + "</a></li>" 
			$("#contents-2").append(title);
		}	
	})	

	// it 
	axios.get("http://localhost/board/api/news/" + "it"+"과학").then(function(response) {
		var it = response.data;
		for (var index = 0; index <= 1; index++) {
			var title = "<li> <a href='" + it.items[index].link + "'>" + it.items[index].title + "</a></li>" 
			$("#contents-3").append(title);
		}	
	})
</script>

</body>
</html>