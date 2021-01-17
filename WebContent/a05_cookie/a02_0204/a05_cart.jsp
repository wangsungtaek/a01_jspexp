<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="java.net.*"
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
ex) 장바구니 물건 담기 예제
1. 초기 장바구니 화면 구현
	1) form 하위 name="pname", name="cnt"
		장바구니담기 submit
	2) 받은 요청값 처리
		String name = request.getParameter("pname");
		String cnt = request.getParameter("cnt");
		if(name!=null) : 초기화면과 구분하처리.
	3) Cookie에 할당 클라이언트 전달.
		Cookie c = new Cookie(name, cnt)
		response.addCookie(c);
	4) 쿠키값 확인페이지 js로 처리.
		location.href='a05_cartList.jsp'
2. 쿠키값 확인페이지
	1) 현재 쿠키리스트
		Cookie[] cks = request.getCookies();
		for(Cookie c:cks) {
			c.getName()
			c.getValue()
		}
	2) 쿠키 삭제처리.
		<input type="checkbox" name="cks" value="<%=c.getName()%>">">
		submit() 클릭시, 체크된 쿠키의 name을 전달.
		String cks = request.getParameterValues("cks");
		for(Cookie c:cks) {
			for(String ck:cks){
				if(c.getName().equals(ck))
			}
		}
3. 쿠키값의 특징
	1) key, value값은 문자열로 1byte만 저장이 된다.
	2) 한글은 2byte문자열이므로 쿠키를 저장할 때, encoding하여 처리하고,
	3) 저장된 쿠키값을 가져올 때, decoding하여 처리한다.
 --%>
<%
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");
	String cnt = request.getParameter("cnt");
	if(pname!=null && cnt!=null){
		Cookie c = new Cookie(URLEncoder.encode(pname, "utf-8"),
												price+"^"+cnt);
		response.addCookie(c);
	}
%>
	<h3>장바구니</h3>
	<form method="post">
		<table>
			<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
			<tr><th>가격</th><td><input type="text" name="price"/></td></tr>
			<tr><th>갯수</th><td><input type="text" name="cnt"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="장바구니담기"/></td>
		</table>
	</form>
	<h4 align="center" onclick="location.href='z02_list.jsp'">장바구니 리스트 보기</h4>
</body>
</html>