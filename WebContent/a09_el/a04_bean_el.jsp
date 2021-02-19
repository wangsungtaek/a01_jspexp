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
// 		$("h3").text("시작");
	});
</script>
</head>
<body>
<jsp:useBean id="bk" class="jspexp.z01_vo.Book"  scope="session"/>
<jsp:setProperty property="*" name="bk"/>
<h2>도서입력</h2>
<form method="post">
	도서명 : <input name="bname"/><br>
	저자 : <input name="author"/><br>
	출판사 : <input name="publisher"/><br>
	<input type="submit" value="등록"/><br>
</form>
<h2>등록 내용</h2>
<!-- bean으로 선언된 내용도 바로 사용할 수 있다. -->
<h3>${bk.bname}</h3>
<h3>${bk.author}</h3>
<h3>${bk.publisher}</h3>
<a href="a05_show.jsp">다음 페이지에서</a>
<!-- 
ex) login화면 구현 id, pass himan/7777일때, 로그인 성공/그외 로그인 실패
	bean을 이용해서 처리
 -->
<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="pass"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="로그인"/></td>
		</tr>
	</table>
</form>
<jsp:useBean id="mem" class="jspexp.z01_vo.Member"/>
<jsp:setProperty property="*" name="mem"/>
<h3 align="center">
	${(empty mem.id)?"":
		(mem.id=='himan' and mem.pass=='7777')?"로그인 성공":"로그인 실패"}
</h3>

</body>
</html>