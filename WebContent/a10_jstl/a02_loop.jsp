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
#. jstl의 반복문 처리.
1. 기본 형식
	<c:forEach var="cnt" begin="시작변수" end="마지막변수"
		stop="증감단위">
2. 기타 옵션
	1) varStatue = "sts"
		${sts.index} : 반복문에서 0부터 시작하는 index를 출력
		${sts.count} : 반복문에서 1부터 시작하는 카운트 출력
		${sts.first} : boolean을 첫번째 값인지 여부를 나타냄..
		${sts.last} : boolean으로 마지막 값인지 여부를 나타냄..
 --%>
	$(document).ready(function(){
		$("h3").text("반복문");
	});
</script>
</head>
<body>
	<h3>제목</h3>
	<h2>1~15까지 출력</h2>
	<c:forEach var="cnt" begin="1" end="15">
		<h4>${cnt}</h4>
	</c:forEach>
	<%--ex1) 1~7까지 출력 하면서 h5로 안녕하세요 표시 하세요. --%>
	<%--ex2) 테이블의 열을 1열... 3열 까지 출력 하여 표시 하세요. --%>
	<%--ex3) 테이블의 열을 1행... 3행 까지 출력 하여 표시 하세요. --%>
	<%--ex4) 테이블의 행/열을 4X4 출력 하여 표시 하세요. --%>
	<table>
	<c:forEach var="row" begin="1" end="4">
		<tr>
		<c:forEach var="col" begin="1" end="4">
			<td>${row}행${col}열</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</table>
</body>
</html>