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
	<link href='/resources/calendar/main.css' rel='stylesheet' />
    <script src='/resources/calendar/main.js'></script>
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
			width: 7rem;
		}
		#main-frame {
			padding-right: 0;
		}
		#side-frame {
			padding-right: 0;
		}
		#calendar {
			width:99%;
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
		#profile-intro img {
			width: 500px;
		}
		#profile-intro .card-body:first{
			width: 500px;
			height: 400px;
			display: table-cell;
			text-align: center;
			
		}
		
</style>
</head>

<body>
	<div class="container-fluid" id="mini-home">
		<div class="row mt-3">
			
			<div class="col-2" id="side-frame">
				<div class="card" >
					<div class="card-header">
						<div class="row">
							<div class="col-5">
								<small>today ${miniHome.todayCnt }</small>
							</div>
								<small>|</small>
							<div class="col-5">
								<small>total ${miniHome.totalCnt }</small>
							</div>
						</div>
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
						<div class="row">
							<div class="col-7">
								<h3 style="display: inline;"><a href="">${hostUser.nickName }님의 미니홈피</a></h3>
							</div>
							<div class="col-1">
								<button class="badge badge-primary badge-xs">수정</button>
							</div>
							<div class="col-4">
								<small>http://www.latteworld.com/${miniHome.address }</small>
							</div>
						</div>
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
		
		var sectionId = $(this).data("section-id");
		// 메인메뉴 버튼에 해당한 sideSection.jsp의 태그를 불러온다.
		$("#side-content").load("sideSection.do " + sectionId + "-side", {sectionId:sectionId, miniHomeNo:${miniHome.no}}, function() {

			// 다이어리 버튼을 눌렀을 때, 사이드컨텐츠에 달력 출력 
			if (sectionId == "#diary-section") {
				initCalendar();
				// 메인컨텐츠가져오기
				$("#main-content").load("mainSection.do " + sectionId, {contentId:sectionId, miniHomeNo:${miniHome.no}});		
				
			} else {
				// sideSection의 li:first a에 해당하는 태그가 클릭되는 콜백함수
				$("#side-content li:first a").trigger("click");
			}
		});
	})
	// 페이지가 로드되면 홈 버튼 클릭되게한다.
	$("#btn-home").trigger("click");
		
	
	
	
	// sideSection의 a 태그가 클릭될 때 이벤트(프로필 폴더, 게시판 폴더들)
	$("#side-content").on("click", "li a", function() {
		var contentId = $(this).data("content-id");
		
		// 게시판인 경우 실행
		var folderNo = $(this).data("folder-no");
		if(folderNo > 0) {
			// 게시판 폴더리스트 나오게 하는 실행문
			axios.get("http://localhost/minihome/api/folder/" + folderNo).then(function(response) {
				var folders = response.data;
				
				var childFolderList = "";
				for (var index = 0; index < folders.length; index++) {
					childFolderList += "<li><a href='' data-folder-no='" + folders[index].no + "' data-content-id='#visualContents-section'>" + folders[index].name + "</a></li>";
				}
				
				$("#childFolder-" + folderNo).empty().append(childFolderList);
				
			})
		}
		// 게시판쪽이 아니라면
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + contentId, {contentId:contentId, miniHomeNo:${miniHome.no}, folderNo:folderNo});

		
		return false;
	})
	
	
	
	
	
	// Diary 달력
	//달력 생성 후 calendar변수에 저장
	var calendar;
	function initCalendar() {
		var calendarEl = document.getElementById('calendar');
	    calendar = new FullCalendar.Calendar(calendarEl, {
	    	initialView: 'dayGridMonth',
	    	events: function(info, successCallback, failureCallback) {
				var yearMonth = moment().format("YYYYMM");
	      		axios.get("http://localhost/minihome/api/diary/eventList/" + yearMonth + "&" + ${miniHome.no}).then(function(response) {
	      			successCallback(response.data);
	      		})
	      	},
	      	eventClick: function(info) {
				axios.get("http://localhost/minihome/api/diary/" + info.event.id).then(function(response) {
					var diary = response.data;
					$("#diary-title").text(diary.title);
					$("#diary-content").text(diary.content);
					var secret = "공개여부 : ";
					if (diary.secret == "N") {
						secret += "전체공개 "
					} else if(diary.secret == "Y") {
						secret += "비공개";
					}
					secret += "<small>(" + moment(diary.createdDate).format("YYYY-MM-DD") + ")</small>";
					$("#diary-secret > p").empty().append(secret);
				}) 		
	      	}
	      
	    });
	    calendar.render();
	}
	
</script>
</body>
</html>