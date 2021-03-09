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
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
	
	<script type="text/javascript">
	$(document).ready(function(){

		/* Event */
		
		//중분류 조회
		$(".form-check").click(function() {
			var productColor = null;
			
			for (var i = 0; i < $('.form-check').find('input').length; i++)
            {
				if($('.form-check-input').eq(i).is(":checked") == true){
					if(!productColor){
						productColor = "'"+$('.form-check-input').eq(i).val() + "'";
					}else{
						productColor += ",";
						productColor += "'"+$('.form-check-input').eq(i).val()+"'";
					}
			    }
            }
			
			var data = {};			
			data["CAT_NO"] = $('#catNo').val();
			data["CAT_LVL"] = $('#catLvl').val();
			data["PD_COLOR"] = productColor;
			
			$.ajax({
				contentType : 'application/json',
				dataType : 'json',
				url : "/ShoppingManage/retrieveProductByColor.do",
				type : 'post',
				data : JSON.stringify(data), // json -> string <-> parse
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					if(data.length > 0){
						$('.productList').empty();
						for(var i=0 in data){
							var html = '';
								html += '<div class="col-3 mb-3 ">';
								html += '<div class="card">';
								html += '<div class="card-body" style="height: 360px;">';

								html += '<a href="detail.do?prodno='+data[i].PRODUCT_NO+'&catno='+data[i].PRODUCT_CATEGORY_NO+'">';
								html += '<img class="img-thumbnail" src="/resources/images/products/'+data[i].PRODUCT_PHOTO_FILENAME+'" alt="Card image">';
								html += '</a>';

								html += '<strong class="mb-2 product-name">'+data[i].PRODUCT_BRAND_NAME+'&nbsp;'+data[i].PRODUCT_NAME+'['+data[i].PRODUCT_CD+']</strong>';
								html += '<div class="d-flex justify-content">';
								html += '<strong class="text-danger">'+data[i].PRODUCT_PRICE+'</strong> 원';
								html += '</div>';
								html += '</div>';
								html += '</div>';
								html += '</div>';
							$('.productList').append(html);
						
			            }
					}else{
						$('.productList').empty();
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
	});

	/* Event End */
	
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
	<%@ include file="/WEB-INF/views/shopping/common/searchform.jsp" %>
</div>

<div class="container">
   <div class="row mb-3">
      <div class="col-12">
         <div class="card">
            <div class="card-header font-weight-bold">${not empty category ? category.name : '전체' } 리스트</div>
            <div class="card-body">
               <div class="row productList">
               <c:forEach var="product" items="${products }">
                  <div class="col-3 mb-3 ">
                     <div class="card">
                         <div class="card-body" style="height: 340px;">
                             <a href="detail.do?prodno=${product.no }&catno=${product.categoryNo }">
                                <img class="img-thumbnail" src="/resources/images/products/${product.photoFilename }" alt="Card image">
                             </a>
                              <strong class="mb-2 product-name">${product.productBrandName}&nbsp;${product.productName } [${product.productCd }]</strong>
                              <div class="d-flex justify-content">
                                 <strong class="text-danger"><fmt:formatNumber value="${product.minPrice }" /> ~ <fmt:formatNumber value="${product.maxPrice }" /></strong> 원
                              </div>
						  </div>
                      </div>      
                  </div>
               </c:forEach>
               </div>
            </div> 
         </div>
      </div>
   </div>
</div>
</body>
</html>