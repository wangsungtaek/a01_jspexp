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
	<%--사원 id 등록 --%>
	<h3>사원 id 등록</h3>
	<form method="post">
		<table>
			<tr><th>아이디</th><th>이름</th></tr>
			<tr><td><input type="text" name="id"/></td>
				<td><input type="text" name="name"/></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="등록"/></td></tr>
		</table>
	</form>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	if(id != null && name != null) {
		Cookie c1 = new Cookie(URLEncoder.encode(id, "utf-8"),
							   URLEncoder.encode(name, "utf-8"));

		response.addCookie(c1);
		response.sendRedirect("z01_exp.jsp");
	}
%>

</body>
</html>