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
	<%@ include file="/WEB-INF/views/shopping/common/searchform.jsp" %>
</div>

<div class="container">
   <div class="row mb-3">
      <div class="col-12">
         <div class="card">
            <div class="card-header font-weight-bold">${not empty category ? category.name : '전체' } 리스트</div>
            <div class="card-body">
               <div class="row">
               <c:forEach var="product" items="${products }">
                  <div class="col-3 mb-3">
                     <div class="card">
                         <div class="card-body" style="height: 400.61px;">
                             <a href="detail.do?prodno=${product.no }&pageno=${page.pageNo }&catno=${product.categoryNo }">
                                <img class="img-thumbnail" src="/resources/images/products/${product.photoFilename }" alt="Card image">
                             </a>
                              <strong class="mb-2 product-brand-name">${product.brandName }</strong>
                              <strong class="mb-2 product-name">${product.name }</strong>
                              <div class="d-flex justify-content">
                                 <strong class="text-danger"><fmt:formatNumber value="${product.salePrice }" /></strong> 원 (<fmt:formatNumber value="${product.discountRate*100}" pattern="###"/>% 할인)
                              </div>
                              <div class="mt-3">
                                 <c:if test="${product.freeDelivery eq 'Y' }">
                                       <span class="badge badge-primary">무료배송</span>
                                 </c:if>
                              </div>
						  </div>
                      </div>      
                  </div>
               </c:forEach>
               </div>

               <div class="row">
                  <div class="col-12">
                     <ul class="pagination justify-content-center">
                          <li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
                             <a class="page-link" href="/shopping/product/list.do?pageno=${page.pageNo - 1 }&catno=${param.catno }">이전</a>
                          </li>
                          <c:forEach var="num" begin="${page.beginPage }" end="${page.endPage }">
                             <li class="page-item ${num eq page.pageNo ? 'active' : '' }">
                                <a class="page-link" href="/shopping/product/list.do?pageno=${num }&catno=${param.catno }">${num }</a>
                             </li>
                          </c:forEach>
                          <li class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
                             <a class="page-link" href="/shopping/product/list.do?pageno=${page.pageNo + 1 }&catno=${param.catno }">다음</a>
                          </li>
                     </ul>
                  </div>
               </div>
               
            </div>   
         </div>
      </div>
   </div>
</div>

</body>
</html>