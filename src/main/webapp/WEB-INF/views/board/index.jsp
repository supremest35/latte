<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Template</title>
</head>
<body>
 <div class="container" id="pannboard">
       <div class="row">
		<div class="col-12">
			<%@ include file="../../common/panNavbar.jsp" %>
		</div>
	  </div>
        <div class="row">
           <div class="col-12">
               <div class="card">
                    <div class="card-header">
                        <a href="index.do?catno=${category.no }">${category.name } 게시판입니다.</a>  <!-- 카테고리 별로 이름이 바뀌게 -> '화제/유머/고민/공포/자유/연예 게시판'-->
                    </div>
               </div>
           </div>
       </div><br>
       
       <div class="row">
           <div class="col-12" >
               <table class="table" style="border-width:10px; font-size: small;">
                   <thead>
                     <colgroup>
                      <col width="5%">
                      <col width="5%">
                      <col width="10%">
                      <col width="50%">
                      <col width="15%">
                      <col width="15%">
                    </colgroup>
                       <tr>
                           <th>추천</th>
                           <th>비추</th>
                           <th></th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>조회수</th>
                       </tr>
                   
                   <tbody>
                   	<c:forEach var="board" items="${boardDto}">
                       <tr>
                           <td>${board.likeCnt } &uarr;</td> 
                           <td>${board.dislikeCnt} &darr;</td>
                           <td><img class="img-thumbnail" src="${board.imageFilename }" alt=""></td>
                           <td><a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href">${board.title} </a> [${board.commentCnt}]</td>
                           <td>${board.nickname }</td>
                           <td>조회수 ${board.hitCnt}</td>
                       </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
       <div class="row">
           <div class="col-12 text-right">
               <a href="form.do?catno=${category.no}" class="btn btn-primary">글쓰기</a>
           </div>
       </div>
    </div>
</body>
</html>