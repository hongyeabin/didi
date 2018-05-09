<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<%
Cookie[] cookies = request.getCookies();
Cookie cookie = null;

String name = null;
int kuk = 0;
int eng = 0;
for (int i = 0; i <cookies.length; i++){
	cookie = cookies[i];
	if(cookie.getName().equals("name")){
	name = cookie.getValue();
	}
	else if(cookie.getName().equals("kuk")){
		kuk = Integer.parseInt(cookie.getValue());
	}else if(cookie.getName().equals("eng")){
		eng=Integer.parseInt(cookie.getValue());
	}
	
}



%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>쿠키읽기</title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
<%
if (name!=null){
	out.println("성명 - "+name+"<br>");
	out.println("국어 - "+kuk+"<br>");
	out.println("영어 - "+eng+"<br>");
	out.println("총점 - "+(kuk+eng)+"<br>");
	out.println("평균 - "+(kuk+eng)/2+"<br>");
	out.println("30초후 쿠키삭제 - "+"<br>");
}else{
	out.println("쿠키를 읽을수없습니다."+"<br>");
	
}%>

 </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 