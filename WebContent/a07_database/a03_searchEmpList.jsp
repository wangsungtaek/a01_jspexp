<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
	tr:hover{background: yellow;}
</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
<%--
1. 화면구성
2. sql작성
	SELECT *
	FROM EMP
	WHERE ename LIKE '%'||upper('a')||'%'
	AND job LIKE '%'||upper('er')||'%'
3. vo : Emp
4. dao단 기능메서드 선언
5. 요청값과 dao기능메서드 매개변수 데이터 처리
6. 화면출력
 --%>

<body>

	<h3>사원정보검색</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/>
			<input type="button" value="등록"
			 onclick="location.href='a10_emplnsForm.jsp'"/></td></tr>
	</table>
	</form>
		<table>
		<tr>
			<th>사원번호</th>
			<th>사원명</th>
			<th>직책명</th>
			<th>부서번호</th>
		</tr>
		<%
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		log("# 검색 내용 #");
		log("사원명:"+ename);
		log("직책:"+job);
		
		A01_Dao dao = new A01_Dao();
		ArrayList<Emp> elist = dao.empList();
		for(Emp e: elist) {%>
		<tr ondblclick="detail(<%=e.getEmpno()%>)"><td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getJob() %></td>
			<td><%=e.getDeptno() %></td></tr>
		<%} %>
	</table>
	<script>
		function detail(empno) {
// 			alert("요청할 번호:"+empno);
			location.href = "a11_empDetail.jsp?empno="+empno;
		}
	</script>
</body>
</html>