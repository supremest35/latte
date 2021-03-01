<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<title>Latte_myProfile</title>
<style type="text/css">
	img#my-photo{
		flex: content;
		width:250px;
		height:250px;
		float: right;
	}
</style>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/common/navbar.jsp" %>
	<div class="row mt-8" id="proApp">
		<div class="col-12">
		<fieldset>
			<div class="card  mt-4">
				<div class="card-header">
					<h4>내 프로필 편집</h4>
				</div>
				<div class="card-body">
					<div class="form-row">
						<div class="col-12">
							<div class="form-group col-3" style="float:left;">
								<img  id="my-photo" src="/resources/images/userProfilePhoto/${LOGINED_USER.photo }" alt="userPhoto" />
							</div>
							<div class="form-group col-4 mt-4" style="float: left;">
								<label>이름</label> 
								<input type="text" class="form-control" name="name" value="${LOGINED_USER.name }" readonly/>
								<label>아이디</label> 
								<input type="text" class="form-control" name="name" value="${LOGINED_USER.id }" readonly/>
								<label>가입일</label> 
								<input type="text" class="form-control" name="nickName" placeholder="${LOGINED_USER.createdDate }" v-model="my.nickName" />
							</div>
							<div class="form-group col-5 mt-4" style="float:right;">
								<label>닉네임</label> 
								<input type="text" class="form-control" placeholder="${LOGINED_USER.nickName }"  />
								<label>전화번호</label> 
								<input type="text" class="form-control"  placeholder="${LOGINED_USER.tel }"  />
								<label>프로필 사진</label>
								<input type="file" class="form-control"  ref="file" />
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer"> 
					<div class="form-row" style="float:right;">
							<a href="main.do" class="btn btn-secondary">취소</a>
							<button type="button" class="btn btn-primary ml-2" id="modify-btn">수정</button>
					</div>
				</div>
			</div>
			</fieldset>
		</div>
	</div>
</div>
<script type="text/javascript">
	
	new Vue({
		el:'#proApp',
		data:{
			my:{
				nickName:'',
				tel:''
			}
		},
		methods:{
			modify: function () {
				axios.post("http://localhost/user/modifyMyProfile.do",my)
			}
		}
	})
</script>
</body>
</html>