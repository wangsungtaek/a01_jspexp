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
<!-- [하] 1. 데이터의 등록과 상세처리 프로세스의 순서에 대하여 기술하세요.
	1. 등록
		1) 화면 interface 구현
			등록 버튼을 통해서 등록페이지 이동
		2) 등록페이지 화면 구성
			등록할 항목
			form객체를 통해서 등록
			요청값 확인
		3) 데이터 처리
			sql작성
			DAO 공통
			기능 메서드 public void insertEmp(Emp e);
				1) 접근 con의 autoCommit(false)로 처리..
				2) 대화객체 .executeUpdate(sql)
				3) commit() 확정명령
				4) 자원해제
				5) 예외 처리. rollback()
		4) jsp
			1) 요청 처리 페이지 구현
			2) DAO객체 호출
			3) 요청값을 Emp에 할당처리
			4) Dao기능 메서드 호출 처리 완료
	2. 상세화면조회
		1) 상세화면 이동
			KEY단위로 요청값 전송 상세화면 이동
			DAO 1개 데이터 KEY 가져와서 화면에 출력..
				SELECT * FROM EMP2 where empno = @@@
			데이터 로딩된 내용 출력..
		2) 수정
			수정버튼 클릭, 변경할 데이터 요청값 전송
			요청값받기, 수정할 데이터 VO객체 할당.
			Dao 수정 처리 메서드 구현
			수정완료
		3) 삭제		
-->
<!-- 		
[하] 2. 부서 상세 정보를 처리하세요.
 -->
<%
	A02_DeptDao dao = new A02_DeptDao();
	ArrayList<Dept> deptList = dao.deptList();
%>
	<h3>Ex2) 부서정보</h3>
	<form method="post">
	<table>
		<tr><th>부서명</th></tr>
		<%for(Dept d : deptList) {%>
			<tr ondblclick="detail(<%=d.getDeptno()%>)">
			<td><%=d.getDname() %></td>
			</tr>
		<%} %>
	</table>
	<script type="text/javascript">
		function detail(deptno){
			location.href='z01_detail.jsp?deptno='+deptno;
		}
	</script>
	</form>

<!-- 
[중] 3. 쇼핑몰에서 관리자 현재 등록된 물건을 확인하고, 물건을 등록하고, 
      물건을 상세정보를 출력하는 웹화면을 구현하세요.
        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
              제조사, 최근입고일, 입고책임자
        조회화면 출력 : 제품번호, 물건명, 물건가격, 물건재고량, 
              최근입고일 조회조건(물건명, 물건가격 from,to) 
-->
<%
	String pname_ = request.getParameter("pname");
	String from_ = request.getParameter("priceFrom");
	String to_ = request.getParameter("priceTo");
	String pname = "";
	int from = 0;
	int to = 0;
	if(pname_ != null && !pname_.equals("")) pname = pname_;
	if(from_ != null && !from_.equals("")) from = Integer.parseInt(from_);
	if(to_ != null && !to_.equals("")) to = Integer.parseInt(to_);
	
	A03_ProductDao pdao = new A03_ProductDao();
	ArrayList<Product2> prods = pdao.produtList(pname, from, to);
%>
	<h3>물건정보</h3>
	<form method="post">
	<table>
		<tr><th>물건명</th><td><input type="text" name="pname" value="<%=pname %>"/></td></tr>
		<tr><th>물건가격</th>
			<td><input type="text" name="priceFrom" value="<%=from %>"/> ~
				<input type="text" name="priceTo" value="<%=to %>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" value="제품등록" onclick="location.href='z03_productIns.jsp'"/></td></tr>
	</table>
	<table>
		<tr><th>제품번호</th>
			<th>물건명</th>
			<th>물건가격</th>
			<th>재고량</th>
			<th>최근입고일</th><tr>
		<%for(Product2 prod : prods) { %>
			<tr ondblclick="prodDetail(<%= prod.getPno()%>)">
				<td><%=prod.getPno() %></td>
				<td><%=prod.getPname() %></td>
				<td><%=prod.getPrice() %></td>
				<td><%=prod.getCnt() %></td>
				<td><%=prod.getWrhsdate() %></td></tr>
		<%} %>
	</table>
	</form>
	<script type="text/javascript">
		function prodDetail(pno){
			location.href = "z03_productDetail.jsp?pno="+pno;	
		}
	</script>
</body>
</html>
