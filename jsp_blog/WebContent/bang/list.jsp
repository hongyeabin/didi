<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bang.BangDAO"/>
<%
	int nowPage=1;
	int recordPerPage=7;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int sno = ((nowPage -1 )*recordPerPage)+1;
	int eno = nowPage * recordPerPage;
	String col = "";
	String word = "";
	int gbno = -1;
	if(request.getParameter("gbno")!=null){
	 gbno = Integer.parseInt(request.getParameter("gbno"));
	}
	Map map = new HashMap();
	map.put("sno",sno);
	map.put("eno", eno);	
	List<BangDTO> list= dao.list(map);
	
	int totalRecord = dao.total(map);
	String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
	
	String mname1 = (String)session.getAttribute("id");
	String mname2 = dao.getName(mname1);
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
function gupdate(gbno){
	var url = "./list.jsp"
	url +="?gbno="+gbno;
	location.href = url;
}
function bdelete(gbno){
        var msg = gbno+"번 방명록을 삭제하시겠습니까?";
        if (confirm(msg)!=0) {
        		var url = "./deleteProc.jsp"
        		url +="?gbno="+gbno;
        		location.href = url;
        } else {
    	var url = "./list.jsp"
    		location.href = url;
}

}
function Ccheck(f){
	if(f.mname.value==""){
		alert("이름를 입력하세요");
		f.id.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력하세요");
		f.id.focus();
		return false;
	}
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록</DIV>
 
<FORM name='frm' method='POST' action='./createProc.jsp' onsubmit="return Ccheck(this)">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" size='10' name="mname" value="<%=mname2 %>"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="3"  name = "content"></textarea></TD>
    </TR>

  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록하기'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
<FORM name='frm' action='./updateProc.jsp' method='POST'>
  <TABLE>
 <%if(list.size()==0){ %>
 <tr>
 <th>내용이없습니다.</th>
 </tr>
 <%}else{
	 for(int i =0;i<list.size();i++){
	 BangDTO dto = list.get(i);
	 %>

  	<tr>
  	      <TH rowspan="4"><img src='./storage/<%=dto.getFname() %>' height='70'></TH>
  	</tr>
    <TR>
      <Td ><%=dto.getGbno() %></Td>
      <Td><%=dto.getMname() %></Td>
      <td><%=dto.getBdate() %></td>
    </TR>
    <TR>
      <TD colspan="3">
    <%if(gbno==dto.getGbno()){ %>
    <textarea rows="3" name="content2"><%=dto.getContent() %>
    </textarea>
    <%}else{ %>
      <%	String content = dto.getContent();
  			content = content.replaceAll("\r\n", "<br>"); %>
		<%=content %>
		
		<%} %>
      </TD>
    </TR>
        <TR>
        <td colspan = "3">
    <%if(gbno==dto.getGbno()){ %>
    <input type="hidden" name ='gbno' value='<%=dto.getGbno() %>'>
           <button type='submit'>수정완료</button>
           <%}else{ %>
           <button type='button' onclick='gupdate(<%=dto.getGbno()%>)'>수정</button>
           <%} %>
           <button type='button' onclick='bdelete(<%=dto.getGbno()%>)'>삭제</button>
        </td>
    </TR>
 <%	}
}%>
  </TABLE>
  
  <DIV class='bottom'>
    	<%=paging %>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 