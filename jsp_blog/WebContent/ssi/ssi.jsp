<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="member.*" %>
<%@ page import="bbs.*" %>
<%@ page import="memo.*" %>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="bang.*" %>
<%@ page import="utility.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>
<%    request.setCharacterEncoding("utf-8");
        String root = request.getContextPath();
        
        String tempDir = "/member/temp";
        String upDir = "/member/storage";
        String tempDir2 = "/bbs/temp";
        String upDir2 = "/bbs/storage";
        
        tempDir = application.getRealPath(tempDir);
        upDir = application.getRealPath(upDir);
        tempDir2 = application.getRealPath(tempDir2);
        upDir2 = application.getRealPath(upDir2);
%> 
 