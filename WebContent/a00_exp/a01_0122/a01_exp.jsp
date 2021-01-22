<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="a00_exp.a01_0122.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%!
	Book b = new Book("어린왕자",5000,"생텍쥐페리");

%>
<body>
	<!-- 
	[하] 1. 자바로 Book객체를 만들고, 도서명 가격 저자를 화면에 출력하세요. 
	 -->
	<h2>도서명 : <%=b.getBname() %></h2>
	<h2>가격 : <%=b.getPrice() %></h2>
	<h2>저자 : <%=b.getAuthor() %></h2>
	
	<!-- 
	[하] 2. 브라우저에서 주소를 입력하여 jsp를 호출하여 화면에 출력되는 과정을 서버/클라이언트 기준으로 기술하세요.
		1)브라우저 주소에 ip와 페이지를 입력
		2) 서버에 해당하는 페이지를 찾아서
		3) 아래와 같은 프로세스를 거쳐 클라이언트(브라우저에 전달)
		jsp페이지 ==> servlet클래스 ==> html코드 ==> 브라우저에 받아 html랜더링
	
	 -->
	<!-- 
	[하] 3. jsp 화면의 구성요소 3가지를 기술하고, 변수 문자열 greet에 "안녕" 할당되고 출력되는 것을 
	        위 3가지 내용을 처리하는 코드를 처리하세요
	 	1) 스크립트릿(scriptlet)
	 		- 반복문, 조건문 등 여러가지 프로그램을 처리하는 부분.
	 	2) 표현식(expresstion)
	 		- 위 선언부나 스크립트릿의 데이터 출력
	 	3) 선언부(Declaration)
	 		- 선언부 변수의 선언/메서드의 선언
	 -->
		<%! String greet; %>
		<% greet="안녕"; %>
		<h3><%=greet %></h3>
		
	<!-- 
	[하] 4. input과 request를 이용해서 전달하고 싶은 말과 반복횟수를 입력받아서, 해당 말을 h3안에 반복 출력되게 하세요.
	 -->
		<form>
			<input type="text" name="message"/>
			<input type="number" name="repeat"/>
			<input type="submit" value="전달"/>
		</form>
		<%
			String inMessage = request.getParameter("message");
			String inCnt = request.getParameter("repeat");
			int cnt=1;
			if(inCnt!=null) cnt = Integer.parseInt(inCnt);
		
			for(int idx=0; idx<cnt; idx++){%>
				<h3><%=inMessage %></h3>
			<%} %>
		
<!-- 			String cols = request.getParameter("col");
	String rows = request.getParameter("row"); -->

</body>
</html>
