<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%--
ex1)
http://localhost:7080/jspexp/a01_basic/
	a07_requestExp.jsp?name=홍길동&age=25
	실행했을 때, 화면에 이름과 나이를 출력되게 하세요.
ex2)
	a07_requestExp.jsp?hobby=독서&hobby=pc게임&hobby=여행
	로 실행시 취미 내용이 출력되게 하세요.
ex3) a08_formExp.jsp에서 위에 query string으로 넘겨주는 것을
	form안에 등록하고, action값으로 a07_requestExp.jsp설정해서
	이름, 나이, 선택된 취미 내용이 출력되게 하세요.
 --%>
	<form action="a07_requestExp.jsp" method="post">
	<table>
		<tr><th>이름</th><td><input type="text" name="name"></td></tr>
		<tr><th>나이</th><td><input type="text" name="age"></td></tr>
		<tr><th>취미생활</th>
			<td>
				<label></label><input type="checkbox" name="hobby" value="음악감상"/>음악감상</label>
				<label></label><input type="checkbox" name="hobby" value="컴퓨터게임"/>컴퓨터게임</label>
				<label></label><input type="checkbox" name="hobby" value="독서"/>독서</label>
				<label></label><input type="checkbox" name="hobby" value="여행"/>여행</label>
			</td></tr>
		<tr><td colspan="2" style="text-align:center;"><input type="submit" value="등록"/></td></tr>
	</table>
	</form>
</body>
</html>
