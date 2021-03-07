<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Latte Shopping</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
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
	<form method="post" action="insert.do">
		<div class="row mb-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header font-weight-bold">주문상품 확인</div>
					<div class="card-body">
						<table class="table">
							<colgroup>
								<col width="*">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>상품명</th>
									<th>도토리</th>
									<th>수량</th>
									<th>구매도토리</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="item" items="${orderItemList }">
								<tr>
									<td>
										<span class="align-top"><a href="/shopping/acorn/detail.do?acornno=${item.acornNo}&catno=${item.acornCategoryNo }" class="text-body">${item.acornName}</a></span>
										<input type="hidden" name="acornNo" value="${item.acornNo }" />
										<input type="hidden" name="price" value="${item.acornPrice }" />
										<input type="hidden" name="amount" value="${item.amount }" />
									</td>
									<td>${item.acornPrice } 개</td>
									<td>${item.amount }</td>
									<td><strong>${item.orderPrice } 개</strong></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="card-body text-right">
						<span>총 도토리 갯수 : <strong class="mr-5">${totalOrderPrice } 개</strong></span>
					</div>	
				</div>
				<div class="card">
					<div class="card-header font-weight-bold">받는 분</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>받는사람 아이디 (예: m@abc.com)</label>
      							<input type="text" class="form-control" name="recId">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-12">
								<label>전할 말 <small class="text-secondary">(예: 친구야 잘쓰도록 하여라!)</small></label>
      							<textarea rows="3" class="form-control" name="message"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header font-weight-bold">결재정보</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-3">
								<label>사용가능
									<button type="button" class="btn btn-primary btn-xs" id="btn-use-acorn" onclick="useAcorn()" ${LOGINED_USER.acornCnt eq 0 ? 'disabled' : '' }>사용하기</button>
									<a href="/shopping/acorn/chargeForm.do" class="btn btn-info btn-xs">충전하기</a>
								</label>
      							<input type="text" class="form-control" name="" id="usable-acorn" value="${user.acornCnt }" readonly>
							</div>
							<div class="form-group col-3">
								<label>필요한 도토리</label>
      							<input type="text" class="form-control" name="totalPrice" id="total-order-price" value="${totalOrderPrice }" readonly>
							</div>
							<div class="form-group col-3">
								<label>사용후 도토리</label>
      							<input type="text" class="form-control" name="" id="used-acorn" value="${user.acornCnt }" readonly>
							</div>
							<div class="form-group col-3">
								<label>총 결재 도토리</label>
      							<input type="text" class="form-control" name="" id="total-pay-price" value="${totalOrderPrice }" readonly>
							</div>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary btn-lg">결재하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	function useAcorn() {
		var usableAcornField = document.getElementById("usable-acorn");
		var totalOrderPriceField = document.getElementById("total-order-price");
		var usedAcornField = document.getElementById("used-acorn");
		var totalPayPriceField = document.getElementById("total-pay-price");
		
		var usableAcorn = parseInt(usableAcornField.value);
		var totalOrderPrice = parseInt(totalOrderPriceField.value);
		var usedAcorn = 0;
		var totalPayPrice = parseInt(totalPayPriceField.value);
		
		if (!usableAcorn) {
			alert("사용가능한 도토리가 없습니다.");
			return;
		}
		if (usableAcorn > totalOrderPrice) {
			usedAcorn = usableAcorn - totalOrderPrice;
			totalPayPrice = 0;
			usableAcorn = usedAcorn;
		} else {
			usedAcorn = usableAcorn;
			totalPayPrice = totalOrderPrice - usableAcorn;
			usableAcorn = 0;
		}
		
		usableAcornField.value = usableAcorn;
		usedAcornField.value = usedAcorn;
		totalPayPriceField.value = totalPayPrice;
		
		document.getElementById("btn-use-acorn").disabled = true;
	}
</script>
</body>
</html>