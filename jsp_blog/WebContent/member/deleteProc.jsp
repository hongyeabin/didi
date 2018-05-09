<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	String fname = request.getParameter("fname");
	
	Map map = new HashMap();
	map.put("id", id);
	map.put("fname", fname);
	
	boolean flag = dao.delete(id);
	
	
	if(flag){
		if(fname!=null && !fname.equals("member.jpg"))
		UploadSave.deleteFile(upDir, fname);
		session.invalidate();
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
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 

<div class="content">
<%
if(flag){
	out.print("안녕히 가십시오");
}else{
	out.print("탈퇴 실패!");
}

%>
</div>
  
  <DIV class='bottom'>
    <input type='button' value='리스트' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
	
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 