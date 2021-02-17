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
		var updateObj = document.querySelector("#update-btn");
		var deleteObj = document.querySelector("#delete-btn");
		updateObj.onclick = function() {
			document.querySelector("[name=proc]").value = "update";
			document.querySelector("form").submit();
		}
		deleteObj.onclick = function() {
			if(confirm("정말 삭제하시겠습니까?")){
				document.querySelector("[name=proc]").value = "delete";
				document.querySelector("form").submit();
			}
		}
		
	};
</script>
</head>
<body>
<%
	int pno = 0;
	int price = 0;
	int cnt = 0;
	//request
	String pnoS = request.getParameter("pno");
	String name = request.getParameter("name");
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	String company = request.getParameter("company");
	String inmanager = request.getParameter("inmanager");
	String credtes = request.getParameter("credtes");
	String incomedte = request.getParameter("incomedte");
	String proc = request.getParameter("proc");
	
	// 조건검사
	if(pnoS!=null && !pnoS.equals("")) pno = Integer.parseInt(pnoS);
	if(name==null) name="";
	if(priceS!=null && !priceS.equals("")) price = Integer.parseInt(priceS);
	if(cntS!=null && !cntS.equals("")) cnt = Integer.parseInt(cntS);
	if(company==null) company="";
	if(inmanager==null) inmanager="";
	if(credtes==null) credtes="";
	if(incomedte==null) incomedte="";
	if(proc==null) proc="";
	
	// db
	A03_ShopDao dao = new A03_ShopDao();
	if(proc != null && proc.equals("update"))
		dao.updateProd(new Product3(pno,name,price,cnt,credtes,company,incomedte,inmanager));
	if(proc != null && proc.equals("delete"))
		dao.delete(pno);
	
	Product3 pro = dao.getProd(pno);
%>
<script type="text/javascript">
	var proc = "<%=proc %>";
	if(proc == 'update')
		if(confirm("수정완료\n조회페이지로 이동하시겠습니까"))
			location.href='a01_exp.jsp';
	if(proc == 'delete') {
		alert('삭제완료');
		location.href='a01_exp.jsp';
	}
</script>

	<h3>상세화면</h3>
	<form method="post">
	<input type="hidden" name="proc" value=""/>
	<table>
		<% if(pro!=null) {%>
		
		<tr><th>물건번호</th><td><input type="text" name="pno" value="<%=pro.getPno()%>"/></td></tr>
		<tr><th>물건명</th><td><input type="text" name="name" value="<%=pro.getName()%>"/></td></tr>
		<tr><th>물건가격</th><td><input type="text" name="price" value="<%=pro.getPrice()%>"/></td></tr>
		<tr><th>물건재고량</th><td><input type="text" name="cnt" value="<%=pro.getCnt()%>"/></td></tr>
		<tr><th>제조사</th><td><input type="text" name="company" value="<%=pro.getCompany()%>"/></td></tr>
		<tr><th>입고책임자</th><td><input type="text" name="inmanager" value="<%=pro.getInmanager()%>"/></td></tr>
		<tr><th>신규입고일</th><td><input type="text" name="credtes" value="<%=pro.getCredte()%>"/></td></tr>
		<tr><th>최근입고일</th><td><input type="text" name="incomedte" value="<%=pro.getIncomedte()%>"/></td></tr>
		<%} else{ %>
			<tr><td colspan="2"> 데이터가 없습니다 </td>
		<%} %>
		<tr><td colspan="2">
			<input type="button" value="수정" id="update-btn"/>
			<input type="button" value="삭제" id="delete-btn"/>
			<input type="button" value="메인화면이동" 
				onclick="location.href='a01_exp.jsp'"/>
			</td></tr>
	</table>
	</form>
</body>
</html>
