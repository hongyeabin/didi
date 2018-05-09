<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<jsp:useBean id="dao" class="memo.MemoDAO"></jsp:useBean>
<% int memono = Integer.parseInt(request.getParameter("memono")); 

	boolean flag = dao.checkRef(memono);

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
<%
if(flag){%>
<div class="content">
답글이 있기 때문에 삭제할수없습니다.
</div>
<DIV class='bottom'>
   <input type='button' value='Back' onclick="blist()">
</DIV>

<% }else{ %>

<div class="title">
삭제 확인
</div>

<div class='content'>
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono %>">
<br>
삭제후 복구가 불가능합니다.<br>
삭제하시겠습니까?<br>
<br>

<button>삭제</button>
<button type="button" onclick="mlist()">목록</button>
</form>
</div>
<%}%>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
