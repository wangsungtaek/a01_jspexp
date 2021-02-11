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
<body>
<%
	String pname_ = request.getParameter("pname");
	if(pname_ == null || pname_.equals("")) pname_ = "";
	String price_ = request.getParameter("price");
	if(price_ == null || price_.equals("")) price_ = "0";
	String cnt_ = request.getParameter("cnt");
	if(cnt_ == null || cnt_.equals("")) cnt_ = "0";
	String regdate_ = request.getParameter("regdate");
	if(regdate_ == null || regdate_.equals("")) regdate_ = "";
	String mfg_ = request.getParameter("mfg");
	if(mfg_ == null || mfg_.equals("")) mfg_ = "";
	String wrhsdate_ = request.getParameter("wrhsdate");
	if(wrhsdate_ == null || wrhsdate_.equals("")) wrhsdate_ = "";
	String director_ = request.getParameter("director");
	if(director_ == null || director_.equals("")) director_ = "";
	
	if(pname_ != null && !pname_.equals("")) {
		A03_ProductDao pdao = new A03_ProductDao();
		pdao.insertProd(new Product2(pname_,
								 	 new Integer(price_),
								 	 new Integer(cnt_),
								 	 regdate_,
								 	 mfg_,
								 	 wrhsdate_,
								  	 director_));
	}
%>
<script type="text/javascript">
	var pname = "<%=pname_%>";
	if(pname != "") {
		alert("제품등록완료");
		if(confirm("조회페이지이동?")) location.href='a01_exp.jsp';
	}
</script>
	<h3>제품등록</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname"/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price"/></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt"/></td></tr>
		<tr><th>신규등록일</th><td><input type="date" name="regdate"/></td></tr>
		<tr><th>제조사</th><td><input type="text" name="mfg"/></td></tr>
		<tr><th>최근입고일</th><td><input type="date" name="wrhsdate"/></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="director"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="등록"/>
			<input type="button" value="이전페이지" onclick="location.href='a01_exp.jsp'"/></td></tr>
	</table>
	</form>
</body>
</html>