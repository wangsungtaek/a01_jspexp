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
		headerName과 headerValue
		host : ip주소와 port
		connection : 연결유지 keep-alive
		user-agent : 지원브라우저
		accept : 전송가능한 형태 html, 파일.. pdf
		upgrad-insecure-requests : 보안 요청 값
		sec-fetch-site : none
		sec-fetch-user : ?1
		sec-fetch-dest : document
		accept-encoding : gzip, defalte, br
		accept-language : ko-Kr...
 --%>
<%--
[하] 2. jsp에서 result.jsp로 요청값 name=himan을 전송하는 경우와 js에서 동일한 내용을 처리하는 코드를 기술하세요.
		form으로 전송
			<form action="result.jsp">
				<input name="name" value="himan"/>
		url로 전송
			response.sendRedirect("result.jsp?name=himan");
		js에서 전송
			location.href="result.jsp?name=himan";
 --%>
<%--
[하] 3. jsp에서 요청값 한개 부터 시작해서, 숫자형 데이터 처리, 다중의 데이터 처리까지 form페이지와 함께 처리한 코드를
    기술하세요. (수업예제 제외)
			a01_basic\a21_form.jsp 참고 진행
 --%>

<%--
[하] 4. 구구단예제 기반(수업중)으로 하여, 임의의 (-)문제를 처리하게 하세요.
 --%>
 <%   
    
    
   int num01 = (int)(Math.random()*100+1) ;
   int num02 = 10;
   int corNum= num01*num02;
   String innumS = request.getParameter("innum");
   if(innumS!=null){
      int innum = Integer.parseInt(innumS);
      if(num01*num02==innum){
         response.sendRedirect("a18_succ.jsp");
      }else{
          response.sendRedirect("a19_fail.jsp?innum="+innum+"&corNum="+corNum);
       }
   }
   
%>
<body>
   <h3>구구단 게임</h3>
   <form>
      <table>
         <tr><th><%=num01 %> X <%=num02 %> = ?</th></tr>
         <tr><th>정답입력: <input type ="text" name="innum"></th></tr>
         <tr><td> <input type ="button" value="정답확인" onclick="valid()"></td></tr>
      </table>
   </form>	
<%--
[중] 4. upgrade판인 연산자도(+,-,*,/)도 임의로 나오게 하고, 총 10문제가 임의로 나오게 처리하세요.
        확인 클릭시, 결과 100점 만점에 맞춘만큼 점수도 표기
 --%>

</body>
<script type="text/javascript">
	
</script>
</html>