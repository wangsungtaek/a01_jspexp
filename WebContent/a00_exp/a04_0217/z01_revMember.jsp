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
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
	<jsp:useBean id="member2" class="jspexp.z01_vo.Member2" scope="request"></jsp:useBean>
	<jsp:setProperty property="*" name="member2"/>
	<h3>회원확인</h3>
	<table>
		<tr><th>아이디</th><td><%=member2.getId() %></td></tr>
		<tr><th>패스워드</th><td><%=member2.getPw() %></td></tr>
		<tr><th>이름</th><td><%=member2.getName() %></td></tr>
		<tr><th>포인트</th><td><%=member2.getPoint() %></td></tr>
		<tr><th>권한</th><td><%=member2.getAuth() %></td></tr>
	</table>
</body>
</html>