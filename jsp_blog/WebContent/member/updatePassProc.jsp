<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String oldpass = request.getParameter("oldpass");
	String repass = request.getParameter("repass1");
	Map map = new HashMap();
	
	map.put("pass",	repass);
	map.put("id", id);
	
	boolean flag = false;
	if(pass.equals(oldpass)){
		flag = dao.passUpdate(map);
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
	var url = "./list.jsp"
	location.href = url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경</DIV>
 
 <%	if(pass.equals(oldpass)){ 
 
 		if(flag){%>
 
	<div class='content'>
	변경되었습니다.
	</div>
  	<%}else{%>
  	<div class='content'>
	변경에 실패하였습니다
	</div>
	<%} %>
  	<DIV class='bottom'>
    <input type='button' value='완료' onclick="glist()">
  	</DIV>
  
 <%}else{ %>
 <div class="content">
 비밀번호가 옳지 않습니다.
 </div><br>
  <DIV class='bottom'>
    <input type='button' value='돌아기기' onclick="glist()">
  </DIV>
 <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 