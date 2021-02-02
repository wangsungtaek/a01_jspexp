<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    isErrorPage="true"
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
	<h3>요청시 에러가 발생(모든 예외처리)</h3>
	<h4>에러 타입 : <%=exception.getClass().getName() %></h4>
	<h4>에러 메시지 : <%=exception.getMessage() %></h4>
	<h4>에러 경로 : <%exception.printStackTrace(); %></h4>
</body>
<%--
ex) web.xml에 java.lang.NullpointerException
과 z05_null.exception.jsp로 등록하고,
해당 에러가 나왔을 때, 처리를 하세요.

 --%>
</html>