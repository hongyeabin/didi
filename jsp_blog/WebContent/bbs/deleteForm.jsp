<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<% 

int bbsno = Integer.parseInt(request.getParameter("bbsno")); 
boolean flag = dao.checkRefnum(bbsno);

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
function blist(){
	var url = "list.jsp";
	location.href = url;
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<%if(flag) {%>
<div class="content">
답글이 있기 때문에 삭제할수없습니다.
</div>
  <DIV class='bottom'>
   <input type='button' value='Back' onclick="blist()">
  </DIV>
 <%}else{ %>
<DIV class="title">Password</DIV>
 
<FORM name='frm' method='POST' action='deleteProc.jsp'>
<input type="hidden" name="bbsno" value="<%=bbsno%>"/>
<input type="hidden" name="word" value="<%=request.getParameter("word")%>"/>
<input type="hidden" name="col" value="<%=request.getParameter("col")%>"/>
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"/>
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>"/>
  <TABLE>
    <TR>
      <TH>Password</TH>
      <TD><input type="password" name="passwd" placeholder="password" required></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='Delete'>
    <input type='button' value='List' onclick="blist()">
  </DIV>
</FORM>
 <%} %>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 