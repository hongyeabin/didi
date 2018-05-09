<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);

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
function use(){
	opener.frm.email.value='<%=email%>';
	self.close();
	
}

</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">E-mail 확인</DIV>
 
<div class="content">
입력된 E-mail : <%=email %><br>
<%if(flag){
	out.print("중복된 이메일은 사용할수 없습니다!<br><br>");
}else{
	out.print("사용할수 있는 이메일입니다.<br>");%>
<button type="button" onclick="use()">사용하기</button>
	
<%}		%>

</div>
  <DIV class='bottom'>
    <input type='submit' value='다시시도' onclick="location.href='./email_form.jsp'">
    <input type='button' value='취소' onclick="window.close()">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 