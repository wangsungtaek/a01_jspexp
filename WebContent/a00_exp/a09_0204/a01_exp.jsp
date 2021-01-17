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
	1) 쿠키생성
		Cookie c = new Cookie(쿠키이름, 쿠키값);
	2) 쿠키전송
		response.addCookie(c);
	3) 쿠키객체 배열 읽기
		Cookie[] c = request.getCookies();
	4) 쿠키이름 읽기
		c.getName();
	5) 쿠키값 읽기
		c.getValue();
 --%>
<%--
[하] 2. 쿠키값을 요청값에 의해 삭제 처리되는 코드를 기술하세요
	쿠키.MaxAge(0);
 --%>	
<%--
[하] 1. 배열의 forEach(), map(), filter()의 기본 형식을 기술하세요.
	1) forEach
		배열명.forEach(function(단위객체, index, Array){
			
		});
	2) map
		배열명.map(function(단위객체){
			return 단위객체변경데이터
		});
	3) filter
		배열명.filter(function(단위객체, index명, 전체배열){
			return 조건
		});
 --%>
<%--
[하] 2. 1000단위 물건가격 5개를 임의로 만들어, 5000이상 고가 그외 저가 구분하여 표기하세요
 --%>
<script type="text/javascript">
	var proList = [];
	for(var i=0; i<5; i++){
		proList.push(Math.floor(Math.random()*10+1)*1000);
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
	var test = {
		kind: 'js테스트',
		date: '2020년12월01일',
		option: '기타'
	};
	console.log(test);
	// 텍스트로 변환
	var testStr = JSON.stringify(test);
	// 객체 변환
	var testObj = JSON.parse(testStr);
	console.log(testStr);
	console.log(testObj);
</script>
</body>
</html>
