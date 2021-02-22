<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="taglib.jsp"%>
<!-- The Modal -->
<div class="modal" id="modal-findId">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">회원정보 찾기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body" id="find-modal-b">
				<div class="row">
					<div class="col-12">
						<ul class="nav nav-pills">
							<li class="nav-item col-6"><a class="nav-link active" data-toggle="pill" href="#find-id">아이디
									찾기</a></li>
							<li class="nav-item col-6"><a class="nav-link" data-toggle="pill" href="#find-pwd">비밀번호
									찾기</a></li>
						</ul>
					</div>
				</div>
				<!-- Tab panes -->
				<div class="row">
					<div class="col-12">
						<div class="tab-content">
							<div class="tab-pane container active" id="find-id">
								<div class="card">
									<div class="card-body">
										<label class="find-label col-3">사용자 이름</label> <input class="find-input col-9"
											type="text" name="name" id="i-name"><br />
										<label class="find-label col-3">연락처</label> <input class="find-input col-9"
											type="text" name="name" id="i-tel">
										<p class="find-msg" id="findId-msg" style="display: none;"></p>
										<button type="button" class="find-btn id-btn" onclick="findMyId()">조회하기</button>
									</div>
									<div class="card-footer" id="findId-success" style="display: none;">
										<h5 style="text-align: center;">조회 결과</h5>
										<p>
											<span class="user-name-sp"></span>(님)의 아이디는
										</p>
										<br>
										<p style="text-align: center;">
											<span class="found-id-sp"></span>입니다.
										</p>
										<button type="button" class="find-btn id-login"
											onclick="loginWithId()">로그인</button>
									</div>
									<div class="card-footer" id="findId-fail" style="display: none;">
										<h5 style="text-align: center;">조회 결과</h5>
										<p style="text-align: center;">조회결과가 존재하지 않습니다.</p>
									</div>
								</div>
							</div>

							<div class="tab-pane container fade" id="find-pwd">
								<div class="card">
									<div class="card-body">
										<label class="find-label  col-3">사용자 이름</label> <input class="find-input col-9"
											type="text" name="name" id="p-name"><br />
										<label class="find-label col-3">아이디</label> <input class="find-input col-9"
											type="text" name="id" id="p-id"><br />
										<label class="find-label col-3">연락처</label> <input class="find-input col-9"
											type="text" name="name" id="p-tel">
										<p class="find-msg" id="findPwd-msg" style="display: none;"></p>
										<button type="button" class="find-btn pwd-btn"
											onclick="findMyPwd()">조회하기</button>
									</div>
									<div class="card-footer" id="findPwd-success" style="display: none;">
										<h5 style="text-align: center;">조회 결과</h5>
										<p>
											<span class="user-name-sp"></span>(님)의 비밀번호가
										</p>
										<br>
										<p style="text-align: center;">
											등록된 이메일(아이디): <span class="found-id-sp"></span>으로 전송되었습니다.
										</p>
										<br>
									</div>
									<div class="card-footer" id="findPwd-fail" style="display: none;">
										<h5 style="text-align: center;">조회 결과</h5>
										<p style="text-align: center;">조회결과가 존재하지 않습니다.</p>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>