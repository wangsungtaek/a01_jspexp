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
${param.dname}
${param.loc}
<jsp:useBean id="DeptDao" class="jspexp.a03_database.A02_DeptDao"/>
<jsp:useBean id="dept" class="jspexp.z01_vo.Dept"/>
<jsp:setProperty property="dname" name="dept"
				value="${(empty param.dname)?'':param.dname}" />
<jsp:setProperty property="loc" name="dept"
				value="${(empty param.loc)?'':param.loc}" />
<table>
	<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
	<c:forEach var="dept" items="${DeptDao.deptList(dept)}" >
		<tr>
			<td>${dept.deptno}</td>
			<td>${dept.dname}</td>
			<td>${dept.loc}</td>
		</tr>
	</c:forEach>
</table> 
