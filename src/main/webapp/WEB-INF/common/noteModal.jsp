<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>

<div class="modal fade" id="modal-note" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h6>${LOGINED_USER_NAME}(님)의 쪽지함</h6>
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
							<div class="card-body">
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
										<tr>
											<td><input type="checkbox" name="쪽지번호"></td>
											<td>손예진(이쁜언니)</td>
											<td>이쁜언니님께서 선물을 보냈습니다.</td>
											<td>2021-02-13</td>
											<td></td>
										</tr>
										<tr>
											<td><input type="checkbox" name="쪽지번호"></td>
											<td>한지민(예쁜언니)</td>
											<td>예쁜언니님께서 둘리님을 초대합니다.</td>
											<td>2021-02-10</td>
											<td>수락</td>
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
							<div class="card-body" id="modal-cd-second">
								<div class="card-column">
									<div class="card-box">
										<div class="card-view">
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
													<tr>
														<td><input type="checkbox" name="쪽지번호"></td>
														<td>공지철(도깨비)</td>
														<td>도깨비님께서 일촌신청을 보냈습니다.</td>
														<td>2021-02-13</td>
														<td>대기</td>
													</tr>
													<tr>
														<td><input type="checkbox" name="쪽지번호"></td>
														<td>이동욱(저승이)</td>
														<td>저승이님께서 일촌신청을 보냈습니다..</td>
														<td>2021-02-10</td>
														<td>수락</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 일촌신청 리스트 끝 -->
					<!-- 쪽지쓰기 -->
					<div id="write" class="container tab-pane fade">
						<br>
						<div class="card">
							<div class="card-body" id="modal-cd-last">
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
								<div class="form-group row">
									<div class="col-6">
										<label class="font-weight-bold">보내는 이</label> 
										<input type="text" class="form-control" name="user" value=${LOGINED_USER_NAME} readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">받는 사람</label> 
										<input type="text"class="form-control" name="recipient" v-model="newNote.recipientNo" />
									</div>
									<c:if test="newNote.categoryNo == 5">
									<div class="col-6">
										<label class="font-weight-bold">송신 부서</label> 
										<input type="text" class="form-control" name="user" value=${LOGINED_USER_NAME} readonly />
									</div>
									<div class="col-6">
										<label class="font-weight-bold">수신 부서</label> 
										<input type="text"class="form-control" name="recipient" v-model="newNote.recipientNo" />
									</div>
									</c:if>
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
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" @click="sendNote">보내기</button>
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
			noteCategories:[],
			newNote:{
				categoryNo:'',
				recipientNo:'',
				
				title:'',
				content:''
			}
		}, // end data
		methods: {
			sendNote: function () {
				axios.get("http://localhost/api/note/sendNote").then(function (response) {
					
				})
			}
		},
		computed: {
			categories: function() {
				var deptNo = '${loginedUser.deptNo}'
				if (deptNo == 100) {
					return this.noteCategories.slice(0.3); 
				} else {
					return this.noteCategories;
				}
			}
		},
		created(){
			var that = this;
			axios.get("http://localhost/api/note/getCategories").then(function(response){
				that.noteCategories = response.data;
			})
		}
		
	})
</script>