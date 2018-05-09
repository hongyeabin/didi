<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	dao.upViewcnt(bbsno); //조회수증가
	BbsDTO dto = dao.read(bbsno);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
function blist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href = url;
	
}
function bupdate(bbsno){
	var url = "./updateForm.jsp"
	url+= "?bbsno="+bbsno;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
	
}
function bdel(){
	var url = "./deleteForm.jsp"
	url+="?bbsno=<%=bbsno%>";
	url+="&oldfile=<%=dto.getFilename()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
	
}
function reply(bbsno){
	var url = "./replyForm.jsp";
	url += "?bbsno="+bbsno;
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
	location.href=url;
	
}
function fileDown(filename){
	var url = "<%=root%>/download";
	url += "?filename="+filename;
	url += "&dir=/bbs/storage"
	location.href = url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">Detail</DIV>
 

  <TABLE>
    <TR>
      <TH>Name</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>Title</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>Content</TH>
      <TD><%=content %></TD>
    </TR>
    <TR>
      <TH>View</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
    <TR>
    <th>file</th>
    <td>
    <%if(dto.getFilename() == null){
   	  out.print("파일없음"); }else{ %>
   	<a href="javascript:fileDown('<%=dto.getFilename() %>')"><%=dto.getFilesize() %></a>
   	<%} %>
   	</td>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>
  
    <input type='button' value='modify' onclick='bupdate("<%=dto.getBbsno() %>")'>
    <button value='delete' onclick='bdel()'> delete </button>
    <input type='button' value='List' onclick='blist()'>
    <button onclick="reply(<%=dto.getBbsno() %>)" type="button">reply</button>
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 