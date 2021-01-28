<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.Product"
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
<%--
[하] 1. session scope 4개의 범위를 기술하세요.(오늘 scope처리 master하지 못하신 분은 페이지 4개 만들어 다시 확인해보세요)
	1) pageContext
		- 한 페이지 단위에서 데이터를 저장하고 활용할 수 있는 pageContext
	2) request
		- 요청 page까지 데이터를 저장하고 활용할 수 있는 request
	3) session
		- 브라우저가 닫힐 때까지 데이터를 저장하고 활용할 수 있는 session
	4) application
		- 서버단위로 데이터를 저장하고 활용할 수 있는 application
--%>
<%--
[중] 2. 장바구니(session범위)에 담은 Product객체가 a01_shop1.jsp(초기설정) 후,  a02_shop2.jsp를 호출할 때마다 구매갯수가 계속 1씩 증가하게 처리하세요.
         Product(물건명,가격,갯수)-a01_shop1.jsp에서 초기 설정
--%>
</body>
</html>