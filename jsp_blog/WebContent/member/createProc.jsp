<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<%
	UploadSave upload = (UploadSave)request.getAttribute("upload");
	
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setJob(upload.getParameter("job"));
	dto.setEmail(upload.getParameter("email"));
	dto.setTel(upload.getParameter("tel"));

	
	FileItem fileItem = upload.getFileItem("fname");
	String fname = "member.jpg";
	int size = (int)fileItem.getSize();
	
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	dto.setFname(fname);
	boolean flag = dao.create(dto);
	
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
function login(){
	var url = "./loginForm.jsp";
	location.href = url;
	
	
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원가입 처리</DIV>
 
<div class="content">
<%
	if(flag){
		out.print("회원가입을 했습니다<br>");
		out.print("<button type='button' onclick='login()'>로그인</button>");
	}else{
		out.print("실패하였습니다");
	}



%>

</div>
<div class="buttom">
<input type='button' value='홈' onclick="location.href='./list.jsp'">
</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 