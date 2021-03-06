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
[하] 1. MVC 패턴에서 list에서 상세화면 처리시, 요청값 처리방식에 대하여 기술하세요
	1) list.jsp 에서 해당열 클릭 시 이벤트를 발생시킨다.
	2) 해당열의 데이터를 읽어와 detail controller에 get방식으로 보낸다.
	3) detail 컨트롤러에서는 전달받은 값을 토대로 데이터베이스 서버에 연결하여
		해당 데이터를 가져온다.
	4) 데이터베이스에서 전달받은 값을 detail.jsp(뷰)로 보내준다.
 --%>
<%--
[하] 2. MVC 패턴에서 상세화면에서 수정과 삭제 처리시 요청값의 내용과 조건에 따른 처리를 기술하세요.
 	request.getParameter("proc")의 값에 따라 조건 처리
	 	upt = 수정
	 	del = 삭제
 --%>
<%--
[중] 3. MVC 패턴으로 물품 상세화면/수정 처리를 해보세요.
 --%>
<%--
[하] 1. 좋아요/싫어요 버튼을 클릭시, 하단에 하트가 하나씩 늘어나든지/줄어들던지 하세요(단 한번만)
 --%>
	<button id="favor">좋아요</button>
	<button id="unfavor">싫어요</button>
	<div>
		<h4>하트</h4>
		<h4>하트</h4>
	</div>
	
<script>
	$('#favor').one("click", function(){
		$('div').append("<h4>하트</h4>");
	});
	$('#unfavor').one("click", function(){
		console.log($('div').children(0).eq(0));
		$('div').children(0).eq(0).remove(0);		
	});

</script>
	
<%--
[중] 2. 임의의 구구단 문제를 나오게 하고, 정답확인을 클릭시 정답여부를 나오게 한다.
        5초가 지나도 정답여부를 출력하게 처리하세요.
 --%>
<%
	int x = (int)Math.floor(Math.random()*8+2);
	int y = (int)Math.floor(Math.random()*9+1);
	request.setAttribute("x", x);
	request.setAttribute("y", y);
%>	
	
	<input type="text" value="${x}" name="x"/> x <input type="text" value="${y}" name="y"/> =
	<input type="text" value="" name="answer" />
	<input type="button" id="submit" value="정답확인"/>
<script>
	$('#submit').on("click",function(){
		console.log($('[name=x]').val());
		var answer = $('[name=x]').val() * $('[name=y]').val();
		console.log(answer);
		$('[name=answer]').val(answer);
	});
	setTimeout(function(){
		$('#submit').trigger("click");
	},5000);
</script>
</body>
</html>