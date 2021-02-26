<%@ page pageEncoding="UTF-8"%>
<div>
	<c:if test="${empty LOGINED_USER_NO }">
	<div class="text-right">
		<span><a href="/board/loginform.do">로그인</a></span>
		<span><a href="/register.do">회원가입</a></span>
	</div>
	</c:if> 
	<c:if test="${not empty LOGINED_USER_NO }">
	<div class="text-right" >
		<span><a href="/shopping/wish/list.do">소원리스트</a></span>
		<span><a href="/shopping/order/list.do">구매내역</a></span>
		<span><a href="/shopping/my/havingitem.do">보유상품</a></span>
		<span><a href="/shopping/my/acornhistory.do">도토리 사용내역</a></span>
		<span>${LOGINED_USER_NICKNAME }(${LOGINED_USER_NAME })님 환영합니다.</span>
		<span><a href="../board/logout.do">로그아웃</a></span>
	</div>
	</c:if>
</div>
<div class="col-12">
    <div class="search" style="float:right">
        <input type="text" placeholder="검색어를 입력해주세요." />
        <button class="btn btn-primary">검색</button>
    </div>
    <h1>
        <span><a href="/main.do"><strong>Latte</strong></a></span>
        <span><a href="/shopping/main.do">쇼핑</a></span>
    </h1>
</div>