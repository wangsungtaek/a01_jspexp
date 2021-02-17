<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.A01_Dao"
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
		var uptBtn = document.querySelector("#uptBtn");
		uptBtn.onclick = function(){
			document.querySelector("[name=proc]").value="upt";
			document.querySelector("form").submit();
			
		}
		var delBtn = document.querySelector("#delBtn");
		delBtn.onclick = function(){
			if(confirm("삭제하시겠습니까?")){
				document.querySelector("[name=proc]").value="del";
				document.querySelector("form").submit();	
			}
		}
	};
</script>
</head>
<%--
# 수정 처리
1. 수정화면처리
	1) 수정 버튼 클릭시, 요청값을 proc 속성에 속성값 upt로 처리하고 요청값 전송.
	2) proc=upt와 함께 수정할 데이터 입력 받아 출력 처리한다.
2. DAO 처리
	1) 수정할 sql 확인
	2) 기능 메서드 public void uptEmp(Emp upt)
3. jsp 화면 처리
	1) 넘겨온 요청값을 기능 메서드의 매개변수로 넘기기 위해 객체 처리
	2) dao에 선언할 메서드로 처리.
4. js
	수정 처리 완료, 수정된 내용 조회/메인화면 이동 처리.

# 삭제 처리
1. 삭제화면처리
	1) 삭제 버튼 클릭시, 요청값을 proc 속성에 속성값 del로 처리하고 요청값 전송
	2) proc=del와 함께 수정할 데이터 입력 받아 출력 처리한다.
2. DAO 처리
	1) 삭제할 sql 확인
	2) 기능 메서드 public void delEmp(int empno) 구현.
3. jsp 화면 처리
	1) 넘겨온 요청값을 기능 메서드의 매개변수로 넘기기 위한 객체 처리
	2) dao에 선언할 메서드로 처리.
4. js
	삭제 처리 완료, 메인화면 이동 처리.


 --%>
<%
	int empno = 0;
	String empnoS = request.getParameter("empno");
	String proc = request.getParameter("proc");
	String ename = request.getParameter("ename");
	String job = request.getParameter("job");
	String mgr = request.getParameter("mgr");
	String hiredate_s = request.getParameter("hiredate_s");
	String sal = request.getParameter("sal");
	String comm = request.getParameter("comm");
	String deptno = request.getParameter("deptno");
	
	if(empnoS != null && !empnoS.equals("")) empno = Integer.parseInt(empnoS);
	
	A01_Dao dao = new A01_Dao();
	
	if(proc!=null) {
		if(proc.equals("upt")){
			Emp upt = new Emp(empno, ename, job,
							  Integer.parseInt(mgr), hiredate_s,
							  Double.parseDouble(sal),
							  Double.parseDouble(comm),
							  Integer.parseInt(deptno));
			dao.updateEmp(upt);
		}
		if(proc.equals("del")){
			dao.deleteEmp(empno);
		}
	}
	
	
	// 1개의 단위 객체 : 전체 list 화면에서 key인 empno를 요청값으로 호출해서
	// 상세내용을 가져올 때, 사용된다.
	Emp emp = dao.getEmp(empno);
%>
<script type="text/javascript">
	var proc="<%=proc%>";
	if(proc=="upt"){
		if(confirm("수정성공\n메인화면 이동하시겠습니까?"))
			location.href='a03_searchEmpList.jsp';
	}
	if(proc=="del"){
		alert("삭제 성공");
		location.href='a03_searchEmpList.jsp';
	}
</script>
<body>
	<h3>사원상세정보[<%=empno %>]</h3>
	<%if(emp != null) { %>
	<form method="post">
		<input type="hidden" name="proc" value=""/>
	<table>
		<tr><th>사원번호</th><td><input type="text" name="empno" value="<%=emp.getEmpno()%>"/></td></tr>
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=emp.getEname()%>"/></td></tr>
		<tr><th>직책</th><td><input type="text" name="job" value="<%=emp.getJob()%>"/></td></tr>
		<tr><th>관리자번호</th><td><input type="text" name="mgr" value="<%=emp.getMgr()%>"/></td></tr>
		<tr><th>입사일</th><td><input type="text" name="hiredate_s" value="<%=emp.getHiredate()%>"/></td></tr>
		<tr><th>급여</th><td><input type="text" name="sal" value="<%=emp.getSal()%>"/></td></tr>
		<tr><th>보너스</th><td><input type="text" name="comm" value="<%=emp.getComm()%>"/></td></tr>
		<tr><th>부서번호</th><td><input type="text" name="deptno" value="<%=emp.getDeptno()%>"/></td></tr>
		<tr><td colspan="2">
			<input type="button" value="수정" id="uptBtn">
			<input type="button" value="삭제" id="delBtn">
			<input type="button" value="메인페이지이동"
				onclick="location.href='a03_searchEmpList.jsp'">
			</td></tr>
	</table>
	</form>
	<%} %>
</body>
</html>