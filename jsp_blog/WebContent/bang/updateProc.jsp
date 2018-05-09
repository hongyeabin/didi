<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
  <jsp:useBean id="dao" class="bang.BangDAO"/>
 <%
 	request.setCharacterEncoding("utf-8");
 	String gbno = request.getParameter("gbno");
 	String content = request.getParameter("content2");
 	Map map = new HashMap();
 	map.put("gbno", gbno);
 	map.put("content", content);
 	
 	dao.update(map);	
 
 	response.sendRedirect("./list.jsp");
 %> 
 
