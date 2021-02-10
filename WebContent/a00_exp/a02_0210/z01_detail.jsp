<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
    %>
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
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
<%
	String deptno = request.getParameter("deptno");
	A02_DeptDao dao = new A02_DeptDao();
	Dept dept = dao.getDept(new Integer(deptno));
%>
	<h3>부서상세정보[<%=deptno %>]</h3>
	<table>
		<tr><th>부서번호</th><th>부서명</th><th>근무지</th></tr>
		<tr><td><%=dept.getDeptno() %></td>
			<td><%=dept.getDname() %></td>
			<td><%=dept.getLoc() %></td></tr>
	</table>
</body>
</html>