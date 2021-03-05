<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<div class="container">
	<%@ include file="../../common/navbar.jsp" %>
	
	<div style="width:1000px; margin-top:40px; text-align:center">
		<input type="text" name="city" id="search-city" value="" style="width:180px; height:24px; vertical-align:top" placeholder="도시를  입력하세요">
		<button id="search-weather">날씨 검색</button> 
	</div>
	
	<div id="search-result" style="margin-left:50px; margin-top:15px; color:blue; font-weight:bold">
		검색결과
	</div>
	<div id="weather_result1"></div>
	<div id="weather_result2">현재 온도는 </div>
	<div id="weather_result3">최저 온도는</div>
	<div id="weather_result4">최고 온도는</div>
	<div id="weather_result5"></div>
	
	</div> 
	
	
	
	
	
</div>
<script type="text/javascript">

	$("#search-weather").click(function() {
		$.getJSON("http://api.openweathermap.org/data/2.5/weather?q=" + $("#search-city").val() + "&appid=e36da81b031737c5fa6f29d386decd41&units=metric", function(result) {
			console.log(result.name);
			$('#weather_result1').append(result.name);
			$('#weather_result2').append(result.main.temp);
			$('#weather_result3').append(result.main.temp_min);
			$('#weather_result4').append(result.main.temp_max);
			//result.weather[0].icon
			var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+'.png" alt="'+result.weather[0].description+'">'
			$('#icon').html(wiconUrl);
			
			var ct = result.dt;
			
			function convertTime(t) {
				var ot = new Date(t*1000);
				// Fri Mar 05 2021 15:03:50 GMT+0900 (대한민국 표준시)
				var hr = ot.getHours();
				var m = ot.getMinutes();
				
				return hr+':'+m;
				
			}
			
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);
		});
	 });
	
	
</script>
</body>
</html>