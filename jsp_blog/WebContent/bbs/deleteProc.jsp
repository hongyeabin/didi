<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");

	
	Map map = new HashMap();
	map.put("bbsno", bbsno);
	map.put("passwd",passwd);
	
	boolean pflag = dao.passCheck(map);
	boolean flag = false;
	if(pflag){
		flag = dao.delete(bbsno);
	}
	if(flag)UploadSave.deleteFile(upDir2, oldfile);

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
	var url = "./list.jsp"
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> 삭제 확인 </DIV>

<div class="content">
<%
if(pflag==false){
	out.print("비밀번호가 잘못되었습니다.");
	out.print("<button type='button' onclick='history.back()'>다시시도</button>");
	
}else if(flag){
	out.print("글을 삭제했습니다");
	
}else{
	out.print("글 삭제를 실패하였습니다.");
}

%>
</div>

  <DIV class='bottom'>

    <input type='button' value='List' onclick="blist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 