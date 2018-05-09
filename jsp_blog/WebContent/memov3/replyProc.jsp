<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%

	Map map = new HashMap();
	map.put("grpno" , dto.getGrpno());
	map.put("ansnum" , dto.getAnsnum());
	
	dao.upAnsnum(map);
	boolean flag = dao.createReply(dto);

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
	var url = "list.jsp"
	location.href = url;
	
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">확인</DIV>


<div class="content">
<%
	if(flag){
		out.print("메모등록 성공");
		
	}else {
		out.print("메모등록 실패");
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