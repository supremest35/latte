<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<style type="text/css">
	a:link {text-decoration: none; color: #333333;}
	a:visited {text-decoration: none; color: #333333;}
	a:active {text-decoration: none; color: #333333;}
	a:hover {text-decoration: underline; color: red;}
</style>
<title>라떼 판 - 커뮤니티</title>
</head>
<body>
	<div class="container" id="pannboard">
		<div class="row">
			<div class="col-12">
				<%@ include file="../../common/panNavbar.jsp"%>
			</div>
		</div>
		
		<div>
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-header">
							<a href="index.do?catno=${category.no }">${category.name } 게시판</a>
							<!-- 카테고리 별로 이름이 바뀌게 -> '화제/유머/고민/공포/자유/연예 게시판'-->
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table" style="border-width: 10px; font-size: small;">
						<thead>
						<colgroup>
							<col width="6%">
							<col width="6%">
							<c:if test="${category.no == 100 }">
								<col width="14%">
							</c:if>
							<col width="50%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>좋아요</th>
							<th>싫어요</th>
							<c:if test="${category.no == 100 }">
								<th></th>
							</c:if>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
	
						<tbody>
							<c:forEach var="board" items="${boards}">
								<tr>
									<td>${board.likeCnt } &#128077;</td>
									<td>${board.dislikeCnt} &#128078;</td>
									<c:if test="${category.no == 100 && empty board.imageFilename }">
										<td><a
											href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}"
											class="href"><img class="img-thumbnail"
												src="../resources/images/noimage.png" alt=""></a></td>
									</c:if>
									<c:if
										test="${category.no == 100 && not empty board.imageFilename }">
										<td><a
											href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}"
											class="href"><img class="img-thumbnail"
												src="../resources/images/${board.imageFilename }" alt=""></a></td>
									</c:if>
									<td><a
										href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}"
										class="href"> <span style="font-size: 15px;">${board.title}</span></a>
										<span style="color: red;">[${board.commentCnt}]</span> <%-- <c:if test="${category.no != 100 }">
	                           		<img class="img-thumbnail" src="../resources/images/noimage.png" alt="" height="10">
	                           	</c:if> --%> <%-- <c:if test="${category.no = 100 }"> --%>
										<p style="font-size: 12px;">
											<a href="index.do?catno=${board.categoryNo}">${board.categoryName }</a>
										</p> <%-- </c:if> --%>
										<p>
											<fmt:formatDate value="${board.createdDate }"
												pattern="yyyy.MM.dd hh:ss" />
										</p></td>
									<td>${board.nickname }</td>
									<td>조회수 ${board.hitCnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" style="border-top: 1px solid lightgray;">
				<div class="col-12 text-right">
					<c:if test="${not empty LOGINED_USER }">
						<a href="form.do?catno=${category.no}" class="btn btn-primary">글쓰기</a>
					</c:if>
				</div>
			</div>
			<c:if test="${category.no != 100 }">
			<div class="row">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						<li class="page-item ${page.pageNo gt 1 ? '' : 'disabled' }">
							<a class="page-link"
							href="index.do?catno=${category.no }&pageno=${page.pageNo -1 }">이전</a>
						</li>
						<c:forEach var="num" begin="${page.beginPage }"
							end="${page.endPage }">
							<li class="page-item ${num eq page.pageNo ? 'active' : '' }">
								<a class="page-link"
								href="index.do?catno=${category.no }&pageno=${num}">${num }</a>
							</li>
						</c:forEach>
						<li
							class="page-item ${page.pageNo lt page.totalPages ? '' : 'disabled' }">
							<a class="page-link"
							href="index.do?catno=${category.no }&pageno=${page.pageNo + 1}">다음</a>
						</li>
					</ul>
				</div>
			</div>
			</c:if>
		</div>
	</div>
</body>
</html>