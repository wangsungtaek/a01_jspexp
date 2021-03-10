<%@page import="jspexp.z01_vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
    import="springdi.z01_vo.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--


--%>
//
   $(document).ready(function(){
      $("input").focus(function(){
         $(this).val("");
         //alert($(this).attr("name"));
         if($(this).attr("name")=="tot"){
            var num01 = Number($("[name=num01]").val());
            var num02 = Number($("[name=num02]").val());
            $(this).val(num01*num02);
         }
      });
   });
</script>
</head>
<div class="jumbotron text-center">
   <h2>예제</h2>
</div>
<div class="container">
   <nav class="navbar navbar-expand-sm bg-light navbar-light">
      <input class="form-control mr-sm-2" type="text" 
         name="num01" value=""> X
      <input class="form-control mr-sm-2" type="text" 
         name="num02"  value=""> =
      <input class="form-control mr-sm-2" type="text" 
         name="tot"  value="">
   </nav>
<%
   ArrayList<Product> plist = new ArrayList<Product>();
   plist.add(new Product("사과",3000,0));
   plist.add(new Product("바나나",4500,0));
   plist.add(new Product("딸기",12000,0));
   request.setAttribute("plist",plist);
%>
   <table class="table table-hover">
   <thead>
      <tr class="table-success text-center">
           <th>물건명</th>
           <th>가격</th>
           <th>갯수</th>
      </tr>
   </thead>
   <tbody>
      <c:forEach var="pro" items="${plist}">
      <tr class="text-center">
         <td>${pro.pname}</td>
         <td>${pro.price}</td>
         <td><select id="${pro.pname}" class="form-control">
            <c:forEach var="cnt" begin="0" end="10">
               <option>${cnt}</option>
            </c:forEach>
         </select>
         </td>
      </tr>
      </c:forEach>
      <tr class="text-center">
         <th colspan="2">구매총액</th><td id="sum">0</td>
      </tr>
   </tbody>
   </table>    
</div>
</body>
</html>