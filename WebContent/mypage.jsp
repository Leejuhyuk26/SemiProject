<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lec.beans.*"%>

<%
	// Controller 로부터 결과 데이터 받음
CustomerDTO[] arr = (CustomerDTO[])request.getAttribute("list");
ReservationDTO [] rarr  = (ReservationDTO[])request.getAttribute("rlist");
PetDTO [] parr= (PetDTO[])request.getAttribute("plist");
Boolean chk = true;

String [] state = new String[3];
state[0]="예약 종료";
state[1]="예약변경가능";
state[2]="투숙중";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="CSS/mypage.css">
<title>마이 페이지</title>
</head>
<script>
</script>

<body>
	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"></jsp:include>
	<!-- 컨텐츠A -->
	<section class="conA">
		<div class="container">
			<div class="announce">
				<h3><%=arr[0].getCus_name() %>님의 정보</h3>
			</div>
			<table>
			</table>
		</div>
	</section>
	<!-- 컨텐츠B -->
	
	<section class="conB">
		<div class="container">
		<table>
		<thead>
			<tr>
				<th>예약 날짜</th>
				<th>예약 종료 날짜</th>
				<th>강아지 이름</th>
				<th>예약 상태</th>
			</tr>
		</thead>
		<tbody>
<%
	if(rarr==null || rarr.length==0){
		chk=false;
	}

%>		
<%
	if(chk){
		for(int i = 0; i < rarr.length; i++){
%>
			<tr id="reserve_list" onclick="window.open('reserve_update.jsp?pet_name=<%=parr[rarr[i].getPet_num()-1].getPet_name()%>&startdate=<%=rarr[i].getRes_startdate()%>&lastdate=<%=rarr[i].getRes_lastdate() %>&res_info=<%=rarr[i].getRes_sinfo() %>&memo=<%=rarr[i].getRes_message() %>&state=<%=rarr[i].getRes_state() %>&res_num=<%=rarr[i].getRes_num() %>&pet_num=<%=rarr[i].getPet_num() %>','info','width=500,height=800,left=650,location=no,status=no,scrollbars=no');">
				<td id="akak"><%= rarr[i].getRes_startdate() %></td>
				<td id="akak"><%= rarr[i].getRes_lastdate() %></td>
				<td id="akak"><%= parr[rarr[i].getPet_num()-1].getPet_name() %></td>
				<td id="akak"><%= state[rarr[i].getRes_state()] %></td>
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
			<table>
				<tr>
					<td><h3>뼈다귀현황</h3></td>
				</tr>
				<tr>
					<td>
						<h2>
							<%=arr[0].getCus_money()%><i class="fas fa-bone"></i>
						</h2>
					</td>
				</tr>
				<tr>
					<td>
						<button onclick="window.open('charge.jsp','charge','width=500,height=615,left=650,location=no,status=no,scrollbars=no');">충전</button>
					</td>
				</tr>
			</table>
		</div>
	</section>

	<!-- 푸터 -->
	<jsp:include page="common/footer.jsp"></jsp:include>
</body>
</html>