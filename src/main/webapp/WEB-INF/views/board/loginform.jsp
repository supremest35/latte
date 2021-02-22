<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>loginform</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class='col-12'>
			<%@ include file="../common/navbar.jsp" %>
		</div>
	</div>
	<c:if test="${param.error eq 'empty' }"> <!-- 요청파라미터값 error가 'empty'와 같다면 -->
		<div class="row">
			<div class="col-6 offset-3">
				<div class="alert alert-danger">
					<strong>오류</strong> 아이디와 비밀번호는 필수 입력값입니다. <!-- 오류 표시 -->
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.error eq 'notfound' or param.error eq 'mismatch' }"> <!-- 요청파라미터값 error가 'notfound' 또는 'mismatch' 라면 -->
		<div class="row">
			<div class="col-6 offset-3">
				<div class="alert alert-danger">
					<strong>오류</strong> 아이디 혹은 비밀번호가 올바르지 않습니다. <!-- 오류 표시 -->
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${param.error eq 'deny' }"> <!-- 요청파라미터값 error가  'deny'와 같다면 -->
		<div class="row">
			<div class="col-6 offset-3">
				<div class="alert alert-danger">
					<strong>오류</strong> 로그인이 필요한 서비스에 접속을 시도하였습니다. <!-- 오류 표시 -->
				</div>
			</div>
		</div>
	</c:if>
	
	<div class="row">
		<div class="col-6 offset-3">
			<div class="card">
				<form id="login-form" method="post" action="login.do"> <!-- post방식(쿼리스트링), 제출시 login.do 요청됨, 이벤트핸들러있음-->
					<h4>로그인</h4>
					<div class="card-body">
						<div class="form-group">
							<label>아이디</label>
							<input type="text" class="form-control" name="id" id="user-id"/>
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" class="form-control" name="password" id="user-password"/>
						</div>
						<div class="text-right">
							<a href="main.do" class="btn btn-secondary">취소</a>
							<input type="submit" class="btn btn-primary" value="로그인" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</div>

</body>
</html>