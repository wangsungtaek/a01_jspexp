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
</head>
<body>
<%--
[하] 1. 정규화의 개념과 원자값, 완전함수종속성, 이행적 함수종속성에 관련하여 기술하세요.
 --%>
<%--
[하] 1. 날짜설정의 기본형식을 기술하세요.
	1) 현재일자
		var 변수명 = new Date()
	2) 특정일자
		Date("영문월 날짜")
		Date("영문월 날짜, 년도")
		Date("영문월 날짜, 년도 시:분:초")
		Date(년도, 월index, 날짜)
		Date(년도, 월index, 날짜, 시, 분, 초)
		Date(년도, 월index, 날짜, 시, 분, 초, 1/1000초)
 --%>
<%--
[하] 2. 입사일 날짜를 (yyyy/mm/dd)형식으로 입력하고, 해당 날짜별 인턴기간(3개월)으로 계산하여 출력하세요.
 --%>

<%--
[하] 3. 아래와 같은 형식으로 입력하여, 두 날짜 사이의 차이를 구하세요
        [@@@@/@@/@@] ~[@@@@/@@/@@] [기간구하기]
        @@ 일
 --%>
	<input type="text" name="beforDate"/> ~ <input type="text" name="afterDate"/>
	<input type="button" onclick="calcDate()" value="기간구하기"/>
	<h3 id="show"></h3>
	<script type="text/javascript">
		function calcDate(){
			var beforDateValue = document.querySelector("[name=beforDate]").value;
			var afterDateValue = document.querySelector("[name=afterDate]").value;
			var showObj = document.querySelector("#show");
			console.log(beforDateValue);
			console.log(afterDateValue);
			if(beforDateValue.length >= 10 && afterDateValue.length >= 10){
				var b_yy = Number(beforDateValue.substring(0,4));
				var b_mm = Number(beforDateValue.substring(5,7));
				var b_dd = Number(beforDateValue.substring(8,10));
				var a_yy = Number(afterDateValue.substring(0,4));
				var a_mm = Number(afterDateValue.substring(5,7));
				var a_dd = Number(afterDateValue.substring(8,10));
				var beforDate = new Date(b_yy, b_mm, b_dd);
				var afterDate = new Date(a_yy, a_mm, a_dd);
				var interval = afterDate.getTime() - beforDate.getTime();
				interval = Math.floor(interval/(1000*60*60*24));
				showObj.innerHTML = interval;
			}
		}
	</script>
<%--
[하] 1. 쿠키의 생성과 확인을 request와 response를 기준으로 메서드를 활용하여 기술하세요
 --%>
<%--
[하] 2. 좋아하는 음식 [     ][주문] ==> 주문 클릭시, 쿠키값을 저장하고, 다음페이지에 쿠키값 내용을 확인하여
            @@@ 주문되었습니다로 출력하세요
 --%>

	좋아하는 음식 : <input type="text" name="food">
					<input type="button" onclick="order()" value="주문">
<%--
[중] 3. 물건명:[   ] 가격:[  ] 갯수:[    ][장바구니담기] 클릭을 통해 요청값을 전달하고, 쿠키를 만들고,
     생성된 쿠키값을 다음 페이지에서 확인해보자. 확인후 삭제 버튼 클릭시, 쿠키값을 삭제해보자.
 --%>
</body>
</html>