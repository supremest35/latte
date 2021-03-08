<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="board-form">
	<div class="card-body" id="intro-insert">
		<form>
			<div class="card">
				<div class="card-header">
					소개 입력폼
				</div>
				<div class="card-body">
					<label>내용</label>
					<textarea id="intro-content" name="content" rows="5" cols="95" required="required"></textarea>
					<label>사진파일</label>
					<input type="file" name="photoFile" id="photoFile"/>
				</div>
				<div class="card-footer">
					<a href="" class="badge badge-primary">등록</a>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="intro-modify">
		<form>
			<div class="card">
				<div class="card-header">
					소개 수정폼
				</div>
				<div class="card-body">
					<label>내용</label>
					<textarea id="intro-content" name="content" rows="5" cols="95" required="required"><c:out value="${profile.content }"/></textarea>
				</div>
				<div class="card-footer">
					<a href="" class="badge badge-primary">수정</a>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="keyword-insert">
		<form>
			<div class="card">
				<div class="card-header">
					키워드 입력폼
				</div>
				<div class="card-body">
					<label>키워드</label>
					<small>(예시: #미니홈피#싸이월드)</small>
					<textarea id="keyword-content" name="content" rows="5" cols="95" required="required"></textarea>
				</div>
				<div class="card-footer">
					<a href="" class="badge badge-primary">등록</a>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="qna-insert">
		<form id="qna-forms">
			<div class="card">
				<div class="card-header">
					문답 입력폼
				</div>
				<div class="card-body" id="qna-content">
					<div class="card">
						<div class="card-header"></div>
						<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
	    							<span class="input-group-text" >질문</span>
	    						</div>
	    						<input type="text" class="form-control" name="question" required="required">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
	    							<span class="input-group-text" >대답</span>
	    						</div>
	    						<input type="text" class="form-control" name="answer" required="required">
							</div>
						</div>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-8">
							<a href="" class="badge badge-primary" data-btn-id="submit-qna">등록</a>
						</div>
						<div class="col-2">
							<a href="" class="badge badge-primary" data-btn-id="add-qna">질문추가</a>
						</div>
						<div class="col-2">
							<a href="" class="badge badge-primary" data-btn-id="delete-qna">질문삭제</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="diary-insert">
		<form id="diary-forms">
			<div class="card">
				<div class="card-header">
					일기 입력폼
				</div>
				<div class="card-body" id="diary-content">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >제목</span>
   						</div>
   						<input type="text" class="form-control" name="title" required="required">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >내용</span>
   						</div>
   						<textarea rows="10" cols="95" class="form-control" name="content" required="required"></textarea>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-12">
							<a href="" class="badge badge-primary" data-btn-id="submit-diary">등록</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="diary-modify">
		<form id="diary-forms">
			<div class="card">
				<div class="card-header">
					일기 입력폼
				</div>
				<div class="card-body" id="diary-content">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >제목</span>
   						</div>
   						<input type="text" class="form-control" name="title" value="${diary.title }" required="required" />
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >내용</span>
   						</div>
   						<textarea rows="10" cols="95" class="form-control" name="content" required="required"><c:out value="${diary.content }"/></textarea>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-12">
							<a href="" class="badge badge-primary" data-btn-id="btn-modify-diary" data-diary-no="${diary.no }">수정</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="visualContent-insert">
		<form id="visualContent-forms">
			<div class="card">
				<div class="card-header">
					입력폼
				</div>
				<div class="card-body" id="visualContent-content">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >제목</span>
   						</div>
   						<input type="text" class="form-control" name="title" required="required">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >내용</span>
   						</div>
   						<textarea rows="10" cols="95" class="form-control" name="content" required="required"></textarea>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >파일</span>
   						</div>
						<input type="file" class="form-control" name="photoFile" id="photoFile" required="required"/>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-12">
							<a href="" class="badge badge-primary" data-btn-id="submit-visualContent">등록</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body" id="visualContent-modify">
		<form id="visualContent-forms">
			<div class="card">
				<div class="card-header">
					입력폼
				</div>
				<div class="card-body" id="visualContent-content">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >제목</span>
   						</div>
   						<input type="text" class="form-control" name="title" value="${board.title }" required="required">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
   							<span class="input-group-text" >내용</span>
   						</div>
   						<textarea rows="10" cols="95" class="form-control" name="content" required="required"><c:out value="${board.content }"/></textarea>
					</div>
				</div>
				<div class="card-footer">
					<div class="row">
						<div class="col-12">
							<a href="" class="badge badge-primary" data-btn-id="modify-visualContent" data-board-no="${board.no }">수정</a>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="visualContents"></div>
	<div id="board"></div>

</div>
