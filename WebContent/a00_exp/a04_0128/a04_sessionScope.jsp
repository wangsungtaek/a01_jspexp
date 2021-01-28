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
	<h3>session</h3>
	<a href="a05_applicationScope.jsp">session</a>
	<table>
		<tr><td><%=pageContext.getAttribute("test1") %></td></tr>
		<tr><td><%=request.getAttribute("test2") %></td></tr>
		<tr><td><%=session.getAttribute("test3") %></td></tr>
		<tr><td><%=application.getAttribute("test4") %></td></tr>
	</table>
</body>
</html>