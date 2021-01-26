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
	<form action="a01_exp.jsp" method="">
		<h2># 구매물건 목록 #</h2>
		<table>
			<tr><th>물건명</th><th>갯수</th><th>가격</th></tr>
			<tr><td><input type="text" name="name"/></td>
				<td><input type="number" name="price"/></td>
				<td><input type="number" name="cnt"/></td></tr>
			<tr><td><input type="text" name="name"/></td>
				<td><input type="number" name="price"/></td>
				<td><input type="number" name="cnt"/></td></tr>
			<tr><td><input type="text" name="name"/></td>
				<td><input type="number" name="price"/></td>
				<td><input type="number" name="cnt"/></td></tr>			
			<tr><th>구매방법</th>
				<td colspan="2"><select name="pay">
									<option>신용카드</option>
									<option>현금</option>
									<option>포인트</option>
								</select></td></tr>
			<tr><td colspan="3"><input type="submit" value="구매"/></td></tr>
		</table>
	</form>
</body>
</html>