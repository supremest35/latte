<%@ page pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header">
		<a href="/shopping/main.do">홈</a> > 
		<a href="/shopping/product/list.do?catno=${category.no }">${category.name }</a> > 
		소분류
	</div>
	<div class="card-body">
		<table class="col-12">
			<thead>
				<tr class="col-4">
				<c:forEach var="lowCategory" items="${lowCategories }" begin="0" end="3">
					<td>
						<a href="/shopping/product/list.do?catno=${lowCategory.no }">${lowCategory.name }</a><br>
					</td>
				</c:forEach>
				</tr>
				<tr class="col-4">
				<c:forEach var="lowCategory" items="${lowCategories }" begin="4" end="7">
					<td>
						<a href="/shopping/product/list.do?catno=${lowCategory.no }">${lowCategory.name }</a><br>
					</td>
				</c:forEach>
				</tr>
				<tr class="col-4">
				<c:forEach var="lowCategory" items="${lowCategories }" begin="8" end="11">
					<td>
						<a href="/shopping/product/list.do?catno=${lowCategory.no }">${lowCategory.name }</a><br>
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
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="brandOption">
			<label class="form-check-label" for="inlineCheckbox">${brand.name }</label>
		</div>
		</c:forEach>
	</div>
	<div class="card-body" style="border-top: 2px solid lightgray;">
		컬러별
		<c:forEach var="color" items="${colors }">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="colorOption">
			<label class="form-check-label" for="inlineCheckbox">
				<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:${color.name}"></i>
			</label>
		</div>
		</c:forEach>
	</div>
</div>