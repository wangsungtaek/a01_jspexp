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
	window.onload=function(){
      
	};
</script>
</head>
        <!-- 물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
              제조사, 최근입고일, 입고책임자 -->
<%
	String pno_ = request.getParameter("pno");
	A03_ProductDao dao = new A03_ProductDao();
	Product2 prod = dao.getProduct(new Integer(pno_));
%>
<body>
	<h3>제품상세[<%=prod.getPno() %>]</h3>
	<table>
		<tr><th>제품번호</th><th>물건명</th>
			<th>물건가격</th><th>물건재고량</th>
			<th>신규등록일</th><th>제조사</th>
			<th>최근입고일</th><th>입고책임자</th></tr>
		<tr><td><%=prod.getPno() %></td><td><%=prod.getPname() %></td>
			<td><%=prod.getPrice() %></td><td><%=prod.getCnt() %></td>
			<td><%=prod.getRegdate() %></td><td><%=prod.getMfg() %></td>
			<td><%=prod.getWrhsdate() %></td><td><%=prod.getDirector() %></td></tr>
	</table>
</body>
</html>