<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%

UploadSave upload = new UploadSave(request , -1 , -1, tempDir2);
dto.setWname(UploadSave.encode(upload.getParameter("wname")));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));

String nowPage = upload.getParameter("nowPage");
String word = UploadSave.encode(upload.getParameter("word"));
String col = UploadSave.encode(upload.getParameter("col"));
String oldFile = UploadSave.encode(upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("filename");
int size = (int)fileItem.getSize();

String filename = null;
if(size>0){
	UploadSave.deleteFile(upDir2, oldFile);
	filename = UploadSave.saveFile(fileItem, upDir2);
}

dto.setFilesize(size);
dto.setFilename(filename);

	Map map = new HashMap();
	map.put("passwd",dto.getPasswd());
	map.put("bbsno",dto.getBbsno());
	boolean pflag= dao.passCheck(map);
	boolean flag = false;
	if(pflag){
		flag=dao.update(dto);
	}
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
	var url = "list.jsp";
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	location.href = url;
	
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> 수정확인 </DIV>

<div class="content">
<%
if(pflag==false){
	out.print("잘못된 비밀번호입니다.");
	out.print("<button type='button' onclick='history.back()'>돌아가기</button>");
}else if(flag){
	out.print("글 수정을 완료했습니다");
	
}else{
	
	out.print("글수정을 실패했습니다");
}

%>
</div>
  <DIV class='bottom'>
    <input type='button' value='list' onclick="blist()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 