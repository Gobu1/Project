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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
></script>
</head>
<style>
a {
	text-decoration-line: none;
}
</style>

<body>
	<c:import url="../../template/headerHTML.jsp"></c:import>
	<form action="../member/adpage" method="post">
		<br>
		<section class="container-fluid">
			<div class="row">
				<table class="table table-hover">
					<h2>전체 회원 정보</h2>
					<tr>
						<td>아이디</td>
						<td>닉네임</td>
						<td>비밀번호</td>
						<td>이메일</td>
						<td>나이</td>
						<td>생년월일</td>
						<td>전화번호</td>
						<td>성별</td>
					</tr>
					<%
					try
					{
					%>
					<c:forEach items="${dto}" var="dto">
						<tr>
							<td>${dto.userID}</td>
							<td>${dto.userName}</td>
							<td>${dto.pwd}</td>
							<td>${dto.email}</td>
							<td>${dto.age}</td>
							<td>${dto.birth}</td>
							<td>${dto.phone}</td>
							<c:choose>
								<c:when test="${dto.gender eq 1}">
									<td>남</td>
								</c:when>
								<c:otherwise>
									<td>여</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					<%
					} catch (Exception e)
					{
					}
					%>
				</table>
			</div>
		</section>
		<%-- <% } catch (Exception e) { } %> --%>
		<c:catch></c:catch>
	</form>
	<c:import url="../../template/footerHTML.jsp"></c:import>
</body>

</html>