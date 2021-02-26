<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
<%--
[하] 1. fmt의 날짜 형식에 있어서 각 속성값을 기술하세요
	<fmt:formatDate type="date||time||both"
		dateStyle = "full|short"
		pattern = "yyyy/MM/dd kk:mm:ss.S"
		value = "선언된 데이터"/>
 --%>
<%--
[하] 2. fmt의 숫자 형식에 있어서 각 속성값을 기술하세요
	currency : 통화단위
	percent : % 처리.
	pattern : 특정한 출력 형식을 처리할 수 있다.
 --%>
<%--
[중] 3. 사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.
 --%>
<jsp:useBean id="dao" class="jspexp.a03_database.A00_EmpDao"/>
<c:set var="empList" value="${dao.groupEmpList()}"/>

<table>
	<tr><th>부서번호</th><th>최근입사일</th><th>평균연봉</th></tr>
<c:forEach var="emp" items="${empList}" >
	<tr>
		<td>${emp.deptno}</td>
		<td><fmt:formatDate type="date" pattern="yyyy/MM/dd" value="${emp.hiredate}"/></td>
		<td><fmt:formatNumber pattern=",000.00" value="${emp.sal}"/>만원</td>
	</tr>
</c:forEach>
</table>
<%--
[하] 4. mvc 패턴이란 무엇인가?
	웹 개발을 Model과 View와 Controller로 역할 분담하여 처리하는
	commander 패턴 개발 방식을 말한다.
 --%>
<%--
[하] 5. 기본 예제를 기준으로 mvc패턴을 실제 코드를 설명하세요.
	1. 요청값 처리
		String test = request.getParameter("test");
	2. 모델데이터 만들기
		request.setAttribute("test",test);
	3. View단 호출
		request.getRequestDispatcher(page).forward(request, response);
 --%>
<%--
[하] 6. mvc.do?id=himan&pass=7777로 controller단에 요청값을 넘기고
        himan/7777일 때는 view단(jsp)에 @@님 환영합니다. 그외에는 @@@님은 인증된 계정이 아닙니다.
        출력하세요.
 --%>
</body>
</html>