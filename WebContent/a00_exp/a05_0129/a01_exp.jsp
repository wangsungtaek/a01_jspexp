<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
	<!-- 
	[하] 1. 파일관리하는 서버 정보를 fileServer/124.243.3.5 로, 특정 이미지의 경로 정보를 설정하여, 화면에 출력하게 하세요.
		<context-param>
			<description>계정</description>
			<param-name>account</param-name>
			<param-value>himan</param-value>
		</context-param>
		<context-param>
			<description>비밀번호</description>
			<param-name>pass</param-name>
			<param-value>7777</param-value>
		</context-param>
		<context-param>
			<description>이미지경로</description>
			<param-name>fileServer</param-name>
			<param-value>124.243.3.5</param-value>
		</context-param>
	 -->
	<h3>fileServer : <%=application.getInitParameter("fileServer") %></h3>
	<!-- 
	[하] 2. 서버 안에 log에 대한 여러가지 출력 형식을 기술하세요.
		1) log
			- 서버Console 창에 'INFO: jsp:@@@' 형식으로 출력
		2) System.out.print
			- 서버Console 창에 검은색 글씨로'@@@' 형식으로 출력
		3) out.println
			- 브라우저 창에 '@@@' 형식으로 출력
		4) application.log
			- 서버Console 창에 'INFO:@@@' 형식으로 출력
	 -->
	<!-- 
	[중] 3. jsp:include 액션 태그를 이용해서 상단/하단이 나뉘어지고, 상단에 메뉴 하단에 페이지가 만들어 지면, 상단의 로그인/상품/관리자 메뉴에 클릭에 따라
       하단의 페이지가 변경되게 처리하세요.
		<jsp:include page="top.jsp">
			<jsp:param name="key" value="전송할값"></div>
		<div>
			<jsp:include page="buttom.jsp"></div>
	 
	 -->
	<%@ include file="a02_top.jspf" %>
	<hr>

	
</body>
</html>