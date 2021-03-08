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
		audio {
			width: 100%;
		}
		#main-menu {
			padding-right: 0;
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
							<div class="col-8">
								<h3 style="display: inline;"><a href="">${hostUser.nickName }님의 미니홈피</a></h3>
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
			<div class="col-3">
				<div class="row mt-5 mb-5">
					<audio src="" controls autoplay loop preload="metadata"></audio>
				</div>
				<div class="row mt-5" id="main-menu">
					<div class="col-12">
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
					</div>
					
				</div>
				<div class="row mt-5">
					<div class="col-12">
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
	</div>
<script type="text/javascript">
	var sectionId;
	var contentId;
	var folderNo;
	var pageNo;
	var isInfiniteScroll=true;
	
	// 메인메뉴 버튼이 클릭될 때 이벤트
	$("#main-menu button").click(function() {
		// 무한스크롤 위한 페이지 번호
		pageNo = 1;
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		
		sectionId = $(this).data("section-id");
		// 메인메뉴 버튼에 해당한 sideSection.jsp의 태그를 불러온다.
		$("#side-content").load("sideSection.do " + sectionId + "-side", {sectionId:sectionId, miniHomeNo:${miniHome.no}}, function() {
			isInfiniteScroll=false;
			// 다이어리 버튼을 눌렀을 때, 사이드컨텐츠에 달력 출력 
			if (sectionId == "#diary-section") {
				boardFormId="diary";
				initCalendar();
				// 메인컨텐츠가져오기
				$("#main-content").load("mainSection.do " + sectionId, {contentId:sectionId, miniHomeNo:${miniHome.no}});		
				
			} else if (sectionId == "#visitor-section") {
				// 메인컨텐츠가져오기
				$("#main-content").load("mainSection.do " + sectionId, {contentId:sectionId, miniHomeNo:${miniHome.no}});		
			} else if (sectionId == "#home-section") {
				isInfiniteScroll=true;
				$("#main-content").load("mainSection.do " + sectionId, {contentId:sectionId, miniHomeNo:${miniHome.no}}, function() {
				});		
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
		
		contentId = $(this).data("content-id");
		boardFormId = contentId;
		// 게시판인 경우 실행
		folderNo = $(this).data("folder-no");
		if(folderNo > 0) {
			// 무한스크롤 위한 페이지 번호
			pageNo = 1;
			// 게시판 폴더리스트와 해당 폴더의 내용이 나오게 하는 실행문
			axios.get("http://localhost/minihome/api/folder/" + folderNo).then(function(response) {
				var folders = response.data;
				// 최하위 폴더를 클릭했을 때는 더 추가할 폴더가 없으므로 실행하지 않는다.
				if (folders.length != 0) {
					var childFolderList = "";
					if (folders[0].categoryNo != 300) {
						isInfiniteScroll = true;
						for (var index = 0; index < folders.length; index++) {
							childFolderList += "<li><a href='' data-folder-no='" + folders[index].no + "' data-content-id='#visualContents-section'>" + folders[index].name + "</a></li>";
						}
					} else {
						isInfiniteScroll = false;
						for (var index = 0; index < folders.length; index++) {
							childFolderList += "<li><a href='' data-folder-no='" + folders[index].no + "' data-content-id='#board-section'>" + folders[index].name + "</a></li>";
						}
					}
					$("#childFolder-" + folderNo).empty().append(childFolderList);
				}
				
			})
		}
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + contentId, {contentId:contentId, miniHomeNo:${miniHome.no}, folderNo:folderNo});

		return false;
	})
	
	// 무한 스크롤
	$("#main-content").scroll(function() {
		// 게시글 상세보기 때는 실행 안함
		if (isInfiniteScroll) {
			var frameHeight = $(this).height();
			var contentHeight = $("#main-content .card-body").height();
	
			var scrollTop = $(this).scrollTop();
			if (contentHeight <= scrollTop + frameHeight + 50) {
				pageNo++;
				if (sectionId == "#home-section") {
					axios.get("http://localhost/minihome/api/home/" + ${miniHome.no} + "&" + pageNo).then(function(response) {
						var boards = response.data;
						var imgs = "";
						for (var index = 0; index < boards.length; index++) {
							imgs += "<div class='col-3 mb-3'><a href='' data-board-no='" + boards[index].no + "' data-content-id='#visual-content-detail'><img class='card-img' src='/resources/images/" + boards[index].imgFilename + "'></a></div>";
							
						}
						
						$("#contents").append(imgs);
					})
				} else {
					axios.get("http://localhost/minihome/api/boards/" + folderNo + "&" + pageNo).then(function(response) {
						var boards = response.data;
						var imgs = "";
						for (var index = 0; index < boards.length; index++) {
							imgs += "<div class='col-3 mb-3'><a href='' data-board-no='" + boards[index].no + "' data-content-id='#visual-content-detail'><img class='card-img' src='/resources/images/" + boards[index].imgFilename + "'></a></div>";
						}
						
						$("#contents").append(imgs);
			
					})
				}
				
			}
		}
	})
	
	
	// Diary 달력
	//달력 생성 후 calendar변수에 저장
	var calendar;
	function initCalendar() {
		var calendarEl = document.getElementById('calendar');
	    calendar = new FullCalendar.Calendar(calendarEl, {
	    	initialView: 'dayGridMonth',
	    	events: function(info, successCallback, failureCallback) {
				var start = info.start;
				var end = info.end;
	      		axios.get("http://localhost/minihome/api/diary/eventList/" + start + "&" + end + "&" + ${miniHome.no}).then(function(response) {
	      			console.log(response.data);
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
	
	// 사진, 동영상 디테일뷰
	$("#main-content").on("click", "#contents a", function() {
		isInfiniteScroll = false;
		var contentId = $(this).data("content-id");
		var boardNo = $(this).data("board-no");
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + contentId, {contentId:contentId, miniHomeNo:${miniHome.no}, boardNo:boardNo});
		
		return false;
	})
	
	// 게시판 디테일뷰
	$("#main-content").on("click", "table a", function() {
		isInfiniteScroll = false;
		var contentId = $(this).data("content-id");
		var boardNo = $(this).data("board-no");
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + contentId, {contentId:contentId, miniHomeNo:${miniHome.no}, boardNo:boardNo});
		
		return false;
	})
	
	// 게시판 페이지네이션 버튼 클릭했을때
	$("#main-content").on("click", "li a", function() {
		isInfiniteScroll = false;
		var contentId = $(this).data("content-id");
		// 메인컨텐츠 안의 내용 지우기
		$("#main-content").empty();
		// 메인컨텐츠 안에 내용 넣기
		$("#main-content").load("mainSection.do " + contentId, {contentId:contentId, miniHomeNo:${miniHome.no}, folderNo:folderNo, pageNo:$(this).data("page-no"), rows:5});
		return false;
	})	
	
	// 프로필 소개쪽 버튼
	$("#main-content").on("click", "#profile-intro a", function() {
		var formId = $(this).data("form-id");
		if ("#intro-delete" == formId) {
			var formData = new FormData();
			formData.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/deleteIntro.do', formData).then(function() {
					$("#btn-profile").trigger("click");
				})
		} else {
			$("#main-content").load("form.do " + formId, {miniHomeNo:${miniHome.no}, formId:formId});
		}
		
		return false;
	})
	
	// 프로필 소개글 등록 버튼(submit역할)
	$("#main-content").on("click", "#intro-insert a", function() {
		var formData = new FormData();
		formData.append("photoFile", $("#photoFile")[0].files[0]);
		formData.append("content", $("#intro-content").val()),
		formData.append("miniHomeNo", ${miniHome.no})
		axios.post('http://localhost/minihome/api/insertIntro.do', formData, {
			  headers: {
			    'Content-Type': 'multipart/form-data'
			  }
			}).then(function() {
				$("#btn-profile").trigger("click");
			})
			
		return false;
	})

	// 글 수정 버튼(submit역할)
	$("#main-content").on("click", "#intro-modify a", function() {
		var formData = new FormData();
		formData.append("content", $("#intro-content").val()),
		formData.append("miniHomeNo", ${miniHome.no})
		axios.post('http://localhost/minihome/api/modifyIntro.do', formData).then(function() {
				$("#btn-profile").trigger("click");
			})
			
		return false;
	})

	// 프로필 키워드쪽 버튼
	$("#main-content").on("click", "#profile-keyword a", function() {
		var formId = $(this).data("form-id");
		if ("#keyword-delete" == formId) {
			var formData = new FormData();
			formData.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/deleteKeyword.do', formData).then(function() {
					$("#keyword").trigger("click");
				})
		} else {
			$("#main-content").load("form.do " + formId, {miniHomeNo:${miniHome.no}, formId:formId});
		}
		
		return false;
	})
	
	// 키워드 등록 버튼(submit역할)
	$("#main-content").on("click", "#keyword-insert a", function() {
		var formData = new FormData();
		formData.append("content", $("#keyword-content").val());
		formData.append("miniHomeNo", ${miniHome.no});
		axios.post('http://localhost/minihome/api/insertKeyword.do', formData).then(function() {
			$("#keyword").trigger("click");
		})
			
		return false;
	})
	
	// 프로필 qna쪽 버튼
	$("#main-content").on("click", "#profile-qna a", function() {
		var formId = $(this).data("form-id");
		if ("#qna-delete" == formId) {
			var formData = new FormData();
			formData.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/deleteQna.do', formData).then(function() {
					$("#qna").trigger("click");
				})
		} else {
			$("#main-content").load("form.do " + formId, {miniHomeNo:${miniHome.no}, formId:formId});
		}
		
		return false;
	})
	
	// 프로필 qna 질문 추가 또는 제출
	$("#main-content").on("click", "#qna-insert a", function() {
		
		var btnId = $(this).data("btn-id");
		if ("add-qna" == btnId) {
			var qnaBox = "<div class='card mt-3'><div class='card-header'></div><div class='card-body'><div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text'>질문</span></div><input type='text' class='form-control' name='question'></div>";
			qnaBox += "<div class='input-group mb-3'><div class='input-group-prepend'><span class='input-group-text'>대답</span></div><input type='text' class='form-control' name='answer'></div></div></div>";
			$("#qna-content").append(qnaBox);
		} else if ("delete-qna" == btnId) {
			$("#qna-content > div:nth-child(2)").remove();
		} else if ("submit-qna" == btnId) {
			var qnaLength = $("input[name=question]").length;
			var questions = [];
			var answers = [];
			for (var index = 0; index < qnaLength; index++) {
				questions.push($("input[name=question]").eq(index).val());
				answers.push($("input[name=answer]").eq(index).val());
			}
			var data = new FormData;
			data.append("questions", questions);
			data.append("answers", answers);
			data.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/insertQna.do', data).then(function() {
				$("#qna").trigger("click");
			})
			
		}		
		return false;
	})

	// 다이어리쪽 버튼
	$("#main-content").on("click", "#diary-section a", function() {
		var formId = $(this).data("form-id");
		if ("#diary-delete" == formId) {
			axios.get('http://localhost/minihome/api/deleteDiary/' + $(this).data("diary-no")).then(function() {
			$("#btn-diary").trigger("click");
			})
		} else {
			$("#main-content").load("form.do " + formId, {miniHomeNo:${miniHome.no}, formId:formId, diaryNo:$(this).data("diary-no")});
		}
		return false;
	})
	
	// 다이어리 submit버튼
	$("#main-content").on("click", "#diary-forms a", function() {
		console.log($(this).data("btn-id"));
		if ("btn-modify-diary" == $(this).data("btn-id")) {
			var data = new FormData;
			data.append("title", $("input[name=title]").val());
			data.append("content", $("textarea[name=content]").val());
			data.append("diaryNo", $(this).data("diary-no"));
			data.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/modifyDiary.do', data).then(function() {
				$("#btn-diary").trigger("click");
			})
		} else {
			var data = new FormData;
			data.append("title", $("input[name=title]").val());
			data.append("content", $("textarea[name=content]").val());
			data.append("miniHomeNo", ${miniHome.no});
			axios.post('http://localhost/minihome/api/insertDiary.do', data).then(function() {
				$("#btn-diary").trigger("click");
			})
		}
		return false;
	})
	
	// 사진첩쪽 버튼
	$("#main-content").on("click", "#visualContent-btn a", function() {
		var formId = $(this).data("form-id");
		if ("#visualContent-delete" == formId) {
			axios.get('http://localhost/minihome/api/deleteVisualContent/' + $(this).data("board-no")).then(function() {
				$("#btn-photo").trigger("click");
			})
		} else {
			$("#main-content").load("form.do " + formId, {miniHomeNo:${miniHome.no}, formId:formId, folderNo:folderNo, boardNo:$(this).data("board-no")});
		}
		return false;
	})
	
	// 사진첩 글 등록 버튼(submit역할)
	$("#main-content").on("click", "#visualContent-insert a", function() {
		var formData = new FormData();
		formData.append("photoFile", $("#photoFile")[0].files[0]);
		formData.append("title", $("input[name=title]").val());
		formData.append("content", $("textarea[name=content]").val());
		formData.append("folderNo", folderNo);		
		formData.append("miniHomeNo", ${miniHome.no});
		axios.post('http://localhost/minihome/api/insertVisualContent.do', formData, {
			  headers: {
			    'Content-Type': 'multipart/form-data'
			  }
			}).then(function() {
				$("#btn-photo").trigger("click");
			})
		return false;
	})

	// 사진첩 글 수정 버튼(submit역할)
	$("#main-content").on("click", "#visualContent-modify a", function() {
		var formData = new FormData;
		formData.append("title", $("input[name=title]").val());
		formData.append("content", $("textarea[name=content]").val());
		formData.append("boardNo", $(this).data("board-no"));
		formData.append("miniHomeNo", ${miniHome.no});
		axios.post('http://localhost/minihome/api/modifyVisualContent.do', formData).then(function() {
			$("#btn-photo").trigger("click");
		})
		return false;
	})
	
</script>
</body>
</html>