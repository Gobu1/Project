<%@page import="org.springframework.jdbc.support.JdbcUtils"%>
<%@page import="com.iu.home.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
></script>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.emcs {
	display: flex;
	/* input: read-only; */
	background-color: #dedede;
}

/* read-only style */
select {
	padding: 7px;
	vertical-align: middle
}
</style>
<body>
	<c:import url="../../template/headerHTML.jsp"></c:import>

	<form action="../member/join" method="post" id="frm" name="myform">
		<br>
		<h1 style="text-align: center;">회원 가입</h1>
		<section class="col-lg-6 container-fluid mt-4">
			<div class="row">
				<!-- id -->
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="userID" aria-describedby="emailHelp" placeholder="아이디 입력" onfocus="this.placeholder=''"
						onblur="this.placeholder='아이디 입력'" id="id"
					>
					<!-- <button type="button" id="idchecked" class="btn btn-outline-dark">ID 중복 체크</button> -->
					<!-- onclick="check();" -->
					<!-- id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상 -->
					<div id="idText" style="display: none; color: #dc3545;">2글자 이상 입력해야 합니다.</div>
					<div>
						<font id="id_feedback" size="3"></font>
					</div>
				</div>

				<!-- password 1 -->
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="pwd" placeholder="비밀번호 입력" id="pwd" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호 입력'" autocomplete="off"
					>
					<!-- pwd를 입력할 때마다 (1글자씩) 메세지를 출력 : pwd - 최소 6글자 이상 -->
					<div id="pwdText" style="display: none; color: #dc3545;">6글자 이상 16글자 이하로 입력해야 합니다.</div>
				</div>
				<!-- password 2 -->
				<div class="mb-3">
					<label class="form-label">비밀번호 확인</label>
					<!-- name="pwd"-->
					<input type="password" class="form-control" placeholder="비밀번호 확인" id="pwd2" onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 확인'"
					autocomplete="off">
					<!-- pwd를 입력하고 나왔을 때 첫번째 pwd와 값 비교 후 메세지 출력 : 같다, 다르다 -->
					<div id="pwdText2" style="display: none; color: #dc3545;">PWD가 일치하지 않습니다.</div>
				</div>
				<!-- name -->
				<div class="mb-3">
					<label class="form-label">닉네임</label>
					<input type="text" class="form-control" name="userName" aria-describedby="emailHelp" placeholder="닉네임 입력" onfocus="this.placeholder=''"
						onblur="this.placeholder='닉네임 입력'" id="name" autocomplete="off"
					>
					<!-- 입력 후 최소 1글자 이상 -->
					<div id="nameText" style="display: none; color: #dc3545;">글자 수가 너무 짧습니다.</div>
					<div>
						<font id="name_feedback" size="3"></font>
					</div>
				</div>
				<!-- email -->
				<div class="mb-7">
					<label class="form-label" required>이메일</label>
					<div class="emcs">
						<!-- 이메일 @뒤 내용 스크롤 만들기 -->
						<!-- style="width: 46%; padding: 5px; border: 1px solid #dedede" -->
						<input type="hidden" name="email" id="email">
						<input style="width: 37%; padding: 5px; border: 1px solid #dedede" name="emaill" id="emaill" type="text" placeholder="이메일 입력"
							onfocus="this.placeholder=''" onblur="this.placeholder='이메일 입력'" autocomplete="off"
						>
						<input style="width: 37%; padding: 5px; border: 1px solid #dedede" name="email2" id="email2" type="text"
						placeholder="입력하지 말고 선택하세요."
							onfocus="this.placeholder=''" onblur="this.placeholder='입력하지 말고 선택하세요.'" autocomplete="off"
						>
						<br>
						<select style="width: 27%; justify-content: right;" name="select_email" id="emse" class="kind">
							<option class="kinds" value="">이메일 선택</option>
							<option class="kinds" value="@naver.com">naver.com</option>
							<option class="kinds" value="@gmail.com">gmail.com</option>
							<option class="kinds" value="@daum.com">daum.com</option>
						</select>
					</div>
					<!-- 입력 후 최소 1글자 이상 -->
					<div id="emailText11" style="display: none; color: #dc3545;">이메일 형식에 맞게 입력하세요.</div>
					<div id="emailText" style="display: none; color: #dc3545;">글자 수가 너무 짧습니다.</div>
					<div id="emailText2" style="display: none; color: #dc3545;">빈칸은 사용할 수 없습니다.</div>
					<div>
						<font id="email_feedback" size="3"></font>
					</div>
				</div>
				<!-- phone -->
				<br> <br> <br>
				<div class="mb-3">
					<label class="form-label">전화번호</label>
					<input type="text" class="form-control" name="phone" id="phone" placeholder="전화번호 입력 - 010-xxxx-xxxx" onfocus="this.placeholder=''"
						onblur="this.placeholder='전화번호 입력 - 010-xxxx-xxxx'" autocomplete="off"v
					>
					<!-- 입력 후 최소 1글자 이상 -->
					<div id="phoneText" style="display: none; color: #dc3545;">글자 수가 너무 짧습니다.</div>
					<div id="phoneText1" style="display: none; color: #dc3545;">휴대전화 번호 형식에 맞지 않습니다.</div>
					<div id="phoneText2" style="display: none; color: #dc3545;">숫자를 입력하세요.</div>
					<div>
						<font id="phone_feedback" size="3"></font>
					</div>
				</div>
				<!-- 나이 -->
				<div class="mb-3">
					<label class="form-label">나이</label>
					<input type="text" class="form-control" name="age" id="age" placeholder="나이 입력" onfocus="this.placeholder=''" onblur="this.placeholder='나이 입력'"
					autocomplete="off">
					<!-- 입력 후 최소 1글자 이상 -->
					<div id="ageText" style="display: none; color: #dc3545;">글자 수가 너무 짧습니다.</div>
					<div id="ageText1" style="display: none; color: #dc3545;">0보다 큰 숫자를 입력하세요.</div>
					<div id="ageText2" style="display: none; color: #dc3545;">숫자를 입력하세요.</div>
					<div id="ageText3" style="display: none; color: #dc3545;">2자리 이하만 입력 가능합니다.</div>
				</div>
				<!-- 생년월일 -->
				<div class="mb-3">
					<label class="form-label">생년월일</label>
					<input type="text" class="form-control" name="birth" id="birth" placeholder="생년월일 입력 - ex)990807" onfocus="this.placeholder=''"
						onblur="this.placeholder='생년월일 입력 - ex)990807'" autocomplete="off"
					>
					<div id="birthText" style="display: none; color: #dc3545;">6자를 입력하세요</div>
					<div id="birthText1" style="display: none; color: #dc3545;">6자를 입력하세요</div>
					<div id="birthText2" style="display: none; color: #dc3545;">숫자를 입력하세요.</div>
				</div>
				<!-- 성별 -->
				<div class="mb-3">
					<label class="form-label">성별</label>
					<input type="text" class="form-control" name="gender" id="gender" placeholder="성별 입력 - 남: 1, 여: 2" onfocus="this.placeholder=''"
						onblur="this.placeholder='성별 입력 - 남: 1, 여: 2'" autocomplete="off"
					>
					<!-- 입력 후 최소 1글자 이상 -->
					<div id="genderText" style="display: none; color: #dc3545;">최소 1글자를 입력하세요.</div>
					<div id="genderText1" style="display: none; color: #dc3545;">형식에 맞게 입력하세요.</div>
					<div id="genderText2" style="display: none; color: #dc3545;">1 또는 2만 입력 가능합니다.</div>
					<div id="genderText3" style="display: none; color: #dc3545;">숫자를 입력하세요.</div>
				</div>

				<!-- id, pwd, name, email, phone의 각 조건을 검사 후 조건이 맞을때만 회원가입 -->
				<div>
					<button type="button" id="btn1" class="btn btn-outline-dark">회원 가입</button>
					<button type="reset" class="btn btn-outline-dark">초기화</button>
				</div>
			</div>
		</section>
		<br> <br>
	</form>

	<c:import url="../../template/footerHTML.jsp"></c:import>
	<script src="/resources/kjk/js/join.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</body>

</html>