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
	         <form id="product-form" method="post" action="register.do" enctype="multipart/form-data" onsubmit="checkProductForm(event)">
	         <div class="card-header"><h4>상품등록 폼</h4></div>
	         <div class="card-body">
	            <div class="form-row">
	               <div class="form-group col-4">
	                  <label>대분류</label>
	                  <select class="form-control" name="categoryNo" id="product-category" onchange="categoryChange(event)">
		                  <option value=""> 선택하세요</option>
		                  <c:forEach var="category" items="${categories }" end="4">
			                 <option value="${category.no }"> ${category.name }</option>
			              </c:forEach>
					  </select>
	               </div>
	               <div class="form-group col-4">
	                  <label>중분류</label>
	                  <select class="form-control" name="categoryMidNo" id="good">
		                  <option value=""> 선택하세요</option>
	                  	  <c:forEach var="category" items="${midCategories }">
		              		<option value="${category.no }"> ${category.name }</option>
		              	  </c:forEach>
	                  </select>
	               </div>
	               <div class="form-group col-4">
	                  <label>소분류</label>
	                  <select class="form-control" name="categoryLowNo" id="product-category">
		           		  <option value=""> 선택하세요</option>
	                  	  <c:forEach var="category" items="${lowCategories }">
		              		<option value="${category.no }"> ${category.name }</option>
		              	  </c:forEach>
					  </select>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>상품색</label>
	                  <select class="form-control" name="colorNo" id="product-color">
						 <option value=""> 선택하세요</option>
						 <c:forEach var="color" items="${colors }">
		                 	<option value="${color.no }"> ${color.name }</option>
		                 </c:forEach>
					  </select>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>쇼핑몰</label>
	                  <select class="form-control" name="mallNo" id="product-mall">
	                  	 <option value=""> 선택하세요</option>
		                 <c:forEach var="mall" items="${malls }">
		                 	<option value="${mall.no }"> ${mall.name }</option>
		                 </c:forEach>
					  </select>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>브랜드명</label>
	                  <input type="text" class="form-control" name="brandName" id="product-brand" />
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>상품명</label>
	                  <input type="text" class="form-control" name="name" id="product-name" />
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>가격</label>
	                  <input type="number" class="form-control" name="price" id="product-price"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>할인율(예: 0.1 = 10%)</label>
	                  <input type="number" step="0.01" class="form-control" name="discountRate" id="product-discount-rate"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>판매가격</label>
	                  <input type="number" class="form-control" name="salePrice" id="product-sale-price"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>상품정보</label>
	                  <input type="text" class="form-control" name="information" id="product-information" />
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>연결URL</label>
	                  <input type="text" class="form-control" name="url" id="product-url" />
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-6">
	                  <label>무료배송입니까?</label>
	                  <select class="form-control" name="freeDelivery" id="product-free-delivery">
	                  	 <option value="N"> 아니오</option>
		                 <option value="Y"> 예</option>
					  </select>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="form-group col-6">
	                  <label>상품 사진</label>
	                  <input type="file" class="form-control" name="photofile" id="product-photo-file" />
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
<script type="text/javascript">
	function checkProductForm(event) {
		var form = document.querySelector("#product-form");
		
		var value = document.querySelector("#product-category").value
	}

</script>
</body>
</html>