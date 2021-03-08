<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
<style type="text/css">
	#welcomeNote-img-box {
		width:196px;
		height: 200px;
		display: table-cell;
		text-align: center;
		vertical-align: middle;
	}
	#welcomeNote-content {
			height: 150px;
		}
</style>
</head>

<body>
	<div class="container-fluid" id="welcomeNote-history">
		<div class="card-body">
			<div class="card">
				<c:choose>
					<c:when test="${empty welcomeNotes }">
						<p class="card-text">게시글이 존재하지 않습니다.</p>
					</c:when>
					<c:otherwise>
						<c:forEach var="welcomeNote" items="${welcomeNotes }">
							<div class="card mt-3">
								<div class="card-header">
									<small><fmt:formatDate value="${welcomeNote.createdDate}" pattern="yyyy-MM-dd"/></small>
									<button class="badge badge-primary badge-xs" data-note-no="${welcomeNote.no }">delete</button>
								</div>
								<div class="card-body">
									<div class="card-body" id="welcomeNote-img-box" >
										<img class="card-img-top" src="/resources/images/miniHome/${welcomeNote.photoFilename }" alt="Card image cap" id="welcomeNote-img">
									</div>
									<div class="card-body" id="welcomeNote-content">
										<p class="card-text">${welcomeNote.content }</p>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="card-footer">
							<div class="row">
								<div class="col-12">
									<ul class="pagination justify-content-center">
										<li class="page-item ${pagination.pageNo gt 1 ? '' : 'disabled' }">
											<a class="page-link" href="/historyWelcomeNote.do?miniHomeNo=${miniHomeNo }&pageNo=${pagination.pageNo - 1}" data-page-no="${pagination.pageNo - 1 }">이전</a>
										</li>
										<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
											<li class="page-item ${pagination.pageNo eq num ? 'active' : ''}" >
												<a class="page-link" href="/historyWelcomeNote.do?miniHomeNo=${miniHomeNo }&pageNo=${num}" data-content-id="" data-page-no="${num }">${num }</a>
											</li>
										</c:forEach>
										<li class="page-item ${pagination.pageNo lt pagination.totalPages ? '' : 'disabled' }">
											<a class="page-link" href="/historyWelcomeNote.do?miniHomeNo=${miniHomeNo }&pageNo=${pagination.pageNo + 1}" data-content-id="" data-page-no="${pagination.pageNo + 1 }">다음</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>	
	</div>
<script type="text/javascript">
	
	$("#welcomeNote-history button").click(function() {
		var welcomeNoteNo = $(this).data("note-no");
		axios.get('http://localhost/minihome/api/deleteWelcomeNote/' + welcomeNoteNo).then(function(response) {
			location.reload();
		})
	})
	
</script>
</body>
</html>