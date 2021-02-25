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
[하] 1. forTokens의 기본 속성값을 기술하세요.
	<c:forTokens var="변수명" items="구분자포함데이터" 
		delims="구분자"></c:forTokens>
	1) var : 구분자에 의해서 추출된 하나의 데이터
	2) items : 구분자가 있는 문자열
	3) delims : 구분자
--%>
<%--
[하] 2. 좋아하는 스포츠 스타 9명을 #으로 리스트하여 forTokens를 이용해서 3X3 테이블에 출력하세요.
 --%>
 	<table>
	<c:forTokens items="1스타#2스타#3스타#4스타#5스타#6스타#7스타#8스타#9스타" 
				var="star" delims="#" varStatus="sts">
		<c:if test="${sts.count%3 == 1 }">
			<tr>
		</c:if>
		<td>${star}</td>
		<c:if test="${sts.count%3 == 0 }">
			</tr>
		</c:if>
	</c:forTokens>
	</table>
<%--
[하] 1. ajax데이터의 속성과 속성값 처리 형식을 기술하세요.
	eval("("+responceText+")");
--%>
<%--
[하] 2. 부서 정보를 ajax로 keyup을 통해서, 검색 출력하세요.
--%>
	부서명  : <input type="text" name="dname"/> <br>
	부서위치 : <input type="text" name="loc"/>
	<div></div>
	
<script>
	var xhr = new XMLHttpRequest();
	
	$(document).ready(function(){
		$("[name=dname], [name=loc]").keyup(function(){
			if(event.key == 'Enter') {
				var xhr = new XMLHttpRequest();
				var dnameV = $("[name=dname]").val();
				var locV = $("[name=loc]").val();
				var str = "dname="+dnameV+"&loc="+locV;
				xhr.open("get","z01_deptData.jsp?"+str, true);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200){
						$("div").eq(0).html(xhr.responseText);
					}
				};
				xhr.send();
			}
		});
		
<%--
[중] 3. 오늘 ajax로 리스트 emp 데이터를 행단위로 클릭시 empno데이터를 요청값으로 넘겨주어
    list된 화면에 중앙 위치에 div 창이 show(), hide()를 통해서 상세내용을 ajax를 통해서
    출력하세요. dao의 Emp getEmp(int empno)메서드 활용
--%>		
		$("#eDetail").hide();
		$("[name=ename], [name=job]").keyup(function(){
			if(event.key == 'Enter'){
				var enameV = $('[name=ename]').val();
				var jobV = $('[name=job]').val();
				var str = 'ename='+enameV+'&job='+jobV;
				xhr.open("get","z02_empList.jsp?"+str, true);
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200){
						$('div#emp').html(xhr.responseText);
					}
				}
				xhr.send();
			}
		});
	});
/*
# 상세화면 popup 처리
1. 로딩되는 div 설정
	1) css로 절대 위치 지정, 크기
	2) 초기 화면은 해당 div를 .hide()(jquery에서 보이지 않게 처리)
2. 리스트 화면에서 클릭시
	1) empno값 전달
	2) 로딩 div 보이게 처리 .show()
	3) ajax로 empno의 값으로 처리된 상세화면 jsp 구현
	4) ajax로 해당 화면 호출..
	5) 기타 창닫기 처리 .close();
	
	
 */
	function detailEmp(empno) {
		$('#eDetail').show();
		ajaxFun3(empno);
	}
	function closeEmp(){
		$('#eDetail').hide();
	}
	function ajaxFun3(empno) {
		xhr.open("get","z03_empDetail.jsp?empno="+empno, true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var bottom="<br><input type='button' value='창닫기' onclick='closeEmp()' />"
				$('#eDetail').html(xhr.responseText+bottom);
			}
		}
		xhr.send();
	}
</script>
	<h3>사원정보 ajax</h3>
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job"/></td></tr>
	</table>
	<div id="emp"></div>
	<div id="eDetail"
		style="position: absolute; left: 30%; TOP: 0%; WIDTH:40%; height: 30%;
		background: yellow;" >
	</div>
</body>
</html>