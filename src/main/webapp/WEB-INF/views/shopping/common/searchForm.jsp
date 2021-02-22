<%@ page pageEncoding="UTF-8"%>
<div class="card">
	<div class="card-header">
		<a href="/shopping.main.do">홈</a> > 
		<a href="">중분류</a> > 
		소분류
	</div>
	<div class="card-body">
		<div style="border-right: 2px solid lightgray; float: left; width: 25%;">
			&nbsp;&nbsp;&nbsp;<a href="/shopping/product/list.do?catno=100101">소분류 목록</a><br>
			&nbsp;&nbsp;&nbsp;<a href="/shopping/product/list.do?catno=100102">소분류 목록</a><br>
		</div>
		<div style="border-right: 2px solid lightgray; float: left; width: 25%;">
			&nbsp;&nbsp;&nbsp;<a href="">소분류 목록</a><br>
			&nbsp;&nbsp;&nbsp;<a href="">소분류 목록</a><br>
		</div>
		<div style="border-right: 2px solid lightgray; float: left; width: 25%;">
			&nbsp;&nbsp;&nbsp;<a href="">소분류 목록</a><br>
			&nbsp;&nbsp;&nbsp;<a href="">소분류 목록</a><br>
		</div>
		<div style="float: left; width: 25%;">
			&nbsp;&nbsp;&nbsp;<a href="/shopping/product/list.do?catno=100101">소분류 목록</a><br>
			&nbsp;&nbsp;&nbsp;<a href="">소분류 목록</a><br>
		</div>
	</div>
	<div class="card-body" style="border-top: 2px solid lightgray;">
		브랜드&nbsp;&nbsp;&nbsp;
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="brandOption">
			<label class="form-check-label" for="inlineCheckbox">브랜드명</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="brandOption">
			<label class="form-check-label" for="inlineCheckbox">브랜드명</label>
		</div>
	</div>
	<div class="card-body" style="border-top: 2px solid lightgray;">
		컬러별&nbsp;&nbsp;&nbsp;
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="colorOption">
			<label class="form-check-label" for="inlineCheckbox">
				<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:red;"></i>
			</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="colorOption">
			<label class="form-check-label" for="inlineCheckbox">
				<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:blue;"></i>
			</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" id="inlineCheckbox" value="colorOption">
			<label class="form-check-label" for="inlineCheckbox">
				<i class="fa fa-circle fa-lg" aria-hidden="true" style="color:gray;"></i>
			</label>
		</div>
	</div>
</div>