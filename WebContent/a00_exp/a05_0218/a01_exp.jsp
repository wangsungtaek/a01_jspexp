<%@page import="jspexp.a03_database.A04_MemberDao"%>
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
<%--
[JSP]
[하] 1. useBean을 이용하여, 회원등록여부를 DB처리를 통해서 등록여부를 확인하세요.
        회원id:[   ] [등록여부확인] => dao 기능메서드를 통해 확인해서 해당 id가 있으면 등록된 회원입니다.
        없으면 회원등록 가능합니다. 메시지 처리하기.
--%>
	<h3>회원확인</h3>
	<form method="post">
	<table>
		<tr>
			<th>회원id</th>
			<td><input type="text" name="id"/></td>
			<td><input type="submit" value="등록여부확인"></td>
		</tr>
	</table>
	</form>
	<jsp:useBean id="user" class="jspexp.z01_vo.Member" scope="request"/>
	<jsp:setProperty property="*" name="user"/>
	<%
	boolean isMember = false;
	if(user.getId() != null) {
		A04_MemberDao dao = new A04_MemberDao();
// 		isMember = dao.checkMamber(user.getId());
	}
	%>
	<script type="text/javascript">
		var id = "<%=user.getId() %>";
		var isMember = <%=isMember %>;
		console.log(typeof(id));
		console.log(id);
		console.log(isMember);
		if(id != "null" ){
			console.log(id);
			console.log(isMember);
			if(isMember) { 
				alert("등록된 회원입니다.");
			}
			else alert("회원등록 가능합니다.");
		}
	</script>
<%--  
[하] 1. jquery의 lib의 CDN방식과 local호출방식의 차이를 기술하세요.
	1) lib 방식
		인터넷이 연결되어 있어야만 사용이 가능하다.
		jquery의 url을 직접 import하는 방식
		예) <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	2) local호출방식
		서버의 특정자원 위치에 jquery파일을 다운받아서 저장해 놓고 이를 경로로
		지정하여 사용하는 방식
		예) <script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
--%>
<%--
[하] 2. $(document).ready(function(){})의 의미를 기술하세요.
	window.onload=funtion(){};와 동일한 처리
	화면의 모든처리(이미지 등..)가 끝난 후 실행되도록 구현된 jquery문법이다.
--%>
<%--
[하] 3. 계층관계의 선택자의 차이(,>)를 기본예제를 통하여 기술하세요.
--%>
	<h4>계층관계 , > 차이</h4>
	<div>테스트1</div>
	<div>테스트2
		<span>테스트3</span>
	</div>
	<span>테스트4</span>
	<script>
		$("div, span").css("color","red");
		$("div>span").css("color","blue");
	</script>
<%--
[하] 4. 형제관계의 선택자의 차이(+,~)의 차이를  선택자 예제를 통하여 기술하세요.
--%>
	<h4>형제관계 + ~ 차이</h4>
	<div class="ex4">테스트1</div>
	<span>테스트1-1</span>
	<div class="ex4">테스트2
		<span>테스트2-1</span>
	</div>
	<span>테스트3</span>
	<span>테스트4</span>
	<span>테스트5</span>
	<script>
		$(".ex4+span").css("background-color","pink");
		$(".ex4~span").css("color","red");
	</script>
<%--
[하] 5. 속성값의 차이(*=,~=,^=,$=)의 차이를 기술하세요.
	1) $("요소객체[속성*=속성값]") : 해당요소객체에 속성에 속성값이 포함되어 있는 경우
	2) $("요소객체[속성~=속성값]") : 해당요소객체에 속성에 속성값이 단어로 포함되어 있는 경우
	3) $("[속성^=속성값]") : 해당 속성에 속성값으로 시작하는 모든 요소객체
	4) $("[속성$=속성값]") : 해당 속성에 속성값으로 끝나는 모든 요소객체
--%>
<%--
[하] 6. html(), text(), val()의 기능적 차이를 기술하세요.
	1) html()
		하위에 있는 자식태그나 문자를 전부 가져온다.
	2) text()
		하위에 있는 자식태그의 문자만 가져온다.
	3) val()
		input으로 정의된 value속성의 값을 가져온다.
--%>
</body>
</html>
