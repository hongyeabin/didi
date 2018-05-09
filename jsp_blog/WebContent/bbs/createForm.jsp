<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

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
function incheck(fo){
	if(fo.wname.value==""){
		alert("이름이 입력되지 않았습니다.")
		fo.wname.focus();
		return false;
	}
	if(fo.title.value==""){
		alert("제목이 입력되지 않았습니다.")
		fo.title.focus();
		return false;
	}
	if(fo.content.value==""){
		alert("내용이 입력되지 않았습니다.")
		fo.content.focus();
		return false;
	}
	if(fo.passwd.value==""){
		alert("비밀번호가 입력되지 않았습니다.")
		fo.passwd.focus();
		return false;
	}
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> Register </DIV>
 
<FORM	name='frm' method='POST' 
		onsubmit = "return incheck(this)"
		action='./createProc.jsp'
		enctype = 'multipart/form-data'>
  <TABLE>
    <TR>
      <TH>Name</TH>
      <TD><input type="text" name="wname"></TD>
    </TR>
    <TR>
      <TH>Title</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
    <TR>
      <TH>Content</TH>
      <TD><textarea rows="10" cols="45" name="content"></textarea></TD>
    </TR>
    <TR>
      <TH>Password</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>File</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>

    	
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='summit'>
    <input type='button' value='cancel' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 