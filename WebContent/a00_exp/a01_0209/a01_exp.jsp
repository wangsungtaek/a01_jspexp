<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a00_exp.a01_0209.A01_Dao"
    import="jspexp.a00_exp.a01_0209.UserInfo"
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
<!--
[하] 1. 특정 요청사항에 따른 웹화면 구성 순서별로 선언하세요.
	1) 화면 구성
	2) SQL 작성
	3) VO 클래스 생성
	4) 기능메서드 선언
	5) 요청값과 Dao기능메서드 매개변수 데이터 철;
	6) 화면 출력
 -->

<!-- 
[중] 2. 회원아이디, 회원패스워드, 이름, 포인트, 주소, 등록일, 권한이 있고, 
        회원아이디와 이름으로 검색하는 웹화면을 구성할려고 한다.
        위 내용을 새로운 테이블을 만들고 처리해보세요.
 -->
<%
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	if(userId == null) userId = "";
	if(userPw == null) userPw = "";
	A01_Dao dao = new A01_Dao();
	ArrayList<UserInfo> users = dao.searchUser(userId, userPw);
%>
	<h3>회원 검색</h3>
	<form method="post">
	<table>
		<tr><th>회원아이디</th>
			<td><input type="text" name="userId" value="<%=userId %>" ></td></tr>
		<tr><th>이름</th>
			<td><input type="text" name="userPw" value="<%=userPw %>" ></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"></td></tr>
	</table>
	</form>
	<h3>결과</h3>
	<table>
		<tr><th>회원아이디</th>
			<th>회원패스워드</th>
			<th>이름</th>
			<th>포인트</th>
			<th>주소</th>
			<th>등록일</th>
			<th>권한</th></tr>
		<%for(UserInfo u : users) {%>
			<tr><td><%=u.getU_id() %></td>
				<td><%=u.getU_pw() %></td>
				<td><%=u.getName() %></td>
				<td><%=u.getPoint() %></td>
				<td><%=u.getAddress() %></td>
				<td><%=u.getRegdate() %></td>
				<td><%=u.getAuthority() %></td></tr>
		<%} %>
	</table>
</body>
</html>