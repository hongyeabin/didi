<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<% int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.read(bbsno);
	

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
function incheck(){
	var fo = document.frm;
	if(fo.wname.value==""){
		alert("이름이 입력되지 않았습니다.")
		fo.wname.focus();
		return ;
	}
	if(fo.title.value==""){
		alert("제목이 입력되지 않았습니다.")
		fo.title.focus();
		return ;
	}
	if(fo.content.value==""){
		alert("내용이 입력되지 않았습니다.")
		fo.content.focus();
		return;
	}
	if(fo.passwd.value==""){
		alert("비밀번호가 입력되지 않았습니다.")
		fo.passwd.focus();
		return;
	}
	fo.submit();
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> Register </DIV>
<FORM	name='frm' method='POST' 		
		action='./updateProc.jsp'
		enctype = "multipart/form-data">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>">

  <TABLE>
    <TR>
      <TH>Name</TH>
      <TD><input type="text" name="wname" value="<%=dto.getWname()%>"></TD>
    </TR>
    <TR>
      <TH>Title</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    <TR>
      <TH>Content</TH>
      <TD><textarea rows="10" cols="45" name="content"><%=dto.getContent() %></textarea></TD>
    </TR>
    <TR>
      <TH>Password</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>File</TH>
      <TD><input type="file" name="filename"><%=Utility.checkNull(dto.getFilename()) %></TD>
    </TR>

    	
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='modify' onclick="incheck()">
    <input type='button' value='cancel' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 