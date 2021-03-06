<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<script src="/resources/js/moment.js"></script>
<style>
	/* 네브바 스타일 시작 */
	#nav {
		border: 1px black;
		width: 100%;
	}

	#nav-ul {
		font-size: 21px;
		margin-left: 20px;
	}

	#nav-menu-li {
		margin-left: 25px;
	}
	.loginbox-msg {
		font-size: 8px;
		color: crimson;
	}
	#loginbox-failMsg{
		font-weigh: 300px;
		margin-left: 10px;
	}
	/* 아이디,비밀번호 찾기 */
	#btn-findId {
		border-style: none;
		padding: 0px 10px 0px 0px;
		margin: 10px 1px 0px 1px;
		width: 110PX;
		height: 25px;
		text-align: right;
		font-size: 7px;
		color: rgb(218, 108, 64);
		float: right;
	}

	/* 아이디 비밀번호 찾기 모달창 */
	.nav-pills {
		margin: 15px;
		flex-wrap: nowrap;
	}
	.nav-item.col-6 {
		margin: 1px;
	}
	a.nav-link {
		color: #070502;
		text-align: center;
	}
	.nav-pills .nav-link.active,
	.nav-pills .show>.nav-link {
		color: rgb(255, 140, 45);
		background-color: white;
	}
	.find-label {
		margin: 10px 10px;
		text-align: right;
	}
	input.find-input {
		width: 60%;
		margin-top: 20px;
	}
	.nav-item {
		margin-left: 0px;
		padding: 0px 5px;
	}
	.find-btn.id-btn {
		float: right;
		margin-right: 55px;
		margin: 10px 55px;
	}

	.find-btn.pwd-btn {
		float: right;
		margin-right: 55px;
		margin: 10px 55px;
	}

	.find-btn.id-login {
		float: right;
	}

	.find-msg {
		text-align: right;
		font-size: 15px;
		color: crimson;
		padding: 10px;
		margin: 0px 55px 10px 0px;
	}

	.user-name-sp {
		font-size: 16px;
		font-weight: bold;
	}

	.found-id-sp {
		font-size: 20px;
		color: rgb(250, 122, 2);
	}
	.tmp-Pwd-sp{
		font-size: 20px;
		color: rgb(250, 122, 2);
		
	}
	/* 로그인 사용자 정보창 */
	.card-body#user-info-box,
	.card-body#login-box{
		padding: 0px;
	}
	.col-12#info-btn{
		margin: 0px;
	}
	#logo-img {
		margin-top: 20px;
		width: 180px;
		height: 200px;
		float: right
	}
	.col-sm-12#info-top-line{
		padding: 0em;
	}
	
	#user-img {
		width: 115px;
		height: 120px;
		float: inherit;
	}
	.info-table{margin-left: 0px; margin-right: 1px}
	.info-table tr,td,th{
		font-size: 13px;
	}
	#info-box-footer{
		padding: 0rem .25rem;
	}
	#btn-minihp {
		background-color: rgb(255, 172, 199);
		color: floralwhite;
		width: 100%;
		
		text-align: center;
		margin: 5px auto;
		border: none;
	}

	#my-minihp {
		color: white;
	}

	#friend-box {
		background-color: rgb(208, 142, 221);
		color: floralwhite;
		margin: 5px auto;
		width: 100%;
		
		border: none;
		align-content: center;
	}

	/*쪽지 모달창*/
	.card-body#note-modal{
		padding: 10px;
	}
	#btn-noteModal{
		font-size: 10px;
		padding: 2px;
	}
	.info-btn {
		margin-top: 2px 0px 0px 0px;
		padding: 0px;
		float: right;
		font-size: 8px;
	}

	.info-btn button {
		border: none;
		margin: 0px;
	}
	.note-table-tr{
		border-bottom: 2px solid lightgray;
	}
	.note-table-tr>th{
		margin-bottom: 3px;
	}
	button.del-btn{
		margin: 5px;
		padding: 0px;
		border: none;
		background-color: white; 
		font-weight: bolder;
		color: gray;
		
	}
	.btn-group#friend-btn{
		float: right;
	}
	.dropdown-menu#friend-downMenu{
		width: 80px;
	}
	#accept-btn{
		color: green;
		width: 40px;
		font-size: 15px;
		padding: 5px;
		margin: 5px;
	}
	#deny-btn{
		color: red;
		width: 40px;
		font-size: 15px;
		padding: 5px;
		margin: 5px;
	}
	#btn-note {
		border: none;
		margin: 0px;
		padding: 1px;
		float: left;
		font-size: 14px;
	}
	.card-header flex-container{
		display: flex;
		float: left;
		padding: 2px;
	}
	#btn-close{
		float: right;
	    font-size: 1.5rem;
	    font-weight: 700;
	    line-height: 1;
	    height: 19px;
	    color: #000;
	    text-shadow: 0 1px 0 #fff;
	    padding: 0;
	    background-color: transparent;
	    border: 0;
	    flex: 1;
	}
	#modal-h{
		float: left;
		width: 143px;
		margin: 0px;
		flex: 1;
	}
	div.card-body#paging{
		hight: 45px;
		padding: 0px;
	}
	.info-table {
		padding: 1px;
		margin-top: 1px;
		width: 100%;
	}

	#info-tr th {
		font-weight: 600;
	}

	.info-table th {
		text-align: left;
		padding-left: 17px;
	}

	.info-table td {
		text-align: right;
		margin-right: 4px;
	}

	.modal-content {
		width: 570px;
	}

	.modal-body {
		padding: 8px;
	}

	.card-body #modal-cd-body,
	#modal-cd-last {
		font-size: small;
		padding: 8px;
	}

	.card-table th,td {
		border-bottom: 1px black;
		margin-left: 1px;
	}

	/* 네브바 스타일 끝 */
</style>

<div class="row mt-3" id="nav" style="height: 237px; max-height: 237px;">
	<div class="col-12">
		<div class="row" style="height: 237px; max-height: 237px;">
			<!-- 로고 존 -->
			<div class="col-2" id="nav-logo" style="height: 237px; max-height: 237px;">
				<a href="http://localhost/main.do"> <img class="nav-logo-img" id="logo-img" src="/resources/images/logo.jpg"
						alt="logo" />
				</a>
			</div>

			<!-- 검색창/메뉴바 존 -->
			<div class="col-7 p-3" id="nav-menu" style="height: 237px; max-height: 237px;">
				<!-- 검색창 -->
				<div class="row mb-4">
					<div class="col-12 mt-5 d-flex justify-content-center">
						<select name="검색엔진" id="search-engine" class="form-control mr-2" style="width: 100px;">
							<option value="google">구글</option>
							<option value="naver">네이버</option>
							<option value="daum">다음</option>
						</select> 
						<input type="text" class="form-control" id="search-keyword" placeholder="Search" style="width: 50%;">
						<button class="btn btn-success ml-1" type="button" onclick="search()">검색</button>
					</div>
				</div>
				<!-- 메뉴바 -->
				<div class="row mt-5">
					<div class="col-12">
						<nav class="navbar navbar-expand-sm justify-content-center bg-light navbar-light font-sixe">
							<ul class="navbar-nav" id="nav-ul">
								<!-- 메뉴바 반복 -->
								<!-- 메뉴바 하나 시작 -->
								<li class="nav-item text-size: 20px" id="nav-menu-li">
									<a class="nav-link" href="/news/main.do" id="navbardrop"> 뉴스 </a>
								</li>
								<li class="nav-item" id="nav-menu-li">
									<a class="nav-link" href="/board/index.do" id="navbardrop"> 라떼판 </a>
								</li>
								<li class="nav-item dropdown" id="nav-menu-li">
									<a class="nav-link" href="/shopping/main.do" id="navbardrop"> 쇼핑 </a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- 메뉴바 끝 -->

			<!-- 로그인창 -->
			<c:if test="${empty LOGINED_USER}">
			<div class="col-3" id="nav-login" style="height: 237px; max-height: 237px;">
				<form action="login.do" method="post" id="login-form">
				<input type="hidden" id="pathName" name="pathName" value="main"  />
					<div class="card login-box">
						<div class="card-body mt-3" id="login-box">
							<div class="card-item col-12">
								<label>아이디</label>
								<button type="button" class="form-control" data-toggle="modal" data-target="#modal-findId" id="btn-findId" @click="findId()"> 아이디/비밀번호 찾기</button>
								<input type="text" class="form-control" name="id" id="loginbox-id" />
								<span class="loginbox-msg" id="loginbox-idMsg"></span>
							</div>
							<div class="card-item col-12 mt-2">
								<label>비밀번호</label> 
								<input type="password" class="form-control" name="pwd" id="loginbox-pwd" /> 
								<span class="loginbox-msg" id="loginbox-pwdMsg"></span>
							</div>
							<c:if test="${not empty message }">
								<span class="loginbox-msg" id="loginbox-failMsg" >${message}</span>
							</c:if>
							<div class="col-12 text-right mt-2 mb-1">
								<button type="button" class="btn-sm btn-info" id="btn-register"><a href="/register.do"> 회원가입</a></button>
								<button type="button" class="btn-sm btn-primary" id="btn-login" onclick="loginCheck()">로그인</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			</c:if>

			<!-- 사용자 정보창 -->
			<c:if test="${not empty LOGINED_USER}">
			<div class="col-3" id="nav-info">
				<!-- 정보창 1열 프로필사진 정보 -->
				<div class="row">
					<div class="card" style=" max-height: 237px;">
						<div class="card-body" id="user-info-box">
							<div class="col-sm-12" id="info-top-line" style="height: 155px; max-height: 163px;">
							<div class="row no-gutters">
								<div class="col-sm-5">
									<img class="ml-1 mt-3 border" id="user-img" src="/resources/images/userProfilePhoto/${LOGINED_USER.photo }" alt="userPhoto" />
								</div>
								<div class="col-sm-7 mt-1">
									<button class="info-btn btn-sm btn-warning mr-1"
									 data-toggle="modal" data-target="#myProfile"
									 @click="modifyProfile(${LOGINED_USER.no })" id="btn-profile">
										프로필 수정
									</button>
									<button class="info-btn btn-sm btn-secondary mr-1" id="btn-logout" type="button" onclick="logout()">
										Logout
									</button>
									<table class="info-table table-borderless" id="info-t">
										
										<thead>
											<tr id="info-tr">
												<th>${LOGINED_USER.name }(${LOGINED_USER.nickName})님</th>
												<td>
													<button class="btn btn-outline-info" id="btn-noteModal" 
														data-toggle="modal" data-target="#modal-note">
														쪽지함</button>
												</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th>도토리수</th>
												<td><a href="/shopping/my/acornhistory.do">${LOGINED_USER.acornCnt}개</a></td>
											</tr>
											<tr>
												<th>받은 쪽지</th>
												<td>${UNREADNOTE_NORMAL_CNT}개</td>
											</tr>
											<tr>
												<th>일촌신청</th>
												<td>${UNREADNOTE_FRIEND_CNT}개</td>
											</tr>
											<tr>
												<th>오늘 방문자수</th>
												<td>${TODAY_VISITOR }명</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							</div>
							<!-- 정보창 2열 내미니홈피 버튼 -->
							<div class="card-footer" id="info-box-footer">
								<div class="hp-row row no-gutters">
									<button type="button" id="btn-minihp" onclick="openMiniHome()">
										내미니홈피 가기
									</button>
								</div>
									<!-- 정보창 3열 일촌 파도타기 셀렉트박스 -->
								<div class="fr-row row no-gutters">
									<select name="selectFriend" id="friend-box" onchange="openFriendMiniHome()">
										<option value="-1" selected>---일촌파도타기---</option>
										<c:forEach items="${FRIEND_LIST }" var="friend">
											<option value="${friend.friendMiniHomeNo }">${friend.friendTotalName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:if>
			
					</div>
				</div>
			</div>

<!-- 아이디 비밀번호 찾기 모달창 시작  -->
<%@ include file="findIdModal.jsp" %>
<!-- 프로필 편집 모달창 -->
<%@ include file="myProfileModal.jsp" %>

<!-- 쪽지함 모달창 -->
<%@ include file="noteModal.jsp" %>


<script>
	// -------- 아이디 비번 찾기 -----------
	var foundId;
	var isLogined = false;
	var curPathName = window.location.pathname;
	
	//쪽지함 클릭시 첫 리스트 반환
	$("#modal-note").on("show.bs.modal", function() {
	    $("a[href='#normal']").trigger('click');
		noteApp.changeTab('normal', 1)
	})
	
	   
	function findMyId() {
		// 입력한 이름과 연락처를 받아온다.
		var nameField = $('#i-name').val();
		var telField = $('#i-tel').val();
		// 컨트롤러에 이름과 연락처를 보내 사용자를 조회한다. 
		if (nameField == "" || telField == "") {
			$('#findId-msg').show();
			$('#findId-msg').text("이름과 연락처를 모두 입력해주세요.")
			return;
		} else {
			$('#findId-msg').hide();
			$.getJSON('http://localhost/api/users/findId.do', { name: nameField, tel: telField }, function (user) {
				if (user.id == null) {
					$('#findId-success').hide();
					$('#findId-fail').show();
				} else {
					$('#findId-fail').hide();
					$('#findId-success').show();
					$('.user-name-sp').text(user.name);
					$('.found-id-sp').text(user.id);
					foundId = user.id;
				}
			})
		}
	}

	function findMyPwd() {
		// 입력한 이름과 연락처를 받아온다.
		var nameField = $('#p-name').val();
		var telField = $('#p-tel').val();
		var idField = $('#p-id').val();
		// 컨트롤러에 이름과 연락처를 보내 사용자를 조회한다. 
		if (nameField == '' || telField == '' || idField == '') {
			$('#findPwd-msg').show();
			$('#findPwd-msg').text("이름, 연락처, 아이디를 모두 입력해주세요.")
			return;
		}
		$.getJSON('http://localhost/api/users/findPwd.do', { name: nameField, tel: telField, id: idField }, function (result) {
			if (result.status == "fail") {
				$('#findPwd-success').hide();
				$('#findPwd-fail').show();
			} else {
				$('#findPwd-fail').hide();
				$('#findPwd-success').show();
				$('.found-id-sp').text(result.id);
				$('.user-name-sp').text(result.userName); 
				$('.tmp-Pwd-sp').text(result.tmpPwd);
			}
		})
	}
	
	
	
	function loginWithId() {
		// 로그인 폼으로 보낼 때 아이디 입력란에 입력되어 있도록 함
		$("#loginbox-id").val(foundId);
		$("#modal-findId").modal('hide');
	}

	function loginCheck() {
		//console.log("###로그인체크 호출");
		console.log("###pathName===>" + curPathName);
		$("#loginbox-idMsg").text("");
		$("#loginbox-pwdMsg").text("");
		//로그인 누르면 입력칸 중에 비어있는 거 확인
		if ($("#loginbox-id").val() == '') {
			$("#loginbox-idMsg").text("* 아이디를 입력하세요.");
		}
		if ($("#loginbox-pwd").val() == '') {
			$("#loginbox-pwdMsg").text("* 비밀번호를 입력하세요.");
		}
		// 비어있지 않으면 로그인 메서드 실행
		if (!$("#loginbox-id").val() == '' && !$("#loginbox-pwd").val() == '') {
			$('#pathName').val(curPathName);
			$("#login-form").submit();
		}
	}
	
	function logout() {
		console.log("로그아웃 실행");
		$.get('http://localhost/logout.do',{pathName: curPathName}, function(result){
			console.log("응답URL", result)
			location.href = result;
		})
	}
	
	// ------------ 사용자 정보창 ------------------
	/* 
		onkeyup="search()"
		function search(){
     	var $ul = $("#box-search-result ul").empty()
		var keyword = $("#search-keyword").val();
		console.log("검색어: " + keyword);
		axios.get("https://dapi.kakao.com/v2/search/web?query="+keyword,{
			headers:{
                "Authorization": "KakaoAK 3c4ab1d2bef4352eb0d6ca927f15bea7"
          }}).then(function (response) {
        	  console.log("검색어 api 응답: ",response.data);
        	  $.each(response.data.documents, function(index, document) {
        		  var item = '<li class="list-group-item">'
        		  item += '<a href="'+document.url+'" target="_blank">'+document.title+'</a>'
        		  item += '</li>'
        		  $ul.append(item);
        	  })
			
		})
	}
	*/
	
	function search() {
		var selectedSearchEngine = $("#search-engine option:selected").val();
		var keyword = $("#search-keyword").val();
		console.log(selectedSearchEngine);
		console.log(keyword);
		
		if(selectedSearchEngine=='google'){
			window.open('https://www.google.com/search?q='+keyword+'&ie=UTF-8', '_blank');
		}else if(selectedSearchEngine == 'naver'){
			window.open('http://search.naver.com/search.naver?ie=UTF-8&query='+keyword, '_blank');
		}else if(selectedSearchEngine == 'daum'){
			window.open('https://search.daum.net/search?w=tot&DA=JU5&q='+keyword, '_blank');
			
		}
		
	}
	
	
	function openMiniHome() {
	      window.open('/minihome.do', '_blank', "width=1400, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	   }
	function openFriendMiniHome() {
		var friendMinihomeNo = $("#friend-box option:selected").val()
		console.log("친구 미니홈피 번호: " + friendMinihomeNo);
	      window.open('/minihome.do?miniHomeNo='+friendMinihomeNo, '_blank', "width=1400, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	   }
		
</script>