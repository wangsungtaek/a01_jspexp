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
//
	var proc = "${param.proc}";
	if(proc == "upt"){
		if(confirm("수정되었습니다.\n조회화면으로 이동하시겠습니까?"))
			location.href="${path}/prod.do";
	}
	if(proc == "del"){
		alert("삭제되었습니다.");
		location.href="${path}/prod.do";
	}


	$(document).ready(function(){
		$("#update").on("click", function(){
			if(confirm("정말 수정하시겠습니까?")){
				$('[name=proc]').val("upt");
				$("form").submit();
			}
		});
		$("#delete").on("click", function(){
			if(confirm("정말 삭제하시겠습니까?")){
				$('[name=proc]').val("del");
				$("form").submit();
			}
		});
	});
</script>
</head>
<body>
	<h3>물품상세[${param.pno}]</h3>
	<form method="post">
		<input type="hidden" value="" name="proc"/>
	<table>
		<c:choose>
			<c:when test="${not empty prod.pno}">
				<tr><th>제품명</th><td><input type="text" value="${prod.name}" name="name"/></td></tr>
				<tr><th>가격</th><td><input type="text" value="${prod.price}" name="price"/></td></tr>
				<tr><th>갯수</th><td><input type="text" value="${prod.cnt}" name="cnt"/></td></tr>
				<tr>
					<th>등록일</th>
					<td><input type="text" 
						value="<fmt:formatDate value="${prod.credte}" pattern="yyyy/MM/dd"/>"
					 	name="credte"/></td>
				</tr>
				<tr>
					<th>담당자</th>
					<td><input type="text" value="${prod.inmanager}" name="inmanager"/></td>
				</tr>				
			</c:when>
			<c:otherwise>
				<tr><td colspan="2">해당 제품은 존재하지 않습니다.</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" id="update"/>
				<input type="button" value="삭제" id="delete"/>
				<input type="button" value="메인페이지로"
					onclick="location.href='${path}/prod.do'"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>