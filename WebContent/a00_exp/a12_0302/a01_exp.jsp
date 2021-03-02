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
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
<%--
[하] 1. MVC 패턴으로 물건 list 조회하는 화면을 만드세요.
--%>
	<h3>물품검색</h3>
	<form method="post">
	<table>
		<tr><th>물품명</th>
			<td><input type="text" name="pname" value="${param.pname}"/></td></tr>
		<tr><th>from</th>
			<td><input type="text" name="fromPrice" value="${param.fromPrice}"/></td></tr>
		<tr><th>to</th>
			<td><input type="text" name="toPrice" value="${param.toPrice}"/></td></tr>
		<tr><td colspan="3"><input type="submit" value="검색"/></td></tr>
	</table>
	<table>
		<tr>
			<th>물품코드</th>
			<th>물품명</th>
			<th>가격</th>
			<th>갯수</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="prod" items="${prodList}">
		<tr>
			<td>${prod.pno}</td>
			<td>${prod.name}</td>
			<td>${prod.price}</td>
			<td>${prod.cnt}</td>
			<td>${prod.credte}</td>
		</tr>
		</c:forEach>
	</table>
	</form>
<%--
[하] 1. 이벤트의 기본 형식을 기술하세요
	1) $('선택자').이벤트명(function()처리할 내용})
	2) $('선택자').on("이벤트명",function(){})
--%>
<%--
[하] 2. 커져라, 작아져라 버튼을 통해서, 특정이미지의 크기를 상대적으로 점점 커지거나,
        작아지게 처리하세요.
--%>
	<button id="big">커져라</button>
	<button id="small">작아져라</button><br>
	<img src="a00_exp/a12_0302/1.png">
	<script>
		$('#big').on("click", function(){
			$('img').attr({
				width:200,
				heigth:200
			});
		});
		$('#small').on("click", function(){
			$('img').attr({
				width:100,
				heigth:100
			});
		});
	</script>
<%--
[하] 3. checkbox의 checked 속성 처리 형식 2가지를 기술하세요.
	1) 삭제
		$('선택자').removeAttr('checked');
		$('선택지').prop("checked", false);
	2) 선택
		$('선택자').arrt('checked', 'checked');
		$('선택지').prop("checked", true);
--%>
<%--
[하] 4. h3로 무지개 색상이 나오고, 클릭시, 바로 밑에 h4로 해당 RE:색상형식으로 추가되어
        클릭시, 글자 색상이 변경되게 하세요.
--%>
	<h3>빨</h3>
	<h3>주</h3>
	<h3>노</h3>
	<h3>초</h3>
	<h3>파</h3>
	<h3>남</h3>
	<h3>보</h3>
	<h4></h4>
	<script>
		$('h3').on("click", function(){
			$(this).css("color","red");
		});
	</script>
</body>
</html>
