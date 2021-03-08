<%@ page pageEncoding="UTF-8"%>
<div>
	<c:if test="${not empty LOGINED_USER }">
	<div class="text-right" >
	</div>
	</c:if>
</div>

<%@ include file="/WEB-INF/common/navbar.jsp" %>