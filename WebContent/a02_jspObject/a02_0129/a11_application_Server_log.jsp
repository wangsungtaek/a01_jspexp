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
	<h3>서보 정보</h3>
	<h4>서버정보 : <%= application.getServerInfo() %></h4>
	<h4>서블릿 규약 메이저 버전 : <%= application.getMajorVersion() %></h4>
	<h4>서블릿 규약 마이너 버전 : <%= application.getMinorVersion() %></h4>
	<h3>로그 처리.</h3>
	<%
	// log("jsp에서 server의  DEMON console로 출력되는 내용")
	log("로그 메시지 기록2");
	String name1 = "홍길동";
	int num03 = 25;
	int num04 = 30;
	int sum = num03 + num03;
	%>
	로그 메시지를 기록합니다.<br>
	<%
	application.log("로그 메시지 기록");
	%>
	로그 메시지를 기록합니다.<br>
	<%
	log(num03 + "+" + num04 + "=" + sum);
	System.out.println("로그 출력");
	%>
<%--
ex) 이름 나이 사는곳 숫자1 숫자2 변수를 출력과 함께 log에도 나타나게 처리하세요.
	이름 : @@
	나이 : @@
	사는 곳 : @@
	@@ + @@ = @@
 --%>
	<%
	String name = "홍길동";
	int age = 25;
	String loc = "서울 방배동";
	int num01 = 20;
	int num02 = 30;
	out.println("<h3>이름1:"+name+"</h3>");
	out.println("<h3>나이1:"+age+"</h3>");
	out.println("<h3>사는곳1:"+loc+"</h3>");
	out.println("<h3>"+num01+"+"+num02+" = "+ (num01+num02)  + "</h3>");
	
	System.out.println("<h3>이름2:"+name+"</h3>");
	System.out.println("<h3>나이2:"+age+"</h3>");
	System.out.println("<h3>사는곳2:"+loc+"</h3>");
	System.out.println("<h3>"+num01+"+"+num02+" = "+ (num01+num02)  + "</h3>");
	log("<h3>이름3:"+name+"</h3>");
	log("<h3>나이3:"+age+"</h3>");
	log("<h3>사는곳3:"+loc+"</h3>");
	log("<h3>"+num01+"+"+num02+" = "+ (num01+num02)  + "</h3>");	
	application.log("<h3>이름4:"+name+"</h3>");
	application.log("<h3>나이4:"+age+"</h3>");
	application.log("<h3>사는곳4:"+loc+"</h3>");
	application.log("<h3>"+num01+"+"+num02+" = "+ (num01+num02)  + "</h3>");
	%>
</body>
</html>