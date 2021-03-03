<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>상품리스트</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style type="text/css">
	body, button {
		font-size: 18px;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    letter-spacing: -1px;
	}
	a {
		color: rgb(34, 34, 34);
	}
   .book-title {
      display: block;
      height: 52px;
      overflow: hidden;
   }
   .img-thumbnail {
      width: 210px;
      height: 210px;
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
	<c:choose>
		<c:when test="${order.userNo ne LOGINED_USER.no }">
			<div class="alert alert-warning">
				<strong>조회 실패</strong> 다른 사용자의 주문정보를 조회할 수 없습니다.
			</div>
		</c:when>
		<c:otherwise>
			<div class="row mb-3">
				<div class="col-12">
					<div class="card">
						<div class="card-header font-weight-bold">주문 상세 정보</div>
						<div class="card-body">
							<table class="table table-bordered">
								<colgroup>
									<col width="18%">
									<col width="32%">
									<col width="18%">
									<col width="32%">
								</colgroup>
								<tbody>
									<tr>	
										<th>주문번호</th>
										<td><strong>${order.no}</strong></td>
										<th>주문상태</th>
										<td><strong>${order.status }</strong><a href="/shopping/order/cancel.do?orderno=${order.no }" class="btn btn-danger btn-xs float-right ${order.status eq '주문취소' ? 'disabled' : '' }">주문취소</a></td>
									</tr>
									<tr>
										<th>주문일자</th><td><fmt:formatDate value="${order.createdDate }"/></td>
										<th>주문하신 분</th><td>${LOGINED_USER.name}</td>
									</tr>
									<tr>
										<th>받으시는 분 아이디</th><td>${order.recId }</td>
										<th>받으시는 분 성함</th><td>${recUser.name }</td>
									</tr>
									<tr>
										<th>총 주문 도토리</th><td><strong>${order.totalPrice }</strong> 개</td>
										<th>결재 도토리</th><td><strong class="text-danger">${order.totalPrice }</strong> 개</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="card-body">
							<table class="table">
								<colgroup>
									<col width="*">
									<col width="10%">
									<col width="7%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th>상품명</th>
										<th>도토리</th>
										<th>수량</th>
										<th>구매가격</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="item" items="${orderItems }">
									<tr>
										<td>
											<span class="align-top"><a href="../acorn/detail.do?acornno=${item.acornNo}" class="text-body">${item.acornName }</a></span>
										</td>
										<td>${item.price } 개</td>
										<td><fmt:formatNumber value="${item.amount }"/></td>
										<td><strong>${item.price } 개</strong></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>