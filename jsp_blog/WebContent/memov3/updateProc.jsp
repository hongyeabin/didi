<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>

<% 

	boolean flag = dao.update(dto);
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
<script type="text/javascript">
function mlist(){
	var url="list.jsp";
	url +="?col=<%=request.getParameter("col")%>";
	url +="&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}
</script>
<link href="../css/style.css" rel="stylesheet" />
</head> 
<body> 
<jsp:include page="/menu/top.jsp" />
<div>
<%
if(flag){
	out.print("수정 완료");
}else{
	out.print("수정 실패");
	
}
%>
<br>
<button type="button" onclick="mlist()">목록</button>
</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
