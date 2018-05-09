<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
</style>
<script type="text/javascript">
function incheck(f){
	if(f.title.value==""){
		alert("제목입력하쇼");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용입력하쇼");
		f.title.focus();
		return false;
	}

	
}
</script>
<!-- <link href="../css/style.css" rel="stylesheet"/> -->
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>
<div class="container-fluid">
	<h2><span class="glyphicon glyphicon-pencil"></span>Memo Register</h2>

<form action='createProc.jsp' method='post' onsubmit="return incheck(this)">
<table class="table table-hover">
<tr>
<th>title</th>
<td><input type="text" name="title" size="30"></td>
</tr>
<tr>
<th>content</th>
<td><textarea rows="11" cols="30" name='content'></textarea></td>
</tr>
</table>




<div class='bottom'>
<button style="font-size: 30px">send</button>

</div>
</form>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>