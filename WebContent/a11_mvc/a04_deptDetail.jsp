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
      
   });
</script>
</head>
<body>
	<h3>부서정보[${param.deptno}]</h3>
	<form id= "frm" method="post">
	<input type="hidden" name="proc" value=""/>
	<table>
		<c:choose>
			<c:when test="${not empty dept.deptno}">
			<tr><th>부서번호</th>
				<td><input type="text" name="deptno" value="${dept.deptno}"/></td>
			</tr>
			<tr><th>부서이름</th>
				<td><input type="text" name="dname" value="${dept.dname}"/></td>
			</tr>
			<tr><th>근무지</th>
				<td><input type="text" name="loc" value="${dept.loc}"/></td>
			</tr>
			</c:when>
			<c:otherwise>
				<tr><td colspan="2">해당 부서정보는 없습니다!<td></td>
			</c:otherwise>
		</c:choose>

		<tr><td colspan="2">
		<input type="button" value="메인화면으로" 
			onclick="location.href='dept.do'"/>
		<input type="button" value="수정" id="upt-btn"/>
		<input type="button" value="삭제" id="del-btn"/>
		</td></tr>
	</table>
	</form>
</body>
</html>