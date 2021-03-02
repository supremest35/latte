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
   <div class="row mb-3">
		<div class="col-12">
			<div class="card">
				<div class="card-header font-weight-bold">주문 내역</div>
				<div class="card-body">
					<table class="table">
						<thead>
							<tr>
								<th>주문번호</th>
								<th>주문일자</th>
								<th>주문내역</th>
								<th>주문도토리/종</th>
								<th>주문상태</th>
								<th>수령자</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty orders }">
								<tr>
									<td class="text-center" colspan="6">주문내역이 존재하지 않습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="order" items="${orders }">
									<tr>
										<td><a href="/shopping/order/detail.do?orderno=${order.no }">${order.no }</a></td>
										<td><fmt:formatDate value="${order.createdDate }"/></td>
										<td><a href="/shopping/order/detail.do?orderno=${order.no }">${order.description }</a></td>
										<td><fmt:formatNumber value="${order.totalPrice }"/>원/${order.amount }종</td>
										<td><span class="text-success">${order.status }</span></td>
										<td>${order.recId }</td>
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