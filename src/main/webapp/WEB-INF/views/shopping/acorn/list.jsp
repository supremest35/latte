<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>도토리상품리스트</title>
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
	th, td {
		font-size: 16px;
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
	<div>
		<h3>${not empty category ? category.name : '전체' }</h3>
		<div>
			<button type="button" class="btn btn-outline-secondary" onclick="addWishItems()"><i class="fas fa-plus"></i>담기</button>
			<button type="button" class="btn btn-outline-secondary" onclick="orderItems()">구매</button>
			<button type="button" class="btn btn-outline-secondary" onclick="orderItems()">선물</button>
		</div>
		<div>
		<!-- 
			<a href="">인기상품순</a>
				&nbsp;|&nbsp;
			<a href="">최신순</a>
		 -->
		</div>
		<form id="acorn-list-form" method="post" action="../order/form.do">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">
				<div class="form-check">
					<input type="checkbox" id="chk-all" onchange="toggleAllChecked()"/>
				</div>
		      </th>
		      <th scope="col">상품명</th>
		      <th scope="col">가격</th>
		      <th scope="col">좋아요</th>
		      <th scope="col">담기</th>
		      <th scope="col">구매</th>
		      <th scope="col">선물</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:forEach var="acorn" items="${acorns }">
			    <tr>
			      <th scope="row">
					<div class="form-check">
						<input type="checkbox" name="acornno" value="${acorn.no }" />
					</div>
			      </th>
			      <td><a href="detail.do?acornno=${acorn.no }&pageno=${page.pageNo }&catno=${acorn.categoryNo }">${acorn.name }</a></td>
			      <td><i class="fad fa-acorn"></i> ${acorn.price }개 <input type="hidden" name="amount" value=1 /></td>
			      <c:if test="${empty LOGINED_USER }">
				      <td>
				      	<i class="far fa-heart"></i> ${acorn.likeCnt }
				      </td>
			      </c:if>
			      <c:if test="${not empty LOGINED_USER }">
				      <td>
				      	<a href="../acorn/insertLikeCnt.do?catno=${category.no }&acornno=${acorn.no }"><i class="far fa-heart"></i> ${acorn.likeCnt }</a>
				      </td>
			      </c:if>
			      <td><a href="/shopping/wish/insertItem.do?acornno=${acorn.no }&amount=1"><i class="fas fa-plus"></i></a></td>
			      <c:if test="${empty LOGINED_USER }">
				      <td><a href="/shopping/main.do">바로구매</a></td>
				      <td><a href="/shopping/main.do">선물하기</a></td>
			      </c:if>
			      <c:if test="${not empty LOGINED_USER }">
				      <td><a href="/shopping/order/form.do?acornno=${acorn.no }&amount=1">바로구매</a></td>
				      <td><a href="/shopping/order/form.do?acornno=${acorn.no }&amount=1">선물하기</a></td>
			      </c:if>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
		</form>
	</div>
	<div class="row">
		<div class="col-12">
			<ul class="pagination justify-content-center">
				<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
					<a class="page-link"
					href="../acorn/list.do?catno=${category.no }&pageno=${page.pageNo -1 }"><i class="fas fa-angle-left"></i></a>
				</li>
				<c:forEach var="num" begin="${page.beginPage }"
					end="${page.endPage }">
					<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
						<a class="page-link"
						href="../acorn/list.do?catno=${category.no }&pageno=${num}">${num }</a>
					</li>
				</c:forEach>
				<li
					class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
					<a class="page-link"
					href="../acorn/list.do?catno=${category.no }&pageno=${page.pageNo + 1}"><i class="fas fa-angle-right"></i></a>
				</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	function toggleAllChecked() {
		var isChecked = document.getElementById("chk-all").checked;
		var checkboxes = document.querySelectorAll("[name='acornno']");
		for (var i=0; i<checkboxes.length; i++) {
			checkboxes[i].checked = isChecked;
		}
	}
	
	function addWishItems() {
		var form = document.getElementById("acorn-list-form");
		form.setAttribute("action", "../wish/insertItem.do");
		form.submit();
	}
	
	function orderItems() {
		var form = document.getElementById("acorn-list-form");
		form.setAttribute("action", "../order/form.do");
		form.submit();
	}
</script>
</body>
</html>