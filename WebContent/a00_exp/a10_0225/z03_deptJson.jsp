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
<jsp:useBean id="dao" class="jspexp.a03_database.A02_DeptDao"/>
<jsp:useBean id="dept" class="jspexp.z01_vo.Dept"/>
<jsp:setProperty property="*" name="dept"/>
<c:set var="dList" value="${dao.deptList(dept)}"/>
[
	<c:forEach var="d" items="dList" varStatus="sts">
		{ 
			"deptno" : ${empty d.deptno?0:d.deptno },
			"dname" :  "${d.dname}",
			"loc" : "${d.loc}"
		}
		<c:if test="${!sts.last}">,</c:if>
	</c:forEach>
]


<%--
[
	{"deptno":10, "dname":"총무", "loc":"서울신림"},
	{"deptno":10, "dname":"총무", "loc":"서울신림"},
	{"deptno":10, "dname":"총무", "loc":"서울신림"},
	{"deptno":10, "dname":"총무", "loc":"서울신림"}
]
--%>