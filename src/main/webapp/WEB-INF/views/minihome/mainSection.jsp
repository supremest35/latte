<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="main-sections">
	<div class="card-body" id="home-section">
		<div class="row mb-3">
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000002.jpg"></a>
			</div>
		</div>
	</div>
	<div class="card-body" id="profile-section">
		<a class="badge badge-primary" href="">edit</a>
		<div class="card" id="profile-intro">
		<img class="card-img-top" src="${profile.photoFilename }" alt="Card image cap">
			<div class="card-body">
			  <p class="card-text">${profile.content }</p>
			</div>
		</div>
		<div class="card" id="profile-keyword">
			<div class="card-header">
				키워드
			</div>
			<div class="card-body">
			  <p class="card-text">
			  	<c:forEach var="keyword" items="${keywords }">
			  		<c:out value="${keyword.content } "/>
			  	</c:forEach>
			  </p>
			</div>
		</div>
		<div class="card" id="profile-qna">
			<div class="card-body">
				<div class="card">
					<c:forEach var="qna" items="${qnas }">
						<div class="card-header">
							<c:out value="${qna.question }"/>
						</div>
						<div class="card-body">
							<c:out value="${qna.answer }"/>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="card" id="profile-basicInfo">
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
       			</tbody>
			  </table>
			</div>
		</div>
	</div>
	<div class="card-body" id="diary-section">
		<div id="diary-button">
			<a href="">새 글 등록</a>
			<a href="">글 삭제</a>
		</div>
		<div class="card">
			<div class="card-header">
				프로젝트 시작함
			</div>	
			<div class="card-body">
				시작시작
			</div>	
			<div class="card-body">
				공개설정 : 전체공개
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
	<div class="card-body" id="photo-section">
		<div class="row mb-3" id="photo-folder-1">
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000009.jpg"></a>
			</div>
		</div>
		<div class="row mb-3" id="photo-folder-2">
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000011.jpg"></a>
			</div>
		</div>
		<div class="row mb-3" id="photo-folder-6">
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
			<div class="col-3 mb-3">
				<a href=""><img class="card-img" src="/resources/images/1000012.jpg"></a>
			</div>
		</div>
	</div>
							
	<div class="card-body" id="video-section">
	</div>
							
	<div class="card-body" id="board-section">
		<div>
			<a href="" class="badge badge-primary">새 글 쓰기</a>
			<a href="" class="badge badge-primary">선택 삭제</a>
		</div>
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
					<th><input type="checkbox"></th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th><input type="checkbox"></th>
					<td>3</td>
					<td><a href="">프로젝트자료</a><div class="badge badge-secondary">3</div></td>
					<td>홍길동</td>
					<td>2021.01.17.</td>
					<td>3</td>
				</tr>
				<tr>
					<th><input type="checkbox"></th>
					<td>2</td>
					<td><a href="">데이터베이스자료</a><div class="badge badge-secondary">3</div></td>
					<td>홍길동</td>
					<td>2021.01.17.</td>
					<td>3</td>
				</tr>
				<tr>
					<th><input type="checkbox"></th>
					<td>1</td>
					<td><a href="">레이아웃자료</a><div class="badge badge-secondary">3</div></td>
					<td>홍길동</td>
					<td>2021.01.17.</td>
					<td>3</td>
				</tr>
			</tbody>
		</table>
		<div class="card-footer">
			<div class="row">
				<div class="col-12">
					<ul class="pagination justify-content-center">
						  <li class="page-item">
							  <a class="page-link" href="">이전</a>
						  </li>

							  <li class="page-item">
								  <a class="page-link" href="">1</a>
							  </li>
							  <li class="page-item">
								  <a class="page-link" href="">2</a>
							  </li>
							  <li class="page-item">
								  <a class="page-link" href="">3</a>
							  </li>

						  <li class="page-item">
							  <a class="page-link" href="">다음</a>
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
	</div>
	<div class="card-body" id="visitor-section">
		<div class="card mb-5">
			<div class="card-header"></div>
			<div class="row">
				<div class="col-3">
					<div class="card-body">
						<img class="card-img" src="resources/images/1000004.jpg">
					</div>
				</div>
				<div class="col-9">
					<div class="card-body">
						<textarea rows="6" cols="60"></textarea>
					</div>
				</div>
			</div>
			<div class="card-footer" id="visitorNote-addButton">
				<input type="checkbox"> 비밀로 하기
				<button type="btn btn-primary">확인</button>
			</div>
		</div>
		
	</div>
	
	<div class="card-body" id="setting-section">
	</div>
</div>

