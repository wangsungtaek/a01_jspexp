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
<jsp:useBean id="deptDao" class="jspexp.a03_database.A02_DeptDao"/>
<c:set var="deptList" value="${deptDao.deptList()}"/>
{
"tot":${deptList.size()}, "deptList":[
	<c:forEach var="dept" items="${deptList}" varStatus="sts" >
		{"deptno":${dept.deptno},"dname":"${dept.dname}","loc":"${dept.loc}"}
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>]
}