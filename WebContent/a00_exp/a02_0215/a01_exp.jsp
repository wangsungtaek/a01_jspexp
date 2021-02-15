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
[JSP]
[하] 1. PreparedStatement를 사용하는 이유를 기술하세요.
	1) sql injection을 막기위해 사용된다.
	2) db서버의 sql해석 속도를 향상시켜 빠른 처리를 한다.
[하] 2. 부서정보조회를 위 PreparedStatement를 활용하여 처리하세요.
	public Dept getDept2(int deptno) {
		Dept d=null;
		try {
			setCon();
			String sql = "select * from dept10 where deptno= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				d = new Dept(rs.getInt(1),
							 rs.getString(2),
							 rs.getString(3));
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return d;
	}	
--%>

<%--  
[js]
[하] 1. 이벤트, 이벤트대상객체, 이벤트 핸들러 함수를 구분하여 예제를 통하여 개념을 정리하세요.
[중] 2. 물건명 :[    ] 가격:[    ] 갯수 [0](버튼)
         @@@를 @@@원에 @@개 구매하여 @@@원입니다.
        버튼을 클릭할 때 마다, 카운트가 업되고, 하단의 출력내용을 변경하게 처리하세요
        단) 대상객체.이벤트 = 핸들러함수 형식으로 처리하세요.
--%>
	<h3>물건구매</h3>
	<table>
		<tr><th>물건명</th>
			<td><input type="text" name="pname"/></td>
			<th>가격</th>
			<td><input type="text" name="price"/></td>
			<th>갯수</th>
			<td><input type="text" name="cnt"/></td>
			<td><button id="calc">버튼</button></tr>
		<tr><td colspan="7">
			<h3 id="show"></h3></td>
	</table>
	
	<script type="text/javascript">
		var show = document.getElementById('show');
		var calc = document.getElementById('calc');
		
		calc.onclick = function() {
			var pname = document.querySelector('[name=pname]');			
			var price = document.querySelector('[name=price]');			
			var cnt = document.querySelector('[name=cnt]');		
			
			show.innerHTML = pname.value + "를 " + 
							 price.value + "원에 " +
							 cnt.value + "개 구매하여 " +
							 Number(price.value) * Number(cnt.value) +
							 "원입니다.";
		}
	
	</script>
</body>
</html>