<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Latte Shopping</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
	body, button {
		font-size: 16px;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    letter-spacing: -1px;
	}
	a {
		color: rgb(34, 34, 34);
	}
	table {
		text-align: center;
	}
	</style>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/shopping.jsp" %>
</div>
<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/navbar.jsp" %>
</div>
<div class="container">
  	<div class="row mb-3">
  		<div class="col-12">
			<div class="alert alert-info text-center" style="font-size: 27px;">
				<span><strong>${LOGINED_USER.name }</strong>님의 도토리 변경 내역입니다.</span><br />
			</div>
		</div>
  	</div>
 
 	<div class="row mb-3">
 		<div class="col-12">
			<div>
				<a class="btn btn-outline-dark btn-xs" href="/shopping/wish/list.do">소원리스트</a>
				<a class="btn btn-outline-dark btn-xs" href="/shopping/order/list.do">주문내역</a>
				<a class="btn btn-outline-dark btn-xs" href="/shopping/my/havingitem.do">보유상품</a>
				<a class="btn btn-primary btn-xs text-right" href="/shopping/acorn/chargeForm.do">충전하기</a>
			</div>
 			<div class="card">
 				<div class="card-body">
 				
 					<h4 class="card-title">도토리 내역</h4>
 					<table class="table">
						<colgroup>
							<col width="15%">
							<col width="*">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th>일자</th>
								<th>내용</th>
								<th class="text-center">주문번호/충전</th>
								<th class="text-right pr-5">잔여 도토리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty acornHistories }">
								<tr>
									<td class="text-center" colspan="4">도토리 변경이력이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="history" items="${acornHistories }">
									<tr>
										<td><fmt:formatDate value="${history.createdDate }" /></td>
										<td>${history.content }</td>
										<c:if test="${empty history.orderNo }">
											<td class="text-center">충전</td>
										</c:if>
										<c:if test="${not empty history.orderNo }">
											<td class="text-center"><a href="../order/detail.do?orderno=${history.orderNo }">${history.orderNo }</a> 번</td>
										</c:if>
										<td class="text-right pr-5"><strong class="${history.acornAmount gt 0 ? 'text-success' : 'text-danger' }"><fmt:formatNumber value="${history.acornAmount }" /></strong></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
 				</div>
 			</div>
 		</div>
 	</div>
</div>
</body>
</html>