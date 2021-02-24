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
<style type="text/css">
	#minihome-blank {
			height: 20px;
		}
		#side-content {
			height: 380px;
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
		#side-section, #main-section {
			height: 580px;
		}
		#side-section {
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
		#welcomeNote-img-box {
			width:196px;
			height: 200px;
			display: table-cell;
			text-align: center;
			vertical-align: middle;
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
						TODAY ${miniHome.todayCnt } | TOTAL ${miniHome.totalCnt }
					</div>
					<div id="side-content">
						
					</div>
					<div class="card-body" id="welcomeNote-userInfo">
						<p class="card-text">
							<div><strong>${hostUser.name }</strong></div>
							<div>${hostUser.id }</div>
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
						<h3 style="display: inline;"><a href="">${hostUser.nickName }님의 미니홈피</a></h3>
						<span style="float: right;">
							<button class="badge badge-primary badge-xs">수정</button>
							<span>http://www.latteworld.com/${miniHome.address }</span>
						</span>
					</div>
					<div id="main-content">

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
<script type="text/javascript">

		
	// 메인메뉴 버튼이 클릭될 때 이벤트
	$("#main-menu button").click(function() {
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		
		// 메인메뉴 버튼에 해당한 sideSection.jsp의 태그를 불러온다.
		$("#side-content").load("sideSection.do " + $(this).data("section-id") + "-side", {sectionId:$(this).data("section-id"), miniHomeNo:${miniHome.no}} , function() {
			// sideSection의 li:first a에 해당하는 태그가 클릭되는 콜백함수
			$("#side-content li:first a").trigger("click");
			
		});		
	})
	// 페이지가 로드되면 홈 버튼 클릭되게한다.
	$("#btn-home").trigger("click");
		
	// sideSection의 a 태그가 클릭될 때 이벤트
	$("#side-content").on("click", "li a", function() {
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + $(this).data("content-id"), {contentId:$(this).data("content-id")});
		loadComplete();
		return false;
	})
		
		
		

		
	
		
</script>
</body>
</html>