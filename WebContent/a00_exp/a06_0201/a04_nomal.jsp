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
	<%
	String name = request.getParameter("user");
	int tot = (Integer)request.getAttribute("tot");
	%>
	<h3><%=name %>님 총구매금액 <%=tot %>원으로 일반고객 페이지에 접속하셨습니다.</h3>
</body>
</html>