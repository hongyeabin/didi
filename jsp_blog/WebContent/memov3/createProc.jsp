<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO"  />
<jsp:setProperty name="dto"  property="title"/>  
<%


//content = content.replaceAll("\r\n", "<br>");



boolean flag = dao.create(dto);
%>
<%



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
font-family: serif;
font-size: 24px;
text-align: center;
}

</style>
</head>
<body>

<div>
<% 
if(flag){
	out.print("등록 성공!");
}else{
	out.print("등록 실패!");
	
}

%><br>
<button type='button' onclick='location.href="./memocreate.jsp"'> 계속 등록하기 </button>
<button type='button' onclick='location.href="./list.jsp"'> 목록 </button>

</div>

</body>
</html>