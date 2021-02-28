<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>


<div class="modal fade" id="modal-note" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6>${LOGINED_USER.name}(님)의 쪽지함</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!-- 쪽지모달바디 -->
			<div class="modal-body">
				<div class="container">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#home">쪽지함</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#friend">일촌신청</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#send" >보낸 쪽지함</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#write" >쪽지쓰기</a>
						</li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- 쪽지함 -->
					<div id="home" class="container tab-pane active">
						<br>
						<div class="card">
							<div class="card-body" id="note-modal">
								<table class="card-table-snd table-sm">
									<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="*">
										<col width="17%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="oNote in otherOriginNotes" :key="oNote.no">
											<td><input type="checkbox" name="oNote.no"></td>
											<td>{{oNote.senderNo}}번 유저이름</td>
											<td><a data-toggle="inner-modal" data-target="#detail" @click="shownoteDetail(oNote)">{{oNote.title}}</a></td>
											<td>{{oNote.createdDate | moment}}</td>
											<td>{{oNote.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 쪽지함 끝 -->
					<!-- 일촌신청 -->
					<div id="friend" class="container tab-pane fade">
						<br>
						<div class="card">
							<div class="card-body" id="note-modal">
								<table class="card-table-snd table-sm">
									<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="*">
										<col width="17%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="fNote in freindOriginNotes" :key="fNote.no">
											<td><input type="checkbox" value="fNote.no"></td>
											<td>${LOGINED_USER.name}</td>
											<td><a data-toggle="inner-modal" data-target="#detail" @click="shownoteDetail(fNote)">{{fNote.title}}</a></td>
											<td>{{fNote.createdDate | moment}}</td>
											<td>{{fNote.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 일촌신청 리스트 끝 -->
					<!-- 보낸 쪽지함 시작 -->
					<div id="send" class="container tab-pane fade" >
						<br>
						<div class="card">
							<div class="card-body" id="note-modal">
								<table class="card-table table-sm">
									<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="*">
										<col width="17%">
										<col width="8%">
									</colgroup>
									<thead>
										<tr>
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="sNote in sendNoteList" :key="sNote.no">
											<td><input type="checkbox" value="sNote.no"></td>
											<td>{{sNote.senderNo}}</td>
											<td><a data-toggle="inner-modal" data-target="#detail" @click="shownoteDetail(sNote.no)">{{sNote.title}}</a></td>
											<td>{{sNote.createdDate | moment}}</td>
											<td>{{sNote.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 보낸 쪽지함 끝 -->
					<!-- 쪽지쓰기 -->
					<div id="write" class="container tab-pane fade">
						<br>
						<div class="card">
							<div class="card-body" id="note-modal">
								<div class="form-group">
									<label class="font-weight-bold">요약</label>
									<div class="form-check" >
										<div class="form-check-inline" v-for="(cat, index) in categories" :key="cat.no">
											<label class="form-check-label"> 
												<input type="radio" class="form-check-input" name="catrgory" :value="cat.no" v-model="newNote.categoryNo">{{cat.name}}
											</label>
										</div>
									</div>
								</div>
								<div class="form-group row" v-show="newNote.categoryNo == 5">
									<div class="col-6">
										<label class="font-weight-bold">송신 부서</label> 
										<input type="text" class="form-control" name="userDept" :value="userDept" readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">수신 부서</label> 
										<input type="text"class="form-control" name="recDept" placeHoder="수신자 부서" id="selectedRec-dept" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-6">
										<label class="font-weight-bold">보내는 이</label>
										<input type="text" class="form-control" name="user" value=${LOGINED_USER.name} readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">받는 사람</label> 
										<input type="text"class="form-control" name="recipient" @input="typing" id="selectedRec-name"/>
									</div>
									<div class="col-6 offset-6 mt-2">
										<ul v-show="showSearchedUserList" class="list-group">
											<li class="list-group-item" 
												style="cursor: pointer;"
												v-for="(recipient, index) in searchedUserList" :key="index"
												@click="selectRecipient(recipient)">{{recipient.name}}({{recipient.nickName}})
											</li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">제목</label> 
									<input type="text" class="form-control"	name="title" v-model="newNote.title" />
								</div>
								<div class="form-group">
									<label class="font-weight-bold">내용</label>
									<textarea rows="5" class="form-control" name="content" v-model="newNote.content"></textarea>
								</div>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-primary" @click="sendNote">보내기</button>
							</div>
						</div>
					</div>
					<!-- 노트 상세보기 시작 -->
					<div id="detail" class="inner-modal" v-show="showInnerModal">
						<br>
						<div class="card" id="detail-modal">
							<div class="card-header flex-container" >
								<h6 id="modal-h">쪽지 상세보기</h6>
								<button type="button" class="btn-sm" id="btn-close" @click="closeInnerModal" aria-label="Close">
									<span aria-hidden="true">&times;</span>									
								</button>
							</div>
							<div class="card-body" id="note-modal">
								<div class="form-group row">
									<div class="col-6">
										<label class="font-weight-bold">요약</label>
										<p>{{detailNote.categoryName}}</p>
									</div>
									<div class="col-6">
										<label class="font-weight-bold">날짜</label>
										<p>{{detailNote.date | moment}}</p>
									</div>
								</div>
								<div class="form-group row" v-show="detailNote.categoryNo == 5">
									<div class="col-6">
										<label class="font-weight-bold">송신 부서</label> 
										<input type="text" class="form-control" name="senderDept" :value="detailNote.senderDept" readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">수신 부서</label> 
										<input type="text"class="form-control" name="recDept" :value="detailNote.recipientDept" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-6">
										<label class="font-weight-bold">보내는 이</label>
										<input type="text" class="form-control" name="user" :value="detailNote.senderName" readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">받는 사람</label> 
										<input type="text"class="form-control" name="recipient" :value="detailNote.recipientName" readonly/>
									</div>
								</div>
								<div class="form-group">
									<label class="font-weight-bold">제목</label> 
									<input type="text" class="form-control"	name="title" :value="detailNote.title" readonly />
								</div>
								<div class="form-group">
									<label class="font-weight-bold">내용</label>
									<textarea rows="5" class="form-control" name="content" :value="detailNote.content" readonly></textarea>
								</div>
							</div>
						</div>
					</div>
					<!-- 노트 상세보기 끝 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal">쪽지함 닫기</button>
					</div>
				</div>
				<!-- end tab -->
			</div>
			<!-- end modal-body -->
		</div>
	</div>
</div>
<script>
	
	var noteApp = new Vue({
		el:'#modal-note',
		data:{
			showInnerModal:false,
			sendNoteList:[],
	        recivedNoteList:[],
	        freindOriginNotes:[],
	        otherOriginNotes:[],
			dataPerPage:5,
			curPageNo:1,
			userDept:'',
			noteCategories:[],
			deptList:[],
			newNote:{
				categoryNo:'',
				recipientNo:'',
				title:'',
				content:''
			},
			detailNote:{
				categoryNo:'',
				categoryName:'',
				senderName:'',
				senderDept:'',
				recipientName:'',
				recipientDept:'',
				title:'',
				content:'',
				date:''
			},
			showSearchedUserList:false,
			userList:[],
			searchedUserList: []
		}, // end data
		methods: {
			typing: function(e) {
				this.noteSearchName = e.target.value;
				this.searchedUserList = [];
				this.showSearchedUserList = false;
				
				if (this.noteSearchName) {
					this.userList.filter(function(user, index) {
						return user.name.indexOf(noteApp.noteSearchName) != -1;
					}).forEach(function(user, index) {
						noteApp.searchedUserList.push(user);
					})
					this.showSearchedUserList =!! this.searchedUserList.length
				} 
			},
			selectRecipient: function(recipient) {
				this.recipientUser = recipient;
				document.querySelector('#selectedRec-name').value = recipient.name +"("+ recipient.nickName+")";
				this.newNote.recipientNo = recipient.no;
				this.searchedUserList = [];
				this.showSearchedUserList = false;
				document.querySelector('#selectedRec-dept').value = this.getDeptName(recipient.deptNo);
			},
			getDeptName: function (no) {
				for(var i =0; i <noteApp.deptList.length; i++){
					if(noteApp.deptList[i].no === no ){
						return noteApp.deptList[i].name;
					}
				}
			},
			sendNote: function () {
				if(noteApp.newNote.categoryNo == ''){
					alert("<요약> 항목을 선택해주세요.");
					return;
				}
				console.log("##categoryNo " + noteApp.newNote.categoryNo);
				
				axios.post("http://localhost/api/note/sendNote", noteApp.newNote).then(function (response) {
					alert('쪽지 전송이 완료되었습니다.');
					noteApp.newNote.title = '';
					noteApp.newNote.content = '';
				})
			},
			shownoteDetail: function (no) {
				noteApp.showInnerModal = true;
				
				console.log("디테일 번호===>" + no)
				axios.get("http://localhost/api/note/getNoteDetail/"+no).then(function(response){
					var detail = response.data;
					noteApp.detailNote.categoryNo = detail.noteCategory.no;
					noteApp.detailNote.categoryName = detail.noteCategory.name;
					noteApp.detailNote.senderName = detail.sender.name+"("+detail.sender.nickName+")";
					noteApp.detailNote.senderDept = detail.senderDept.name;
					noteApp.detailNote.recipientName = detail.recipient.name+"("+detail.recipient.nickName+")";
					noteApp.detailNote.recipientDept = detail.senderDept.name;
					noteApp.detailNote.title = detail.note.title;
					noteApp.detailNote.content = detail.note.content;
					noteApp.detailNote.date = detail.note.createdDate;
				})
			},
			closeInnerModal: function () {
				noteApp.showInnerModal = false
				
			}
		}, // end methods
		filters: {
			moment: function (value) {
				return moment(value).format('YYYY-MM-DD');
			}
		},
		computed: {
			categories: function() {
				var that = this
				var deptNo = '${LOGINED_USER.deptNo}'
				axios.get("http://localhost/api/depts").then(response => {
					for(var i =0; i <response.data.length; i++){
						if(response.data[i].no == deptNo){
							this.userDept = response.data[i].name;
						}
					}
					noteApp.deptList = response.data;
				})
				
				if (deptNo == 100) {
					return this.noteCategories.splice(0,4); 
				} else {
					return this.noteCategories;
				}
			},
			sortNotes: function() {
	            this.recivedNoteList.forEach(note => {
	                if(note.categoryNo == 1){
	                    this.freindOriginNotes.push(note);
	                }else{
	                    this.otherOriginNotes.push(note);
	                }
	            })
	        },
			start() {
				return ((this.curPageNo -1) * this.dataPerPage);
			},
			end() {
				return ((this.start + this.dataPetPage));
			}
		},
		created(){
			var that = this;
			var loginedNo = '${LOGINED_USER.no}'
	
			axios.get("http://localhost/api/note/getCategories").then(function(response){
				that.noteCategories = response.data;
			})
			
			axios.get("http://localhost/api/note/getAllNotes/"+loginedNo).then(function(response){
	            for(var i = 0; i < response.data.length; i++){
	                var note = response.data[i];
	                if(note.senderNo == loginedNo){
	                    that.sendNoteList.push(note);
	                }else{
	                    that.recivedNoteList.push(note);
	                }
	            }
	        })
			
			axios.get("http://localhost/api/users/getAllAvailableUser").then(function(response){
				that.userList = response.data;
			})
		}
	})
</script>