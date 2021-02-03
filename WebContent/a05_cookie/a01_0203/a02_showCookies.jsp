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
<%
Cookie[] cookies = request.getCookies();
%>
	<h3>쿠키값 가져오기.</h3>
<%
for(Cookie ck : cookies){
%>
	<h4><%=ck.getDomain() %> - 
	
		<%=URLDecoder.decode(ck.getName(), "utf-8") %> -
		<%=URLDecoder.decode(ck.getValue(), "utf-8") %></h4>
<%-- 출력한 뒤 쿠키값의 삭제
	setMaxAge 쿠키의 생존기간을 지정 0으로 하면 바로 삭제 처리.
--%>
<%
	ck.setMaxAge(0);
	response.addCookie(ck); // 클라이언트에 전달
} %>
</body>
</html>