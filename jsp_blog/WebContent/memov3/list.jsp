<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<%
	
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total"))word="";
	
	int nowPage =1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null)
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	int sno = ((nowPage-1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno",eno);
	
	List<MemoDTO> list = dao.list(map);
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
text-align:center;
margin : auto;
}

</style>

<script type="text/javascript">
function read(memono) {
	//alert(memono);
	var url = "read.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>"
	url += "&word=<%=word%>"
	location.href=url;
}
</script>
<!-- <link href="../css/style.css" rel="stylesheet"> -->
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">메    모    목    록</div>
<div class="search">
<form action="./list.jsp" method="post">
<select name="col">
	<option value="title"
	<%if(col.equals("title")) out.print("selected"); %>
	>제목</option>
	<option value="content"
	<%if(col.equals("content")) out.print("selected"); %>
	>내용</option>
	<option value="total">전체</option>
	
</select>
<input type="search" name="word" value="<%=word %>" required>
<button>검색</button>
<button type="button" onclick="location.href='memocreate.jsp'">등록</button>

</form>
</div>
<br>
<div class="container-fluid">
	<h2><span class="glyphicon glyphicon-th-list"></span>Memo list</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>   번        호   </th>
				<th>   제        목   </th>
				<th>   날        짜   </th>
				<th>   조   회   수   </th>
				<th>	grpno	 </th>
				<th> 	indent	</th>
				<th>	ansnum	</th>
			</tr>
		</thead>
		<%if(list.size()==0){ %>
		<tbody>
			<tr>
				<td colspan="7">등록된 메모가 없습니다.</td>
			</tr>
		</tbody>
		<%} else {
			for(int i=0;i<list.size();i++){
				MemoDTO dto = list.get(i);
		
			%>
		<tbody>
			<tr>
				<td><%=dto.getMemono() %></td>
				<td>
				<%for(int a=0; a<dto.getIndent(); a++){ 
				out.print("&nbsp;");%>
				<img src="../menu/images/re.jpg" height="10%">
			
				<%} %>
			<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a>
			
		<%
		if(Utility.compareDay(dto.getWdate())){
		%>
		<img src="../menu/images/new.gif">
		<%} %>
		</td>
		<td><%=dto.getWdate() %></td>
		<td><%=dto.getViewcnt() %></td>
		<td><%=dto.getGrpno() %></td>
		<td><%=dto.getIndent() %></td>
		<td><%=dto.getAnsnum() %></td>
		</tr>
		</tbody>
		<%} }%>

	</table>


	<div class="bottom">
		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
	</div>
</div>

<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body> 
</html> 
