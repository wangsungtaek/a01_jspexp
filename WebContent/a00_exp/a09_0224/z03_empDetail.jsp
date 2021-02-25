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
<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
<c:set var="empDetail" value="${dao.getEmp(param.empno)}"/>
<table>
	<tr>
		<th>사원번호</th>
		<th>사원명</th>
		<th>직책명</th>
		<th>관리자번호</th>
		<th>입사일</th>
		<th>급여</th>
		<th>보너스</th>
		<th>부서번호</th>
	</tr>
	<tr>
		<td>${empDetail.empno}</td>
		<td>${empDetail.ename}</td>
		<td>${empDetail.job}</td>
		<td>${empDetail.mgr}</td>
		<td>${empDetail.hiredate}</td>
		<td>${empDetail.sal}</td>
		<td>${empDetail.comm}</td>
		<td>${empDetail.deptno}</td>
	</tr>
</table>