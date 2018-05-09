<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bang.BangDAO"/>
<%
request.setCharacterEncoding("utf-8");
String gbno = request.getParameter("gbno");
dao.delete(gbno);


response.sendRedirect("./list.jsp");
%>