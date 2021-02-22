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
<script type="text/javascript" src="<%=path%>/a00_com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
// 		$("h3").text("시작");
	});
</script>
</head>
<body>
	<%-- use Bean을 통해서 session범위로 저장되어 있는 내용은
		el을 이용해서 바로 호출하여 사용할 수 있다. ${bean아이디.속성} --%>
<h3>${bk.bname}</h3>
<h3>${bk.author}</h3>
<h3>${bk.publisher}</h3>
</body>
</html>