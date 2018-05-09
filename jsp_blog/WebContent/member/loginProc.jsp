<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
 
 <%
 	String id = request.getParameter("id");
 	String passwd = request.getParameter("passwd");
 	
 	Map map = new HashMap();
 	map.put("id", id);
 	map.put("passwd", passwd);
 	
 	boolean flag = dao.loginCheck(map);
 	String grade = null;
 	if(flag){
 		grade = dao.getGrade(id);
 		session.setAttribute("id",id);
 		session.setAttribute("grade", grade);
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
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function glist(){
	var url = "../index.jsp"
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">로그인 처리</DIV>
 
<div class="content">
<%
if(flag){
out.print("로그인이 되었습니다");

Cookie cookie = null; 

String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
   
if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
  cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
  cookie.setMaxAge(120);               // 2 분 유지 
  response.addCookie(cookie);          // 쿠키 기록 

  cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
  cookie.setMaxAge(120);               // 2 분 유지 
  response.addCookie(cookie);          // 쿠키 기록  
     
}else{ 
  cookie = new Cookie("c_id", "");     // 쿠키 삭제 
  cookie.setMaxAge(0); 
  response.addCookie(cookie); 
     
  cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
  cookie.setMaxAge(0); 
  response.addCookie(cookie); 
} 

}else{
out.print("아이디 혹은 비밀번호를 확인하여 주세요");
}
%>
</div>

  <DIV class='bottom'>
    <input type='button' value='홈으로' onclick='glist()'>
    <input type='button' value='돌아가기' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 