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
			<%@ include file="../common/navbar.jsp" %>
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
                             <div class="col-9">
                                ${dto.title }
                             </div>
                             <div class="col-3">
                                ${dto.createdDate }
                             </div>
                         </div>
                     </div>
                     <div class="card">
                        <div class="row">
                            <div class="col-8">
                                ${dto.nickname }
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
                    <div class="row">
                        <div class="col-12">
                        	<p><img src="../resources/images/${dto.imageFilename }"></p>
                            ${dto.content }q
                            <hr/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12" style="text-align: center;">
                            <button><a href="like.do?boardNo=${dto.no }">추천</a></button> <button>비추</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-2">
                            <button>이전 글</button>
                        </div>
                        <div class="col-8" style="text-align: center;">
                            <button><a href="index.do?catno=${dto.categoryNo }">목록으로 가기</a></button>
                        </div>
                        <div class="col-2">
                            <button>다음 글</button>
                        </div>
                    </div>
                    <div class="row">
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
                      <div class="row">
                        <div class="col-9">
                          <label>댓글 쓰기</label>
                          <textarea row="3" class="form-control"></textarea>
                        </div>
                        <div class="col-3">
                            <button>댓글등록</button>
                        </div>
                      </div>
                    </div>
                    </div>
                </div>
            </div><br>

</div>
</body>
</html>