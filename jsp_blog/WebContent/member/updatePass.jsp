<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	
	int pass = dao.checkPass(id);
	
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
function inCheck(f){
	if(f.oldpass.value==""){
		alert("비밀번호를 입력하세요");
		f.oldpass.focus();
		return false;
	}
	if(f.repass1.value==""){
		alert("비밀번호를 입력하세요");
		f.repass1.focus();
		return false;
	}
	if(f.repass1.value==""){
		alert("비밀번호를 입력하세요");
		f.repass2.focus();
		return false;
	}
	if(f.repass1.value!=f.repass2.value){
		alert("새 비밀번호와 확인비밀번호가 동일하지 않습니다. \n 다시입력하세요");
		f.repass2.focus();
		return false;
	}
	if(f.oldpass.value == f.repass1.value){
		alert("기존비밀번호입니다. \n 다시입력하세요");
		f.repass1.focus();
		return false;
	}

}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 변경</DIV>
 
<FORM name='frm' method='POST' action='./updatePassProc.jsp' onsubmit="return inCheck(this)">
<input type="hidden" name="id" value ="<%=id %>">
<input type="hidden" name="pass" value ="<%=pass %>">
  <TABLE>
    <TR>
      <TH>기존 패스워드</TH>
      <TD><input type="password" name="oldpass" size="17"></TD>
    </TR>
    <TR>
      <TH>새로운 패스워드</TH>
      <TD><input type="password" name="repass1" size="17"></TD>
    </TR>
    <TR>
      <TH>새로운 패스워드 확인</TH>
      <TD><input type="password" name="repass2" size="17"></TD>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 