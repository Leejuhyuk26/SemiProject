<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ page import="com.lec.beans.*"%>
<!DOCTYPE html>
<%
	CustomerDTO[] crr = (CustomerDTO[]) request.getAttribute("clist");
	ProductDTO[] prr = (ProductDTO[])request.getAttribute("plist");
	String c_num = (String) session.getAttribute("c_num");
	String pName = prr[0].getPro_name();
	String pKind = prr[0].getPro_kind();
	String content = prr[0].getPro_content();
	int sCnt = 1;
	int pCnt = prr[0].getPro_cnt();
	int pNum = prr[0].getPro_num();
	int price = prr[0].getPro_price();
	int c_money = crr[0].getCus_money();
	int sSum = price*sCnt;
	String name;
    int a;
    if(session.getAttribute("c_num") != null){
       name = (String)session.getAttribute("c_num");
       a = Integer.parseInt(name);
    }else{
       name = null;
       a = 0;
    }
%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/b95da9d126.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="CSS/shopping.css">
<title>물품 구매</title>
</head>

<body>
	<!-- 헤더 -->
	<header>
		<div class="container">
			<i class="fas fa-dog"></i>
			<h2>구 매</h2>
			<!--  <input type="button" value="X" onClick="">-->
		</div>
	</header>
	<!-- 컨텐츠 A  -->
	<div class="containerA">
		<div class="c_money">
			보유 뼈다귀 :
			<%=c_money%>
			<i class="fas fa-bone"></i>
		</div>
		<section class="conA">
			<div class="deco">
				<div class="content">
					<%=content%>
					<div class="ctext">
						<%=pName%><br>
						<br> 가격 :
						<%=price%>
						<i class="fas fa-bone"></i><br> 
						구매 수량 : <%=sCnt %>

					</div>
				</div>
			</div>
		</section>
		<!-- 컨텐츠 C  -->
		<form name="frm" method="post">
			<input type="hidden" name="pName" value="<%=pName%>" /> 
			<input type="hidden" name="price" value="<%=price%>" /> 
			<input type="hidden" name="sSum" value="<%=sSum%>" /> 
			<input type="hidden" name="sCnt" value="<%=sCnt%>" /> 
			<input type="hidden" name="pNum" value="<%=pNum%>" /> 
			<input type="hidden" name="c_num" value="<%= a %>"><br>
			<div class="sum">
				총 결제 금액 :
				<%=price %>
				<i class="fas fa-bone"></i>
			</div>
	</div>
	<!-- 푸터 -->
	<footer>
		<div class="container">
			<button type="submit" onclick="submit2(<%=c_money%>,<%=price%>)">
				<h2>구매하기</h2>
			</button>
		</div>
	</footer>
	</form>



</body>
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="JS/shopping.js"></script>
</html>