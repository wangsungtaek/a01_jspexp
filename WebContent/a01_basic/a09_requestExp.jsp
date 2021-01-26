<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script>
   window.onload=function(){
      
   };
</script>
</head>
<body>
<%-- 
http://localhost:7080/jspexp/a01_basic/a09_requestExp.jsp?pname=사과&cnt=5&price=2
ex1) ?pname=사과&cnt=5&price=2 출력
ex2) ?pay=현금&address=서울신림동&ps=바나나&ps=딸기&ps=오렌지
ex3) form 활용 전송페이지 a10_buyResult.jsp
	물건명 : [ ]
	가격 : [ ]
	갯수 : [ ] 
	구매방법 : [현금/카드/포인트]select(단일선택)
	배송지 : ()서울방배동()서울신림동()경기수원 radio(단일선택)
	기타관심 물품 : []바나나[]딸기[]수박[]오렌지[]키위(다중)
	[구매]
	
--%>
<%
	String product = request.getParameter("pname");
	if(product == null) product = "";
	String cnt = request.getParameter("cnt");
	if(cnt == null) cnt = "0";
	String price = request.getParameter("price");
	if(price == null) price = "0";
	
%>
	<table>
		<tr><th>상품명</th><td><%= product %></td></tr>
		<tr><th>갯수</th><td><%= cnt %></td></tr>
		<tr><th>가격</th><td><%= price %></td></tr>
	</table>
	
<%
	String money = request.getParameter("pay");
	String address = request.getParameter("address");
	String[] pro = request.getParameterValues("ps");
	
%>
	<table>
		<tr><th>상품명</th><td><%= money %></td></tr>
		<tr><th>갯수</th><td><%= address %></td></tr>
		<%
		if(pro != null) {
			for(String p : pro){ %>
			<tr><th>가격</th><td><%= p %></td></tr>
		<%		
			}
		}
		%>
		
		
	</table>

</body>
</html>