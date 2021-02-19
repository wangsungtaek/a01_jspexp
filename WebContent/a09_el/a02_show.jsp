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
		$("h3").text("시작");
	});
</script>
</head>
<body>
	<h3>el session값</h3>
	<h4>아이디 : ${mem.id}</h4>
	<h4>비번 : ${mem.pass}</h4>
	<h4>이름 : ${mem.name}</h4>
	<h4>권한 : ${mem.auth}</h4>
</body>
</html>