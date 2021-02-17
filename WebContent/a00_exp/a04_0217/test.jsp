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
	<h3>제목</h3>
	<form method="get">
		<input type="text" name="id" value="<%=request.getParameter("id")%>"/>
		<input type="button" value="adf" onclick="test()"/>
	</form>
</body>
<script>
	function test(){
		document.querySelector("form").submit();
		<%
		String a = request.getParameter("id");
		%>
		var a = "<%=a%>";
		console.log(1);
		console.log(2);
		console.log(3);
		console.log(4);
		console.log(5);
		console.log(6);
		console.log(7);
		console.log(8);
		console.log(9);
		console.log(10);
		var test = setTimeout(function(){
			console.log("test");	
		},1000);
	}
</script>
</html>