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
	<link href='resources/calendar/main.css' rel='stylesheet' />
    <script src='resources/calendar/main.js'></script>
	<style>
		#minihome-blank {
			height: 20px;
		}
		#side-section {
			height: 400px;
		}
		#welcomeNote-content {
			height: 150px;
		}
		#welcomeNote-button button {
			margin-right: 10px;
			margin-bottom: 10px;
			float: right;
		}
		#welcomeNote-userInfo {
			padding: 10px;
		}
		#welcomeNote-userInfo > .card-text {
			padding: 0;
			margin: 0;
		}

		.card-img-top {
			width: 70%;	
		}
		.card-body {
			border-top: 2px solid lightgray;
		}
		.card-img {
			border: 1px solid black;
			aspect-ratio: 1;
			width: 150px;
		}
		#side-content, #main-section {
			height: 580px;
		}
		#side-content {
			width: 13rem;
		}
		#main-frame {
			padding-right: 0;
		}
		#side-frame {
			padding-right: 0;
		}
		ul {
			list-style: none;
		}
		#diary-button, #visitorNote-addButton, #visitorNote-settingButton{
			text-align: right;
		}
		#search-board {
			text-align: center; 
			margin-top: 20px;
		}
		#welcomeNote-img {
			width: 140px;
		}
		#main-content {
			height: 600px;
			overflow-y:scroll;
		}		
		#profile-section .card-img-top {
			width: 20%;
		}
	</style>
</head>

<body>
	<div class="container-fluid" id="mini-home">
		<div class="row mt-3">
			
			<div class="col-2" id="side-frame">
				<div class="card" >
					<div class="card-header">
						TODAY ${miniHomeInfo.miniHome.todayCnt } | TOTAL ${miniHomeInfo.miniHome.totalCnt }
					</div>
					<div id="side-section">
						<div id="home-section-side">
							<img class="card-img-top" src="/resources/images/1000001.jpg" alt="Card image cap" id="welcomeNote-img">
							<div class="card-body" id="welcomeNote-content">
							  <p class="card-text">${miniHomeInfo.welcomeNote.content }</p>
							</div>
							<div id="welcomeNote-button">
								<button class="badge badge-primary badge-xs">edit</button>
								<button class="badge badge-primary badge-xs">history</button>
							</div>
						</div>
						
						<div id="profile-section-side">
							<div class="card-body">
								<h5>profile</h5>
							</div>
							<div class="card-body">
								<h6>내 소개</h6>
								<ul id="profile-folder-list">
									<li><a href="" data-content-id="#profile-intro">소개</a></li>
									<li><a href="" data-content-id="#profile-keyword">키워드</a></li>
									<li><a href="" data-content-id="#profile-qna">42문답</a></li>
									<li><a href="" data-content-id="#profile-basicInfo">기본정보</a></li>
								</ul>
							</div>
						</div>
						
						<div id="diary-section-side">
							<div id="calendar">
								
							</div>
						</div>
						
						<div id="photo-section-side">
							<div class="card-body">
								<h5>photo</h5>
							</div>
							<div class="card-body">
								<ul id="photo-folder-list">
								
								</ul>
							</div>
						</div>
						
						
						<div id="video-section-side">
							<div class="card-body">
								<h5>video</h5>
							</div>
							<div class="card-body">
								<ul id="video-folder-list">
								<!-- 동적이기 때문에 폴더 번호로 db에서 가져와서 넣어주기 -->
									<li><a href="" data-content-id="#video-2020">2020</a>
										<ul>
											<li><a href="" data-content-id="#video-2020-1">1월</a></li>
											<li><a href="" data-content-id="#video-2020-2">2월</a></li>
											<li><a href="" data-content-id="#video-2020-3">3월</a></li>
										</ul>
									</li>
									<li><a href="" data-content-id="#video-2021">2021</a></li>
								</ul>
							</div>
						</div>
						<div id="board-section-side">
						</div>
						<div id="visitor-section-side">
							<img class="card-img-top" src="/resources/images/1000001.jpg" alt="Card image cap" id="welcomeNote-img">
							<div class="card-body" id="welcomeNote-content">
							  <p class="card-text">${miniHomeInfo.welcomeNote.content }</p>
							</div>
							<div id="welcomeNote-button">
								<button class="badge badge-primary badge-xs">edit</button>
								<button class="badge badge-primary badge-xs">history</button>
							</div>
						</div>
						
					</div>
					<div class="card-body" id="welcomeNote-userInfo">
						<p class="card-text">
							<div><strong>${LOGINED_USER.name }</strong></div>
							<div>${LOGINED_USER.id }</div>
						</p>
					</div>
					<div class="card-footer">
						<select class="form-control">
							<option value="">일촌1</option>
							<option value="">일촌2</option>
							<option value="">일촌3</option>
							<option value="">일촌4</option>
						</select>
					</div>
				  </div>
			</div>
			
			<div class="col-7" id="main-frame">
				<div class="card" id="main-section">
					<div class="card-header">
						<h3 style="display: inline;"><a href="">${LOGINED_USER.name }님의 미니홈피</a></h3>
						<span style="float: right;">
							<button class="badge badge-primary badge-xs">수정</button>
							<span>http://www.latteworld.com/${miniHomeInfo.miniHome.address }</span>
						</span>
					</div>
					<div id="main-content">
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
							<div class="card" id="profile-intro">
							<img class="card-img-top" src="" alt="Card image cap">
								<div class="card-body">
								  <p class="card-text"></p>
								</div>
							</div>
							<div class="card" id="profile-keyword">
								<div class="card-header">
									키워드
								</div>
								<div class="card-body">
								  <p class="card-text"></p>
								</div>
							</div>
							<div class="card" id="profile-qna">
								
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
				</div>
			</div>
			
			<div class="col-1" id="main-menu">
					<div class="row mb-5 mt-5">
						<div class="col-12"></div>
					</div>
					<div class="row mb-2">
						<button id="btn-home" class="badge badge-primary" data-section-id="#home-section">홈</button>
					</div>
					<div class="row mb-2">
						<button id="btn-profile" class="badge badge-primary" data-section-id="#profile-section">프로필</button>
					</div>
					<div class="row mb-2">
						<button id="btn-diary" class="badge badge-primary" data-section-id="#diary-section">다이어리</button>
					</div>
					<div class="row mb-2">
						<button id="btn-photo" class="badge badge-primary" data-section-id="#photo-section">사진첩</button>
					</div>
					<div class="row mb-2">
						<button id="btn-video" class="badge badge-primary" data-section-id="#video-section">동영상</button>
					</div>
					<div class="row mb-2">
						<button id="btn-board" class="badge badge-primary" data-section-id="#board-section">게시판</button>
					</div>
					<div class="row mb-2">
						<button id="btn-visitor" class="badge badge-primary" data-section-id="#visitor-section">방명록</button>
					</div>
					<div class="row mb-2">
						<button id="btn-setting" class="badge badge-primary" data-section-id="#setting-section">관리</button>
					</div>
			</div>
			<div class="col-2">
				<div class="row mt-5">
					<div class="card">
						<div class="card-header">
							음악 플레이
						</div>
						<div class="card-body">
							<audio src="" controls autoplay loop muted preload="metadata"></audio>
						</div>
					</div>
				</div>
				<div class="row mt-5 mb-5"></div>
				<div class="row mt-5">
					<div class="card">
						<div class="card-header">
							광고
						</div>
						<div class="card-body">
							광고
						</div>
					</div>
				</div>
			</div>
		
	</div>
	</div>
	<script>
	// 스크롤
	/* $("#main-content").scroll(function() {
		var frameHeight = $(this).height();
		var contentHeight = $("#main-content .card-body").height();

		var scrollTop = $(this).scrollTop();
		
		if (contentHeight <= scrollTop + frameHeight + 1) {
			var imgs = "<div class='col-3 mb-3'><a href=''><img class='card-img' src='/resources/images/1000002.jpg'></a></div>";
			 $("#main-content .card-body > div").append(imgs);
		}
		
	}) */
	
	
	// 달력 생성 후 calendar변수에 저장
	var calendar;
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
        });
        calendar.render();
      });
	
	
	// 메인 메뉴 버튼 클릭 이벤트
	$("#main-menu button").click(function() {
		// 모든 섹션을 숨긴다.
		$("#main-content > .card-body").hide();
		$("#side-section > div").hide();
		
		var sectionId = $(this).data("section-id");
		
		$(sectionId + "-side li:first a").trigger("click");
		$(sectionId).show();
		$(sectionId + "-side").show();
		
		if (sectionId == "#diary-section") {
			calendar.refetchEvents();
		} else if (sectionId == "#photo-section") {
			
			$("#photo-folder-list").empty();
			
			axios.get("http://localhost/api/photo/parentFolder/" + ${miniHomeInfo.miniHome.no} + "&" + 100).then(function(response) {
				var parentFolders = response.data;
				var contentList = "<li><a href='' data-content-id='#photo-folder-" + parentFolders[0].parentNo + "'>전체보기</a></li>";
				
				for(var index = 0; index < parentFolders.length; index++) {
					contentList += "<li><a href='' data-content-id='#photo-folder-" + parentFolders[index].no + "'>" + parentFolders[index].name + "</a></li>";
				}
				$("#photo-folder-list").append(contentList);
			}) 
		} else if (sectionId == "#visitor-section") {
			axios.get("http://localhost/api/visitorNote/" + ${miniHomeInfo.miniHome.no} + "&" + 1).then(function(response) {
				var visitorNote = response.data;

				var noteContent = "<div class='card mb-5'><div class='card-header'><div class='row'><div class='col-6'>번호";
				noteContent += "<a href=''>" + visitorNote.userNo + "</a>(" + visitorNote.createdDate + ")</div>";
				noteContent += "<div class='col-6' id='visitorNote-settingButton'><a href=''>비밀로하기</a><a href=''>삭제</a><a href=''>신고</a></div></div></div>";
				noteContent += "<div class='row'><div class='col-3'><div class='card-body'><img class='card-img' src='resources/images/1000010.jpg'></div></div>";
				noteContent += "<div class='col-9'><div class='card-body'><p class='card-text'>" + visitorNote.content + "</p></div></div></div>";
				noteContent += "<div class='card-footer' id='visitorNote-addButton'><input type='checkbox'> 비밀로 하기<button type='btn btn-primary'>확인</button></div></div>"
				
				$("#visitor-section").append(noteContent);
			})
			$("#photo-folder-list").on("trigger");
			console.log($("#photo-folder-list li:first a"));
			
		}
	})
	$("#btn-home").trigger("click");
	
	$("#photo-folder-list").on("click", "li a", function() {
		$("#photo-section > div ").hide();
		
		var contentId = $(this).data("content-id");
		$(contentId).show();
		
		return false;
	});
	
	var profileNo;
	$("#profile-folder-list li a").click(function() {
		$("#profile-section > div ").hide();

		var contentId = $(this).data("content-id");
		
		if (contentId == "#profile-intro") {
			axios.get("http://localhost/api/profile/intro/" + ${miniHomeInfo.miniHome.no}).then(function(response) {
				var profile = response.data;
				$("#profile-intro img").prop("src", "/resources/images/" + profile.photoFilename);
				$("#profile-intro p").text(profile.content);
				
				profileNo=profile.no;
				
			}); 
		} else if (contentId == "#profile-keyword") {
			axios.get("http://localhost/api/profile/keyword/" + profileNo).then(function(response) {
				var keywords = response.data;
				var textContent="";
				for (var index = 0; index < keywords.length; index++) {
					textContent += " " + keywords[index].content;
				}
				
				$("#profile-keyword p").text(textContent);
			});
		} else if (contentId == "#profile-qna") {
			axios.get("http://localhost/api/profile/qna/" + profileNo).then(function(response) {
				var qnas = response.data;
				
				for (var index = 0; index < qnas.length; index++) {
					var content = "<div class='card'>";
					content += "<div class='card-header'>" + qnas[index].question + "</div>";
					content += "<div class='card-body'>" + qnas[index].answer + "</div>";
					content += "</div>"
					$("#profile-qna").append(content);
				}
			});
		} else if (contentId == "#profile-basicInfo") {
			axios.get("http://localhost/api/profile/basicInfo/" + ${miniHomeInfo.miniHome.userNo}).then(function(response) {
				var basicInfo = response.data;
				var contentTable = "<tr>";
				contentTable += "<th>이름</th><td>" + basicInfo.name + "</td><th>닉네임</th><td>" + basicInfo.nickName + "</td>";
				contentTable +="</tr>";
				contentTable += "<tr>";
				contentTable += "<th>생년월일</th><td>" + basicInfo.birthday + "</td><th>전화번호</th><td>" + basicInfo.tel + "</td>";
				contentTable +="</tr>";
				contentTable += "<tr>";
				contentTable += "<th>e-mail</th><td>" + basicInfo.id + "</td><th>주소</th><td>" + basicInfo.address + "</td>";
				contentTable +="</tr>";
				$("#profile-basicInfo tbody").append(contentTable);
			})
		}	
		
		$(contentId).show();
		return false;
	});

	
	
	$("#video-folder-list li a").click(function() {
		$("#video-section > div ").hide();
		
		var contentId = $(this).data("content-id");
		$(contentId).show();
		return false;
	});
	
	
	
	var index = 2;		
	$("#main-content").scroll(function() {
		var frameHeight = $(this).height();
		var contentHeight = $("#visitor-section").height();
		var scrollTop = $(this).scrollTop();
		
		if (contentHeight <= scrollTop + frameHeight + 200) {
			console.log(index);
			axios.get("http://localhost/api/visitorNote/" + ${miniHomeInfo.miniHome.no} + "&" + index).then(function(response) {
				var visitorNote = response.data;
				if (visitorNote == '') {
					return false;
				}
				var noteContent = "<div class='card mb-5'><div class='card-header'><div class='row'><div class='col-6'>번호";
				noteContent += "<a href=''>" + visitorNote.userNo + "</a>(" + visitorNote.createdDate + ")</div>";
				noteContent += "<div class='col-6' id='visitorNote-settingButton'><a href=''>비밀로하기</a><a href=''>삭제</a><a href=''>신고</a></div></div></div>";
				noteContent += "<div class='row'><div class='col-3'><div class='card-body'><img class='card-img' src='resources/images/1000010.jpg'></div></div>";
				noteContent += "<div class='col-9'><div class='card-body'><p class='card-text'>" + visitorNote.content + "</p></div></div></div>";
				noteContent += "<div class='card-footer' id='visitorNote-addButton'><input type='checkbox'> 비밀로 하기<button type='btn btn-primary'>확인</button></div></div>"
				
				$("#visitor-section").append(noteContent);
			})
			index++;
		}
		
	})
	</script>
</body>
</html>