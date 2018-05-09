<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateID(id);

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
	opener.frm.id.value='<%=id%>';
	self.close();
	
	
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디 중복확인</DIV>
 
<div class = "content">
입력된 아이디 : <%=id %><br>
<% if(flag){
	out.print("중복된 아이디입니다! <br><br>");
}else{
	out.print("사용가능한 아이디 입니다. <br>");
	out.print("<button type='button' onclick='use()'>사용</button>");
}
	
	%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='./id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 