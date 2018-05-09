<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />

<% 
    int memono = Integer.parseInt(request.getParameter("memono"));


	MemoDTO dto = dao.read(memono);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
font-size: 19px;
}

</style>
<link href="../css/style.css" rel="stylesheet" />
<script type="text/javascript">
function incheck(){
	var f = document.frm;
	if(f.title.value==""){
		alert("제목입력하쇼");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용입력하쇼");
		f.title.focus();
		return false;
	}

	f.submit();
}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class = 'title'>
register

</div>
<form name='frm' action='updateProc.jsp' method='post'>
<input type="hidden" name=memono value="<%=dto.getMemono() %>">
<input type="hidden" name=col value="<%=request.getParameter("col") %>">
<input type="hidden" name=word value="<%=request.getParameter("word") %>">
<table>
<tr>
<th>title</th>
<td><input type="text" name="title" size="30" value='<%=dto.getTitle()%>'></td>
</tr>
<tr>
<th>content</th>
<td><textarea rows="11" cols="30" name='content'><%=dto.getContent()%></textarea></td>
</tr>
</table>




<div class='bottom'>
<button type="button" onclick="return incheck()">send</button>

</div>
</form>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>
</html>