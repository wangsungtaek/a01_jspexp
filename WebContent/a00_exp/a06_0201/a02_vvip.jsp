<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>VVIP페이지 입니다.</h3>
	<table>
		<tr><th>구매자</th>
			<td><%=request.getParameter("user") %></td></tr>
		<tr><th>물건명</th>
			<td><%=request.getParameter("pname") %></td></tr>
		<tr><th>가격</th>
			<td><%=request.getParameter("price") %></td></tr>
		<tr><th>개수</th>
			<td><%=request.getParameter("cnt") %></td></tr>
	</table>
	<%
	String name = request.getParameter("user");
	int tot = (Integer)request.getAttribute("tot");
	%>
	<h3><%=name %>님 총구매금액 <%=tot %>원으로 VVIP 페이지에 접속하셨습니다.</h3>
</body>
</html>