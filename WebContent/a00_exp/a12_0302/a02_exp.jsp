<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 
   href="${path}/a00_com/a00_com.css">
<style>

</style>
<script type="text/javascript" 
  src="${path}/a00_com/jquery-3.5.1.js"></script>
<script type="text/javascript">
<%--
 
 
--%>
//
   $(document).ready(function(){
      
   });
</script>
</head>
<body>
<%--
[하] 1. 이벤트의 기본 형식을 기술하세요
	1) $('선택자').이벤트명(function()처리할 내용})
	2) $('선택자').on("이벤트명",function(){})
--%>
<%--
[하] 2. 커져라, 작아져라 버튼을 통해서, 특정이미지의 크기를 상대적으로 점점 커지거나,
        작아지게 처리하세요.
--%>
	<input type="button" id="big" class="btn" value="커져라"/>
	<input type="button" id="small" class="btn" value="작아져"/><br>
	<img src="1.png" width="100" height="100">
	<h3>red</h3><span></span>
	<h3>orange</h3><span></span>
	<h3>yellow</h3><span></span>
	<h3>green</h3><span></span>
	<h3>blue</h3><span></span>
	<h3>navy</h3><span></span>
	<h3>purple</h3><span></span>
	<script>
		$('h3').on("click", function(){
			$(this).next().append("<h4 id="+$(this).text()+">RE:"+$(this).text()+"</h4>");
		});
		$("body").on('click','h4',function(){
			$(this).css("color",$(this).attr("id"));
		})
		$(".btn").on("click",function(){
			var width = Number($("img").attr("width"));
			var height = Number($("img").attr("height"));
			if($(this).val() == '커져라'){
				width+=10;
				height+=10;
			} else {
				width-=10;
				height-=10;
			}
			$("img").attr("width",width);
			$("img").attr("height",height);
		})
	</script>
<%--
[하] 3. checkbox의 checked 속성 처리 형식 2가지를 기술하세요.
--%>
<%--
[하] 4. h3로 무지개 색상이 나오고, 클릭시, 바로 밑에 h4로 해당 RE:색상형식으로 추가되어
        클릭시, 글자 색상이 변경되게 하세요.
--%>
	
</body>
</html>
