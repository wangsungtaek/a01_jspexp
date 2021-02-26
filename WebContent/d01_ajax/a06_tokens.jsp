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
<%--
# forTokens
1. 구분자에 의해서 데이터를 처리하는 것을 말한다.
2. 기본형식
	<c:forTokens var="변수명" items="구분자포함데이터"
		delims="구분자"
		${변수명} : 단위 데이터
3. 속성
	1) var : 구분자에 의해서 추출된 하나의 데이터
	2) items : 구분자가 있는 문자열
	3) delims : 구분자
--%>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<h3>구분자처리</h3>
	<c:forTokens var="color" items="red, green, blue" delims=",">
		<h2>${color}</h2>
	</c:forTokens>
<%--ex) 과일명 사과;오렌지;수박;딸기; 를 구분자로 처리하여 2x2 테이블에 출력하세요. --%>
	<table>
	<c:forTokens var="prod" items="사과; 오렌지; 수박; 딸기;" delims=";" varStatus="sts">
		<c:if test="${sts.count % 2 == 1 }"><tr></c:if>
			<td>${prod}</td>
		<c:if test="${sts.count % 2 == 0 }"></tr></c:if>
	</c:forTokens>
	</table>	
</body>
</html>