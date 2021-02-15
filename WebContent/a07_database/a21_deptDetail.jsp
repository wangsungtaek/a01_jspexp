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
<%
	int deptno = 1;
	String deptnoS = request.getParameter("deptno");
	if(deptnoS != null && !deptnoS.equals("")) deptno = Integer.parseInt(deptnoS);
	A02_DeptDao dao = new A02_DeptDao();
	Dept d = dao.getDept(deptno);
%>
<body>
	<h3>부서정보[<%=request.getParameter("deptno") %>]</h3>
	<table>
		<%if(d!=null){ %>
		<tr><th>부서번호</th>
			<td><input type="text" name="deptno" value="<%=d.getDeptno()%>"/></td>
		</tr>
		<tr><th>부서이름</th>
			<td><input type="text" name="dname" value="<%=d.getDname()%>"/></td>
		</tr>
		<tr><th>부서번호</th>
			<td><input type="text" name="loc" value="<%=d.getLoc()%>"/></td>
		</tr>
		<%} else{ %>
			<tr><td colspan="2">해당 부서정보는 없습니다!<td></td>
		<%} %>
		<tr><td colspan="2">
		<input type="button" value="메인화면으로" 
			onclick="location.href='a04_searchDeptList.jsp'"/>
		<input type="button" value="수정"/>
		<input type="button" value="삭제"/>
		</td></tr>
	</table>
</body>
</html>