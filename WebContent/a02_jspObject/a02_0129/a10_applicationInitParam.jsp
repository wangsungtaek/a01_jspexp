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
	<h3>초기화 파라미터 목록(web.xml)</h3>
	<ul>
	<%	// # application 초기 파라미터 관련 메서드
		// getInitParameterNames : web.xml의 초기 매개변수 이름 목록을 가져옴
		// getInitParameter(name) : 이름에 해당하는 데이터를 가져온다.
		Enumeration<String> initParamEnum = 
			application.getInitParameterNames();
		while(initParamEnum.hasMoreElements()){
			String initParamName = initParamEnum.nextElement();
	%>
	<li><%= initParamName %> =
		<%= application.getInitParameter(initParamName) %></li>
	<%
		}
	%>
	</ul>
	<%--
	ex) web.xml에 DBServer : 192.212.42.54로 매개변수 이름과 값을 설정하고,
				  account : himan
				  pass : 7777
				  로 설정하여
		현재 화면에서 값을 출력해보세요.
	 --%>
	<h3>DBServer : <%= application.getInitParameter("dbServer") %></h3>
	<h3>account : <%= application.getInitParameter("account") %></h3>
	<h3>pass : <%= application.getInitParameter("pass") %></h3>
</body>
</html>