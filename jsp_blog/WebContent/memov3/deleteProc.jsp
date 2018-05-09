<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<% 	int memono = Integer.parseInt(request.getParameter("memono"));
	
	MemoDAO dao = new MemoDAO();
	boolean flag= dao.delete(memono);
	
	
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
	var url = "list.jsp";
	location.href=url;
	
}
</script>
<link href="../css/style.css" rel="stylesheet"/>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class="content">
<% 
if(flag){
	out.print("메모를 삭제했습니다.");}

	else{
	out.print("메모삭제를 실패하였습니다.");
}
%>
<br>
<button type="button" onclick="mlist()">목록으로</button>
</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
