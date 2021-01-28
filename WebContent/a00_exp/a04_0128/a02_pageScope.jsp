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
</head>
<body>
	<%
		pageContext.setAttribute("test1", "테스트1");
		request.setAttribute("test2", "테스트2");
		session.setAttribute("test3", "테스트3");
		application.setAttribute("test4", "테스트4");
		request.getRequestDispatcher("a03_requestScope.jsp").forward(request,response);
	%>
	<h3>page</h3>
	<table>
		<tr><td><%=pageContext.getAttribute("test1") %></td></tr>
		<tr><td><%=request.getAttribute("test2") %></td></tr>
		<tr><td><%=session.getAttribute("test3") %></td></tr>
		<tr><td><%=application.getAttribute("test4") %></td></tr>
	</table>
</body>
</html>