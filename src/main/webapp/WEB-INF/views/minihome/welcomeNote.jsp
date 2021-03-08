<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://momentjs.com/downloads/moment-with-locales.min.js"></script>
<style type="text/css">
		
</style>
</head>

<body>
	<div class="container-fluid" id="welcomeNote-form">
		<div class="card">
			<div class="card-header">
				대문글 입력 폼
			</div>
			<div class="card-body">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" >내용</span>
					</div>
					<textarea rows="7" cols="30" class="form-control" name="content" required="required"></textarea>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" >사진파일</span>
					</div>
					<input type="file" class="form-control" name="photoFile" id="photoFile" required="required"/>
				</div>
			</div>
			<div class="card-footer">
					<div class="row">
						<div class="col-12">
							<a href="" class="badge badge-primary">등록</a>
						</div>
					</div>
				</div>
		</div>	
	</div>
<script type="text/javascript">
	$("#welcomeNote-form a").click(function() {
		
		var formData = new FormData;
		
		formData.append("content", $("textarea[name=content]").val());
		formData.append("miniHomeNo", ${miniHomeNo});
		formData.append("photoFile", $("#photoFile")[0].files[0]);
		axios.post('http://localhost/minihome/api/insertWelcomeNote.do', formData, {
			  headers: {
			    'Content-Type': 'multipart/form-data'
			  }
			}).then(function(response) {
				opener.document.location.reload();
				self.close();
			})
		return false;
	})
	
</script>
</body>
</html>