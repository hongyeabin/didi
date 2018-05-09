<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
	int memono = Integer.parseInt(request.getParameter("memono"));

	dao.upViewcnt(memono);
	MemoDTO dto = dao.read(memono);
		
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
	
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
function mcreate(){
	var url = "memocreate.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function mlist(){
	var url = "list.jsp";
	url +="?col=<%=request.getParameter("col")%>";
	url +="&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function mupdate(memono){
	var url = "updateFrom.jsp";
	url += "?memono="+memono;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function mdelete(memono) {
	var url = "deleteForm.jsp";
	url += "?memono="+memono;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
function reply(memono){
	var url = "replyFrom.jsp";
	url += "?memono="+memono;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href = url;
	
}
</script>
<link href="../css/style.css" rel="stylesheet"/>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title"> 조회</div>
<table>
	<tr>
		<th> 제목 </th>
		<td><%=dto.getTitle() %></td>
		
	 </tr>
	 <tr>
	 	<th>내용</th>
	 	<td>
	 	<%=content %> 
	 	</td>
	 	</tr>
	 	<tr>
	 	<th>조회수</th>
	 	<td><%=dto.getViewcnt() %></td>
	 	</tr>
	 	<tr>
	 	<th>등록일</th>
	 	<td><%=dto.getWdate() %></td>
	 	</tr>
	 	
</table>
<div class="content">
	<button type="button" onclick="mcreate()">등록</button>
	<button type="button" onclick="mupdate('<%=memono%>')">수정</button>
	<button type="button" onclick="mdelete('<%=memono%>')">삭제</button>
	<button type="button" onclick="mlist()">목록</button>
	<button type="button" onclick="reply(<%=memono%>)">답글</button>

</div>
<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
