<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<%@ include file="../../common/navbar.jsp" %>
    <div class="row">
    	<div class="col-12">
		    <h3>뉴스 검색하기</h3>
		 	<input id="search1" type="text"> 
		    <button id="search-keyword">검색</button>
    	</div>
    </div>
    <div class="card">
    	<div class="card-body" id="contents-result">
    	</div>
    </div>
    
    <!--스포츠 -->
    
    		<h3>  연예/스포츠</h3>
    <div class="card">
    	<div class="card-body" id="contents-1">
    	
    	</div>
    </div>
    
    <!--경제 -->
    
    <!--  <input id="search2" type="text"> -->
    <!--  <button id="search-economy">경제</button> -->
    		<h3>  경제</h3>
    <div class="card">
    	<div class="card-body" id="contents-2">
    	
    	</div>
    </div>
    
    <!--it-->
    
    <!-- <input id="search2" type="text"> -->
    <!--  <button id="search-it">IT</button> -->
    		<h3>  IT</h3>
    <div class="card">
    	<div class="card-body" id="contents-3">
    	
    	</div>
    </div>
    
</body>
<script type="text/javascript">
	// 검색창
	 $("#search-keyword").click(function() {
	axios.get("http://localhost/board/api/news/" + $("#search1").val()).then(function(response) {
		var result = response.data;
		
		for (var index = 0; index <=4; index++) {
			/* var title = "<p>" + sports.items[index].title + "</p>" */
 			var result = "<p> <a href='" + result.items[index].link + "'>" + result.items[index].title + "</a></p>" 
			console.log(result);
			$("#contents-result").append(result);
		}
	})
	
}) 
	// 스포츠
	axios.get("http://localhost/board/api/news/" + "스포츠").then(function(response) {
		var sports = response.data;
		
		for (var index = 0; index <=4; index++) {
			/* var title = "<p>" + sports.items[index].title + "</p>" */
 			var title = "<p> <a href='" + sports.items[index].link + "'>" + sports.items[index].title + "</a></p>" 
			console.log(sports);
			$("#contents-1").append(title);
		}
	})
	
	// 경제
	axios.get("http://localhost/board/api/news/" + "경제").then(function(response) {
		var economy = response.data;
		/* var url = "http://localhost/news/detail.do"; */
		for (var index = 0; index <=4; index++) {
			var title = "<p> <a href='" + economy.items[index].link + "'>" + economy.items[index].title + "</a></p>" 
			$("#contents-2").append(title);
		}	
	})	

	// it 
	axios.get("http://localhost/board/api/news/" + "it").then(function(response) {
		var it = response.data;
		for (var index = 0; index <=4; index++) {
			var title = "<p> <a href='" + it.items[index].link + "'>" + it.items[index].title + "</a></p>" 
			$("#contents-3").append(title);
		}	
	})	

</script>
</html>