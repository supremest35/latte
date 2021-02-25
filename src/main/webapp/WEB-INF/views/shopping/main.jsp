<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Latte Shopping</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	.carousel {
	    background: whitegray;
	    margin-top: 20px;
	}
	.carousel-item {
	    text-align: center;
	    min-height: 20px;
	}
	.carousel-item .img-box {
		height: 230px;
		width: 100%;
		position: relative;
	}
	.carousel-item img {	
		max-width: 100%;
		max-height: 100%;
		display: inline-block;
		position: absolute;
		bottom: 0;
		margin: 0 auto;
		left: 0;
		right: 0;
	}
	.carousel .thumb-wrcater {
		text-align: center;
	}
	.carousel .thumb-content h4 {
		font-size: 18px;
		margin: 10px 0;
	}
	.carousel .thumb-content {
		padding: 15px;
	}
	.carousel .item-price {
		font-size: 18px;
		padding: 2px 0;
	}
	.carousel .item-price strong {
		color: tomato;
		margin-right: 5px;
	}
	.carousel .item-price span {
		color: #86bd57;
		font-size: 110%;
	}
	.carousel .carousel-control-prev {
		height: 60px;
	    width: 30px;
	    background: none;
	    margin: auto 0;
	    background: rgba(0, 0, 0, 0.2);
	}
	.carousel .carousel-control-next {
		height: 60px;
	    width: 30px;
	    background: none;
	    margin: auto 0;
	    background: rgba(0, 0, 0, 0.2);
	}
	.carousel .carousel-indicators {
		bottom: -40px;
	}
	.carousel-indicators li {
		border-radius: 20%;
		border-color: transparent;
		background: rgba(0, 0, 0, 0.2);
	}
	.carousel-indicators li.active {
		border-radius: 20%;
		border-color: transparent;
		background: rgba(0, 0, 0, 0.6);
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
	<div class="card bg-light text-dark">
	    <div class="card-body">
	        <a href="product/list.do?pageno=1">
	        	서치킹 - 고객들이 가장 많이 찾아본 상품!
	        </a>
			<div class="container-lg my-3">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
			            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			            <li data-target="#myCarousel" data-slide-to="1"></li>
			        </ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row">
							<c:forEach var="product" items="${hitProducts }">
								<div class="col-sm-4">
									<div class="thumb-wrcater">
										<div class="img-box">
											<a href="product/detail.do?prodno=${product.no }&catno=${product.categoryNo}">
												<img class="img-thumbnail" src="/resources/images/products/${product.photoFilename }" alt="Card image">
											</a>
										</div>
										<div class="thumb-content">
											<strong>${product.brandName } </strong>
											<h4><a href="product/detail.do?prodno=${product.no }&catno=${product.categoryNo}">${product.name }</a></h4>
											<p class="item-price"><strong>${product.discountRate*100 } %</strong> <span>${product.salePrice}</span>원</p>
											<c:if test="${product.freeDelivery eq 'Y' }">
												<span class="badge badge-primary">무료배송</span>
											</c:if>
										</div>						
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
							<c:forEach var="product" items="${hitProducts }">
								<div class="col-sm-4">
									<div class="thumb-wrcater">
										<div class="img-box">
											<a href="product/detail.do?prodno=${product.no }&catno=${product.categoryNo}">
												<img class="img-thumbnail" src="/resources/images/products/${product.photoFilename }" alt="Card image">
											</a>
										</div>
										<div class="thumb-content">
											<strong>${product.brandName } </strong>
											<h4><a href="product/detail.do?prodno=${product.no }&catno=${product.categoryNo}">${product.name }</a></h4>
											<p class="item-price"><strong>${product.discountRate*100 } %</strong> <span>${product.salePrice}</span>원</p>
											<c:if test="${product.freeDelivery eq 'Y' }">
												<span class="badge badge-primary">무료배송</span>
											</c:if>
										</div>						
									</div>
								</div>
							</c:forEach>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			            <span class="carousel-control-prev-icon"></span>
			        </a>
			        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			            <span class="carousel-control-next-icon"></span>
			        </a>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>