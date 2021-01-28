<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
		ex2();
		// name=himan을 js에서 처리하는 방식
    	function ex2(){
    		var ex2Obj = document.querySelector("#ex2 table");
    		var show="";
    		show += "<tr><th>name</th></tr>";
    		show += "<tr><td><input type='text' name='name'/></td></tr>";
    		show += "<tr><td><input type='submit' value='전송'/></td></tr>";
    		ex2Obj.innerHTML = show;
    	}
	};
</script>
</head>
<body>
<%--
[하] 1. 요청의 header에 들어가는 key와 value를 나열해보세요.
	1) headerName : headerValue
	2) host : localhost:7080
	3) connection : keep-alive
	4) upgrade-insecure-requests : 1
	5) user-agent : Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36
	6) accept : text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
	7) sec-fetch-site : none
	8) sec-fetch-mode : navigate
	9) sec-fetch-user : ?1
	10) sec-fetch-dest : document
	11) accept-encoding : gzip, deflate, br
	12) accept-language : ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7
	13) cookie : JSESSIONID=D2BAFC54ED6E459B8A4A9CDA4A560CC3
 --%>
<%--
[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와 js에서 동일한 내용을 처리하는 코드를 기술하세요.

 --%>
 	<%--form을 사용한 데이터 전송 --%>
	<h3>ex2)</h3>
	<form action="result.jsp" method="get">
	<table>
		<tr><th>name</th></tr>
		<tr><td><input type="text" name="name"/></td></tr>
		<tr><td><input type="submit" value="전송"/></td></tr>
	</table>
	</form>
	<form action="result.jsp" method="get" id="ex2">
		<table></table>
	</form>
<%--
[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 다중의 데이터 처리까지 form페이지와 함께 처리한 코드를
    기술하세요. (수업예제 제외)
 --%>
	<form method="get" id="ex3">
	<table>
		<tr><th>좋아하는 음식 TOP1</th>
			<td><input type="text" name="bestFood"/></td></tr>
		<tr><th>좋아하는 숫자 TOP1</th>
			<td><input type="text" name="bestNumber"/></td></tr>		
		<tr><th>좋아하는 노래 TOP1</th>
			<td><input type="text" name="bestSong"/></td></tr>
		<tr><th>좋아하는 노래 TOP2</th>
			<td><input type="text" name="bestSong"/></td></tr>
		<tr><th>좋아하는 노래 TOP3</th>
			<td><input type="text" name="bestSong"/></td></tr>
		<tr><td colspan="2">
			<input type="button" onclick="valid()" value="전송"/></td></tr>
	</table>
	</form>
	<%
		String food = request.getParameter("bestFood"); if(food == null) food = "";
		String number = request.getParameter("bestNumber"); if(number == null) number = "";
		String[] songs = request.getParameterValues("bestSong"); if(songs == null) songs = new String[]{};
	%>
	<table>
		<tr><th>좋아하는 음식</th>
			<td><%=food %></td></tr>
		<tr><th>좋아하는 숫자</th>
			<td><%=number %></td></tr>
		<tr><th rowspan="4">좋아하는 노래</th></tr>
			<%for(int idx=0; idx<songs.length; idx++) { %>
		<tr><td><%=songs[idx] %></td></tr>
			<%} %>
	</table><br>
<%--
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.
 --%>
	<%
		int num01 = (int)(Math.random()*8+2);
		int num02 = (int)(Math.random()*9+1);
		int result = (num01-num02);
		String inNum = request.getParameter("inNum"); if(inNum == null) inNum="";
		String answer = request.getParameter("answer"); if(answer == null) answer="";
	%>
	<h3>ex4)</h3>
	<form id="ex4">
	<table>
		<tr><th><%=num01 %>-<%=num02 %>=</th>
			<td><input type="text" name="inNum"/>
				<input type="hidden" name="answer" value="<%=result %>"/></td></tr>
		<tr><td colspan="2">
			<input type="button" onclick="valid2()" value="제출"/>
			</td>
	</table>
	</form>
	<h3>입력값 : <%=inNum %></h3>
	<h3>정답 : <%=answer %></h3>
<%--
[중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
        확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기
 --%>
	<%
	int num04 = 0;
	int num05 = 0;
	int ran = 0;
	char[] calcs = {'+','-','*','/'};
	int[] answers = new int[10];
	
	String[] inDap = request.getParameterValues("dap");
	if(inDap == null) inDap = new String[]{};
	String[] inCheck = request.getParameterValues("check");
	if(inCheck == null) inCheck = new String[]{};
	%>
	<h3>ex4)</h3>
	<form>
	<table>
	<% 
	for(int idx=0; idx<answers.length; idx++){
		num04 = (int)(Math.random()*8+2);
		num05 = (int)(Math.random()*9+1);
		ran = (int)(Math.random()*4);
		switch(ran){
			case 0: answers[idx]= num04 + num05; break;
			case 1: answers[idx]= num04 - num05; break;
			case 2: answers[idx]= num04 * num05; break;
			default: answers[idx]= num04 / num05; break;
		}%>
		<tr><th><%=num04 %> <%=calcs[ran] %> <%=num05 %></th>
			<td><input type="text" name="dap"/>
				<input type="hidden" name="check" value="<%=answers[idx] %>" /></td></tr>
	<%} %>
		<tr><td colspan="2"/>
			<input type="submit" value="정답확인"/></td></tr>
	</table>
	</form>
	<!-- 정답확인 -->
	<table>
		<tr><th>정답</th><th>입력값</th><th>결과</th><tr>
	<%
		String result2 = "";
		int score = 0;
		for(int idx=0;idx<inCheck.length;idx++){
			if(inCheck[idx].equals(inDap[idx])) {
				result2 = "정답";
				score += 10;
			} else {
				result2 = "오답";
			}
	%>
		<tr><th><%=inCheck[idx] %></th>
			<td><%=inDap[idx] %></td>
			<td><%=result2 %></td></tr>
	<%				
		}
	%>
		<tr><th colspan="2">점수</th>
			<td><%=score %></td></tr>
	</table>
<%--
[하] 1. id와 point를 등록해서 서버에 전송할려고 한다. 입력값을 받드시 넣어야 하고, point는 숫자값이 되게 js로 처리한 후,
       result.jsp에서 해당 값을 출력하세요 처리하세요.
 --%>
	<h3>js ex1)</h3>
	<form action="result.jsp" method="post" id="jsEx1">
		<label>아이디:<input type="text" name="id"/></label><br>
		<label>포인트:<input type="text" name="point"/></label><br>
		<label>전송:<input type="button" onclick="valid3()" value="전송"/></label>
	</form>
</body>
<script type="text/javascript">
	// ex3)
	function valid(){
		var numObj = document.querySelector("input[name=bestNumber]");
		if(numObj.value == ""){
			alert("데이터를 입력해주세요.");
			numObj.focus;
		} else {
			if(isNaN(numObj.value)){
				alert("숫자를 입력해주세요.");
			}else {
				document.querySelector("#ex3").submit();
			}
		}
	}
	// ex4)
	function valid2(){
		var inNumObj = document.querySelector("#ex4 input[name=inNum]");
		if(inNumObj.value == ""){
			alert("정답을 입력하세요.");
			inNumObj.focus();
		} else {
			if(isNaN(inNumObj.value)) {
				alert("숫자를 입력하세요.");
			} else {
				document.querySelector("#ex4").submit();
			}
		}
	}
	// js Ex1)
	function valid3(){
		var idObj = document.querySelector("#jsEx1 input[name=id]");
		var pointObj = document.querySelector("#jsEx1 input[name=point]");
		if(idObj.value == ""){
			alert("아이디를 입력해주세요");
			idObj.focus();
		} else {
			if(pointObj.value == ""){
				alert("포인트를 입력해주세요");
				pointObj.focus();
			} else if(isNaN(pointObj.value)){
				alert("포인트는 숫자를 입력해주세요");
				pointObj.focus();
			} else {
				document.querySelector("#jsEx1").submit();
			}
		} 
	}
</script>
</html>