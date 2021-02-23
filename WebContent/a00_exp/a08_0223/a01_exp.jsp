<%@page import="jspexp.a03_database.A03_ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A03_ShopDao"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
[하] 1. jstl의 forEach varStatus의 상태 속성에 대하여 기술하세요.
	1) index : 0부터 시작하여 증가하는 index번호 출력
	2) count : 1부터 시작하여 증가하는 카운트번호 출력
	3) first : 해당 반복의 첫번째인지 여부 boolean
	4) last : 해당 반복의 마지막인지 여부 boolean
--%>
<%-- 
[하] 2. 배열로 물건명과 가격을 3개씩을 선언한 후, 테이블(1X3)에서
        물건명(가격)  형식으로 한 셀에 표기하세요.
--%>
<%
	pageContext.setAttribute("pnames",new String[]{"사과","배","바나나"});
	pageContext.setAttribute("prices", new int[]{1000,2000,3000});
%>
	<table>
	<tr>
	<c:forEach begin="0" end="${fn:length(pnames)-1}" varStatus="sts">
		<td>${pnames[sts.index]}(${prices[sts.index]})</td>
	</c:forEach>
	</tr>
	</table>
<%-- 
[하] 3. dao의 수업 중 진행하지 않은 검색데이터 기능메서드를 찾아서 검색 처리화면을 구현하세요.
--%>
	
	<h3>쇼핑</h3>
	<form method="post">
	<table>
		<tr><th>제품명</th><td><input type="text" name="pname" value="${param.pname}" /></td></tr>
		<tr><th>from-price</th><td><input type="text" name="fr_price" value="${param.fr_price}" /></td></tr>
		<tr><th>to-price</th><td><input type="text" name="to_price" value="${param.to_price}" /></td></tr>
		<tr><td colspan="2"><input type="submit" value="검 색"/></td></tr>
	</table>
	</form>
	
	<jsp:useBean id="dao" class="jspexp.a03_database.A03_ShopDao"/>
	<c:set var="proList" value="${dao.shopList(param.pname, param.fr_price, param.to_price)}"/>
	<table>
		<tr><th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>갯수</th>
			<th>등록일</th>
			<th>제조사</th>
			<th>최근등록일</th>
			<th>담당자</th></tr>
		<c:forEach var="pro" items="${proList}">
			<tr>
				<td>${pro.pno}</td>
				<td>${pro.name}</td>
				<td>${pro.price}</td>
				<td>${pro.cnt}</td>
				<td>${pro.credte}</td>
				<td>${pro.company}</td>
				<td>${pro.incomedte}</td>
				<td>${pro.inmanager}</td>
			</tr>
		</c:forEach>
	</table>			
<%-- 
[하] 1. ajax 기본 호출형식과 open()의 속성값과 비동기와 동기의 차이를 기술하세요
	1) 객체 생성
		var xhr = new XMLHttpRequest();
	2) 서버에 특정 자원 가져오기
		xhr.open("get", "test.html" false||true);
		1번째 인자 : 통신방식(get, post)
		2번째 인자 : 자원
		3번째 인자 : 비동기 방식 활성화 or 비활성화
	3) 호출
		xhr.send();
	4) 결과값 확인
		alert(xhr.responseText);
		
	비동기 통신 : 해당 이벤트를 처리하고 이후에 답변이 오기 전에 다른 요소객체를 변경가능하다.
	동기 통신 : 해당 이벤트를 처리하고 이후에 답변이 오기 전에 다른 요소객체를 변경할 수 없다.
--%>
<%--
[하] 2. [이쪽으로 와보세요] ==> 해당위치로 커서를 옮겼을 때, z01_data.txt에 있는 I love you! 를 비동기적으로
    로딩해서 호출하여 추가적으로 출력하세요..
--%>
	<script>
	$(document).ready(function(){
		$('[name=come]').val("이쪽으로 와보세요.").mouseenter(function(){
			var xhr = new XMLHttpRequest();
			console.log(xhr);
			xhr.open("post","z01_data.txt",true);
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4 && xhr.status == 200){
					$('#result').text( $('#result').text() + xhr.responseText );
				}
			}
			xhr.send();
		})
	});
	</script>
	<input type="text" name="come"/>
	<div id="result"></div>
</body>
</html>