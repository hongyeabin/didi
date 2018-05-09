<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/> 
<jsp:useBean id="dto" class="bbs.BbsDTO"/> 

<%
	UploadSave upload = new UploadSave(request , -1 , -1, tempDir2);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();

	String filename = null;
	if(size>0){
		filename = UploadSave.saveFile(fileItem, upDir2);
	}
	
	dto.setFilesize(size);
	dto.setFilename(filename);
	boolean flag= dao.create(dto);
	
	

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
	location.href = url;
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="content">
<%
	if(flag){
		out.print("Success!");
		
	}else{
		out.print("fail!");
	}

%>

</DIV>
 

  <DIV class='bottom'>

    <input type='button' value='List' onclick='blist()'>
  </DIV>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 