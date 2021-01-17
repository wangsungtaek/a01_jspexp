<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
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
      
	};
</script>
</head>
<body>
<%--
[하] 1. 쿠키값의 life cycle과 필요한 메서드를 기술하세요.
	1) 쿠키 생성(서버) : Cookie c = new Cookie(이름, 값)
	2) 쿠키 생성 내용 전달(서버)
		response.addCookie(c);
	3) 쿠키 저장(브라우저)
		브라우저의 특정 위치에 저장됨.
	4) 쿠키 저장 내용 전달(브라우저)
		request에 의해 전달, 페이지 호출.
	5) 전달 되어온 쿠키 확인처리(서버)
		Cookie[] c = request.geetCookie();
		
 --%>
<%--
[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
	1) 삭제할 쿠키값을 요청값으로 전달
		get방식/post 방식으로 전달
		ex) <input type="checkbox" name="dcks"
				value="<%= c.getName%>">
		String[] ck = request.getParameterValues("dcks");
	2) 삭제할 요청된 쿠키값과 저장된 쿠키값을 비교
		for(Cookie c:request.getCookies()) {
			for(int idx=0; idx<dcks.length;idx++){
				if(c.getName.equals(dck[idx]){
		
	3) 쿠키 사용 기간값 0으로 설정.
		조건에 해당하는 쿠키의 기간
			c.setMaxAge(0);
	4) response객체로 해당 쿠키를 전송
			response.addCookie(c)
	
 --%>	
<%--
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
	1) forEach
		배열명.forEach(function(단위객체, index, Array){
			배열의 단위 객체에 데이터를 처리할 때, 활용된다.
		});
	2) map
		배열명.map(function(단위객체){
			return 단위객체변경데이터
			return 단위객체; // 값이 변경된 단위객체
		});
	3) filter
		배열명.filter(function(단위객체, index명, 전체배열){
			return 조건
		});
		해당 배열에 조건에 맞는 새로운 배열을 만들어 준다.
 --%>
<%--
[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여 표기하세요
 --%>
<script type="text/javascript">
	var proList = [];
	for(var i=0; i<5; i++){
		proList.push(Math.floor(Math.random()*9+1)*1000);
	}
	var compare = proList.map(function(ele, i, arry){
		return ele>=5000? ele+': 고가' : ele+': 저가';	
	});
	console.log(compare);
</script>
<%--
[하] 3. json객체의 문자열 변환 및 객체 변환 메서드를 기본예제를 통해 기술하세요.
 --%>
<script type="text/javascript">
	var book={
		title: "jsp중급",
		price: 32000,
		publisher: "IT서적"
	}
	// 문자열 변환처리
	var bookStr = JSON.stringify(book);
	console.log(bookStr);
	// 다시 객체로 변환 처리.
	var book2 = JSON.parse(bookStr);
	console.log(book2);
</script>
</body>
</html>
