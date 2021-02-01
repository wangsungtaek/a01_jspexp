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

/* [하] 1. prototype의 개념에 대하여 Book(도서명,저자,가격)의 생성자형 객체를 기준으로
        배열형(구매 도서3권)으로 선언하여 기술하세요.
        
    	function Book(bname, author, price) {
    		this.bname = bname;
    		this.author = author;
    		this.price = price;
    	} 
    	Book.prototype.buy = function(){
    		return this.author + ' 저자의 ' + this.bname + ' ' + this.price + ' 구매';
    	}
    	var b = new Book('자바의정석','남궁성',20000);
    	console.log(b.buy());
        
[하] 2. Object의 하위의 공통 메서드를 기술하고, Duck(오리종류, 색상, 날수있는지여부)를 선언하여,
        종류가 속성에 포함되는지, 수영을 할 수 있는지 여부, 속성을 포함되는지 호출하고, 색상이 접근가능
        여부를 하위 공통메서드 기반으로 선언하세요.
        
[하] 3. Number의 소숫점 이하 표현 메서드를 이용해서, 아래와 같이 출력을 클릭시, 화면에 처리되게 하세요.
       입력데이터[0.34222  ]
       소숫점자리수[3   ] [출력]
       0.342
*/
	function print(){
		var digits = document.querySelector(".digits");
		var inNum = document.querySelector(".inNum");
		var digitsInt = Number(digits.value);
		var inNumInt = Number(inNum.value);
		var result = inNumInt.toFixed(digitsInt);
	
		console.log(result);	
	}
</script>
</head>
<body>
<!-- 
[하] 1. jsp:forward의 기본 코드를 request.getRequestDispatcher비교하세요.
-->
<!--
[하] 2. 물건명,물건가격, 물건갯수를 입력받아, 1000000이상은 VVIP, 50만이상 VIP 
        그외에는 일반고객으로 각각의 페이지를 구현하여 처리하세요. 고객 이름과 함께 처리하세요.
        @@님 총구매금액 @@@원으로 VVIP 페이지에 접속하셨습니다.
 -->
	<form method="post">
		<label>이름 : <input type="text" name="user"/></label><br>
		<label>물건명 : <input type="text" name="pname"/></label><br>
		<label>물건가격 : <input type="text" name="price"/></label><br>
		<label>물건갯수 : <input type="text" name="cnt"/></label><br>
		<label><input type="submit" value="구 매"/></label>
	</form>
	<%
	String pname_ = request.getParameter("pname");
	String price_ = request.getParameter("price");
	String cnt_ = request.getParameter("cnt");
		
	if(price_ != null && !price_.equals("") && cnt_ != null && !cnt_.equals("")){
		int price = Integer.parseInt(price_);
		int cnt = Integer.parseInt(cnt_);
		int tot = price * cnt;
		request.setAttribute("tot", tot);
		
		String nextPage = "";
		if(tot >= 1000000) nextPage = "a02_vvip.jsp";
		else if(tot >= 500000) nextPage = "a03_vip.jsp";
		else nextPage = "a04_nomal.jsp";
	%>
		<jsp:forward page="<%=nextPage %>"></jsp:forward>
	<%} %>
	
	<label>입력데이터 : <input type="text" class="inNum"/><br></label>
	<label>소숫점 자리수 : <input type="text" class="digits"/><br></label>
	<input type="button" onclick="print()" value="출력">
	
</body>
</html>