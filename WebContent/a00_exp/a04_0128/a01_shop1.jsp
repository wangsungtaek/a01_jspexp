<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.Product"
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
<body>
	<%
		session.setAttribute("p01", new Product("사과",1200,3));
		
	%>
	<h3>구매목록</h3>
	<a href="a02_shop2.jsp">show2 이동</a>
	<table>
		<tr><th>품명</th><th>가격</th><th>갯수</th></tr>
			<%
			if(session.getAttribute("p01") != null){
				Product p = (Product)(session.getAttribute("p01"));
			%>
				<tr><td><%=p.getName() %></td>
					<td><%=p.getPrice() %></td>
					<td><%=p.getCnt() %></td></tr>
			<%} %>
	</table>
</body>
</html>