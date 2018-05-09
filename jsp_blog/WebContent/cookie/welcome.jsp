<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 <%
 Cookie[] cookies = request.getCookies();
 Cookie cookie = null;
 
 String sw = null;
 
 if(cookies != null){
	 for (int i = 0; i<cookies.length;i++){
		 cookie = cookies[i];
		 
		 if(cookie.getName().equals("sw")){
			 sw = cookie.getValue();
		 }
	 }
 }
 
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>접속환영</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<div class="content">
<%
if(sw!= null){
	out.println("재접속을 환영함"+"<br>");
}else{
	out.println("처음 왔네요"+"<br>");
	Cookie wcookie = null;
	wcookie = new Cookie("sw", "1"); 
	wcookie.setMaxAge(60);
	
	response.addCookie(wcookie);
}

%>
<br><br>
<A href='http://172.16.3.22:8000/jsp_blog/cookie/welcome.jsp'>server 접속</A>


</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 