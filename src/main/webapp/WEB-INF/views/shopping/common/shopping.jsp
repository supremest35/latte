<%@ page pageEncoding="UTF-8"%>
<div>
	<c:if test="${not empty LOGINED_USER }">
	<div class="text-right" >
		<span><a href="/shopping/wish/list.do">소원리스트</a></span>
		<span><a href="/shopping/order/list.do">구매내역</a></span>
		<span><a href="/shopping/my/havingitem.do">보유상품</a></span>
		<span><a href="/shopping/my/acornhistory.do">도토리 사용내역</a></span>
	</div>
	</c:if>
</div>

<%@ include file="/WEB-INF/common/navbar.jsp" %>