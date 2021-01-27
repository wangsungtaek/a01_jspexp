<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
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
<%
	// a23_reqExp.jsp?pname=사과&pname=바나나&pname=딸기
	String[] pnames=request.getParameterValues("pname");
	// pnames={"사과","바나나","딸기"};
	// null에 대한 에러 방지 처리.
	if(pnames == null) pnames = new String[]{};
	
	//a23_reqExp.jsp?price=3000&price=4000&price=5000&cnt=2&cnt=3&cnt=5
	String[] prices = request.getParameterValues("price");
	String[] cnts = request.getParameterValues("cnt");
	if(prices == null) prices = new String[]{};
	if(cnts == null) cnts = new String[]{};
%>


<body>
	<h3>받은 다중의 데이터</h3>
	<table>
		<%for(int idx=0; idx<pnames.length; idx++){ %>
		<tr><th><%=idx+1 %></th><td><%=pnames[idx] %></td></tr>
		<%} %>
	</table>
	<h3>받은 다중의 데이터</h3>
	<table>
		<%for(int idx=0; idx<prices.length; idx++){ %>
		<tr><th>가격<%=idx+1 %></th><td><%=prices[idx] %></td></tr>
		<%} %>
		<%for(int idx=0; idx<cnts.length; idx++){ %>
		<tr><th>갯수<%=idx+1 %></th><td><%=cnts[idx] %></td></tr>
		<%} %>
	</table>
</body>
</html>