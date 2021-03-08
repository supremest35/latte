<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="main-sections">
	<div class="card-body" id="home-section">
		<div class="card" id="contents">
			<div class="card-body">
				<div class="row" id="content-scroll">
					<c:choose>
						<c:when test="${empty boards }">
							<p class="card-text">게시글이 존재하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boards }">
								<div class="col-3 mb-3">
									<a href="" data-board-no="${board.no }" data-content-id="#visual-content-detail">
									<c:if test="${not empty board.imgFilename }">
										<img class="card-img" src="${board.imgFilename }">
									</c:if>
									<c:if test="${empty board.imgFilename }">
										<p>${board.title }</p>
									</c:if>
									</a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body" id="profile-section">
		<div class="card-body" id="profile-intro">
			<div id="edit-button">
				<c:if test="${empty profile }">
					<a href="" class="badge badge-primary" data-form-id="#intro-insert">새 글 쓰기</a>
				</c:if>
				<c:if test="${not empty profile }">
					<a href="" class="badge badge-primary" data-form-id="#intro-modify">글 수정</a>
					<a href="" class="badge badge-primary" data-form-id="#intro-delete">글 삭제</a>
				</c:if>
			</div>
			<div class="card">
				<div class="card-header">소개</div>
				<c:choose>
					<c:when test="${empty profile }">
						<div class="card-body">
							<p class="card-text">게시글이 존재하지 않습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-body">
							<img class="card-img-top" src="${profile.photoFilename }" alt="Card image cap">
						</div>
						<div class="card-body">
							<p class="card-text">${profile.content }</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="card-body" id="profile-keyword">
			<div>
				<c:if test="${empty keywords }">
					<a href="" class="badge badge-primary" data-form-id="#keyword-insert">새 글 쓰기</a>
				</c:if>
				<c:if test="${not empty keywords }">
					<a href="" class="badge badge-primary" data-form-id="#keyword-delete">글 삭제</a>
				</c:if>
			</div>
			<div class="card">
				<div class="card-header">
					키워드
				</div>
				<div class="card-body">
				  <c:choose>
				  	<c:when test="${empty keywords }">
				  		<p class="card-text">게시글이 존재하지 않습니다.</p>
				  	</c:when>
				  	<c:otherwise>
						<p class="card-text">
							<c:forEach var="keyword" items="${keywords }">
								<c:out value="${keyword.content } "/>
							</c:forEach>
						</p>
				  	</c:otherwise>
				  </c:choose>
				</div>
			</div>
		</div>
		<div class="card-body" id="profile-qna">
			<div>
				<c:if test="${empty qnas }">
					<a href="" class="badge badge-primary" data-form-id="#qna-insert">새 글 쓰기</a>
				</c:if>
				<c:if test="${not empty qnas }">
					<a href="" class="badge badge-primary" data-form-id="#qna-delete">글 삭제</a>
				</c:if>
			</div>
			<div class="card">
				<div class="card-header">문답</div>
				<c:choose>
					<c:when test="${empty qnas }">
						<div class="card-body">
							<p class="card-text">게시글이 존재하지 않습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-body">
							<c:forEach var="qna" items="${qnas }">
								<div class="card mb-3">
									<div class="card-header">
										<c:out value="${qna.question }"/>
									</div>
									<div class="card-body">
										<c:out value="${qna.answer }"/>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="card-body" id="profile-basicInfo">
			<div class="card">
				<div class="card-header">기본정보</div>
				<div class="card-body">
				  <table class="table">
				  	<colgroup>
	       					<col width="18%">
	       					<col width="32%">
	       					<col width="18%">
	       					<col width="32%">
	       			</colgroup>
	       			<tbody>
	       				<tr>
	       					<th>이름</th><td>${hostUser.name}</td>
	       					<th>닉네임</th><td>${hostUser.nickName}</td>
	       				</tr>
	       				<tr>
	       					<th>생일</th><td><fmt:formatDate value="${hostUser.birthday}" pattern="yyyy-MM-dd"/> </td>
	       					<th>전화번호</th><td>${hostUser.tel}</td>
	       				</tr>
	       				<tr>
	       					<th>이메일</th><td>${hostUser.id}</td>
	       					<th>주소</th><td>${hostUser.address}</td>
	       				</tr>
	       			</tbody>
				  </table>
				</div>
			</div>
		</div>
	</div>
	<div class="card-body" id="diary-section">
			<div>
				<a href="" class="badge badge-primary" data-form-id="#diary-insert">새 글 쓰기</a>
				<c:if test="${not empty diary }">
					<a href="" class="badge badge-primary" data-form-id="#diary-modify" data-diary-no="${diary.no }">글 수정</a>
					<a href="" class="badge badge-primary" data-form-id="#diary-delete" data-diary-no="${diary.no }">글 삭제</a>
				</c:if>
			</div>
		<c:choose>
			<c:when test="${empty diary }">
				<div class="card">
					<div class="card-header"></div>
					<div class="card-body">
						<p class="card-text">게시글이 존재하지 않습니다.</p>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="card">
					<div class="card-header" id="diary-title">
						<c:out value="${diary.title }"/>
					</div>	
					<div class="card-body" id="diary-content">
						<c:out value="${diary.content }"/>
					</div>	
					<div class="card-body" id="diary-secret">
						<p class="card-text">공개여부 : 
							<c:choose>
								<c:when test="${diary.secret == 'N' }">
									전체공개
								</c:when>
								<c:otherwise>
									비공개
								</c:otherwise>
							</c:choose>
							<small>(<fmt:formatDate value="${diary.createdDate }" pattern="yyyy-MM-dd" />)</small>
						</p>  
					</div>	
					<div class="card-footer">
						<ul>
							<li>
								<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
								<a href=""><i class="fas fa-comment-dots"></i></a>
								<a href=""><i class="fas fa-lock"></i></a>
								<a href=""><i class="fas fa-ban"></i></a>
							</li>
							<li>
								<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
								<a href=""><i class="fas fa-comment-dots"></i></a>
								<a href=""><i class="fas fa-lock"></i></a>
								<a href=""><i class="fas fa-ban"></i></a>
							</li>
							<li>
								<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
								<a href=""><i class="fas fa-comment-dots"></i></a>
								<a href=""><i class="fas fa-lock"></i></a>
								<a href=""><i class="fas fa-ban"></i></a>
							</li>
						</ul>
						<input type="text" name="comment"> <button class="badge badge-primary">등록</button>
					</div>	
		
				</div>
			
			</c:otherwise>
		</c:choose>
	</div>
	<div class="card-body" id="visualContents-section">
		<div id="visualContent-btn">
			<a href="" class="badge badge-primary" data-form-id="#visualContent-insert" >새 글 쓰기</a>
		</div>
		<div class="card" id="contents">
			<div class="card-body">
				<div class="row" id="content-scroll">
					<c:choose>
						<c:when test="${empty boards }">
							<p class="card-text">게시글이 존재하지 않습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${boards }">
								<div class="col-3 mb-3">
									<a href="" data-board-no="${board.no }" data-content-id="#visual-content-detail"><img class="card-img" src="${board.imgFilename }"></a>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>							
	<div class="card-body" id="visual-content-detail">
		<div id="visualContent-btn">
			<a href="" class="badge badge-primary" data-form-id="#visualContent-modify" data-board-no="${board.no }">글 수정</a>
			<a href="" class="badge badge-primary" data-form-id="#visualContent-delete" data-board-no="${board.no }">글 삭제</a>
		</div>
		<div class="card">
			<div class="card-header">
				<c:out value="${board.title }"/>
			</div>
			<div class="row">
				<div class="col-10">
					<a href="">${userName }</a>					
				</div>
				<div class="col-2">
					<small><fmt:formatDate value="${board.createdDate }" pattern="yyyy-MM-dd" /></small>					
				</div>
			</div>
			<div class="card-body">
				<c:choose>
					<c:when test="${folderCategoryNo eq 100 }">
						<img class="card-img-top" src="${board.imgFilename }"/>
						<c:out value="${board.content }"/>
					</c:when>
					<c:when test="${folderCategoryNo eq 200 }">
						<video width="100%" poster="${board.imgFilename }" autoplay loop controls>
							<source src="${board.extraFilename }" type="video/mp4"/>
						</video>
						<c:out value="${board.content }"/>
					</c:when>
				</c:choose>
			</div>
			<div class="card-footer">
				<ul>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
				</ul>
				<input type="text" name="comment"> <button class="badge badge-primary">등록</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="board-section">
		<div id="board-btn">
			<a href="" class="badge badge-primary" data-form-id="#board-insert">새 글 쓰기</a>
			<a href="" class="badge badge-primary" data-form-id="#board-select-delete">선택 삭제</a>
		</div>
		<c:if test="${empty boards }">
			<div class="card-body">
				게시글이 존재하지 않습니다.
			</div>
		</c:if>
		<c:if test="${not empty boards }">
			<table class="table">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="35%">
					<col width="15%">
					<col width="20%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="check-all"/></th>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boards }" varStatus="status">
						<tr>
							<th><input type="checkbox" name="board-checkbox" value="${board.no }"></th>
							<td>${status.count }</td>
							<td><a href="" data-content-id="#board-detail" data-board-no="${board.no }"><c:out value="${board.title }"/></a><div class="badge badge-secondary"> ${board.likeCnt }</div></td>
							<td>${userName }</td>
							<td><fmt:formatDate value="${board.createdDate }" pattern="yyyy-MM-dd" /></td>
							<td>${board.hitCnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="card-footer">
				<div class="row">
					<div class="col-12">
						<ul class="pagination justify-content-center">
							<li class="page-item ${pagination.pageNo gt 1 ? '' : 'disabled' }">
								<a class="page-link" href="" data-content-id="#board-section" data-page-no="${pagination.pageNo - 1 }">이전</a>
							</li>
							<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
								<li class="page-item ${pagination.pageNo eq num ? 'active' : ''}" >
									<a class="page-link" href="" data-content-id="#board-section" data-page-no="${num }">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${pagination.pageNo lt pagination.totalPages ? '' : 'disabled' }">
								<a class="page-link" href="" data-content-id="#board-section" data-page-no="${pagination.pageNo + 1 }">다음</a>
							</li>
						</ul>
					</div>
				</div>
				<div id="search-board" >
					<form id="search-form" method="get" action="">
					<input type="hidden" name="catno" value="">
						<select name="opt">
							<option value="title">제목</option>
							<option value="writer">저자</option>
							<option value="publisher">출판사</option>
						</select>
						<input type="text" name="keyword">
						<button type="button">조회</button>
					</form>
				</div>
			</div>
		
		</c:if>
	</div>
	<div class="card-body" id="board-detail">
		<div id="board-button">
			<a href="" class="badge badge-primary" data-form-id="#board-modify" data-board-no="${board.no }">글 수정</a>
			<a href="" class="badge badge-primary" data-form-id="#board-delete" data-board-no="${board.no }">글 삭제</a>
		</div>
		<div class="card">
			<div class="card-header">
				<c:out value="${board.title }"/>
			</div>
			<div class="row">
				<div class="col-10">
					<a href="">${userName }</a>					
				</div>
				<div class="col-2">
					<small><fmt:formatDate value="${board.createdDate }" pattern="yyyy-MM-dd" /></small>					
				</div>
			</div>
			<div class="card-body">
				<c:out value="${board.content }"/>
			</div>
			<a href="">첨부파일</a>
			<div class="card-footer">
				<ul>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
					<li>
						<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
						<a href=""><i class="fas fa-comment-dots"></i></a>
						<a href=""><i class="fas fa-lock"></i></a>
						<a href=""><i class="fas fa-ban"></i></a>
					</li>
				</ul>
				<input type="text" name="comment"> <button class="badge badge-primary">등록</button>
			</div>
		</div>
	</div>
	<div class="card-body" id="visitor-section">
		<c:if test="${not empty LOGINED_USER }">
			<div class="card mb-5" id="visitorNote-form">
				<div class="card-header"></div>
				<div class="row">
					<div class="col-3">
						<div class="card-body">
							<img class="card-img" src="/resources/images/userProfilePhoto/${LOGINED_USER.photo }">
						</div>
					</div>
					<div class="col-9">
						<div class="card-body">
							<textarea rows="6" cols="60" name="content"></textarea>
						</div>
					</div>
				</div>
				<div class="card-footer" id="visitorNote-addButton">
					<small><input type="checkbox"> 비밀로 하기</small>
					<a href="" class="badge badge-primary" data-form-id="#visitorNote-insert">등록</a>
				</div>
			</div>
		</c:if>
		<c:forEach var="visitorNote" items="${visitorNotes }">
			<div class="card mb-5">
				<div class="card-header">
					<div class="row">
						<div class="col-2">
							NO.1
						</div>
						<div class="col-6">
							<a href="">${visitorNote.userName }</a>
							<small>(<fmt:formatDate value="${visitorNote.createdDate }" pattern="yyyy-MM-dd" />)</small>
						</div>
						<div class="col-4">
							<a href="">비밀로 하기</a>|
							<a href="">삭제</a>|
							<a href="">신고</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-3">
						<div class="card-body">
							<img class="card-img" src="/resources/images/userProfilePhoto/${visitorNote.userPhoto }">
						</div>
					</div>
					<div class="col-9">
						<div class="card-body">
							<p class="card-text"><c:out value="${visitorNote.content }"/></p>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<ul>
						<li>
							<a href="">김유신</a> : 프로젝트임? <span>(2021.01.29. 22:30)</span>
							<a href=""><i class="fas fa-comment-dots"></i></a>
							<a href=""><i class="fas fa-lock"></i></a>
							<a href=""><i class="fas fa-ban"></i></a>
						</li>
						<li>
							<input type="text" name="comment"> <button class="badge badge-primary">등록</button>
						</li>
					</ul>
				</div>
			</div>
			
		</c:forEach>
		<div class="card-footer">
			<div class="row">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						<li class="page-item ${pagination.pageNo gt 1 ? '' : 'disabled' }">
							<a class="page-link" href="" data-content-id="#visitor-section" data-page-no="${pagination.pageNo - 1 }">이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item ${pagination.pageNo eq num ? 'active' : ''}" >
								<a class="page-link" href="" data-content-id="#visitor-section" data-page-no="${num }">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${pagination.pageNo lt pagination.totalPages ? '' : 'disabled' }">
							<a class="page-link" href="" data-content-id="#visitor-section" data-page-no="${pagination.pageNo + 1 }">다음</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="search-visitorNote" >
				<form id="search-form" method="get" action="">
				<input type="hidden" name="catno" value="">
					<select name="opt">
						<option value="title">제목</option>
						<option value="writer">저자</option>
						<option value="publisher">출판사</option>
					</select>
					<input type="text" name="keyword">
					<button type="button">조회</button>
				</form>
			</div>
		</div>
	</div>
</div>

