<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/taglib.jsp"%>
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