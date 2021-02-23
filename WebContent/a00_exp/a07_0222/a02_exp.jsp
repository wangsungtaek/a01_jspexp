<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
[하] 1. jstl의 환경 설정 방법에 대하여 기술하세요
	1) WebContent\WEB-INF\lib에 jstl-1.2.jar 추가
	2) tag lib를 상단에 선언..
		<%@ taglib prefix='c' uri="http://java.sum.com/jsp/jstl/core" %>
		<%@ taglib prefix='fmt' uri="http://java.sum.com/jsp/jstl/fmt" %>
--%>
<%--
[하] 2. jstl의 일반 변수 선언, 객체할당 선언을 구분하여 처리한 기본 예제를 기술하세요.
	<c:set var="fname" value="사과" scope="request" />
	<h2>과일명:${fname}></h2>
	<jsp:useBean id="prod" class="vo.Fruit"/>
	<c:set target="${prod}" property="name" value="사과"/>
	<c:set target="${prod}" property="price" value="3000"/>
	<c:set target="${prod}" property="cnt" value="2"/>
	<h3>과일명:${prod.name}</h3>
	<h3>가격:${prod.price}</h3>
	<h3>갯수:${prod.cnt}</h3>
--%>
	
<%--
[하] 3. 기존 조건문과 else if 조건문에 해당하는 jstl의 조건 형식을 기술하세요.
	<c:if test="조건">
		조건이 true일때, 처리할 내용.
	</c:if>	
	<c:choose>
		<c:when test="조건1">조건1일 경우 처리할 내용</c:when>
		<c:when test="조건2">조건2일 경우 처리할 내용</c:when>
		<c:when test="조건3">조건3일 경우 처리할 내용</c:when>
		<c:otherwise>위 조긴이 아닐 경우</c:otherwise>
	</c:choose>
--%>
<%--
[하] 4. 임의의 구구단 문제를 form객체에 의해 정답값 입력에 따라, jstl에 의해 정답/오답을 구분하여 처리하세요.
--%>
	<script>
		$(document).ready(function(){
			$("[name]").css("text-align","center");
			$("[name=num01]").val(Math.floor(Math.random()*8+2));
			$("[name=num02]").val(Math.floor(Math.random()*9+1));
		});
	</script>
	<h3>9x9단</h3>
	<form method="post">
	<table>
		<tr>
			<th>
				<input name="num01"/> X
				<input name="num02"/> =
				<input name="reply"/>
			</th>
		</tr>
		<tr><td><input type="submit" value="정답확인"/></td></tr>
	</table>
	</form>
	<c:if test="${not empty param.num01}">
		<h4>${param.num01} X ${param.num02} = ${param.reply}</h4>
		<h4>정답여부 : ${param.num01 * param.num02 == param.reply ? '정답' : '오답'}</h4>
	</c:if>
	
	
<%--
[하] 5. jstl 반복문으로 개당 물건값을 입력받아 10개까지 계산된 물건총계을 출력하세요
        물건명:[   ] 단가:[   ] [10개까지 출력]
            @@@  1개  @@@ 원
            @@@  2개  @@@ 원
            @@@  3개  @@@ 원
            ...
            @@@  10개  @@@ 원
--%>
	<h3>jstl 반복문</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>단가</th><td><input type="text" name="price"/></td></tr>
		<tr><th>갯수(~까지 출력)</th><td><input type="text" name="cnt"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="계산출력"/>-</td></tr>
	</table>
	</form>
	<table>
		<tr><th>물건명</th><th>갯수</th><th>계</th></tr>
		<c:forEach var="cnt" begin="1" end="${param.cnt}" >
			<tr>
				<td>${param.pname}</td>
				<td>${cnt}개</td>
				<td> ${param.price * cnt}</td>
			</tr>
	</c:forEach>
	</table>
</body>
</html>