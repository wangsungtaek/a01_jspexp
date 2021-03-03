<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
	var dname = "${param.dname}";
	if(dname!=""){
		alert("등록 성공");
		if(confirm("등록성공\n조회페이지로이동")){
			location.href="${path}/dept.do";
		}
	}
	$(document).ready(function(){
		$("#insBtn").on("click",function(){
			var isPass = true
			$("[type=text]").each(function(){
				console.log($(this).val());
				if($(this).val()==""){
					alert("데이터를 입력하세요");
					$(this).focus();
					isPass = false;
					return false;
				} else {
					isPass = true;
					return true;
				}
			})
			if(isPass == true) {
				location.href='${path}/deptInsert.do';
			}
		});
	});
</script>
</head>
<body>
	<h3>부서등록페이지</h3>
	<form method="post">
	<table>
		<tr><th>부서번호</th><td><input type="text" name="deptno"></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname"></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc"></td></tr>
		<tr><td colspan="2"><input type="button" id="insBtn" value="등록"/>
			<input type="button" value="메인페이지이동"
				onclick="location.href='${path}/dept.do'"></td></tr>
	</table>
	</form>
</body>
</html>