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
	// body 하단에 있는 효과..
	var cnt = 1;
	window.onload=function(){
		makeTab(cnt);

	};
	function add(){
		cnt++;
		makeTab(cnt);
	}
	function del(){
		cnt--;
		makeTab(cnt);
	}
	function makeTab(cnt){
		var tabObj = document.querySelector("table");
		var show = "<table><tr><th>no</th><th>물건명</th><th>가격</th><th>갯수</th></tr>";
		for(var no=1; no<=cnt; no++){
			show+="<tr><td>"+no+"</td>";
			show+="<td><input name='name'/></td>";
			show+="<td><input name='price' size='3'/></td>";
			show+="<td><input name='cnt' size='2'/></td></tr>";
		}
		show+="<tr><th colspan='2'>구매방법</th><td colspan='2'>";
		show+="<label><input type='checkbox' name='pay' value='카드'/>카드</label>";
		show+="<label><input type='checkbox' name='pay' value='현금'/>현금</label>";
		show+="<label><input type='checkbox' name='pay' value='포인트'/>포인트</label>";
		show+="<tr><td colspan='4'><input type='submit' value='구매처리'/></td></tr>";
//		show+="<tr><td colspan='4'><input type='button' onclick='valid()' value='구매처리'/></td></tr>";
		show+="</table>";
		tabObj.innerHTML = show;
	}
	function valid(){
		var nameObj = document.querySelectorAll("name");
		var priceObj = document.querySelectorAll("price");
		
		// 문자형 입력 항목
		for(var idx=0;idx<=nameObj.length;idx++){
			if(nameObj[idx].value==''){
				alert('데이터를 입력해주세요');
				nameObj[idx].focus();
				return;
			}
		}
		// 숫자형 입력 항목
		for(var idx=0;idx<=priceObj.length;idx++){
			if(priceObj[idx].value==''){
				alert('데이터를 입력해주세요');
				priceObj[idx].focus();
				return;
			} else {
				if(isNaN(priceObj[idx].value){
					alert('가격은 숫자를 입력해주세요.');
					priceObj[idx].focus();
					return;	
			}
		}
	}
	
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
	<h3>구매물건</h3>
	<input type="button" onclick="add()" value="구매추가"/>
	<input type="button" onclick="del()" value="삭제"/>
	<br>
	<form action="a02_exp.jsp" method="post">
		<table></table>
	</form>
</body>
</html>