<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<%--
[ajax]
[하] 1. ajax의 post방식 선언 속성을 기술하세요.
	open("post", "주소", true);
	sendRequestHeader("Content-Type, application/x-www-form-urlencoded")
	send("요청1=요청값1&요청2=요청값2")
--%>
<%--
[중] 2. 물건 번호:[   ] 입력 후, enter키를 입력시, 물건 정보가 있으면
        상세내용을 출력 하세요.
--%>
	<h3>물건 정보 출력</h3>
	<table>
		<tr><th>물건번호</th><td><input type="text" name="pno"/></tr>
	</table>
	<table id="pro-info">
	</table>
	<table id="deptList">
	</table>
<script>
	var xhr = new XMLHttpRequest();
	$(document).ready(function(){
		$("[name=pno]").keyup(function(){
			if(event.key == 'Enter'){
				var pno = $("[name=pno]").val();
				var qstr = "pno="+pno;
				xhr.open("post","z01_prodData.jsp",true);
				xhr.setRequestHeader("Content-Type",
									 "application/x-www-form-urlencoded");
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200) {
						var prod = JSON.parse(xhr.responseText);
						console.log(xhr.responseText);
						var show = "<tr><td>"+prod.pno+"</td>";
						show += "<td>"+prod.name+"</td>";
						show += "<td>"+prod.price+"</td>";
						show += "<td>"+prod.cnt+"</td>";
						show += "<td>"+prod.credte+"</td>";
						show += "<td>"+prod.company+"</td>";
						show += "<td>"+prod.incomedte+"</td>";
						show += "<td>"+prod.inmanager+"</td><tr>";
						$("#pro-info").html(show);
					}
				};
				xhr.send(qstr);
			}
		});
	});
<%--
[하] 3. deptlist를 json형식으로 로딩하여 ajax로 가져와서 출력하세요.
--%>
	function showDeptList(){
		xhr.open("post","z02_deptData.jsp",true);
		xhr.setRequestHeader("Content-Type",
							 "application/x-www-form-urlencoded");
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200) {
				var deptJson = JSON.parse(xhr.responseText);
				console.log(deptJson);
				var show = "";
				$(deptJson.deptList).each(function(idx, dept){
					show += "<tr><td>"+dept.deptno+"</td>"; 
					show += "<td>"+dept.dname+"</td>";
					show += "<td>"+dept.loc+"</td><tr>";
				});
				$("#deptList").html(show);
			}
		};
		xhr.send();
	}
	showDeptList();
</script>
</body>
</html>