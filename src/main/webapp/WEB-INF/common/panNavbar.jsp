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
           <c:if test="${empty LOGINED_USER_NO }">
            <div class="col-1 text-right" >
               <a href="../board/loginform.do">로그인</a>
            </div>
            <div class="col-1 text-right" >
              <a href="/register.do">회원가입</a>
            </div>
            </c:if> 
            <c:if test="${not empty LOGINED_USER_NO }">
            <div class="col-3 text-right" >
               <span>${LOGINED_USER_NICKNAME }(${LOGINED_USER_NAME })님 환영합니다.</span>
            </div>
            <a href="../board/logout.do">로그아웃</a>
            </c:if>
        </div><br>
       <div class="row" align="left" >
          <div class="col-12" >
            <a href="../main.do"><img src="../resources/images/logo.jpg" alt="logo" style="width:100px;height:100px;"></a>
            <img src="../resources/images/&logo3.png" style="width:30px; margin-right: 10px;">
            <a href="../board/index.do"><img src="../resources/images/panLogo4.png" alt="logo" style="width:100px;height:100px; align-content: center;"></a>
          </div>
        </div>
        <div class="row" align="left" style="margin-bottom: 20px;">
        	<div class="col-12">
        		<span style="font-size:8px; color: olive;">라떼월드 메인으로가기</span>
        		<span style="font-size:8px; padding-left: 40px; color: olive;">게시판 처음으로가기</span>
        	</div>
        </div>
        
        <nav class="navbar navbar-expand-sm  navbar-light" style="border-top: 1px solid lightgray; "> 

            <!-- Links -->
            <ul class="navbar-nav"> 
              <li class="nav-item active">
                <a class="nav-link"  href="../board/index.do?catno=100" style="font-size:20px;">베스트 이슈<span style="font-size:12px; color: red;"> 공감 top10</span><span style='font-size:20px; padding-right: 15px;'></span> </a>
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

          
    
      