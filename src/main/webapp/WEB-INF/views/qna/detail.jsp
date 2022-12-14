<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
<c:import url="../template/headerHTML.jsp"></c:import>
</head>
<style>
#context {
	width: 200px;
}
</style>
<body>
	<section class="container-fluid col-lg-10 mt-5">

		<h1>Q&A Detail Page</h1>

		<table border="1" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>NUM</th>
					<th>TITLE</th>
					<th>USERID</th>
					<th>CONTENTS</th>
					<th>REGDATE</th>
					<th>HIT</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>${dto.num}</td>
					<td>${dto.title}</td>
					<td>${dto.userID}</td>
					<td id="context">
						<textarea style="border:none" name="" id="" cols="50" style="height: 200px;" rows="10" disabled>${dto.contents}</textarea>
					</td>
					<td>${dto.regDate}</td>
					<td>${dto.hit}</td>
				</tr>
			</tbody>
		</table>


		<!-- <a href="./list">리스트</a> <a href="./update?num=${dto.num}">수정</a>
		<a href="./delete?num=${dto.num}">삭제</a> 
		<a href="./reply?num=${qnaDTO.num}" class="btn btn-default" role="button">답글입력</a> -->

		<div style="display: inline-block; margin: 0 5px;  float: left;">
			<button onclick="location='./list'" class="btn btn-primary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
				</svg>
				목록
			</button>
		</div>


		<!-- <div class="modal" tabindex="-1">

			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">
						<h5 class="modal-title">localhost 내용:</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>

					<div class="modal-body">
						<p>작성자만 수정할 수 있습니다.</p>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary">확인</button>
					</div>

				</div>

			</div>

		</div> -->

		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo" id="modalOpenBtn" style="display: none;">수정</button>
		<div style="display: inline-block; margin: 0 5px;  float: left;">
			<!-- <input type="text" value="${dto.memberDTOs[0].userID}">
			<input type="text" value="${sessionScope.member.userID}"> -->
			<button onclick="location='./update?num=${dto.num}'" class="btn btn-primary" id="updateQna" data-userID="${dto.memberDTOs[0].userID}" data-user="${sessionScope.member.userID}">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
					<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
				</svg>
				수정
			</button>
		</div>


		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo" id="modalOpenBtn1" style="display: none;">삭제</button>
		<button onclick="location='./delete?num=${dto.num}'" class="btn btn-primary" id="deleteQna">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
			</svg>
			삭제
		</button>
		<br>
		<br>
		
		<div style="display: inline-block; margin: 0 5px;  float: right;">
			<button onclick="location='./reply?num=${qnaDTO.num}'" class="btn btn-secondary btn-sm">답글 달기</button>
		</div>

	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
<!-- 
	<script src="../../../resources/hjs/js/QnaList.js"></script> -->
</body>
</html>