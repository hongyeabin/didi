<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>
 <%
 	UploadSave upload = new UploadSave(request, -1 , -1, tempDir);
 	String id = upload.getParameter("id");
 	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
 	FileItem fileItem = upload.getFileItem("fname");
 	
 	int size = (int)fileItem.getSize();
 	String fname = null;
 	if(size>0){
 		
 		if(oldfile!=null && !oldfile.equals("member.jpg")){
 		UploadSave.deleteFile(upDir, oldfile);
 		}
 		fname = UploadSave.saveFile(fileItem, upDir);
 	}
 	Map map = new HashMap();
 	map.put("id", id);
 	map.put("fname", fname);
 	
 	boolean flag = dao.updateFile(map);
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
function read(){
	var url = "list.jsp";
	url += "?id=<%=id%>";
	location.href= url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> 사진변경 </DIV>
 
 <div class='content'>
 <%
 	if(flag){
 		out.print("사진변경 성공");
 	}else{
 		out.print("사진변경실패");
 	}
 %>
 
 </div>

  
  <DIV class='bottom'>
    <input type='button' value='정보보기' onclick="read()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 