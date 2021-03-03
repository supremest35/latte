<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>


 	<div class="row" style="border-bottom: 2px solid lightgray; background-color:ivory;">
          <div class="col-4">
            <span style="font-size: 10px;" ><a href="../main.do">라떼월드 메인으로 가기</a></span>
          </div>
          <div class="col-4">
            <span style="font-size: 10px;" >라떼 판  - 유머, 정보, 일상, 모두의 이야기가 있는 커뮤니티</span>
          </div>
 	</div>
	<%@ include file="navbar.jsp" %>
    
        <div class="row mt-5">
        	<div class="col-12">
		        <nav class="navbar navbar-expand-sm  navbar-light" style="border-top: 1px solid lightgray; width: 100%;"> 
					<!-- <div class="col-12"> -->
		            <!-- Links -->
		            <ul class="navbar-nav"> 
		              <li class="nav-item active">
		                <a class="nav-link"  href="../board/index.do?catno=100" style="font-size:20px;">베스트 이슈<span style="font-size:12px; color: red;"> 좋아요 top10</span><span style='font-size:20px; padding-right: 15px;'></span> </a>
		                <!-- <p><span style="font-size:10px; color: red;">실시간 공감 top10</span></p> -->
		              </li>
		              <li class="nav-item">
		                <a class="nav-link " href="../board/index.do?catno=200">유머/정보 <span style='font-size:20px; padding-right: 15px;'></span> </a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link " href="../board/index.do?catno=300">고민/일상 <span style='font-size:20px; padding-right: 15px;'></span></a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link " href="../board/index.do?catno=400">공포/미스테리 <span style='font-size:20px; padding-right: 15px;'></span></a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link " href="../board/index.do?catno=500">자유주제 <span style='font-size:20px; padding-right: 15px;'></span></a>
		              </li>
		              <li class="nav-item">
		                <a class="nav-link " href="../board/index.do?catno=600">아이돌/팬 <span style='font-size:20px;'></span></a>
		              </li>
		            </ul>
		
		           <!--  <div class="search"  style="padding-left: 150px;" >
		              <input type="text" placeholder="" />
		              <button class="btn btn-primary"> 검색</button>
		            </div> -->
		          
		        </nav><hr>
        	</div>
        </div>

          
    
      