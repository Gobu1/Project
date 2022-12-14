<%@page import="com.iu.home.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.iu.home.member.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
</head>
<c:import url="../template/headerHTML.jsp"></c:import>
<style>
#on {
	align-content: right;
	justify-content: right;
	/* margin-left: 46%; */
}
</style>
<body>
	<section class="container-fluid col-lg-6 mt-5">
		<h1>공지사항 Add Page</h1>

		<form action="./add" method="post">
			<div class="mb-3">
				<label for="formGroupExampleInput2" class="form-label">작성자</label>
				<input type="hidden" name="userID" value="${member.userID}">
				<input type="text" class="form-control" value="${member.userID}" disabled>
			</div>
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">제목</label>
				<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요.">
			</div>
			<div class="mb-3">
				<label for="formGroupExampleInput2" class="form-label">글 내용</label>
				<textarea name="contents" id="contents" class="form-control" cols="20" rows="5" placeholder="내용을 입력하세요."></textarea>
				<!-- <input type="text" class="form-control" name="contents" placeholder="${dto.contents}"> -->
			</div>
			<br>
			<!-- <div style="display: inline-block; margin: 0 5px;  float: left;">
				<button onclick="location='../noice/list'" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
						<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
					</svg>
					홈으로
				</button>
			</div> -->

			<div style="display: inline-block; margin: 0 5px;  float: right;">
				<button id="on" type="submit" class="btn btn-success">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-all" viewBox="0 0 16 16">
						<path d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z"/>
					  </svg>
					작성완료
				</button>
			</div>
		</form>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>
	<c:import url="../template/footerHTML.jsp"></c:import>

</body>
</html>