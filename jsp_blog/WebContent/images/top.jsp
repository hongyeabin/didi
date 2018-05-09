<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
<%
	String id = (String)session.getAttribute("id");

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 

ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
padding : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style> 
</head> 
<body> 
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img src="<%=root %>/menu/images/kong.jpg" width='60%' height='60%'>
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <ul id="menu">
     <li><a href="<%=root %>/index.jsp">홈</a></li>    
     <%if(id==null){ %>
     <li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>    
     <li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>  
     <%}else{ %>  
     <li><a href="<%=root %>/member/read.jsp">내정보</a></li> 
     <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>    
     <li><a href="<%=root %>/member/delete.jsp">회원탈퇴</a></li>    
     <%} %> 
     <li><a href="<%=root %>/bbs/list.jsp">게시판</a></li>
     <li><a href="<%=root %>/memov3/list.jsp">메모</a></li>
    </ul>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
</body> 
</html> 
