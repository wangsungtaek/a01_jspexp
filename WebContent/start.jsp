<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jspexp.z01_vo.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Product p01 = new Product("사과",3000,2);
%>
<body>
<!-- 
z01_vo 하위 패키지에 Product 클래스(물건명, 가격, 갯수 선언)
현재 화면에서 해당 클래스 호출하고 h3로 출력하세요.

	브라우저에서 주소로 특정한 jsp를 호출 [브라우저]
	jsp ==> servletXX.java => @@@.class
		==> 결과 html만들어 요청한 클라이언트 전달 [서버]
		==> client html을 받아서 rendering(html) [브라우저]
			화면에 보여준다.
JSP : CSS, JAVASCRIPT(JQUERY, AJAX)
	JAVA => CSS, JAVASCRIPT 연동 처리..
	를 포함하여 최종결과를 전달하는 프로그램이다.
 -->
	<h3>물건명 : <%=p01.getName() %></h3>
	<h3>가격 : <%=p01.getPrice() %></h3>
	<h3>갯수 : <%=p01.getCnt() %></h3>
</body>
</html>