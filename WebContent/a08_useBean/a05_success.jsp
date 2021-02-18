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
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$("h3").text("로그인 성공");
	});
</script>
</head>
<body>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
	<h3>제목</h3>
	<table>
		<tr><th>아이디</th><td><%=m.getId() %></td></tr>
		<tr><th>이름</th><td><%=m.getName() %></td></tr>
		<tr><th>권한</th><td><%=m.getAuth() %></td></tr>
		<tr><th>포인트</th><td><%=m.getPoint() %></td></tr>
	</table>
</body>
</html>