<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>


 <div class="row" style="border-bottom: 2px solid lightgray; background-color:ivory;">
          <div class="col-8">
            <span style="font-size: 10px;" >네이트 판 - 유머, 정보, 일상, 모두의 이야기가 있는 커뮤니티</span>
          </div>
           <c:if test="${empty LOGINED_USER }">
            <div class="col-1 text-right" >
               <a href="../board/loginform.do">로그인</a>
            </div>
            <div class="col-1 text-right" >
              <a href="/register.do">회원가입</a>
            </div>
            </c:if> 
            <c:if test="${not empty LOGINED_USER }">
            <div class="col-3 text-right" >
               <span>${LOGINED_USER.name }(${LOGINED_USER.id })님 환영합니다.</span>
            </div>
            <a href="../board/logout.do">로그아웃</a>
            </c:if>
        </div><br>
       <div class="row">
          <div class="col-12" >
            <a href="../main.do"><img src="../resources/images/logo.jpg" alt="logo" style="width:100px;height:100px;"></a>&#128151;
          </div>
       <div class="row">
          <div class="col-12" >
            <a href="../board/index.do"><img src="../resources/images/panLogo.jpg" alt="logo" style="width:100px;height:100px; align-content: center;" >
          </div>
       </div>
        </div>
        
        <nav class="navbar navbar-expand-sm bg-light navbar-light"> 

            <!-- Links -->
            <ul class="navbar-nav"> 
              <li class="nav-item active">
                <a class="nav-link"  href="../board/index.do?catno=100" >화제의 톡 <span style='font-size:20px;'>&#11088;</span> </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="../board/index.do?catno=200">유머/정보 <span style='font-size:20px;'>&#128514;</span> </a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="../board/index.do?catno=300">고민/일상 <span style='font-size:20px;'>&#129300;</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="../board/index.do?catno=400">공포/미스테리 <span style='font-size:20px;'>&#128561;</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="../board/index.do?catno=500">자유주제 <span style='font-size:20px;'>&#128526;</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link " href="../board/index.do?catno=600">아이돌/팬 <span style='font-size:20px;'>&#128525;</span></a>
              </li>
            </ul>

            <div class="search" style="float:right; text-align: right;" >
              <input type="text" placeholder="" />
              <button class="btn btn-primary"> 검색</button>
            </div>
          
        </nav><hr>

          
    
      