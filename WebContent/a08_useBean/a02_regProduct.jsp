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
	<h3>물건정보등록</h3>
	<form method="post" action="a03_revBean.jsp">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name"/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="2">갯수<input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>