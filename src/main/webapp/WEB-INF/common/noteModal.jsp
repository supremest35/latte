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
							<a class="nav-link" :class="{active: tab == 'normal'}" data-toggle="tab" href="#normal" @click="changeTab('normal',1)">쪽지함</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" :class="{active: tab == 'friend'}" id="note-friend" data-toggle="tab" href="#friend" @click="changeTab('friend',1)">일촌신청</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" :class="{active: tab == 'send'}" data-toggle="tab" href="#send" @click="changeTab('send',1)">보낸 쪽지함</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#write" >쪽지쓰기</a>
						</li>
					</ul>
				</div>
				<!-- Tab panes -->
				<div class="tab-content">
					<!-- 쪽지함 -->
					<div id="normal" class="container tab-pane active">
						<br>
						<div class="card note-card">
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
										<tr class="note-table-tr">
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="normal in noteDtoList" :key="normal.noteNo">
											<td><input type="checkbox" :value="normal.noteNo" v-model="ckNormalNoteNo"></td>
											<td>{{normal.senderTotalName}}</td>
											<td><a data-toggle="inner-modal" href="#detail" @click="shownoteDetail(normal.noteNo)">{{normal.title}}</a></td>
											<td>{{normal.createdDate | moment}}</td>
											<td>{{normal.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<button type="button" class="del-btn btn-sm" @click="deleteNote(ckNormalNoteNo)">선택삭제</button>
						<!-- Block Pagination -->
						<ul class="pagination pagination-sm justify-content-center mb-1" >
						
							<li class="page-item" :class="{disabled:pagination.pageNo == 1}">
								<a class="page-link" @click="changeTab('normal',pagination.pageNo-1)">Previous</a>
							</li>
							
							<li v-for="i in paginationRange" class="page-item" :class="{active:pagination.pageNo == i}">
								<a class="page-link" @click="changeTab('normal',i)">{{i}}</a>
							</li>
							
							<li class="page-item" :class="{disabled:pagination.pageNo == pagination.totalPages}">
								<a class="page-link" @click="changeTab('normal',pagination.pageNo+1)">Next</a>
							</li>
						</ul>
					</div>
					<!-- 쪽지함 끝 -->
					<!-- 일촌신청 -->
					<div id="friend" class="container tab-pane fade">
						<br>
						<div class="card note-card">
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
										<tr class="note-table-tr">
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="friend in noteDtoList" :key="friend.noteNo">
											<td><input type="checkbox" :value="friend.noteNo" v-model="ckFriendNoteNo"></td>
											<td>{{friend.senderTotalName}}</td>
											<td><a data-toggle="inner-modal" href="#detail" @click="shownoteDetail(friend.noteNo)">{{friend.title}}</a></td>
											<td>{{friend.createdDate | moment}}</td>
											<td>{{friend.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<button type="button" class="del-btn btn-sm" @click="deleteNote(ckFriendNoteNo)">선택삭제</button>
						<ul class="pagination pagination-sm justify-content-center" >
						  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						  <li class="page-item"><a class="page-link" href="#">1</a></li>
						  <li class="page-item"><a class="page-link" href="#">2</a></li>
						  <li class="page-item"><a class="page-link" href="#">3</a></li>
						  <li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</div>
					<!-- 일촌신청 리스트 끝 -->
					<!-- 보낸 쪽지함 시작 -->
					<div id="send" class="container tab-pane fade" >
						<br>
						<div class="card note-card">
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
										<tr class="note-table-tr">
											<th></th>
											<th>보낸이</th>
											<th>제목</th>
											<th>날짜</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="send in noteDtoList" :key="send.noteNo">
											<td><input type="checkbox" :value="send.noteNo" v-model="ckSendNoteNo"></td>
											<td>{{send.senderTotalName}}</td>
											<td><a data-toggle="inner-modal" href="#detail" @click="shownoteDetail(send.noteNo)">{{send.title}}</a></td>
											<td>{{send.createdDate | moment}}</td>
											<td>{{send.status}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<button type="button" class="del-btn btn-sm" @click="deleteNote(ckSendNoteNo)" >선택삭제</button>
						<ul class="pagination pagination-sm justify-content-center" >
						  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
						  <li class="page-item"><a class="page-link" href="#">1</a></li>
						  <li class="page-item"><a class="page-link" href="#">2</a></li>
						  <li class="page-item"><a class="page-link" href="#">3</a></li>
						  <li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
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
										<p>{{detailNote.createdDate | moment}}</p>
									</div>
								</div>
								<div class="form-group row" v-show="detailNote.categoryNo == 5">
									<div class="col-6">
										<label class="font-weight-bold">송신 부서</label> 
										<input type="text" class="form-control" name="senderDept" :value="detailNote.senderDept" readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">수신 부서</label> 
										<input type="text"class="form-control" name="recDept" :value="detailNote.recDept" readonly/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-6">
										<label class="font-weight-bold">보내는 이</label>
										<input type="text" class="form-control" name="user" :value='detailNote.senderTotalName' readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">받는 사람</label> 
										<input type="text"class="form-control" name="recipient" :value='detailNote.recTotalName' readonly/>
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
 							    <div v-show="detailNote.categoryNo==1" class="btn-group btn-group-sm" id="friend-btn">
								    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
								       		친구 하기
								    </button>
							    <div class="dropdown-menu" id="friend-downMenu">
								    <button type="button" class="dropdown-item" id="accept-btn" @click="relationship('ACCEPT',detailNote.senderNo)">수락하기</button>
								    <button type="button" class="dropdown-item" id="deny-btn" @click="relationship('DENY',detailNote.senderNo)">거절하기</button>
							    </div>
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
			tab:'',
			// 노트리스트
			noteDtoList:[],
			pagination:{},
			paginationRange:[],
			// 노트 상세보기
			showInnerModal:false,
			detailNote:{},
			// 노트쓰기 초기 설정값
			deptList:[],
			noteCategories:[],
			loginedNo:'',
			userDept:'',
			newNote:{
				categoryNo:'',
				recipientNo:'',
				title:'',
				content:''
			},
			// 수신자 자동완성
			showSearchedUserList:false,
			userList:[],
			searchedUserList: [],
			// 선택 삭제 노트번호 배열
			ckNormalNoteNo:[],
			ckFriendNoteNo:[],
			ckSendNoteNo:[]
		}, // end data
		methods: {
			changeTab: function (tabName,pageNo) {
				var that = this;
				that.tab = tabName;
				var userNo = that.loginedNo;
				axios.get("http://localhost/api/notes/getDtoList",{ params: {pageNo:pageNo,sort:tabName,userNo:userNo}})
						.then(function(response){
							that.noteDtoList = response.data.noteDtos;
							that.pagination = response.data.pagination;
							that.pagnationRange(response.data.pagination.beginPage, response.data.pagination.endPage);
						})
			},
			pagnationRange: function(begin,end) {
				console.log("페이지범위 메소드 실행");
				this.paginationRange = new Array(end-begin+1).fill(begin).map((n,i)=>n+i);
	
				//new Array(end-begin+1).fill(begin).map((n,i)=>n+i).forEach((n) => self.paginationRange.push(n));
				
			},
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
				axios.post("http://localhost/api/notes/sendNote", noteApp.newNote).then(function (response) {
					alert(response.data);
					$("#selectedRec-name").text();
					noteApp.newNote.recipientNo = '';
					noteApp.newNote.title = '';
					noteApp.newNote.content = '';
				})
			},
			shownoteDetail: function (no) {
				noteApp.showInnerModal = true;
				axios.get("http://localhost/api/notes/getNoteDetail/"+no).then(function(response){
					noteApp.detailNote = response.data;
				})
			},
			closeInnerModal: function () {
				noteApp.showInnerModal = false
			},
			deleteNote: function (arr) {
				if(arr.length==0){
					alert("삭제할 쪽지를 선택해주세요.");
					return;
				}else{
					axios.post("http://localhost/api/notes/deleteNote",arr).then(function (response) {
						alert(response.data+"개의 쪽지가 삭제되었습니다.");
						noteApp.changeTab('friend');
					})
				}
			},
			relationship: function (status, friendNo) {
				var that = this;
				var userNo = that.loginedNo;
				
				axios.get("http://localhost/api/notes/setRelationship/",{ params: 
									{userNo: userNo, status: status, friendNo:friendNo}})
					.then(function (response) {
						console.log(response.data);
					})
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
			}
		},
		created() {
			var that = this;
			that.loginedNo = '${LOGINED_USER.no}'
	
			axios.get("http://localhost/api/notes/getCategories").then(function(response){
				that.noteCategories = response.data;
			})
			
			axios.get("http://localhost/api/users/getAllAvailableUser").then(function(response){
				that.userList = response.data;
			})
		}
	})
</script>