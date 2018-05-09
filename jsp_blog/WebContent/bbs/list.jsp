<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<%

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	
	if(col.equals("total")){word="";}
	
	//--------------------------------------------------------------
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	
	
	//--------------------------------------------------------------
	Map map = new HashMap();
	map.put("col",col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	List<BbsDTO> list = dao.list(map);
	
	
	int totalRecord = dao.total(map);
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
.search{
width : 80%;
margin : 2px auto;
text-align : center;
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>

<script type="text/javascript">
function bcreate(){
	var url = "./createForm.jsp"
	location.href=url;
	
}
function read(bbsno){
	var url = "./read.jsp"
	url += "?bbsno="+bbsno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>"
	
	location.href = url;
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
<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>MongchongE List</h2>

 <div class="search">
 <form action="./list.jsp" method = "post">
 <select name="col">
 	<option value="wname"
 	<%if(col.equals("wname")) out.print("selected"); %>
 	>이름</option>
 	<option value="title"
 	<%if(col.equals("title")) out.print("selected"); %>
 	>제목</option>
 	<option value="content"
 	<%if(col.equals("content")) out.print("selected"); %>
 	>내용</option>
 	<option value="total">전체출력</option>
 
 </select>
<input type="search" name = "word" value="<%=word %>" required>
<button>search</button>
<button type="button" onclick="location.href='./createForm.jsp'">regit</button>
</form>
 </div>
<br>
<TABLE class="table table-hover">
<thead>
    <TR>
      <TH>Number</TH>
      <th>Name</Th>
      <th>Title</th>
      <th>Date</th>
      <th>View</th>
      <th>file</th>

    </TR>
</thead>
    <%if(list.size()==0){ %>
    <tbody>
    <tr>
    <td colspan = "6"> No Title </td>
    </tr>
    </tbody>
   <%} else{ 
   for(int i=0;i<list.size();i++){
	   BbsDTO dto = list.get(i);
	   
   %>
   <tbody>
    <tr>
    <td><%=dto.getBbsno() %></td>
    <td><%=dto.getWname() %></td>
    <td>
    <% if(dto.getIndent()>0){
    	for(int r=0;r<dto.getIndent();r++){
    		out.print("&nbsp;&nbsp;");
    	}
    	%>
    <img src="../menu/images/re.png" height="50%">
    <%} %>
    <a href="javascript:read('<%=dto.getBbsno() %>')">   <%=dto.getTitle() %>   </a>

	<%
	if(Utility.compareDay(dto.getWdate())){%>
		<img src="../menu/images/new.gif">
	
	<%}%>
    </td>
    <td><%=dto.getWdate() %></td>
    <td><%=dto.getViewcnt() %></td>
    <td>
    <%if(dto.getFilename() == null){
   	  out.print(" "); }else{ %>
   	<a href="javascript:fileDown('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
   	<%} %>
	</td>
    </tr>
    </tbody>
    <%} }%>
</TABLE>
  
  <DIV class='bottom'>
    
    <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>

  </DIV>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 