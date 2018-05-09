<%@ page contentType="text/html; charset=UTF-8" %> 
<%  request.setCharacterEncoding("utf-8"); 
	String id =(String)session.getAttribute("id");
	String grade =(String)session.getAttribute("grade");
	String title = "블로그!!!";
	if(id!=null && grade.equals("A")){
		title="관리자님 반갑습니다";
	}
	String str = null;
	if(id==null){
	str = "메인 페이지 입니다.";
	}else{
	str = "안녕하세요 "+id+"님!";
	}
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div{
text-align: center;
}
</style> 
<link href="css/style.css" rel="stylesheet">
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title"><%=title %></div>
 
<div class="content">
<h1><%=str %></h1>
<img src="images/main.jpg"  width="50%"><br><br>
 
<%if(id==null){ %>
 
<input type="button" value="로그인" 
onclick="location.href='member/loginForm.jsp'">
 
<%}else{ %>
 
<input type="button" value="로그아웃" 
onclick="location.href='member/logout.jsp'">
 
<%} %>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 