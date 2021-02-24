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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
	href="<%=path%>/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script>
<%--
# jstl을 통한 검색 처리
1. useBean이용, 검색/dao호출
2. forEach를 통한 처리
--%>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<h3>사원검색</h3>
	<form method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value="${param.ename}"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value="${param.job}"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			</td></tr>
	</table>
	</form>
	<%--
	?ename=@@&job=@@
	${param.ename}, ${param.job}를 통해서 요청값을 받는다.
	
	el에서 사용하는 요청값을 null일때는 ""으로 자동 변환 처리하여 nullpointexception
	을 방지해준다.
	
	useBean을 통해서 dao 객체 생성..
	<c:set var="empList" value="${dao.empList2(param.ename, param.job)}"/>
	
	새로운 변수 empList에 요청값과 dao의 검색메서드를 통해서
	결과 ArrayList<Emp>를 할당 처리.
	 --%>
	<jsp:useBean id="dao" class="jspexp.a03_database.A01_Dao"/>
	
	<c:set var="empList" value="${dao.empList2(param.ename, param.job)}"/>
	<%--
	A01_Dao dao = new A01_Dao();
	ArrayList<Emp> empList = 
		dao.empList2(request.getParameter("ename"),
					 request.getParameter("job"));
	 --%>
	<h3>EMPNO</h3>
	<table>
		<caption style="text-align: left">총건수:${empList.size()}</caption>
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>직책</th>
			<th>매니져</th>
			<th>입사일</th>
			<th>급여</th>
			<th>보너스</th>
			<th>부서번호</th>
		</tr>
		<c:forEach var="emp" items="${empList}">
			<tr>
				<td>${emp.empno}</td>
				<td>${emp.ename}</td>
				<td>${emp.job}</td>
				<td>${emp.mgr}</td>
				<td>${emp.hiredate}</td>
				<td>${emp.sal}</td>
				<td>${emp.comm}</td>
				<td>${emp.deptno}</td>
			</tr>
		</c:forEach>
	</table>
	
<%--
ex) 회원리스트 검색처리..
 --%>	
	<h3>회원</h3>
	<form method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" value="${param.id}"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="${param.name}"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			</td></tr>
	</table>
	</form>
	<jsp:useBean id="mem" class="jspexp.a03_database.A04_MemberDao"></jsp:useBean>
	<c:set var="mlist" value="${mem.memberList(param.name, param.id)}" />
	<h3>회원리스트</h3>
	<table>
		<caption style="text-align: left">총건수:${mlist.size()}</caption>
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>포인트</th>
			<th>이름</th>
			<th>권한</th>
		</tr>
		<c:forEach var="member" items="${mlist}">
			<tr>
				<td>${member.id}</td>
				<td>${member.pass}</td>
				<td>${member.point}</td>
				<td>${member.name}</td>
				<td>${member.auth}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>