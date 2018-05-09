<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
<%
	String id = request.getParameter("id");

	if(id==null)
		id = (String)session.getAttribute("id");
	
	MemberDTO dto = dao.read(id);
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
function deleteF(){
	var url = "./deleteForm.jsp"
	url += "?id=<%=id%>";
	location.href = url;
}
function updateFile(){
	var url = "./updateFileForm.jsp";
	url+="?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}
function updatePass(){
	var url = "./updatePass.jsp";
	url+="?id=<%=id%>";
	location.href = url;
}
function mupdate(){
	var url = "./updateForm.jsp";
	url += "?id="+"<%=id%>";
	location.href = url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> 회원 정보 </DIV>
 
  <TABLE>
    <TR>
      <TD colspan="2">
		<center><img src="./storage/<%=dto.getFname()%>"></center>
      </TD>
    </TR>
    <TR>
      <TH>아이디</TH>
      <TD>
		<%=dto.getId() %>
      </TD>
    </TR>
    <TR>
      <TH>이름</TH>
      <TD>
      	<%=dto.getMname() %>
      </TD>
     </tr>
     <tr>
      <TH>전화번호</TH>
      <TD>
      	<%=dto.getTel() %>
      </TD>
     </tr>
     <tr>
      <TH>E-mail</TH>
      <TD>
      	<%=dto.getEmail() %>
      </TD>
     </tr>
     <tr>
      <TH>우편번호</TH>
      <TD>
      	<%=dto.getZipcode() %>
      </TD>
     </tr>
     <tr>
      <TH>주소</TH>
      <TD>
      	<%=dto.getAddress1() %><br>
      	<%=dto.getAddress2() %>
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <TD>
      	직업코드:<%=dto.getJob() %>
      	(<%=Utility.getCodeValue(dto.getJob()) %>)
      
      </TD>
    </TR>
     <tr>
      <TH>가입날짜</TH>
      <TD>
      	<%=dto.getMdate() %>
      </TD>
    </TR>


  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="mupdate()">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='패스워드변경' onclick="updatePass()">
    <input type='button' value='리스트' onclick="location.href='./list.jsp'">
    <input type="button" value='삭제' onclick="deleteF()">
    <input type='button' value='다운로드'  
           onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'">   
   </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 