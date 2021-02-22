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
</head>
<body>
<%--
[하] 1. el태그를 이용한 4가지 범위의 데이터를 저장하고 객체로 저장하고, 4칙연산자에의 출력 처리하세요.
 --%>
<%
	pageContext.setAttribute("num01", 10);
	request.setAttribute("num02", 30);
	session.setAttribute("num03", 10);
	application.setAttribute("num04", 40);
%>
<h3>ex1)</h3>
<h4>${num01+num02-num03*num04}</h4>
<%--
[하] 2. el에서 사용되는 조건논리연산자를 활용하여, 임의의 값에 정답을 입력한 후, 정답 여부를 true/false로 출력하세요.
        [ @@] * [ @@  ] = [ 정답입력  ] [정답확인]
            정답여부 @@@
 --%>
<h3>ex2)</h3>
<%
	int first = (int)Math.floor(Math.random()*100+1);
	int second = (int)Math.floor(Math.random()*100+1);
%>
<form>
	<table>
		<tr><td><input type="text" name="inFirst" value="<%=first%>"/></td>
			<td>*</td>
			<td><input type="text" name="inLast"/ value="<%=second%>"></td>
			<td><input type="text" name="anwer"/></td>
			<td><input type="submit" value="정답확인"/></td>
		</tr>
		<tr>
			<td colspan="5">
				${param.inFirst} * ${param.inLast} 의 정답은 ${param.inFirst * param.inLast} 입니다.   
			</td>
		</tr>
		<tr>
			<td colspan="5">
				${(empty param.inFirst)?"":
					((param.inFirst * param.inLast) == param.anwer)?"정답입니다":"오답입니다"}
			</td>
		</tr>
	</table>
</form>
<%--
[하] 3. useBean과 el을 이용하여 회원가입 정보입력과 가입된 정보를 출력 처리하세요.~
 --%>
<h3>ex3) 회원정보입력</h3>
<form method="post">
	<h4>이름: <input type="text" name="name"/></h4>
	<h4>나이: <input type="text" name="age"/></h4>
	<h4>사는곳: <input type="text" name="loc"/></h4>
	<input type="submit" value="가입"/>
</form>
<jsp:useBean id="p" class="jspexp.z01_vo.Person"/>
<jsp:setProperty property="*" name="p"/>
<h4>가입정보</h4>
<h5>${p.name}</h5>
<h5>${p.age}</h5>
<h5>${p.loc}</h5>
<%--
[하] 1. 재귀적 함수 호출 개념과 toggleClass에 대하여 간단하게 기술하세요.
	함수 실행 중 자기자신을 호출하여 반복적으로 실행하는 호출 개념이다.
 --%>
<%--
[하] 2. 재귀적 함수와 slideToggle를 이용하여 특정한 이미지가 보였다가 사라졌다가를 처리해보세요.

 --%>
 	<img src="toggletest.jpg" alt="테스트이미지"/>
	<input type="button" id="btn" value="이미지 토글"/>
	<input type="button" onclick="animateIt()" value="슬라이드토글"/>
	<script>
		$(document).ready(function(){
			$("#btn").click(function(){
				$("[src='toggletest.jpg']").toggle();	
			})
		});
		function animateIt() {
			$("[src='toggletest.jpg']").slideToggle("slow", animateIt);
		}
	</script>
</body>
</html>
