<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--
# 요청값을 테이블 자동 생성..
--%>
<body>
	<form>
		열의 갯수:<input type="text" name="col"/><br>
		행의 갯수:<input type="text" name="row"/><br>
		 <input type="submit" value="테이블 생성!!">
	</form>
	<%
	String cols = request.getParameter("col");
	String rows = request.getParameter("row");
	int col=1, row=1; // 
	if(cols!=null) col = Integer.parseInt(cols);
	if(rows!=null) row = Integer.parseInt(rows);
	int cnt=1;
	%>
	<table width="300" height="300" border>
		<%for(int rCnt=1;rCnt<=row;rCnt++){ %>
			<tr>
				<%for(int cCnt=1;cCnt<=col;cCnt++){ %>
					<td><%=cnt++ %></td>
				<%}%>
			</tr>
		<%}%>
	</table>
	
	
</body>
</html>