<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="side-sections">
	<div id="home-section-side">
		<div class="card-body" id="welcomeNote-img-box" >
			<c:choose>
				<c:when test="${not empty welcomeNote }">
					<img class="card-img-top" src="${welcomeNote.photoFilename }" alt="Card image cap" id="welcomeNote-img">
				</c:when>
				<c:otherwise>
					<img class="card-img-top" src="/resources/images/miniHome/cat.jpg" alt="Card image cap" id="welcomeNote-img">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="card-body" id="welcomeNote-content">
			<c:choose>
				<c:when test="${not empty welcomeNote }">
					<p class="card-text">${welcomeNote.content }</p>
				</c:when>
				<c:otherwise>
					<p class="card-text">대문글</p>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${LOGINED_USER.no eq hostUserNo}">
			<div id="welcomeNote-button">
				<button class="badge badge-primary badge-xs" data-form-id="#welcomeNote-edit">edit</button>
				<button class="badge badge-primary badge-xs" data-form-id="#welcomeNote-history">history</button>
			</div>
		</c:if>
	</div>
	<div id="profile-section-side">
		<div class="card-body">
			<h5>profile</h5>
		</div>
		<div class="card-body">
			<h6>내 소개</h6>
			<ul id="profile-folder-list">
				<li><a href="" id="intro" data-content-id="#profile-intro">소개</a></li>
				<li><a href="" id="keyword" data-content-id="#profile-keyword">키워드</a></li>
				<li><a href="" id="qna" data-content-id="#profile-qna">42문답</a></li>
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
			<c:if test="${LOGINED_USER.no eq hostUserNo }">
				<span id="folder-button">
					<button class="badge badge-primary badge-xs" data-form-id="#folder-add">추가</button>
					<button class="badge badge-primary badge-xs" data-form-id="#folder-delete">삭제</button>
				</span>
			</c:if>
		</div>
		<div class="card-body">
			<ul id="photo-folder-list">
				<li><a href="" data-content-id="#visualContents-section" data-folder-no="${rootFolder.no }">전체보기</a></li>
				<c:forEach var="folder" items="${folders}">
					<li>
						<a href="" data-content-id="#visualContents-section" data-folder-no="${folder.no}">${folder.name}</a>
						<ul id="childFolder-${folder.no}">
						</ul>	
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="video-section-side">
		<div class="card-body">
			<h5>video</h5>
			<c:if test="${LOGINED_USER.no eq hostUserNo }">
				<span id="folder-button">
					<button class="badge badge-primary badge-xs" data-form-id="#folder-add">추가</button>
					<button class="badge badge-primary badge-xs" data-form-id="#folder-delete">삭제</button>
				</span>
			</c:if>
		</div>
		<div class="card-body">
			<ul id="video-folder-list">
				<li><a href="" data-content-id="#visualContents-section" data-folder-no="${rootFolder.no }">전체보기</a></li>
				<c:forEach var="folder" items="${folders}">
					<li>
						<a href="" data-content-id="#visualContents-section" data-folder-no="${folder.no}">${folder.name}</a>
						<ul id="childFolder-${folder.no}">
						</ul>	
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="board-section-side">
		<div class="card-body">
			<h5>board</h5>
			<c:if test="${LOGINED_USER.no eq hostUserNo }">
				<span id="folder-button">
					<button class="badge badge-primary badge-xs" data-form-id="#folder-add">추가</button>
					<button class="badge badge-primary badge-xs" data-form-id="#folder-delete">삭제</button>
				</span>
			</c:if>
		</div>
		<div class="card-body">
			<ul id="board-folder-list">
				<li><a href="" data-content-id="#board-section" data-folder-no="${rootFolder.no }">전체보기</a></li>
				<c:forEach var="folder" items="${folders}">
					<li>
						<a href="" data-content-id="#board-section" data-folder-no="${folder.no}">${folder.name}</a>
						<ul id="childFolder-${folder.no}">
						</ul>	
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="visitor-section-side">
		<div class="card-body" id="welcomeNote-img-box" >
			<c:choose>
				<c:when test="${not empty welcomeNote }">
					<img class="card-img-top" src="${welcomeNote.photoFilename }" alt="Card image cap" id="welcomeNote-img">
				</c:when>
				<c:otherwise>
					<img class="card-img-top" src="/resources/images/miniHome/cat.jpg" alt="Card image cap" id="welcomeNote-img">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="card-body" id="welcomeNote-content">
			<c:choose>
				<c:when test="${not empty welcomeNote }">
					<p class="card-text">${welcomeNote.content }</p>
				</c:when>
				<c:otherwise>
					<p class="card-text">대문글</p>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${LOGINED_USER.no eq hostUserNo}">
			<div id="welcomeNote-button">
				<button class="badge badge-primary badge-xs" data-form-id="#welcomeNote-edit">edit</button>
				<button class="badge badge-primary badge-xs" data-form-id="#welcomeNote-history">history</button>
			</div>
		</c:if>
	</div>
</div>
