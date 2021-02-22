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
<script>
	$(document).ready(function(){
	});
</script>
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
--%>
	<h3>jstl 변수(일반, 참조)선언</h3>
	<c:set var="num" value="일반변수할당"/>
	<div>${num}</div>
	<jsp:useBean id="m" class="jspexp.z01_vo.Member"/>
	<c:set target="${m}" property="name" value="홍길동" />
	<div>${m.name}</div>
<%--
[하] 3. 기존 조건문과 else if 조건문에 해당하는 jstl의 조건 형식을 기술하세요.
	
	// if문
	<c:if test="(조건문)">
		조건문이 참일때 수행할 프로세스
	</c:if>
	
	// if else문
	<c:choose>
		<c:when test="(조건문1)">조건문1이 참일때 수행할 프로세스</c:when>
		<c:when test="(조건문2)">조건문2이 참일때 수행할 프로세스</c:when>
		<c:when test="(조건문3)">조건문3이 참일때 수행할 프로세스</c:when>
		<c:otherwise>위의 조건문에서 만족하는 조건이 없을 경우 수행할 프로세스</c:otherwise>
	</c:choose>
--%>
<%--
[하] 4. 임의의 구구단 문제를 form객체에 의해 정답값 입력에 따라, jstl에 의해 정답/오답을 구분하여 처리하세요.
--%>
	<h3>9x9단</h3>
	<%
		int ran1 = (int)Math.ceil(Math.random()*9);
		int ran2 = (int)Math.ceil(Math.random()*9);
		request.setAttribute("ran1", ran1);
		request.setAttribute("ran2", ran2);
	%>
	<c:set var="answer" value="${ran1 * ran2}"/>
	<form method="post">
	<table>
		<input type="hidden" name="answer" value="${answer}"/>
		<tr><td>${ran1} x ${ran2} = <input type="text" name="submit" value="${param.submit}" /></td>
			<td><input type="submit" value="정답제출"/></td><tr>
		<tr><td colspan="2">
				정답은 [${param.answer}]입니다. 입력하신 [${param.submit}]은
				<c:if test="${param.answer == param.submit}">
					정답입니다.
				</c:if>
				<c:if test="${param.answer != param.submit}">
					오답입니다.
				</c:if>
			</td></tr>
	</table>
	</form>
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
		<tr>
			<th>물건명</th>
			<td><input type="text" name="pname"/></td>
			<th>단가</th>
			<td><input type="text" name="price"/></td>
			<td><input type="submit" value="10개까지 출력"/></td>
	</table>
	</form>
	<c:forEach var="num" begin="1" end="10" >
		${param.pname} ${num}개 ${param.price * num}원<br>
	</c:forEach>
</body>
</html>