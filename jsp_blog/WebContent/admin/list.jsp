<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
	//검색
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")) word="";
	//페이지
	int nowPage=1;
	int recordPerPage=3;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
	}
	//순번
	int sno = ((nowPage -1 )*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	//dao메소드 호출
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno",sno);
	map.put("eno", eno);	
	List<MemberDTO> list= dao.list(map);
	
	//페이징
	int totalRecord = dao.total(map);
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function read(id){
	var url = "<%=root%>/member/read.jsp";
	url +="?id="+id;
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<div class="content">
<form method = "post" action="./list.jsp">
<select name='col'>
	<option value="mname"
		<%if(col.equals("mname")) out.print("selected"); %>
		>성명</option>
	<option value="id"
		<%if(col.equals("id")) out.print("selected"); %>
		>아이디</option>
	<option value="email"
		<%if(col.equals("email")) out.print("selected"); %>
		>이메일</option>
	<option value="total">전체출력</option>

</select>
<input type="search" name="word" required value="<%=word%>">
<button>검색</button>
<button type="button" onclick="location.href='<%=root%>/member/createForm.jsp'">회원등록</button>
</form>

</div>

<div class="container-fluid">
<h2><span class="glyphicon glyphicon-th-list"></span>회원 List!!!</h2>
 <% for(int i=0; i<list.size();i++){ 
 	MemberDTO dto = list.get(i);
 %>
 <table class="table table-hover">
 <tr>
 	<td rowspan='5' width="30%">
 	<img src='<%=root%>/member/storage/<%=dto.getFname() %>'
 	width='190px' height='200px'></td>
 	<th width="20%">아이디</th>
 	<td width="50%"><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId() %></a></td>
 </tr>
 <tr>
 	<th>성명</th>
 	<td><%=dto.getMname() %></td>
 </tr>
 <tr>
 	<th>전화번호</th>
 	<td><%=dto.getTel() %></td>
 </tr>
 <tr>
 	<th>e-mail</th>
 	<td><%=dto.getEmail() %></td>
 </tr>
 <tr>
 	<th>주소</th>
 	<td>
 	<%=Utility.checkNull(dto.getAddress1()) %><br>
 	<%=Utility.checkNull(dto.getAddress2()) %>
 	</td>

 </tr>
 </table>
 
 <%} %>

  
  <DIV class='bottom'>
  	<%=paging %>
    <input type='button' value='나무위키' onclick="location.href='https://namu.wiki/'">
  </DIV>

 </div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 