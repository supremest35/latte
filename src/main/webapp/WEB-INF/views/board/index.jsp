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
                        <a href="index.do?catno=${category.no }">${category.name } 게시판</a>  <!-- 카테고리 별로 이름이 바뀌게 -> '화제/유머/고민/공포/자유/연예 게시판'-->
                    </div>
               </div>
           </div>
       </div><br>
       
       <div class="row">
           <div class="col-12" >
               <table class="table" style="border-width:10px; font-size: small;">
                   <thead>
                     <colgroup>
                      <col width="6%">
                      <col width="6%">
                      <col width="20%">
                      <col width="40%">
                      <col width="15%">
                      <col width="15%">
                    </colgroup>
                       <tr>
                           <th>좋아요</th>
                           <th>싫어요</th>
                           <th></th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>조회수</th>
                       </tr>
                   
                   <tbody>
                   	<c:forEach var="board" items="${boards}">
                       <tr>
                           <td>${board.likeCnt } &#128077;</td> 
                           <td>${board.dislikeCnt} &#128078;</td>
                           <c:if test="${empty board.imageFilename }">
	                          <td><a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href"><img class="img-thumbnail" src="../resources/images/noimage.png" alt=""></a></td>
                           </c:if>
                           <c:if test="${not empty board.imageFilename }">
	                           <td><a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href"><img class="img-thumbnail" src="../resources/images/${board.imageFilename }" alt=""></a></td>
                           </c:if>
                           <td>
                           	<a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="href"><span style="font-size: 20px;">${board.title}</span> </a> <span style="color: red;">[${board.commentCnt}]</span>
                           	<%-- <c:if test="${category.no = 100 }"> --%>
                           	<p style="font-size: 11px;"><a href="index.do?catno=${board.categoryNo}">${board.categoryName }</a></p>
                           	<%-- </c:if> --%>
                           	<p><fmt:formatDate value="${board.createdDate }" pattern="yyyy.MM.dd hh:ss"/> </p>
                           </td>
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
           		<c:if test="${not empty LOGINED_USER_NO }">
              	 <a href="form.do?catno=${category.no}" class="btn btn-primary">글쓰기</a>
               </c:if>
           </div>
       </div>
    </div>
</body>
</html>