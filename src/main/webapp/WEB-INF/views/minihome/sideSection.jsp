<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="side-sections">
	<div id="home-section-side">
		<img class="card-img-top" src="/resources/images/1000001.jpg" alt="Card image cap" id="welcomeNote-img">
		<div class="card-body" id="welcomeNote-content">
		  <p class="card-text"></p>
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

<script type="text/javascript">


</script>