<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.15/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- 우편번호 검색  -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>라떼월드 회원가입</title>
<style type="text/css">
	.postbox#sample6_postcode{
		width: 60%;
		margin-bottom: 5px;
	}
	.postbox#sample6_address{
		width: 100%;
		margin-bottom: 5px;
	}
	.postbox#sample6_detailAddress{
		width: 100%;
	}
</style>
</head>
<body>
	<%-- <div class="container" id="registerPage">
		<div class="row">
     <div class="col-12">
         <%@ include file="../common/navbar.jsp" %>
     </div>
 </div>  --%>
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4>회원가입</h4>
					</div>
					<div class="card-body">
						<div class="form-row">
							<div class="form-group col-8">
								<label>아이디(이메일)</label> <span id="id-info"
									style="font-size: 5px; color: blue;"> * 아이디는 이메일형식으로
									입력하세요. 예시) hong@abc.com </span> <input type="text"
									class="form-control" id="r-id" v-model="user.id" /> <span
									class="register-msg" id="id-msg"></span>
							</div>
							<div class="form-group col-2">
								<label>&nbsp;</label><br />
								<button type="button" onclick="checkDupId()"
									class="btn btn-success btn-sm form-control">
									<small>이메일 중복체크</small>
								</button>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<label>이름</label> <input type="text" class="form-control"
									name="name" id="r-name" v-model="user.name" /> <span
									class="register-msg" id="name-msg"
									style="font-size: 3px; color: crimson;"></span>
							</div>
							<div class="form-group col-6">
								<label>닉네임</label> <input type="text" class="form-control"
									name="nickName" id="r-nickName" v-model="user.nickName" /> <span
									class="register-msg" id="nickName-msg"
									style="font-size: 3px; color: crimson;"></span>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<label>비밀번호</label> <input type="password" class="form-control"
									name="password" id="r-pwd" onclick="cleanMsg()"
									v-model="user.password" /> <span class="register-msg"
									id="pwd-msg"></span>
							</div>
							<div class="form-group col-6">
								<label>비밀번호 재입력</label> <input type="password"
									class="form-control" name="password2" id="r-pwd-check"
									onkeyup="checkPwd()" /> <span class="register-msg"
									id="pwd-check-msg"></span>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-6">
								<label>전화번호</label> <input type="text" class="form-control"
									name="tel" id="r-tel" v-model="user.tel" /> <span
									class="register-msg" id="tel-msg"></span>
							</div>
							<div class="form-group col-6">
								<label>생일</label> <input type="date" class="form-control"
									name="birthday" id="r-brd" v-model="user.birthday" /> <span
									class="register-msg" id="brd-msg"></span>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-6">
								<input type="text" class="postbox" id="sample6_postcode" name="postCode"
									placeholder="우편번호" class="postbox" v-model="user.postCode">
								<input type="button" @click="getAddress" value="우편번호 찾기"><br>
								<input type="text" class="postbox" id="sample6_address" name="addr"
									placeholder="주소" v-model="user.address"><br>
								<input type="text" class="postbox" id="sample6_detailAddress" name="detailAddr"
									placeholder="상세주소" v-model="user.addressDetail">
							</div>

							<div class="form-group col-6">
								<label>프로필 사진</label>
								<input type="file" class="form-control" @change="selectFiles" ref="file" />
							</div>
						</div>
						<!--사용자가 아닐 경우만 직급창 표시되도록  -->
						<div class="form-row">
							<div class="form-group col-12">
								<label>유형</label>
								<div class="form-control" id="dept-box">
									<span v-for="dept in deptList" class="mr-3"> <input
										type="radio" name="deptNo" :value="dept.no"
										v-model="user.deptNo"> <label><small>{{dept.name}}</small></label>
									</span>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-6" v-show="user.deptNo != 100">
								<label>직급</label> <select class="form-control"
									v-model="user.position">
									<option value="부장" selected>부장</option>
									<option value="차장">차장</option>
									<option value="과장">과장</option>
									<option value="대리">대리</option>
									<option value="주임">주임</option>
									<option value="사원">사원</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="text-right">
								<a href="main.html" class="btn btn-secondary">취소</a>
								<button type="button" @click="addUser" class="btn btn-primary"
									id="add-btn">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var telRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
    var idCheck = false;
    var pwdCheck = false;
   var checkFd = false;
    var addr = ''; // 주소 변수
    var extraAddr = ''; // 참고항목 변수
    
    // 아이디 중복체크 버튼
    function checkDupId() {
       $("#id-msg").text('');
       
      var inputId = $("#r-id").val();
      if(inputId == ''){
         $("#id-msg").css("color","red");
         $("#id-msg").text('* 아이디를 입력하세요.');
      }else if(!emailRegExp.test(inputId)){
         $("#id-msg").css("color","red");
         $("#id-msg").text('* 이메일 형식이 올바르지 않습니다.');
      }else{
         $.getJSON("/api/users/ckeckDupId.do",{id:inputId},function(user){
            console.log("받아온 유저 아이디: "+user.id)
            if(user.id == null){
               $("#id-msg").css("color","green");
               $("#id-msg").text('* 사용 가능한 아이디입니다.');
               idCheck = true;
            }else{
               $("#id-msg").css("color","red");
               $("#id-msg").text('* 이미 사용 중인 아이디입니다.');
            }
         })
      }
   }
    
   // 비밀번호 오류 메세지 없애기
   function cleanMsg() {
   if(!idCheck){
      $("#id-msg").css("color","red");
      $("#id-msg").text('* 아이디 중복 체크를 확인해주세요.');
   }
      $("#pwd-msg").text('');
      $("#pwd-check-msg").text('');
   }
   
   // 비밀번호 체크
   function checkPwd() {
      
      var pwd = $('#r-pwd').val();
      var leng = pwd.length;
      var pwd2 = $('#r-pwd-check').val();
      
      if(leng < 8){
         $("#pwd-msg").css('color','red');
         $("#pwd-msg").text('* 비밀번호는 8글자 이상으로 설정해주세요.');
         return;
      }
      if(pwd == pwd2){
         $("#pwd-check-msg").css('color','green');
         $("#pwd-check-msg").text('* 비밀번호가 일치합니다.');
         pwdCheck = true;
      }else{
         $("#pwd-check-msg").css('color','red');
         $("#pwd-check-msg").text('* 비밀번호가 일치하지 않습니다.');
         checkField = false;
      }
      
   }
    
   // 사용자 회원가입
    var app = new Vue ({
        el: '#registerPage',
        data: {
            deptList: [],
            user: {
                id: '',
                name: '',
                nickName: '',
                password: '',
                tel: '',
                birthday: '',
                address: '',
                addressDetail: '',
                postCode: '',
                deptNo: '100',
                position: '사용자'
            },
            selectedFiles: undefined,
            currentFile: undefined
        },
        methods: {
           getAddress: function() {
              var that = this;
              new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample6_detailAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("sample6_extraAddress").value = '';
                        }
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  		that.user.postCode = data.zonecode;
                 	    that.user.address = addr;
                    }
                }).open();
           },
           
			selectFiles: function () {
           		this.selectedFiles = this.$refs.file.files;
				this.currentFile = this.selectedFiles[0];
			},
			addUser: function () {
			    var v = app.user
				if(!(v.tel == '' || v.brd == '' || v.name == '' || v.nickName == '')){
				         checkFd = true;
				}
			    if(typeof currentFile =='undefined'){
			    	
			    }
				      
				if(idCheck && pwdCheck && checkFd){
					
					var formData = new FormData();
							
					formData.append('id', this.user.id);
	                formData.append('name', this.user.name);
	                formData.append('nickName', this.user.nickName);
	                formData.append('password', this.user.password);
	                formData.append('tel', this.user.tel);
	                formData.append('birthday', this.user.birthday);
	                formData.append('address', addr);
	                formData.append('addressDetail', extraAddr);
	                formData.append('postCord', this.user.postCord);
	                formData.append('photoFile', this.currentFile);
	                formData.append('deptNo', this.user.deptNo);
	                formData.append('position', this.user.position);
	                
					axios.post('http://localhost/api/users/addUser.do', formData,{
						headers:{
	                          'Content-Type':'multipart/form-data'
	                    }})
					.then(function (response) {
	                      console.log("### 응답: " + response);
	                      location.href = "http://localhost/main.do"
	                })
	                
				}else{
					alert("모든 값은 필수 입력값입니다.");
				}
			}
       	 	},
       	 created() {
                axios.get('http://localhost/api/depts').then(function (response) {
                    app.deptList = response.data;
                })
            }
        })
    
</script>
</html>