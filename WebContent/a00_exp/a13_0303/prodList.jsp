<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
	$(document).ready(function(){
		$('.data').on("click",function(){
			var pno = $(this).children().eq(0).text();
			location.href="${path}/prodDetail.do?pno="+pno;
		});
	});
</script>
</head>
<body>
	<h3>물품검색</h3>
	<form method="post">
	<table>
		<tr><th>물품명</th>
			<td><input type="text" name="pname" value="${param.pname}"/></td></tr>
		<tr><th>from</th>
			<td><input type="text" name="fromPrice" value="${param.fromPrice}"/></td></tr>
		<tr><th>to</th>
			<td><input type="text" name="toPrice" value="${param.toPrice}"/></td></tr>
		<tr><td colspan="3"><input type="submit" value="검색"/></td></tr>
	</table>
	<table>
		<tr>
			<th>물품코드</th>
			<th>물품명</th>
			<th>가격</th>
			<th>갯수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="prod" items="${prodList}">
		<tr class="data">
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td>${prod.credte}</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</body>
</html>