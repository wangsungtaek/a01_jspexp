<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jspexp.z01_vo.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
[jsp]
[하] 1. 자바로 Book객체를 만들고, 도서명 가격 저자를 화면에 출력하세요. 		 --%>
<h2>1. 자바로 Book객체를 만들고, 도서명 가격 저자를 화면에 출력하세요.</h2>
<%
	Book b = new Book("삼국지",15000,"황석영");
%>
	<h3>도서명 : <%=b.getBname() %></h3>
	<h3>가격 : <%=b.getPrice() %></h3>
	<h3>저자 : <%=b.getAuthor() %></h3>
<%--
[하] 2. 브라우저에서 주소를 입력하여 jsp를 호출하여 화면에 출력되는 과정을 서버/클라이언트 기준으로 기술하세요.
		1) 브라우저 주소에 ip와 페이지를 입력
		2) 서버에 해당하는 페이지를 찾아서
		3) 아래와 같은 프로세스를 거쳐 클라이언트(브라우저에 전달)
	
	jsp페이지 ==> servlet클래스 ==> html코드 ==> 브라우저에 받아 html랜더링
	서버			서버				 서버	만들어 클라이언트 전달	
	
	==> http://ip주소:포트/자원폴드/@@@.jsp?요청1=요청값1&요청2=요청값2[브라우저 페이지 호출.]
			요청값 전달까지는 html로 처리가 가능하다.
		@@@.jsp --> @@servlet.java
		--> @@@.class --> 최종 결과 html페이지 만들어서 전달 [서버]
		String 요청1값 할당 변수 = request.getParameter("요청1")(jsp)
			요청값을 받는 처리는 반드시 객체를 사용하는 jsp를 통해서만 가능하다.
		
		최종 html 코드 받아서 랜더링으로 출력	[브라우저페이지 호출(클라이언트)]
	
[하] 3. jsp 화면의 구성요소 3가지를 기술하고, 변수 문자열 greet에 "안녕" 할당되고 출력되는 것을 
        위 3가지 내용을 처리하는 코드를 처리하세요
    1) 표현식(Expression) - 변수를 통해 값을 출력 ex) <%=변수명%>
	2) 스크립트릿(Scriptlet) - 자바 코드를 실행 ex) <% %>를 선를
		선언하여, 자바의 변수를 선언하거나, 조건 반복문들의 로직을 수행..
	3) 선언부(Declaration) - 자바 메서드(함수)를 정의	ex) <%! %>사이에 선언..      		--%>
	<%!
	//# script의 3가지 요소
	//1. declaration(선언)
	String greet;
	%>
	<%
	//2. scriptlet
	greet="안녕"; 
	%>
	<!-- 
	3. expression(표현)
	 -->
	<h3><%=greet %></h3>
<%--
[하] 4. input과 request를 이용해서 전달하고 싶은 말과 반복횟수를 입력받아서,
		해당 말을 h3안에 반복 출력되게 하세요.	
 --%>
 <form method="post"><!-- action="요청을 전달한 페이지(jsp)" 
 			: 선언하지 않으면 현재페이지를 다시 호출
 			method="get/post"
 			get방식 : default, 요청값을 화면 url에 나타남
 			post방식 : 선언시, 요청값은 http의 body에 나타나기에 
 					  url에는 나타나지 않는다. -->
 			하고 싶은 말:<input type="text" name="msg"/><br>
 			<!-- 요청값을 전달할 때, name="요청값key"로 전달하여야 한다. -->
 			반복 횟수 : <input type="text" name="cnt"/><br>
 			<input type="submit" value="전송"/>
 
 </form>
 <%--논리적으로 받는 페이지 처리 --%>
 <%request.setCharacterEncoding("utf-8"); %>
 <%
 //모든 요청값은 일단 문자열로 받는다.
 String msg = request.getParameter("msg");
 String cntS = request.getParameter("cnt");
 //모든 한글에 대한 요청값은 encoding처리가 필요로 하다.
 //get방식은 서버에서 encoding지원
 //post방식을 코드로 설정..
 
 
 if(msg!=null){
	 int cnt=0;
	 if(cntS!=null) cnt = Integer.parseInt(cntS);//형변환 처리.
	 for(int no=1; no<=cnt; no++){
	 %> 
	 	<h3><%=no%>)<%=msg%></h3>
	 
 <%} 
 
 }%>

</body>
</html>