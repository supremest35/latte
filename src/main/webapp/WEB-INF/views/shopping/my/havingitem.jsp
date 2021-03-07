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
 			<div class="card">
 				<div class="card-body">
 					<h4 class="card-title">보유 도토리상품 리스트</h4>
 					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" id="chk-all" checked onchange="toggleAllChecked()"/></th>
								<th>상품명</th>
								<th class="text-center" onclick="">적용하기</th>
								<th class="text-right pr-5">구매날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty userItems }">
								<tr>
									<td class="text-center" colspan="4">보유 상품이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="item" items="${userItems }">
									<tr>
										<td><input type="checkbox" name="itemno" value="${item.no}" checked /></td>
										<td>${item.acornName }</td>
										<td class="text-center" onclick=""><a href="">적용하기</a></td>
										<td class="text-right pr-5"><fmt:formatDate value="${item.createdDate }"/></td>
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
<script type="text/javascript">
	function toggleAllChecked() {
		var isChecked = document.getElementById("chk-all").checked;
		var checkboxes = document.querySelectorAll("[name='itemno']");
		for (var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = isChecked;
		}
	}
</script>
</body>
</html>