<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h1>Home</h1>
	
	<p>고양이 구경하러 오세요. <img src="resources/images/cat.jpg" width="82px" height="51.2px"></p>
	
	<h3>방문자 리스트</h3>
	<ul>
		<c:forEach var="user" items="${users }">
			<li>${user.name }</li>
		</c:forEach>
	</ul>
	<div>
			<button class="btn btn-primary" onclick="openMiniHome()">미니홈피</button>
			<button class="btn btn-primary" onclick="login()">로그인</button>
			<button class="btn btn-primary" onclick="logout()">로그아웃</button>
			<p>${sessionScope.LOGINED_USER }</p>
	</div>
	<script type="text/javascript">
	function openMiniHome() {
		window.open('/minihome.do', '_blank', "width=1400, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}
	function login() {
		location.href = "login.do";
	}
	function logout() {
		location.href = "logout.do";
	}
	
</script>
</body>
</html>