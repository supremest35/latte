<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="side-sections">
	<div id="home-section-side">
		<div class="card-body" id="welcomeNote-img-box" >
			<img class="card-img-top" src="${welcomeNote.photoFilename }" alt="Card image cap" id="welcomeNote-img">
		</div>
		<div class="card-body" id="welcomeNote-content">
		  <p class="card-text">${welcomeNote.content }</p>
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
				<li><a href="" data-content-id="#visualContents-section" data-folder-no="${folders[0].parentNo }">전체보기</a></li>
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
		</div>
		<div class="card-body">
			<ul id="video-folder-list">
				<li><a href="" data-content-id="#visualContents-section" data-folder-no="${folders[0].parentNo }">전체보기</a></li>
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
		</div>
		<div class="card-body">
			<ul id="board-folder-list">
				<li><a href="" data-content-id="#board-section" data-folder-no="${folders[0].parentNo }">전체보기</a></li>
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
			<img class="card-img-top" src="${welcomeNote.photoFilename }" alt="Card image cap" id="welcomeNote-img">
		</div>
		<div class="card-body" id="welcomeNote-content">
		  <p class="card-text">${welcomeNote.content }</p>
		</div>
		<div id="welcomeNote-button">
			<button class="badge badge-primary badge-xs">edit</button>
			<button class="badge badge-primary badge-xs">history</button>
		</div>
	</div>
</div>
<script type="text/javascript">

	
	
		
</script>