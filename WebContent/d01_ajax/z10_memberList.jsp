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
<jsp:useBean id="dao" class="jspexp.a03_database.A04_MemberDao"/>
<c:set var="memList" value="${dao.memberList(param.name, param.id)}"/>
<c:set var="memCheck" value="${dao.hasMember(param.idCheck)}"/>
<c:if test="${param.action =='t'}">
<table>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>포인트</th>
		<th>이름</th>
		<th>권한</th>
	</tr>
	<c:forEach var="mem" items="${memList}" >
	<tr>
		<td>${mem.id}</td>
		<td>${mem.pass}</td>
		<td>${mem.point}</td>
		<td>${mem.name}</td>
		<td>${mem.auth}</td>
	</tr>
	</c:forEach>
</table>
</c:if>
<c:if test="${param.action =='f'}">
${param.idCheck}id 등록여부 : ${memCheck}
</c:if>