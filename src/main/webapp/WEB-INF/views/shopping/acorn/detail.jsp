<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>도토리상품 상세정보</title>
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
	body, button  {
		font-size: 16px;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    letter-spacing: -1px;
	}
	a {
		color: rgb(34, 34, 34);
	}
   .img-thumbnail {
      width: 110px;
      height: 110px;
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
			<a href="">홈</a> > <a href="">${category.name }</a>
		</div>
		<div class="row mb-3">
			<div class="col-12 mb-3">
				<div class="card-body">
			  		<div class="row no-gutters">
			    		<div class="col-md-12">
			      			<div class="card-body">
			        			<h5 class="card-title">${acorn.name }</h5>
			        			<form id="acorn-form" method="get" action="/shopping/order/form.do">
			        				<input type="hidden" name="acornno" value="${acorn.no }" />
				        			<table class="table">
				        				<colgroup>
				        					<col width="18%">
				        					<col width="32%">
				        					<col width="18%">
				        					<col width="32%">
				        				</colgroup>
				        				<tbody>
				        					<tr>
				        						<th>이름</th>
				        						<td>${acorn.name }</td>
				        						<th>가격</th>
				        						<td><i class="fad fa-acorn"></i> ${acorn.price } 개</td>
				        					</tr>
				        					<tr>
				        						<th>잔여수량</th>
				        						<td>${acorn.stock } 개</td>
				        						<th>상품상태</th>
				        						<td>${acorn.status }</td>
				        					</tr>
				        					<tr>
				        						<th>좋아요</th>
				        						<td>${acorn.likeCnt } 개</td>
				        						<th>댓글</th>
				        						<td>${acorn.commentCnt } 개</td>
				        					</tr>
				        					<tr>
				        						<th>판매</th>
				        						<td>${acorn.sellCnt } 개</td>
				        						<th>등록일</th>
				        						<td><fmt:formatDate value="${acorn.createdDate }"/></td>
				        					</tr>
				        					<tr>
				        						<th>구매수량</th>
				        						<td><input type="number" class="form-control" name="amount" value="1" style="width: 100px;"></td>
				        						<td colspan="2" class="text-right">
				        							<button type="button" class="btn btn-primary" ${acorn.stock eq 0 ? 'disabled' : '' } onclick="buy()">바로구매</button>
				        							<button type="button" class="btn btn-info" ${acorn.stock eq 0 ? 'disabled' : '' } onclick="addWishItem()">장바구니</button>
				        							<a href="list.do?catno=${acorn.categoryMidNo }&pageno=1" class="btn btn-outline-primary">쇼핑계속</a>
				        						</td>
				        					</tr>
				        				</tbody>
				        			</table>
			        			</form>
			      			</div>
				  		</div>
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
						<c:if test="${not empty LOGINED_USER }">
							<button class="btn btn-primary btn-sm float-right" data-toggle="modal" data-target="#modal-comment-form">댓글쓰기</button>
						</c:if>
						사용자 댓글
					</h5>
				</div>
				<c:choose>
					<c:when test="${empty comments }">
					<div class="card-body">
						<div class="card-text text-center">작성된 댓글이 없습니다.</div>
					</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="comment" items="${comments }">
						<div class="card-body border border-left-0 border-top-0 border-right-0">
							<h5 class="card-title  d-flex justify-content-between">
								<span><img class="img-thumbnail" src="/resources/images/userProfilePhoto/${comment.userPhoto }" alt="Card image"></span>
								<span>${comment.userId }</span>
								<span class="col-6">${comment.content }</span>
								<small>
									<a href="likeComment.do?acornno=${acorn.no }&commentno=${comment.no }" class="ml-3 btn btn-outline-secondary btn-xs ${empty LOGINED_USER ? 'disabled' : '' }">
									<i class="far fa-heart"></i> ${comment.likeCnt } </a>
								</small>
							</h5>
						</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>	
			</div>
			<c:if test="${not empty comments}">
			<div class="card-body border border-left-0 border-top-0 border-right-0">
				<div class="p-3">
					<ul class="pagination justify-content-center">
				  		<li class="page-item ${commentpageno eq 1 ? 'disabled' : '' }">
				  			<a class="page-link " href="detail.do?acornno=${acorn.no }&reviewpageno=${commentpageno-1 }">이전</a>
				  		</li>
				  		<c:forEach var="num" begin="1" end="${totalpages }">
					  		<li class="page-item ${commentpageno eq num ? 'active' : '' }"><a class="page-link" href="detail.do?acornno=${acorn.no }&commentpageno=${num }">${num }</a></li>
					  	</c:forEach>
				  		<li class="page-item ${commentpageno eq totalpages ? 'disabled' : '' }">
				  			<a class="page-link " href="detail.do?acornno=${acorn.no }&reviewpageno=${commentpageno+1 }">다음</a>
				  		</li>
					</ul>
				</div>
			</div>
			</c:if>
		</div>
	</div>
	<div class="modal fade" id="modal-comment-form" tabindex="-1" aria-hidden="true">
  		<div class="modal-dialog">
  			<form method="post" action="insertComment.do" onsubmit="submitComment(event)">
  			<input type="hidden" name="acornno" value="${acorn.no }" />
  			<input type="hidden" name="pageno" value="${pageNo }" />
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title">댓글 작성하기</h5>
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          				<span aria-hidden="true">&times;</span>
        			</button>
      			</div>
      			<div class="modal-body">
      				<div class="card">
      					<div class="card-body">
		        			<div class="form-group">
		        				<label class="font-weight-bold">내용</label>
		        				<textarea rows="5" class="form-control" name="content" id="comment-content"></textarea>
		        			</div>
      					</div>
      				</div>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        			<button type="submit" class="btn btn-primary">등록</button>
      			</div>
    		</div>
    		</form>
  		</div>
	</div>
</div>
<script type="text/javascript">
	function buy() {
		var form = document.getElementById("acorn-form");
		form.setAttribute("action", "../order/form.do")
		form.submit();
	}
	
	function addWishItem() {
		var form = document.getElementById("acorn-form");
		form.setAttribute("action", "../wish/insertItem.do");
		form.submit();
	}

	function submitComment(event) {
		var contentElement = document.querySelector("#comment-content");
		
		if (!contentElement.value) {
			event.preventDefault();
			alert("내용을 입력하세요");
			return;
		}
	}
</script>
</body>
</html>