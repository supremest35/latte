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
	<div class="card">
		<div class="card-header">
			<a href="">홈</a> > <a href="">중분류</a> > 소분류
		</div>
		<div class="card-body">
	  		<div class="row no-gutters">
	    		<div class="col-md-3">
	      			<img src="/resources/images/products/${product.photoFilename }" class="card-img" alt="...">
	      			<h5 class="text-center"><small>등록일 : </small><fmt:formatDate value="${product.createdDate }"/></h5>
	    		</div>
	    		<div class="col-md-7">
	      			<div class="card-body">
	        			<h5 class="card-title">${product.detailName }</h5>
	        			<h5 class="card-title"><strong>25000 ~ ${product.salePrice } </strong>원</h5>
    						<a href="${product.url }" class="btn btn-primary">구매URL</a>
    						<button type="button" class="btn btn-info" >가격비교</button>
    						<a href="list.do?pageno=1" class="btn btn-outline-primary">쇼핑계속</a>
	        			<table class="table">
	        				<tbody>
	        					<tr>
	        						<th>판매쇼핑몰</th>
	        					</tr>
	        					<tr>
	        						<th>티몬</th>
	        						<td><fmt:formatNumber value="${product.salePrice }" /> 원
	        						<c:choose>
			        					<c:when test="${product.freeDelivery eq 'Y' }">
	                                       <span class="badge badge-info">무료배송</span>
	                                 	</c:when>
	                                 	<c:otherwise>
	                                 		<span class="badge badge-secondary">유료배송</span>
	                                 	</c:otherwise>
                                 	</c:choose>
	        						</td>
	        					</tr>
	        					<tr>
	        						<th>G마켓</th>
	        						<td>25000 원
	        							<span class="badge badge-secondary">유료배송</span>
	        						</td>
	        					</tr>
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
					<c:if test="${empty product.information }">
						<div class="card-text text-center">내용이 없습니다.</div>
					</c:if>
					<c:if test="${not empty product.information }">
						<div class="card-text">${product.information }</div>
					</c:if>
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
				<div class="card-body">
					<div class="card-text text-center">등록된 쇼핑몰이 없습니다.</div>
				</div>
				<div class="card-body border border-left-0 border-top-0 border-right-0">
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
					    <tr>
					      <td><img src="/resources/images/malls/gmarket.png" class="card-img" alt="..."></td>
					      <td><a href="">${product.detailName }</a></td>
					      <td>25000 원</td>
					      <td><span class="badge badge-secondary">유료배송</span></td>
					      <td><a href="" class="btn btn-outline-primary">구매하기</a></td>
					    </tr>
					    <tr>
					      <td><img src="/resources/images/malls/tmon.png" class="card-img" alt="..."></td>
					      <td><a href="">${product.detailName }</a></td>
					      <td>${product.salePrice } 원</td>
					      <td><span class="badge badge-info">무료배송</span></td>
					      <td><a href="" class="btn btn-outline-primary">구매하기</a></td>
					    </tr>
					  </tbody>
	       			</table>
				</div>
			</div>
			<div class="card-body border border-left-0 border-top-0 border-right-0">
				<div class="p-3">
					<ul class="pagination justify-content-center">
				  		<li class="page-item ">
				  			<a class="page-link  " href="detail.hta?bookno=1&cartno=100&pageno=1&reviewpageno=1">이전</a>
				  		</li>
					  		<li class="page-item "><a class="page-link" href="detail.jsp?bookno=1&cartno=100&pageno=1&reviewpageno=1">1</a></li>
					  		<li class="page-item "><a class="page-link" href="detail.jsp?bookno=1&cartno=100&pageno=1&reviewpageno=1">2</a></li>
					  		<li class="page-item "><a class="page-link" href="detail.jsp?bookno=1&cartno=100&pageno=1&reviewpageno=1">3</a></li>
					  		<li class="page-item "><a class="page-link" href="detail.jsp?bookno=1&cartno=100&pageno=1&reviewpageno=1">4</a></li>
					  		<li class="page-item "><a class="page-link" href="detail.jsp?bookno=1&cartno=100&pageno=1&reviewpageno=1">5</a></li>
				  		<li class="page-item ">
				  			<a class="page-link  " href="detail.hta?bookno=1&cartno=100&pageno=1&reviewpageno=1">다음</a>
				  		</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>