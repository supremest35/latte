<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-white navbar-info">
  	<ul class="navbar-nav">	
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	<i class="fas fa-bars"></i> 전체 카테고리
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${allCategories }">
	      		<c:if test="${category.no != 600 }">
	        		<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        	</c:if>
	      		<c:if test="${category.no == 600 }">
	        		<a class="dropdown-item" href="/shopping/acorn/list.do?catno=${category.no }">${category.name }</a>
	        	</c:if>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	패션/뷰티
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${fashionCategories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	가전/컴퓨터
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${computerCategories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	가구/리빙/건강
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${livingCategories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	식품/유아동
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${foodCategories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	여행/레저/자동차
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${carCategories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	도토리마켓
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${acornCategories }">
	        	<a class="dropdown-item" href="/shopping/acorn/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item">
	    	<a href="/shopping/product/form.do" class="nav-link">상품등록</a>
	    </li>
		<li class="nav-item">
			<a href="/shopping/acorn/form.do" class="nav-link">도토리상품등록</a>
		</li>
	</ul>
</nav>

