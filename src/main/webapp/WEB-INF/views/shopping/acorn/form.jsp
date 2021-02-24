<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	body, button {
		font-size: 18px;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    letter-spacing: -1px;
	}
	a {
		color: rgb(34, 34, 34);
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
	<div class="row">
	   <div class="col-12">
	      <div class="card">
	         <form id="product-form" method="post" action="register.do" enctype="multipart/form-data" onsubmit="checkAcornForm(event)">
	         <div class="card-header"><h4>도토리상품 등록폼</h4></div>
	         <div class="card-body">
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>카테고리</label>
	                  <select class="form-control" name="categoryMidNo" id="acorn-category">
	                  <c:forEach var="category" items="${acornCategories }">
		                 <option value="${category.no }"> ${category.name }</option>
		              </c:forEach>
					  </select>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>상품명</label>
	                  <input type="text" class="form-control" name="name" id="acorn-name" />
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>도토리 (1개 = 100원)</label>
	                  <input type="number" class="form-control" name="price" id="acorn-price"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>수량</label>
	                  <input type="number" class="form-control" name="stock" id="acorn-price"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="text-right">
	                  <a href="/shopping/main.do" class="btn btn-secondary">취소</a>
	                  <input type="submit" class="btn btn-primary" value="상품등록" />
	               </div>
	            </div>
	         </div>
	         </form>
	      </div>
	   </div>
	</div>
</div>

</body>
</html>