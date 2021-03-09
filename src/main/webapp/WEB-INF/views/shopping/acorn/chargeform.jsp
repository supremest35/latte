<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	body, button {
		font-size: 16px;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    letter-spacing: -1px;
	}
	a {
		color: rgb(34, 34, 34);
	}
	.col-6 {
	  position: absolute;
	  width: 400px;
	  height: 600px;
	  top: 700px;
	  left: 50%;
	  margin: -300px 0 0 -200px;
	}
	</style>
</head>
<body>

<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/shopping.jsp" %>
</div>

<div class="container">
	<%@ include file="/WEB-INF/views/shopping/common/navbar.jsp" %>
</div>

<div class="container">
	<div class="row">
	   <div class="col-6">
	      <div class="card" style="float:center">
	         <form id="charge-form" method="post" action="acornRegister.do" enctype="multipart/form-data" onsubmit="checkAcornForm(event)">
	         <div class="card-header"><h4>도토리 충전폼</h4></div>
	         <div class="card-body">
	            <div class="form-row">
	               <div class="form-group col-12">
	                  <label>도토리 (1개 = 100원)</label>
	                  <input type="number" class="form-control" name="acornCnt" id="acorn-cnt" min="0"/>
	               </div>
	            </div>
	            <div class="form-row">
	               <div class="text-right">
	                  <a href="/shopping/main.do" class="btn btn-secondary">취소</a>
	                  <input type="submit" class="btn btn-primary" value="충전" />
	               </div>
	            </div>
	         </div>
	         </form>
	      </div>
	   </div>
	</div>
</div>

</body>
</html>