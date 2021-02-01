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
<%--
# <jsp:forward>액션 태그
1. 하나의 jsp페이지에서 다른 jsp 페이지로 요청 처리를
	전달할 때 사용된다.
2. request, response를 포함 시켜 전송한다.
 --%>
<body>
	<h2>권한에 따른 페이지 전환</h2>
	<form method="post">
		권한:<select name="auth">
			<option>관리자</option>
			<option>일반사용자</option>
			<option>방문자</option>
			</select><br>
		아이디:<input type="text" name="id"/><br>
		<input type="submit" value="로그인"/>
	</form>
	<%
	String auth = request.getParameter("auth");
	if(auth != null){
		String page1 = "";
		if(auth.equals("관리자")) page1 = "a06_admin.jsp";
		if(auth.equals("일반사용자")) page1 = "a06_normal.jsp";
		if(auth.equals("방문자")) page1 = "a06_quest.jsp";
	%>
		<jsp:forward page="<%=page1 %>"/>
		<%--
		RequestDispatcher re = request.getRequestDispatcher("페이지");
		rd.forward(request, response);를 포함된 것과 동일하게
		처리한다.
		 --%>
	<%} %>
</body>
</html>