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
 <div class="container" id="form">
        <div class="row">
		<div class="col-12">
				<%@ include file="../../common/panNavbar.jsp" %>
		</div>
	  </div>
  		 <div class="row">
           <div class="col-12">
               <div class="card">
                    <div class="card-header">
                        <a href="index.do?catno=${category.no }">${category.name } 게시판에 쓰신 글입니다. </a>  <!-- 카테고리 별로 이름이 바뀌게 -> '화제/유머/고민/공포/자유/연예 게시판'-->
                    </div>
               </div>
           </div>
       </div><br>
    
        <div class="row">
            <div class="col-12">
                <div class="card">
                        <div class="card-header"><h4>글 수정하기</h4></div>
                        	<form id="board-form" method="post" action="modify.do" enctype="multipart/form-data">
		                         <input type="hidden" value="${LOGINED_USER_NO }" name="userNo"> 
		                         <input type="hidden" value="${board.no }" name="boardNo"> 
		                         <input type="hidden" value="${board.categoryNo }" name="catno"> 
		                        <div class="card-body">
		                            <div class="form-group row">
		                                <div class="col-2">
		                                    <select class="form-control" name="categoryNo">
		                                   <%--  <c:forEach var="category" items="${categories }"> --%>
		                                        <option value="200" selected="selected"> 유머/정보</option>
		                                        <option value="300"> 고민/일상</option>
		                                        <option value="400"> 공포/미스테리</option>
		                                        <option value="500"> 자유</option>
		                                        <option value="600"> 아이돌/팬</option>
		                                    <%-- </c:forEach> --%>
		                                    </select>
		                                </div>
		                                <div class="col-10">
		                                    <input type="text" class="form-control" name="title" value="${board.title }">
		                                </div>
		                            </div>
		                           
		                            <div class="form-group row">
		                                <div class="col-12">
		                                    <textarea rows="10" class="form-control" name="content" >
		                                   		 ${board.content }
		                                    </textarea>
		                                   		 <img src="../resources/images/${board.imageFilename }"/>
		                                </div>
		                            </div>
		                            <div class="row">
		                            	<div class="col-12">
		                            		<input type="file" class="form-control" name="photofile" />
		                            	</div>
		                            </div>
		                        </div>
		                        <div class="card-footer">
		                            <div class="text-right">
		                                <a href="detail.do?boardNo=${board.no }&catno=${board.categoryNo}" class="btn btn-secondary">취소</a>
		                               <input type="submit" class="btn btn-primary" value="수정" >
		                            </div>
                      		  </div>
		                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>