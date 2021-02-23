<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-white navbar-info">
  	<ul class="navbar-nav">	
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	전체 카테고리
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${categories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	패션/뷰티
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${categories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	가전/컴퓨터
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${categories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	가구/생활/건강
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${categories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
	        </c:forEach>
	      </div>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	      	전체 카테고리
	      </a>
	      <div class="dropdown-menu">
	      	<c:forEach var="category" items="${categories }">
	        	<a class="dropdown-item" href="/shopping/product/list.do?catno=${category.no }">${category.name }</a>
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

