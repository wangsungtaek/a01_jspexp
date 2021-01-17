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
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
<%--
[하] 3. 아래와 같은 형식으로 입력하여, 두 날짜 사이의 차이를 구하세요
        [@@@@/@@/@@] ~[@@@@/@@/@@] [기간구하기]
        @@ 일
 --%>
	<input type="text" name="date01" placeholder="yyyy/mm/dd"/> ~ 
	<input type="text" name="date02" placeholder="yyyy/mm/dd"/>
	<input type="button" onclick="calcuTerm()" value="기간구하기"/><br>
	<h3 id="show2"></h3>
	<script type="text/javascript">
		function calcuTerm() {
			var date01 = document.querySelector("[name=date01]").value;
			var date02 = document.querySelector("[name=date02]").value;
			var date01Arry = date01.split("/");
			var date02Arry = date02.split("/");
			var startDate = new Date(date01Arry[0], Number[date01Arry[1]-1], date01Arry[2]);
			var endDate = new Date(date02Arry[0], Number[date02Arry[1]-1], date02Arry[2]);
			var interval = startDate.getTime() - endDate.getTime();
			interval = Math.floor(interval / (1000*60*60*24));
			
			document.querySelector("#show2").innerHTML = interval;
		}
	</script>
</body>
</html>