<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Latte 쇼핑</title>
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
		table {
			text-align: center;
		}
		.btn-group-xs > .btn, .btn-xs {
		  padding: .45rem .4rem;
		  font-size: .875rem;
		  line-height: .5;
		  border-radius: .2rem;
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
				<div class="card-header font-weight-bold">소원 리스트</div>
				<div class="card-body">
				<form id="wish-form" method="post" action="../order/form.hta">
					<table class="table">
						<colgroup>
							<col width="3%">
							<col width="*">
							<col width="12%">
							<col width="9%">
							<col width="20%">
							<col width="12%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="chk-all" checked onchange="toggleAllChecked()"/></th>
								<th>상품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>필요 도토리 갯수</th>
								<th>주문</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty wishItems }">
								<tr>
									<td colspan="7" class="text-center">장바구니가 비어 있습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${wishItems }">
									<tr>
										<td><input type="checkbox" name="wishno" value="${dto.itemNo }" checked /></td>
										<td>
											<span class="align-top">
												<a href="../acorn/detail.do?acornno=${dto.acornNo }&catno=${dto.categoryNo}" class="text-body">${dto.acornName }</a>
											</span>
										</td>
										<td><fmt:formatNumber value="${dto.itemPrice }" />개</td>
										<td>
											<input type="number" name="amount" id="amount-${dto.itemNo }" value="${dto.itemAmount }" style="width: 43px; height: 20px;"/><br/>
											<button type="button" class="btn btn-outline-secondary btn-xs" onclick="changeAmount(${dto.itemNo })" >변경</button>
										</td>
										<td><strong><fmt:formatNumber value="${dto.itemPrice * dto.itemAmount }" />개</strong></td>
										<td>
											<button type="button" class="btn btn-primary btn-xs" onclick="buy(${dto.itemNo })">주문하기</button><br />
											<a href="deleteItem.do?wishno=${dto.itemNo }" class="btn btn-secondary btn-xs">삭제하기</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</form>
				</div>
				<div class="card-footer d-flex justify-content-between">
					<span>선택한 도토리상품 <button class="btn btn-primary btn-xs" onclick="orderItems()">주문하기</button> <button class="btn btn-secondary btn-xs" onclick="deleteItems()">삭제하기</button></span>
					<span>필요한 총 도토리 갯수 : <strong class="mr-5"><fmt:formatNumber value="${totalOrderPrice }" /> 개</strong></span>
				</div>	
			</div>
		</div>
	</div>
</div>
</body>
</html>