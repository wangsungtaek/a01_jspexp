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
<style>

</style>
<script>
	window.onload=function(){
      
	};
</script>
</head>
<body>
<%--  
[하] 1. jsp에서 에러페이지의 지정 속성과 실제 에러가 발생한 페이지에 대한 속성을 선언하세요.

	에러예상페이지 : errorPage="처리할페이지"
	에러페이지 : <%@ isErrorPage="true"%>
 --%>
<%--  
[하] 2. String [] s= {""}; s[3]; 코드를 호출하여, 에러가 발생했을 때, 나타날 페이지를 
    	지정하여 처리하세요. 
    	
	발생에러 : java.lang.ArrayIndexOutOfBoundsException
	나타날 페이지 지정 : <%@ errorPage="z01_error.jsp">
 --%>
<%--
[하] 3. 서버단위 에러와 페이지 단위 에러처리의 차이점을 기술하세요.
 --%>
<%--
[하] 4. ArrayIndexOutOfBoundsException를 확인하고, 해당 내용일 때, 처리할 페이지를 구현하고,
        web.xml에 등록하여, 처리되게 하세요.
	
	<error-page>
		<exception-type>java.lang.ArrayIndexOutOfBoundsException</exception-type>
		<location>/a00_exp/a07_0202/z01_error.jsp</location>
	</error-page>
 --%>
<%--
[하] 1. 주민번호를 문자열 메서드에 의해서 생년월일을 추출하여, 출력하세요
 --%>
	<label>주민번호 : <input type="text" name="num"/></label>
	<input type="button" onclick="change()" value="클릭"/><br>
	<div id="ex1">결과</div>

<%--
[중] 2. 물건정보 [사과^바나나^딸기]
       가격정보 [3000,4000,5000] [등록] ==> 클릭시 데이터 추출 후, 아래 테이블에 리스트
        물건명   가격
        사과    3000
        바나나   4000
        딸기    5000
 --%>
	물건정보 : <input type="text" name="pnames" /><br>
	가격정보 : <input type="text" name="prices" />
	<input type="button" value="등록" onclick="update()"/><br>
	<table id="ex2">
		<tr><th>물건명</th><th>가격</th>
	</table>

</body>
<script type="text/javascript">
	function change(){
		var inValue = document.querySelector("[name=num]").value;
		var resultObj = document.querySelector("#ex1");
		if(inValue.length == 6) {
			resultObj.innerHTML = inValue.substr(0,2) + '년 ';
			resultObj.innerHTML += inValue.substr(2,2) + '월 ';
			resultObj.innerHTML += inValue.substr(4,2) + '일 생 ';
		}
	}
	
	function update(){
		var inPname = document.querySelector("[name=pnames]").value;
		var inPrices = document.querySelector("[name=prices]").value;
		var arryPname = inPname.split("^");
		var arryPrice = inPrices.split(",");
	
		var addValue = "";
		arryPname.forEach(function(ele,idx){
			addValue += "<tr><td>"+ ele + "</td><td>" + arryPrice[idx] + "</td></tr>"
		});
		document.querySelector("#ex2").innerHTML += addValue;
	}
<%--
[하] 3. 임의의 점수 1~100을 한반에 30명에 할당한 후, 내림차순과 오름 차순으로 출력하세요.
 --%>
	var ban = [];
	for(var i=0; i<30; i++) {
		ban.push(Math.floor(Math.random()*100+1));
	}
	// 오름차순
	ban.sort(function(left, right){
		return left - right;
	});
	console.log(ban);
	// 오름차순
	ban.sort(function(left, right){
		return right - left;
	});
	console.log(ban);
<%--
[중] 4. 학생번호와 국어,영어,수학 점수의 속성화 함수로 avg()로 선언하고, 30명에게 각각 임의의 점수(1~100)
    까지 할당하게 하고, 전체과목기준 평균점수 기준으로 rank3을 출력하세요.
 --%>
	function student(no, kor, eng, math){
		this.학번 = no;
		this.국어 = kor;
		this.영어 = eng;
		this.수학 = math;
	};
	student.prototype.avg = function() {
		return (this.국어 + this.영어 + this.수학)/3; 
	};
	var arryStudent = [];
	for(var i=1; i<=30; i++){
		var ranKor = Math.floor(Math.random()*100+1);
		var ranEng = Math.floor(Math.random()*100+1);
		var ranMath = Math.floor(Math.random()*100+1);
		arryStudent.push(new student(i,ranKor,ranEng,ranMath));
	};
	// rank3
	var top3 = [];
	top3 = arryStudent.sort(function(left, right){
		return right.avg() - left.avg(); 
	}).slice(0,3);
	
	console.log(top3);
<%--
[하] 5. 배열 삭제 메서드의 prototype선언과 삭제 위치에 대한 역순위 처리의 이유에 대하여 기술하세요.
 --%>
	
</script>
</html>