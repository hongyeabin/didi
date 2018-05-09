<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 

<meta http-equiv="Content-Type" content="text/html; charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
	font-family: gulim; 
	font-size: 20px; 
} 
#idcss{
	color: #ff0000;
	background-color : #ffff00;
	font-size : 50px;
	text-align: center;
	width : 35%;
	margin : 0 auto;
}


</style> 
<link href="./style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
	<DIV class='title'>게시판 version 2.0</DIV>
	
	<div class='content'>내용</div>

	<table class='table'>
	<tr>
	<th>번호</th>
	<th>제목</th>
	<th>내용</th>
	</tr>
	<tr>
	<td align='center'>1</td>
	<td align='center'>월요일</td>
	<td>첫눈</td>
	</tr>
	<TR>
      <TD align='center'>2</TD>
      <TD align='center'>화요일</TD>
      <TD>메모장 제작</TD>
    </TR>
	<tr>
	<td align='center'>3</td>
	<td align='center'>수요일</td>
	<td>메모장테스트</td>
	</tr>
	</table>
	<div class='content'>
	<a href='http://www.kma.go.kr'>기 상 청</a><br>
	
	</div>

	<div id = 'idcss'>
	<br>
	고유한 css적용
	<br><br>
	</div>
	<div class='bottom'>하단메뉴</div>
</body> 
</html> 
