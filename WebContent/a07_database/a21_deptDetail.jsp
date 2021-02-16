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
		var updateBtn = document.querySelector("#upt-btn");
		
		updateBtn.onclick = function(){
			document.querySelector("[name=proc]").value = "update";
			document.querySelector("form").submit();
		}
	};
</script>
</head>
<%

	int deptno = 1;
	String dname = "";
	String loc = "";
	// request
	String deptnoS = request.getParameter("deptno");
	String dnameS = request.getParameter("dname");
	String locS = request.getParameter("loc");
	String proc = request.getParameter("proc");
	
	// 조건검사
	if(deptnoS != null && !deptnoS.equals("")) deptno = Integer.parseInt(deptnoS);
	if(dnameS !=null && !dnameS.equals("")) dname = dnameS;
	if(locS !=null && !locS.equals("")) loc = locS;
	
	log("#deptno"+deptno);
	log("#deptno"+dname);
	log("#deptno"+loc);
	log("#proc"+proc);
	
	A02_DeptDao dao = new A02_DeptDao();
	
	if(proc != null)
		if(proc.equals("update")) {
			dao.updateDept(new Dept(deptno, dname, loc));
			log("success");
		}
	
	Dept d = dao.getDept(deptno);
%>
<script type="text/javascript">
	var proc = "<%=proc %>";
	if(proc == "update")
		if(confirm("수정완료\n조회화면으로 이동하시겠습니까"))
			location.href='a04_searchDeptList.jsp';
</script>
<body>
	<h3>부서정보[<%=request.getParameter("deptno") %>]</h3>
	<form method="post">
	<input type="hidden" name="proc" value=""/>
	<table>
		<%if(d!=null){ %>
		<tr><th>부서번호</th>
			<td><input type="text" name="deptno" value="<%=d.getDeptno()%>"/></td>
		</tr>
		<tr><th>부서이름</th>
			<td><input type="text" name="dname" value="<%=d.getDname()%>"/></td>
		</tr>
		<tr><th>근무지</th>
			<td><input type="text" name="loc" value="<%=d.getLoc()%>"/></td>
		</tr>
		<%} else{ %>
			<tr><td colspan="2">해당 부서정보는 없습니다!<td></td>
		<%} %>
		<tr><td colspan="2">
		<input type="button" value="메인화면으로" 
			onclick="location.href='a04_searchDeptList.jsp'"/>
		<input type="button" value="수정" id="upt-btn"/>
		<input type="button" value="삭제" id="del-btn"/>
		</td></tr>
	</table>
	</form>
</body>
</html>