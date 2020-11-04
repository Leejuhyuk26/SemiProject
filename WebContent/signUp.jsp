<!-- 로그인페이지, 이주혁 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메인 페이지  -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/index.css">
<link rel="stylesheet" href="CSS/signup.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/b95da9d126.js"
	crossorigin="anonymous"></script>
<title>LOGIN</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>

	<section class="conA">
		<div class="container">
			<form name="frm" id="contact-form" action="signupOk.do" method="post"
				onsubmit="return chkSubmit()">
				<div id="content-header">
					<h3>회원가입</h3>
				</div>
				<div>
					<label>ID :</label> <input type="text" name="c_id"
						placeholder="아이디를 입력해 주세요." />
				</div>
				<div>
					<label>PW :</label> <input type="password" name="c_pw"
						placeholder="비밀번호를 입력해 주세요." />
				</div>
				<div>
					<label>이름 :</label> <input type="text" name="c_name"
						placeholder="이름를 입력해 주세요." />
				</div>
				<div>
					<label>전화번호 :</label> <input type="text" name="c_phone"
						placeholder="전화번호를 입력해 주세요." />
				</div>
				<div>
					<label>이메일 :</label> <input type="text" name="c_email"
						placeholder="이메일을 입력해 주세요." />
				</div>
				<div class="clearfix"></div>
				<div class="content-footer">
					<p>우리는 가입자의 정보를 무단으로 사용하지 않습니다.</p>
				</div>
				<input type="submit" id="logbtn" class="hc vc" value="회원가입하기" /> <input
					type="button" class="navyBtn" value="돌아가기"
					onClick="location.href='index.jsp'">
			</form>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
<script src="JS/index.js" type="text/javascript"></script>
<script type="text/javascript" src="JS/signup.js"></script>
</html>