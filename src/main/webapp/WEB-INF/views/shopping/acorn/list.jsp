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
			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-plus"></i>담기</button>
			<button type="button" class="btn btn-outline-secondary">구매</button>
			<button type="button" class="btn btn-outline-secondary">선물</button>
		</div>
		<div>
			<a href="">인기상품순</a>
				&nbsp;|&nbsp;
			<a href="">최신순</a>
		</div>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="checkbox" value="allSelect">
					<label class="form-check-label" for="checkbox"></label>
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
						<input class="form-check-input" type="checkbox" id="checkbox" value="select">
						<label class="form-check-label" for="checkbox"></label>
					</div>
			      </th>
			      <td><a href="detail.do?acornno=${acorn.no }&pageno=${page.pageNo }&catno=${acorn.categoryNo }">${acorn.name }</a></td>
			      <td><i class="fad fa-acorn"></i> ${acorn.price }개</td>
			      <td><a href=""><i class="far fa-heart"></i> ${acorn.likeCnt }</a></td>
			      <td><a href="/shopping/wish/insertItem.do?acornno=${acorn.no }&amount=1"><i class="fas fa-plus"></i></a></td>
			      <td><a href="/shopping/order/form.do?acornno=${acorn.no }&amount=1">바로구매</a></td>
			      <td><a href="/shopping/order/form.do?acornno=${acorn.no }&amount=1">선물하기</a></td>
			    </tr>
		    </form>
		    </c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="container">
	    <div class="row">
		    <ul class="pagination mx-auto">
		        <li class="page-item disabled">
		            <a class="page-link" href="#" aria-label="Previous">
		                <span aria-hidden="true"><i class="fas fa-angle-double-left"></i></span>
		                <span class="sr-only">First</span>
		            </a>
		        </li>
		        <li class="page-item disabled">
		            <a class="page-link" href="#" aria-label="Previous">
		                <span aria-hidden="true"><i class="fas fa-angle-left"></i></span>
		                <span class="sr-only">Previous</span>
		            </a>
		        </li>
		        <li class="page-item active"><a class="page-link" href="#">1</a></li>
		        <li class="page-item"><a class="page-link" href="#">2</a></li>
		        <li class="page-item"><a class="page-link" href="#">3</a></li>
		        <li class="page-item"><a class="page-link" href="#">4</a></li>
		        <li class="page-item">
		            <a class="page-link" href="#" aria-label="Next">
		                <span aria-hidden="true"><i class="fas fa-angle-right"></i></span>
		                <span class="sr-only">Next</span>
		            </a>
		        </li>
		        <li class="page-item">
		            <a class="page-link" href="#" aria-label="Nextest">
		                <span aria-hidden="true"><i class="fas fa-angle-double-right"></i></span>
		                <span class="sr-only">Last</span>
		            </a>
		        </li>
		    </ul>
	    </div>
	</div>
</div>
</body>
</html>