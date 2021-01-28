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
		if(session.getAttribute("p01") != null){
			Product p = (Product)(session.getAttribute("p01"));
	%>
				
	<%		
		}
	%>
	<h3>shop2</h3>
	<table>
		<tr><th>품명</th><th>가격</th><th>수량</th>
		<%
		if(session.getAttribute("p01") != null){
			Product p = (Product)(session.getAttribute("p01"));
			p.setCnt(p.getCnt() + 1);
			session.setAttribute("p01", p);
		%>
			<tr><td><%=p.getName() %></td>
				<td><%=p.getPrice() %></td>
				<td><%=p.getCnt() %></td></tr>
		<%} %>
	</table>
</body>
</html>