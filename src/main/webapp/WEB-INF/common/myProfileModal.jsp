<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<style type="text/css">
	img#my-photo{
		flex: content;
		width:230px;
		height:230px;
		float: right;
		margin-right: 20px;
	}
</style>
<!-- The Modal -->
<div class="modal" id="myProfile">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">내 프로필 편집</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body" id="find-modal-b">
				<div class="card board">
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-6 mt-2" style="float:left;">
								<img  id="my-photo" src="/resources/images/userProfilePhoto/${LOGINED_USER.photo }" alt="userPhoto" />
							</div>
							<div class="form-group col-6 mt-3" style="float: right;">
								<label>이름</label> 
								<input type="text" class="form-control mb-2" name="name" value="${LOGINED_USER.name }" readonly/>
								<label>아이디</label> 
								<input type="text" class="form-control mb-2" id="pro-userId" name="id" value="${LOGINED_USER.id }" readonly/>
								<label>가입일</label> 
								<input type="text" class="form-control" name="createdDate" placeholder='<fmt:formatDate value="${LOGINED_USER.createdDate }" />' readonly/>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-12" >
								<label>닉네임</label> 
								<input type="text" class="form-control mb-2" placeholder="${LOGINED_USER.nickName }" v-model="my.nickName"/>
								<label>전화번호</label> 
								<input type="text" class="form-control mb-4"  placeholder="${LOGINED_USER.tel }" v-model="my.tel" />
								<label>프로필 사진</label>
								<button type="button" class="btn-sm" style="float: right;" data-toggle="collapse" data-target="#select-photo">변경하기</button>
								<div  class="collapse" id="select-photo">
									<input type="file" ref="file" @change="getPhoto"/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-row" style="float:right;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn-sm btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn-sm btn-primary ml-2" @click="modifyProfile()"id="modify-btn">수정</button>
			</div>
		</div>
	</div>
</div>
<script>
	var userId = $('#pro-userId').val()
	console.log(userId)
	new Vue({
		el:"#myProfile",
		data:{
			my:{
				id: userId,
				nickName:'',
				tel:''
			},
			selectedFiles:'',
			currentFile:'',
			changedPhoto:false
		},
		methods:{
			getPhoto: function () {
				this.selectedFiles = this.$refs.file.files;
				this.currentFile = this.selectedFiles[0];
				this.changedPhoto = true;
			},
			modifyProfile: function () {
				// 사진 변경 여부에 따라 메서드 두개로 나누기 ...
				var formData = new FormData();
				
				formData.append('id', this.my.id);
				formData.append('nickName', this.my.nickName);
				formData.append('tel', this.my.tel);
				
				if(this.changedPhoto){
					formData.append('photoFile', this.currentFile);
				}
				
				axios.post('http://localhost/api/users/modifyProfile', formData,{
					headers:{
                          'Content-Type':'multipart/form-data'
                    }})
				.then(function (response) {
                      alert(response.data);
                      location.href="http://localhost/main.do";
                })
			}
			
		
		}
	})
</script>