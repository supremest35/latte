<%@ page pageEncoding="UTF-8"%>
<div class="card">
	<form id="product-search-form" method="post" action="../product/list.do">
	<c:if test = "${resVo.catlvl == 1}">
		<div class="card-header">
			<a href="/shopping/main.do">홈</a> > 
			<a href="/shopping/product/list.do?catno=${category.no }&catlvl=2">${category.name }</a> > 
			소분류  
		</div>
		<div class="card-body">
			<table class="col-12">
				<thead>
					<tr class="col-4">
					<c:forEach var="midCategory" items="${midCategories }" begin="0" end="3">
						<td>
							<a href="/shopping/product/list.do?catno=${midCategory.no }&catlvl=2">${midCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="midCategory" items="${midCategories }" begin="4" end="7">
						<td>
							<a href="/shopping/product/list.do?catno=${midCategory.no }&catlvl=2">${midCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="midCategory" items="${midCategories }" begin="8" end="11">
						<td>
							<a href="/shopping/product/list.do?catno=${midCategory.no }&catlvl=2">${midCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
				</thead>
			</table>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			브랜드
			<c:forEach var="brand" items="${brands }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="brandno" value="${brand.no }" onclick=searchBrand()>
				<label class="form-check-label" for="inlineCheckbox">${brand.name }</label>
			</div>
			</c:forEach>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			컬러별
			<c:forEach var="color" items="${colors }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="colorno" value="${color.no }" onclick=searchColor()>
				<label class="form-check-label" for="inlineCheckbox">
					<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:${color.name}"></i>
				</label>
			</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test = "${resVo.catlvl == 2}">
		<div class="card-header">
			<a href="/shopping/main.do">홈</a> > 
			<a href="/shopping/product/list.do?catno=${category.no }&catlvl=2">${category.name }</a> > 
			소분류  
		</div>
		<div class="card-body">
			<table class="col-12">
				<thead>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="0" end="3">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="4" end="7">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="8" end="11">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
				</thead>
			</table>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			브랜드
			<c:forEach var="brand" items="${brands }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="brandno" value="${brand.no }" onclick=searchBrand()>
				<label class="form-check-label" for="inlineCheckbox">${brand.name }</label>
			</div>
			</c:forEach>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			컬러별
			<c:forEach var="color" items="${colors }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="colorno" value="${color.no }" onclick=searchColor()>
				<label class="form-check-label" for="inlineCheckbox">
					<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:${color.name}"></i>
				</label>
			</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test = "${resVo.catlvl == 3}">
		<div class="card-header">
			<a href="/shopping/main.do">홈</a> > 
			<a href="/shopping/product/list.do?catno=${category.no }&catlvl=2">${category.name }</a> > 
			소분류  
		</div>
		<div class="card-body">
			<table class="col-12">
				<thead>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="0" end="3">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="4" end="7">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
					<tr class="col-4">
					<c:forEach var="lowCategory" items="${lowCategories }" begin="8" end="11">
						<td>
							<a href="/shopping/product/list.do?catno=${lowCategory.no }&catlvl=3">${lowCategory.name }</a><br>
						</td>
					</c:forEach>
					</tr>
				</thead>
			</table>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			브랜드
			<c:forEach var="brand" items="${brands }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="brandno" value="${brand.no }" onclick=searchBrand()>
				<label class="form-check-label" for="inlineCheckbox">${brand.name }</label>
			</div>
			</c:forEach>
		</div>
		<div class="card-body" style="border-top: 2px solid lightgray;">
			컬러별
			<c:forEach var="color" items="${colors }">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" id="colorno" value="${color.no }" onclick=searchColor()>
				<label class="form-check-label" for="inlineCheckbox">
					<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:${color.name}"></i>
				</label>
			</div>
			</c:forEach>
		</div>
	</c:if>
	</form>
</div>