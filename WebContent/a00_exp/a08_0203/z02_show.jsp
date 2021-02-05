<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.net.*"
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
	Cookie[] cks = request.getCookies();
%>
	<h3>주문내역확인 (쿠키값 확인)</h3>
	<table>
		<%
		for(Cookie c : cks) {
			if(c.getName().equals("pname")){
		%>
		<tr><th>물건명</th><td><%=URLDecoder.decode(c.getValue(), "utf-8") %>가 주문되었습니다.</td></tr>
		<%
			}
			if(c.getName().equals("price")){
		%>
		<tr><th>가격</th><td><%=c.getValue() %></td></tr>
		<%	
			}
			if(c.getName().equals("cnt")){
		%>
			<tr><th>갯수</th><td><%=c.getValue() %></td></tr>
		<%	
			}
		} %>
	</table>

</body>
</html>