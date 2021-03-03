<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>it/과학 뉴스</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style type="text/css">
	a:link {text-decoration: none; color: #333333;}
	a:visited {text-decoration: none; color: #333333;}
	a:active {text-decoration: none; color: #333333;}
	a:hover {text-decoration: underline; color: red;}
</style>
</head>
<body>
<div class="container">
	<%@ include file="../../common/navbar.jsp" %>
	
		<span style="font-size: 12px"><a href="main.do"> &lt; 뉴스 메인으로 돌아가기</a></span> 
		<h3>  IT/과학 </h3> 
		<p><span style="font-size: 10px">해당 언론사가 주요 기사로 직접 선정한 기사입니다.</span></p>
	    <div class="card">
	    	<div class="card-body" id="contents-3">
	    	
	    	</div>
	    </div>
	
	
</div>

<script type="text/javascript">
	//경제
	axios.get("http://localhost/board/api/news/" +"it"+"과학").then(function(response) {
		var it = response.data;
		/* var url = "http://localhost/news/detail.do"; */
		for (var index = 0; index <=30; index++) {
			var title = "<p> <a href='" + it.items[index].link + "'>" + it.items[index].title + "</a></p>" 
			$("#contents-3").append(title);
		}	
	})	
</script>
</body>
</html>