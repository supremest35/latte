<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>상품 상세정보</title>
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
	a {
		color: rgb(34, 34, 34);
	}
	.card-img-mall {
		width: 100x;
		height: 80px;
	}
	</style>
	<script>
    function fnMove(seq){
        var offset = $("#div" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
	</script>
</head>
<body>

<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/shopping.jsp" %>
</div>

<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/navbar.jsp" %>
</div>

<div class="container">
	<div class="card">
		<div class="card-header">
			<a href="/shopping/main.do">홈</a> > <a href="list.do?catno=${product.categoryMidNo }&catlvl=2">${product.categoryMidNo }</a> > ${product.categoryLowNo }
		</div>
		<div class="card-body">
	  		<div class="row no-gutters">
	    		<div class="col-md-3">
	      			<img src="/resources/images/products/${product.photoFilename }" class="card-img" alt="...">
	      			<h5 class="text-center"><small>등록일 : </small><fmt:formatDate value="${product.createdDate }"/></h5>
	    		</div>
	    		<div class="col-md-7">
	      			<div class="card-body">
	        			<h5 class="card-title">${product.productBrandName } ${product.productName } [${product.productCd }]</h5>
	        			<h5 class="card-title"><strong>${minAndMaxPrice.minPrice } ~ ${minAndMaxPrice.maxPrice } </strong>원</h5>
    						<button type="button" class="btn btn-info" onclick="fnMove('1')">가격비교</button>
    						<a href="list.do?catno=${product.categoryNo }&catlvl=1" class="btn btn-primary">쇼핑계속</a>
	        			<table class="table">
	        				<tbody>
	        					<tr>
	        						<th>판매쇼핑몰</th>
	        						<td>가격</td>
	        					</tr>
	        					<c:forEach var="detail" items="${details }" end="3">
	        					<tr>
	        						<th>${detail.detailName }</th>
	        						<td><fmt:formatNumber value="${detail.price }" /> 원
	        						<c:choose>
			        					<c:when test="${detail.freeDelivery eq 'Y' }">
	                                       <span class="badge badge-info">무료배송</span>
	                                 	</c:when>
	                                 	<c:otherwise>
	                                 		<span class="badge badge-secondary">유료배송</span>
	                                 	</c:otherwise>
                                 	</c:choose>
	        						</td>
	        					</tr>
	        					</c:forEach>
	        				</tbody>
	        			</table>
	      			</div>
		  		</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5>
						상세정보
					</h5>
				</div>
				<div class="col-md-3">
		      			<img src="/resources/images/products/${product.photoFilename }" class="card-img" alt="...">
		    		</div>
				<div class="card-body border border-left-0 border-top-0 border-right-0">
					<h5 class="card-title  d-flex justify-content-between">
						<span>${product.detailName }</span>
					</h5>
					<div class="card-text">${product.info }</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5>
						쇼핑몰 리스트
					</h5>
				</div>
				<c:if test="${empty details }">
				<div class="card-body">
					<div class="card-text text-center">등록된 쇼핑몰이 없습니다.</div>
				</div>
				</c:if>
				<c:if test="${not empty details }">
				<div id="div1" class="card-body border border-left-0 border-top-0 border-right-0" id="divId">
					<table class="table">
	       				<colgroup>
	       					<col width="15%">
	       					<col width="">
	       					<col width="15%">
	       					<col width="15%">
	       					<col width="15%">
	       				</colgroup>
						<thead>
						    <tr>
						      <th scope="col">쇼핑몰</th>
						      <th scope="col">상품명</th>
						      <th scope="col">판매가</th>
						      <th scope="col">혜택</th>
						      <th scope="col">구매</th>
						    </tr>
						  </thead>
	       				<tbody>
	       				<c:forEach var="detail" items="${details }" end="0">
						    <tr>
						      <td><img src="/resources/images/malls/${detail.mallNo }.png" class="card-img-mall" alt="..."></td>
						      <td><a href="${detail.url }">${detail.detailName }</a></td>
						      <td><span style="color:red">최저가</br><fmt:formatNumber value="${detail.price }" /> 원</span></td>
						      <c:choose>
						      	<c:when test="${detail.freeDelivery eq 'N'}">
						      		<td><span class="badge badge-secondary">유료배송</span></td>
						      	</c:when>
						      	<c:otherwise>
						      		<td><span class="badge badge-info">무료배송</span></td>
						      	</c:otherwise>
						      </c:choose>
						      <td><a href="${detail.url }" class="btn btn-outline-primary">구매하기</a></td>
						    </tr>
	       				</c:forEach>
	       				<c:forEach var="detail" items="${details }" begin="1">
						    <tr>
						      <td><img src="/resources/images/malls/${detail.mallNo }.png" class="card-img-mall" alt="..."></td>
						      <td><a href="${detail.url }">${detail.detailName }</a></td>
						      <td><fmt:formatNumber value="${detail.price }" /> 원</td>
						      <c:choose>
						      	<c:when test="${detail.freeDelivery eq 'N'}">
						      		<td><span class="badge badge-secondary">유료배송</span></td>
						      	</c:when>
						      	<c:otherwise>
						      		<td><span class="badge badge-info">무료배송</span></td>
						      	</c:otherwise>
						      </c:choose>
						      <td><a href="${detail.url }" class="btn btn-outline-primary">구매하기</a></td>
						    </tr>
	       				</c:forEach>
					  </tbody>
	       			</table>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
      $(document).ready(function(){
        $("#moveBtn").on("click",function(event){
 
          var offset = $("#divId").offset();
 
          $("html body").animate({scrollTop:offset.top},2000);
        });
      });
</script>
</body>
</html>