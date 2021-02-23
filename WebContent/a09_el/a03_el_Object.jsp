<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
   pageContext.setAttribute("path", "${pageContext.request.contextPath}");
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
		$("h3").text("시작:${path}:${pageContext.request.contextPath}");
	});
</script>
</head>
<%--
# el의 내장된 기본 객체
1. session scope의 범위에 따른 객체 선언.
	pageContext, requestScope, sessionScope, applicationScope
	를 통해서 속성을 설정하여 처리할 수 있다.
	앞에 요청범위에 따른 내용을 생략이 가능하다.
2. ${param.요청key} == request.getParameter("요청key")
   ${paramValues.요청배열key} == request.getParameterValues("요청배열key)

 --%>

<body>
	<h3>제목</h3>
	<form method="get">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
		<tr><th>오늘의 점심</th>
			<td><input type="checkbox" name="chFood" value="한식"/>한식
			<input type="checkbox" name="chFood" value="중식"/>중식
			<input type="checkbox" name="chFood" value="일식"/>일식
			<input type="checkbox" name="chFood" value="아메리카노"/>아메리카노
			<input type="checkbox" name="chFood" value="라떼"/>라떼
			<input type="checkbox" name="chFood" value="음료"/>음료</td>
		<tr><td colspan="2"><input type="submit"/></td></tr>
	</table>
	</form>
	<h2>전송된 값 : ${param.id }</h2>
	<h4>선택한 메뉴 :
		${paramValues.chFood[0]}
		${paramValues.chFood[1]}
		${paramValues.chFood[2]}
		${paramValues.chFood[3]}
		${paramValues.chFood[4]}
		${paramValues.chFood[5]}
	</h4>
	<!-- 
	ex1) 물건명: [		] 물건가격 : [		] 갯수 : [		]	[계산]
			e1의 요청값으로 @@@ 물건 @@개 구매 총 @@@원 출력
	 -->
	<h2>물건 정보 처리</h2>
	<form method="post">
		<table>
			<tr><th>물건명</th>
				<td><input type="text" name="pname"/></td>
				<th>물건가격</th>
				<td><input type="text" name="price"/></td>
				<th>갯수</th>
				<td><input type="text" name="cnt"/></td>
				<td><input type="submit" value="계산"/></tr>
			<tr><td colspan="7">
					${param.pname}물건
					${param.cnt}개 구매 총 
					${param.price * param.cnt}</td></tr>
		</table>
	</form>
	 
	<!-- 
	ex2) 주말의 취미생활 []@@@[]@@@[]@@@ [확인]
	 -->
	<form method="post">
	<h4>
		주말의 취미생활
		<input type="checkbox" name="hobby" value="축구"/>축구
		<input type="checkbox" name="hobby" value="농구"/>농구
		<input type="checkbox" name="hobby" value="야구"/>야구
		<input type="checkbox" name="hobby" value="족구"/>족구
		<input type="submit" value="확인"/>
	</h4>
	</form>
	<h4>
		${paramValues.hobby[0]}
		${paramValues.hobby[1]}
		${paramValues.hobby[2]}
		${paramValues.hobby[3]}
	</h4>
	<form method="get">
		<input type="checkbox" name="testBox" value="java"/>자바
		<input type="checkbox" name="testBox" value="javaScript"/>자바스크립트
		<input type="checkbox" name="testBox" value="파이썬"/>파이썬
		<input type="checkbox" name="testBox" value="HTML"/>HTML
		<input type="checkbox" name="testBox" value="CSS"/>CSS
		<input type="checkbox" name="testBox" value="C++"/>C++
		<button>전송</button>
	</form>
	${paramValues.testBox[0]}
	${paramValues.testBox[1]}
	${paramValues.testBox[2]}
	${paramValues.testBox[3]}
	${paramValues.testBox[4]}
	${paramValues.testBox[5]}
	
	
</body>
</html>