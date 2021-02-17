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

</head>
<body>
<%--        
[JSP]
[하] 1. 웹화면에서 데이터를 삭제할 때, 진행되는 순서를 간단하게 기술하세요.
	1) 삭제버튼과 onclick 이벤트와 연결
	2) onclick이벤트에서 input = proc 값 변경 및 form객체 submit
		예) document.querySelector("#proc").value = 'delete';
			document.querySelector('#myForm).submit();
	3) input proc의 값이 delete값이 입력되면 데이터베이스에 접속해서 delete문 실행할 수 있도록 조건문 작성
		예) if(proc=="delete") {
				dao.deleteProduct(pno);
			}
	4) js에서 proc 값을 받아 delete 값이 들어오면 메인페이지로 이동
		예) if(proc == 'delete') {
				location.href='메인사이트주소";
			}
--%>
<%--			
[하] 2. 물건객체에서 삭제처리하는 프로세스에 의해 삭제 처리하세요
--%>
<%--
[하] 3. useBean에서 property와 필드를 구분하여 기술하세요.
	1) 필드
		- VO객체의 속성을 의미한다.
	2) property
		- VO객체의 속성을 설정하거나 읽어오는 getter, setter의의미
		- 자바빈에 저장/호출 되는 값을 표현하는 것을 말한다.
		- 일반적으로 메서드 이름을 사용해서 프로퍼티 이름을 결정한다.
 --%>
<%-- 
[하] 4. 아이디, 패스워드, 이름, 포인트, 권한이 있는 Member Vo객체를 만들고,
        회원등록페이지와 useBean을 이용해서, 등록버튼 클릭시 등록 회원을
        확인할 수 있게 처리하세요.
--%>
	<h3>회원등록</h3>
	<form method="post" action="z01_revMember.jsp">
		<table>
			<tr><th>아이디</th><td><input type="text" name="id"/></td></tr>
			<tr><th>패스워드</th><td><input type="text" name="pw"/></td></tr>
			<tr><th>이름</th><td><input type="text" name="name"/></td></tr>
			<tr><th>포인트</th><td><input type="text" name="point"/></td></tr>
			<tr><th>권한</th><td><input type="text" name="auth"/></td></tr>
			<tr><td colspan="2">
				<input type="submit" value="회원등록"/></td></tr>
		</table>
	</form>
<%--  
[js]
[하] 1. 윈도우창 로딩시, 매개변수에 따른 기본 옵션을 기술하세요.
	var win01 = window.open("url","이름","option")
		1) option
			- width: 넓이, height: 높이
--%>
	
<%--
[하] 2. 윈도창이 왼쪽 상단에 로딩되어, 오른쪽으로 하단으로 다시 왼쪽으로
        위로 이동하여 멈추게 처리하세요.(자동으로 이동)
--%>
	<h3>윈도우창 이동</h3>
	<input type="button" onclick="moveWin()" value="윈도우창 이동하기"/>
<script type="text/javascript">
	function moveWin(){
		var win = window.open('','','width=300, height=300');
		win.document.write("<h3>움직이는 윈도우</h3>");
		win.moveTo(0,0);
		var widthArry = [1680, -1680];
		var heightArry = [1050, -1050];
		var cnt = 0;
		var time = setInterval(function(){
			win.moveBy(widthArry[cnt], heightArry[cnt]);
			console.log(widthArry[cnt], heightArry[cnt]);
			cnt++;
			if(cnt >= 2) clearInterval(time);
		},2000);
	}
</script>
</body>
</html>
