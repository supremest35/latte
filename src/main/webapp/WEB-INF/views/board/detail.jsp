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
<div class="container" id="app">
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
          
            <div class="col-12">
                <div class="card">
                     <div class="card-header">
                         <div class="row">
                             <div class="col-9" style="font-size: 20px;">
                                ${dto.title }
                             </div>
                             <div class="col-3" align="right">
                               	 <fmt:formatDate value="${dto.createdDate }" pattern="yyyy.MM.dd hh:ss"/> 
                             </div>
                         </div>
                     </div>
                     <div class="card">
                        <div class="row">
                            <div class="col-8">
                                <span><small>${dto.nickname }</small></span>
                            </div>
                            <div class="col-2" style="font-size: 12px;">
                               조회수 ${dto.hitCnt }
                            </div>
                            <div class="col-1" style="font-size: 11px;">
                              추천 ${dto.likeCnt }
                            </div>
                            <div class="col-1" style="font-size: 11px;">
                              댓글 수  ${dto.commentCnt }
                            </div>
                        </div>
                     </div>
                </div>
                <div class="card-body" style="border-top: 2px solid lightgray;">
                    <div class="row" >
                    	<c:if test="${dto.userNo == LOGINED_USER_NO }">
	                    	<div class="col-12" align="right">
	                    	<a href="modifyform.do?boardNo=${dto.no }&catno=${dto.categoryNo}"><button>수정</button></a> 
	                    	<a href="delete.do?boardNo=${dto.no }&catno=${dto.categoryNo}"><button>삭제</button></a>
	                    	</div>
                    	</c:if>
                        <div class="col-12" style="margin-top:30px; margin-bottom: 100px;">
                        	<c:if test="${not empty dto.imageFilename  }">
                        		<p><img src="../resources/images/${dto.imageFilename }"></p>
                        	</c:if>
                        	
                            ${dto.content }
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="text-align: center; margin-bottom: 20px;">
                        	<c:if test="${not empty LOGINED_USER_NO && dto.userNo != LOGINED_USER_NO }">
                            <button><a href="like.do?boardNo=${dto.no }&catno=${category.no}">좋아요 &#128077;</a></button> <button><a href="dislike.do?boardNo=${dto.no }&catno=${category.no}">싫어요 &#128078;</a></button>
                        	</c:if>
                        </div>
                    </div>
                    <div class="row">
                        <!-- <div class="col-2">
                            <button>이전 글</button>
                        </div> -->
                        <div class="col-12" style="text-align: center;">
                            <button><a href="index.do?catno=${dto.categoryNo }">목록으로 가기</a></button>
                        </div>
                        <!-- <div class="col-2">
                            <button>다음 글</button>
                        </div> -->
                    </div>
                     </div>
                     <!-- 댓글창 시작-->
                   <%--  <div class="row">
                      <div class="col-12">
                        <div class="card-header">
                          댓글  ${dto.commentCnt } 개
                      </div>
                      <div class="card-body" >
                          <div class="row">
                              <div class="col-10">
                                ${dto.nickname }
                              </div>
                              <div class="col-2">
                                <button>댓글추천</button>
                              </div>
                              
                          </div>
                          <div class="row"  style="border-bottom: 1px solid lightgray;">
                              <div class="col-12">
                                  ${dto.commentContent } 
                              </div>
                          </div>
                      </div>
                      </div>
                      <c:if test="${LOGINED_USER !=  }">
                      <form class="row" action="addComment">
                      	<input type="hidden" value="${LOGINED_USER.no}" name="userNo">
                        <div class="col-12">
                          <label>댓글 쓰기</label>
                          <textarea  class="form-control" name="commentContent"></textarea>
                        </div>
                        <div class="col-6">
                            <input type="submit" class="btn btn-primary" value="댓글등록">
                        </div>
                      </form>
                    </div> --%>
                    <%--
				댓글입력폼 표시여부
					로그인한 사용자인 경우에만 댓글 입력폼을 표시한다.
			 --%>
			 	<!-- 댓글 입력폼 시작 -->
			 	<%-- <%
			 		if (loginedUserId != null) {
			 	%> --%>
				<div class="card-body">
					<form method="post" action="commentInsert.do">
						<input type="hidden" name="boardNo" value="${dto.no }" />
						<input type="hidden" name="catno" value="${category.no }" />
							<div class="form-group row">
							<div class="col-11">
							댓글쓰기
								<textarea rows="3" class="form-control" name="content"></textarea>
							</div>
							<div class="col-1">
								<input type="submit" class="btn btn-outline-primary" value="댓글등록">
							</div>
						</div>
					</form>
				</div>
				<%-- <%
			 		}
				%> --%>
			 	<!-- 댓글 입력폼 끝-->
			 	<!-- 댓글 목록 시작 -->
				<ul class="list-group ">
				<%-- <%
					if(commentList.isEmpty()) {
				%> --%>
				<c:if test="${empty comments }">
					<li class="lsit-group-item">댓글이 존재하지 않습니다.</li>
				</c:if>
				<span>댓글 ${dto.commentCnt } 개</span> 
				<c:forEach var="comment" items="${comments }">
					<li class="list-group-item">
    					<div class="d-flex w-100 justify-content-between">
      						<h5 class="mb-1">${comment.nickname }</h5>
      						<small><fmt:formatDate value="${comment.createdDate }" pattern="yyyy.MM.dd hh:ss"/> </small>
    					</div>
    					<p class="mb-1"><small>${comment.commentContent }</small></p>
  					</li>
				</c:forEach> 
				
				
					
					
  				<%-- <%
						}
					}
  				%> --%>
				</ul>
				<!--  댓긂 목록 끝 -->
                    
                    
					
                </div>
            </div><br>

</div>
</body>
</html>