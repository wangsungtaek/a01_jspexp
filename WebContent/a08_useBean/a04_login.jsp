<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A04_MemberDao"
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
/*
# 로그인을 통한 session 처리 예제
1. 로그인 화면구현
	id, pass입력
2. usebean 설정을 통해서 id, pass 받음
3. DB id, pass 확인 DAO하단에 기능 메서드 선언
	public Member login(Member mem) {}
4. useBean을 활용하여 Dao단 기능 메서드 호출
	m = dao.login(m);
	if(m==null) 로그인 실패 다시 로그인 페이지 이동
	그외에는 main페이지로 이동 해당 bean 호출 확인
 */
	$(document).ready(function(){
		$("h3").text("로그인");
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
	</table>
	</form>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member" scope="session"/>
	<jsp:setProperty property="*" name="m"/>
	<%
	boolean isLogFail = false;
	if(m.getId()!=null){ // 로그인 처리 후..
		log("##로그인한 id "+m.getId());
		A04_MemberDao dao = new A04_MemberDao();
		Member m1 = dao.login(m);
		
		m.setAuth(m1.getAuth());
		m.setName(m1.getName());
		m.setPoint(m1.getPoint());
		if(m1==null){
			isLogFail = true;
		} else {
			response.sendRedirect("a05_success.jsp");
		}
	}
	%>
	<script type="text/javascript">
	var isLogFail = <%=isLogFail%>;
	if(isLogFail){
		alert("인증되지 않는 계정입니다.");
		$("[name=id]").focus();
	}
	</script>
</body>
</html>