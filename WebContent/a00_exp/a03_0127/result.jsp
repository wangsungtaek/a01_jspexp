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
<body>
<%--
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, point는 숫자값이 되게 js로 처리한 후,
       result.jsp에서 해당 값을 출력하세요 처리하세요.
 --%>
	<h3>결과</h3>
	<%
		String inId = request.getParameter("id");
		String inPoint = request.getParameter("point");
	%>
	<table>
		<tr><th>아이디</th><td><%=inId %></td></tr>
		<tr><th>포인트</th><td><%=inPoint %></td></tr>
	</table>
</body>
</html>