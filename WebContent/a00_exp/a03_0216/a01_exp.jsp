<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"
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
</script>
</head>
<body>
<%
	int frPrice = 0;
	int toPrice = 999999;
	
	// request
	String name = request.getParameter("name");
	String frPriceS = request.getParameter("frPrice");
	String toPriceS = request.getParameter("toPrice");

	// 조건검사
	if(name == null) name="";
	if(frPriceS != null && !frPriceS.equals("")) frPrice = Integer.parseInt(frPriceS);
	if(toPriceS != null && !toPriceS.equals("")) toPrice = Integer.parseInt(toPriceS);
	
	A03_ShopDao pdao = new A03_ShopDao();
	ArrayList<Product3> plist = pdao.shopList(new Product3(name, frPrice, toPrice));
	
%>	
<!--
[중] 1. 2/10숙제의 상세화면에서 물건정보를 수정 처리하세요.
 -->
	<h3>물건리스트</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="name" value="<%=name %>"/></td></tr>
		<tr><th>물건가격</th>
			<td><input type="text" name="frPrice" value="<%=frPrice %>"/> ~
				<input type="text" name="toPrice" value="<%=toPrice %>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="제품등록" onclick="regProduct()"/></td></tr>
	</table>
	<table>
		<tr><th>제품번호</th>
			<th>물건명</th>
			<th>물건가격</th>
			<th>재고량</th>
			<th>최근입고일</th><tr>
		<%for(Product3 pro : plist) { %>
			<tr onclick="Detail(<%= pro.getPno()%>)">
				<td><%=pro.getPno() %></td>
				<td><%=pro.getName() %></td>
				<td><%=pro.getPrice() %></td>
				<td><%=pro.getCnt() %></td>
				<td><%=pro.getCredte() %></td></tr>
		<%} %>
	</table>
	</form>
	<script type="text/javascript">
		function regProduct(){
			location.href = "z01_insert.jsp";	
		}
		function Detail(pno) {
			location.href = "z02_detail.jsp?pno="+pno;
		}
	</script>
<%--  
[js]
[하] 1. 강제이벤트란 무엇인가? 개념을 설명하고, 기본예제로 기술하세요.
	- 이벤트가 발생하지 않더라도, 코드사 이벤트가 수행된 것과 동일한 효과를 처리하는 것
	- 실제 이벤트가 발생하지 않지만, 객체.on이벤트명();으로 js 코드로
		이벤트가 발생했을 때, 핸들러 함수를 수행하는 것을 말한다.
		h3Obj.onclick = function(){
			this.innerTest="*";
		}
		setInterval(function(){
			h3Obj.onclick(); // 강제 이벤트 발생 처리(1초마다)
			
		},1000);
--%>
	<button id=button-a>버튼A</button>
	<button id=button-b>버튼B</button>
	<div id="test">0</div>
	<script>
		var bntObjA = document.querySelector("#button-a");
		var bntObjB = document.querySelector("#button-b");
		var testObj = document.querySelector("#test");
		bntObjA.onclick = function() {
			console.log('버튼A호출됨');
			bntObjB.onclick();
		}
		bntObjB.onclick = function() {
			console.log('버튼B호출됨');
			testObj.innerHTML = Number(testObj.innerHTML)+1;
		}
		
	
	</script>
<%--	
[하] 2. 특정 페이지를 서버에 요청값으로 처리할 때, 유효성 처리 이벤트에 대해 기술하세요.
        1) 이벤트명
        	DAO객체.onsubmit = true;
        	DAO객체.onsubmit = false;
        2) 유효성 처리 방법
        	form객체를 onsubmit 이벤트와 연결하여 처리하고
        	유효성 검사를 할 객체의조건을 확인하여
        	만족하면 return값을 true, 만족하지 못하면 fasle를 반환하여 submit을 하지 않도록 구현한다.
        
        // 정답
        1) 이벤트명 : submit
        2) 유효성 처리 방법
        	선택한form객체.onsumnit=function(){
        		요청값으로 form하위에 있는 요소객체에 대한 유효성 check
        		해당 값이 유효성에 문제가 있을 때, return false 처리하여
        		전송하지 못하게 방지한다.
        	}
        
[하] 3. 키 이벤트를 이용하여  h3 7개를 아래 위로 키를 입력시
   이동되어 배경색상과 글자 색상이 변경되게 처리하세요.
--%>
	<h2 id="dis">현재 키 : </h2>
	<h3 class="ex3">1</h3>
	<h3 class="ex3">2</h3>
	<h3 class="ex3">3</h3>
	<h3 class="ex3">4</h3>
	<h3 class="ex3">5</h3>
	<h3 class="ex3">6</h3>
	<h3 class="ex3">7</h3>
	<script>
		window.onload = function() {
			var h3Objs = document.querySelectorAll(".ex3");
			var disObj = document.querySelector("#dis");
			var idx=-1;
			
			this.onkeyup = function() {
				disObj.innerHTML = '현재 키 : ' + event.keyCode;
				for(var i=0; i<h3Objs.length; i++)
					h3Objs[i].style.backgroundColor="";
				if(event.keyCode == 40) {
					idx++;
				} else if(event.keyCode == 38) {
					idx--;
				}
				if(idx<0) idx = 0;
				if(idx>6) idx = 6;
				h3Objs[idx].style.backgroundColor="yellow";
				h3Objs[idx].style.color="pink";
			}
		}	
	</script>
</body>
</html>
