<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>Latte_main</title>
</head>
<style type="text/css">
   a:link {text-decoration: none; color: #333333;}
   a:visited {text-decoration: none; color: #333333;}
   a:active {text-decoration: none; color: #333333;}
   a:hover {text-decoration: underline; color: red;}
   a#moreContent {font-size: 12px; color: blue; float: right;}
</style>
<body>
	<div class="container">
		<div class="col-12">
		<%@ include file="/WEB-INF/common/navbar.jsp" %>
		</div>
		<div class="row mt-4" style="width: 1110px;">
			<div class="col-12">
				<div class="row">
					<div class="col-7">
						<div class="card">
							<div class="card-header">베스트 이슈</div>
						</div>
						<div class="card-body border">
							<h6 class="card-title">실시간 좋아요 Top 5</h6>
							<a id="moreContent" href="/board/index.do?catno=100">더보기 ></a>
							<table class="table" id="board-table">
								<thead>
									<colgroup>
										<col width="20%">
										<col width="*">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<tr>
										<th>이미지</th>
										<th>제목</th>
										<th>작성자</th>
										<th>조회수</th>
									</tr>
								<tbody>
								<c:forEach var="board" items="${boards}" begin="0" end="4">
									<tr>
										<c:if test="${empty board.imageFilename }">
										<td>
											<a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}">
											<img class="img-thumbnail" src="/resources/images/noimage.png"></a>
										</td>
										</c:if>
										<c:if test="${not empty board.imageFilename }">
										<td><a
											href="/board/detail.do?boardNo=${board.no }&catno=${board.categoryNo}"
											class="href"><img class="img-thumbnail"
											src="/resources/images/${board.imageFilename }" alt=""></a>
										</td>
										</c:if>
										<td>
											<a href="/board/detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href"> 
											<span style="font-size: 15px;">${board.title}</span></a>
											<span style="color: red;">[${board.commentCnt}]</span> <br>
										</td>
										<td>${board.nickname }</td>
										<td>${board.hitCnt} <br> 
											${board.likeCnt } &#128077;
											${board.dislikeCnt} &#128078;
										</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</div>
					</div>
					<div class="col-5">
						<div class="card">
							<div class="card-header">뉴스
							<a id="moreContent" href="/news/main.do">뉴스 홈으로 ></a>
							</div>
						</div>
						<div class="card-body border">
							<!-- <h6 class="card-title">오늘의 뉴스</h6> -->
							<div class="card-text">
								<p>연예/스포츠<a id="moreContent" href="/news/EntSports.do">연예/스포츠 뉴스 더보기 ></a></p>
								<ul id="contents-1">
									
								</ul>
								<p>사회/경제<a id="moreContent" href="/news/Economy.do">사회/경제 뉴스 더보기 ></a></p>
								<ul id="contents-2">
									
								</ul>
								<p>IT과학<a id="moreContent" href="/news/itScience.do">it/과학 뉴스 더보기 ></a></p>
								<ul id="contents-3">
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		// 스포츠
		axios.get("http://localhost/board/api/news/" + +"연예"+"스포츠").then(function(response) {
			var sports = response.data;
			
			for (var index = 0; index <= 2; index++) {
				/* var title = "<p>" + sports.items[index].title + "</p>" */
	 			var content = "<li> <a href='" + sports.items[index].link + "'>" + sports.items[index].title + "</a></li>" 
				$("#contents-1").append(content);
			}
		})
		
		// 경제
		axios.get("http://localhost/board/api/news/" + "경제").then(function(response) {
			var economy = response.data;
			/* var url = "http://localhost/news/detail.do"; */
			for (var index = 0; index <= 2; index++) {
				var title = "<li> <a href='" + economy.items[index].link + "'>" + economy.items[index].title + "</a></li>" 
				$("#contents-2").append(title);
			}	
		})	
	
		// it 
		axios.get("http://localhost/board/api/news/" + "it"+"과학").then(function(response) {
			var it = response.data;
			for (var index = 0; index <= 2; index++) {
				var title = "<li> <a href='" + it.items[index].link + "'>" + it.items[index].title + "</a></li>" 
				$("#contents-3").append(title);
			}	
		})
	</script>
</body>
</html>