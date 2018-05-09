<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="bang.BangDAO"/>
<%
request.setCharacterEncoding("utf-8");
String mname = request.getParameter("mname");
String content = request.getParameter("content");
Map map = new HashMap();
map.put("mname", mname);
map.put("content", content);

dao.create(map);

response.sendRedirect("./list.jsp");
%>