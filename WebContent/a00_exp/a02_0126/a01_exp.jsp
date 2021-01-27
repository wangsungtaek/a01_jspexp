<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      
   };
</script>
</head>
<body>
<%--
[하] 1. request, response 참조변수의 원래 객체의 명은 무엇인가?(servlet클래스 참조)
	1) request
		- HttpServletRequest
	2) response
		- HttpServletResponse
--%>
<%--
[하] 2. jsp에서 객체선언없이 사용하는 내장된 참조객체를 기술하세요.
	1) request : 요청 정보를 구할 때, 사용
	2) response : 응답과 관련된 설정 시 사용
	3) out : 직접 응답을 출력할 때 사용
	4) session : 세션 관리에 사용
	jsp ==> servlet로 변경할때, 위객체는 선언되어 있기 때문에 선언없이 사용이 가능하다.
--%>
<%--
[하] 3. request객체의 메서드의 각자 특징과 내용을 기술하세요.
	1) request.getParameter("key") : 단일데이터 String
		request.getParameterValue("key") : 다중데이터 String[]
		- client가 주소창이나 form객체를 통해서 전송하는 매개값을 처리하는 객체
	2) request.getRemoteAddr()
		- 웹서버에 연결된 클라이언트의 ip주소를 구한다.
	3) request.getMethod()
		- 요청값을 전달할 때, 전송하는 방식을 가져온다.
	4) request.getContextPath()
		- 위 주소에 해당하는 context명을 말한다. 웹서버에 등록하여 할당하는 프로젝트명이기도 하다.
	5) request.getRequestURI()
		- 웹 브라우저가 요청한 url경로:
			위 주소에서 context명/폴드/파일.jsp에 해당한다.
	6) request.getServerPort()
		- 연결할 때, 사용한 포트번호
		- 위 주소기준이면 7080에 해당한다.
	7) request.getServerName()
		- 연결할 때, 사용한 서버이름
--%>
<%--
[하] 4. request객체의 메서드 가운데 요청값을 처리하는 메서드의 특징을 기술하세요.
	1) request.getParameter("key")
		- key값에 해당하는 value를 받아올 수 있다.
	2) request.getParameterValues("key")
		- 동일한 이름의 key값으로 여러 value값을 받을 때, 배열로 데이터를 받을 수 있다.
	3) request.getParameterName()
		- 요청되는 모든 내용을 key값을 가져온다.
	4) request.getParameterMap();
		- 요청된 모든 내용을 key/value형식으로 map에 할당되어 가져온다.
--%>
<%--
[중] 5. 구매할물건과 갯수를 queryString으로 페이지와 함께 만들고, 해당 페이지에서 
        데이터를 처리하세요 page.jsp?name=사과&cnt=2&price=3000&name=바나나&cnt=5&prcie=4000&pay=신용카드&pay=현금&pay=포인트
        1) get방식으로 바로 출력
        2) form 처리 방식 입력 후, 출력.
            구매물건
            물건명   갯수
            [   ]  [  ]
            [   ]  [  ]
            [   ]  [  ]
            구매방법 []신용카드[]현금[]포인트
--%>
	<%-- http://localhost:7080/jspexp/a00_exp/a02_0126/a01_exp.jsp?
	name=사과&price=3&cnt=2000&name=바나나&price=2&cnt=3000&name=앵두&price=2&cnt=4000&pay=신용카드 --%>
	<%		
		String[] pname = request.getParameterValues("name");
		String[] price = request.getParameterValues("price");
		String[] cnt = request.getParameterValues("cnt");
		String pay = request.getParameter("pay");
	%>
	<h3>구매물건</h3>
	<table>
		<tr><th>물건명</th><th>가격</th><th>갯수</th><th>총계</th></tr>
		<%
		if(pname != null && price != null && cnt != null) {
			for(int idx=0; idx<pname.length; idx++){
		%>
				<tr><td><%= pname[idx] %></td>
					<td><%= price[idx] %></td>
					<td><%= cnt[idx] %></td>
					<td><%= Integer.parseInt(price[idx]) * Integer.parseInt(cnt[idx]) %></td></tr>
		<%		
			}
		}
		if(pay != null) {
		%>	
			<tr><th>구매방법</th><td colspan="3"><%=pay %></td></tr>
		<%	
		}
		%>
	
	</table>
</body>
</html>
