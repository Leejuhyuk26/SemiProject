<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>
<%
	// Controller 로부터 결과 데이터 받음
PetDTO[] arr = (PetDTO[]) request.getAttribute("list");
CustomerDTO[] carr = (CustomerDTO[]) request.getAttribute("clist");
Boolean chk = true;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/pet.css">
<title>애완견 정보 관리</title>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="announce">
				<h3><%=carr[0].getCus_name()%>님의 반려견 정보
				</h3>
			</div>
		</div>
	</section>
	<!-- 컨텐츠B -->
	<section class="conB">
		<div class="container">
			<!-- for 문 돌려야됨 -->
			<table>
				<thead>
					<tr>
						<th>강아지 이름</th>
						<th>강아지 나이</th>
						<th>강아지 무게</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (arr == null || arr.length == 0) {
						chk = false;
					}
					%>
					<%
						if (chk) {
						for (int i = 0; i < arr.length; i++) {
					%>
					<tr id="pet_list" onclick="petchk('pet_update.do?pet_num=<%=arr[i].getPet_num()%>&pet_name=<%=arr[i].getPet_name()%>&pet_age=<%=arr[i].getPet_age()%>&pet_weight=<%=arr[i].getPet_age()%>&pet_image=<%=arr[i].getPet_image()%>')">
						<td><%=arr[i].getPet_name()%></td>
						<td><%=arr[i].getPet_age()%></td>
						<td><%=arr[i].getPet_weight()%></td>
					</tr>
					<%
						} // end for
					}
					%>
				</tbody>
			</table>
		</div>
	</section>
	<!-- 컨텐츠C -->
	<section class="conC">
		<div class="container">
			<h3>펫 정보 추가</h3>
			<form name="frm" action="petOk.do" method="post"
				onsubmit="return chkSubmit()">
				강아지 이름<input type="text" name="pet_name"><br> 강아지 나이<input
					type="text" name="pet_age"><br> 강아지 무게<input type="text"
					name="pet_weight"><br> 
				<h3>강아지 사진</h3> 
				<input type="radio" name="pet_image" value="1"><img src="img/K-001.png">	
				<input type="radio" name="pet_image" value="2"><img src="img/K-002.png">	
				<input type="radio" name="pet_image" value="3"><img src="img/K-003.png">	
					
				<input type="submit" value="반려추" />
			</form>
		</div>
	</section>
	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>

<script type="text/javascript" src="JS/pet.js"></script>
</html>