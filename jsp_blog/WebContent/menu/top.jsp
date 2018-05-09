<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
<%
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");

%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title> 
<style type="text/css"> 
/*
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
*/
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style> 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">오목눈이's</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<%=root %>/index.jsp">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">내정보 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root %>/index.jsp">홈</a></li>
          <%if(id!=null){ %>
          <li><a href="<%=root %>/member/read.jsp">회원정보</a></li>
          <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>
          <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>
          <%} %>
        </ul>
      </li>
      <li><a href="<%=root %>/bang/list.jsp">방명록</a></li>
      <li><a href="<%=root %>/memov3/list.jsp">메모장</a></li>
      <li><a href="<%=root %>/bbs/list.jsp">게시판</a></li>
      <li><a href="https://namu.wiki/w"><span class="glyphicon glyphicon-search"></span></a></li>
      <li><a href="<%=root %>/bbs/list.jsp"><span class="glyphicon glyphicon-sunglasses"></span></a></li>
    </ul>
          <%if(id==null){ %>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<%=root %>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root %>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
    <%}else{%>
   <ul class="nav navbar-nav navbar-right">
      <li><a href="<%=root %>/member/read.jsp"><span class="glyphicon glyphicon-user"></span> My info</a></li>
      <li><a href="<%=root %>/member/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      <%if(id!=null && grade.equals("A")){ %>
      <li><a href="<%=root %>/admin/list.jsp"><span class="	glyphicon glyphicon-eye-open"></span> 계정관리</a></li>
   		<%} %>
    </ul>
	<%} %>
  </div>
</nav>
    
    
<!--     <ul id="menu"> -->
<%--      <li><a href="<%=root %>/index.jsp">홈</a></li>     --%>
<%--      <%if(id==null){ %> --%>
<%--      <li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>     --%>
<%--      <li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>   --%>
<%--      <%}else{ %>   --%>
<%--      <li><a href="<%=root %>/member/read.jsp">내정보</a></li>  --%>
<%--      <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>     --%>
<%--      <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>     --%>
<%--      <%} %>  --%>
<%--      <li><a href="<%=root %>/bbs/list.jsp">게시판</a></li> --%>
<%--      <li><a href="<%=root %>/memov3/list.jsp">메모</a></li> --%>
<%--      <li><a href="<%=root %>/bang/list.jsp">방명록</a></li> --%>
<!--     </ul> -->
    
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
</body> 
</html> 
