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
<script src="/resources/js/moment.js"></script>
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
								<label>현재 프로필 사진 </label>
								<img  id="my-photo" src="/resources/images/userProfilePhoto/${LOGINED_USER.photo }" alt="userPhoto" />
								<input type="hidden" name="userNo" value="${LOGINED_USER.no }" id="userNo">
							</div>
							<div class="form-group col-4 mt-4" style="float: left;">
								<label>이름</label> 
								<input type="text" class="form-control" name="name" value="${LOGINED_USER.name }" readonly/>
								<label>아이디</label> 
								<input type="text" class="form-control" name="id" value="${LOGINED_USER.id }" readonly/>
								<label>가입일</label> 
								<input type="text" class="form-control" name="createdDate" value="${LOGINED_USER.createdDate}" readonly/>
							</div>
							<div class="form-group col-5 mt-4" style="float:right;">
								<label>닉네임</label> 
								<input type="text" class="form-control" placeholder="${LOGINED_USER.nickName }" v-model="my.nickName" />
								<label>전화번호</label> 
								<input type="text" class="form-control"  placeholder="${LOGINED_USER.tel }" v-model="my.tel" />
								<label>프로필 사진</label>
								<input type="file" class="form-control"  ref="file" @change="changePhoto" />
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer"> 
					<div class="form-row" style="float:right;">
							<a href="main.do" class="btn btn-secondary">취소</a>
							<button type="button" class="btn btn-primary ml-2" @click="modifyProfile">수정</button>
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
				tel:'',
				photo:''
			},
			selectedFiles: undefined,
            currentFile: undefined
		},
		methods:{
			changePhoto: function(){
				this.selectedFiles = this.$refs.file.files;
				this.currentFile = this.selectedFiles[0];
			},
			modifyProfile: function () {
				//세션에 저장된 user값 가져올 방법 -> 프로필 편집 클릭시 새 페이지 로딩-> 네브바/프로필 편집창이 다른 뷰 사용
				//사진을 저장하지 않을 시 해결방법 ..?
				var formData = new FormData();
                formData.append('nickName', this.my.nickName);
                formData.append('tel', this.my.tel);
                if(this.currentFile){
	               	formData.append('photo',this.currentFile);
                }
               	formData.append('photo',"samePhoto");
                
				axios.post("http://localhost/users/modifyProfile.do",formData,{
					headers:{
                        'Content-Type':'multipart/form-data'
                  }}).then(function (response) {
                	  location.href = "http://localhost/myProfile.do"
				})
			}
		}
	})
</script>
</body>
</html>