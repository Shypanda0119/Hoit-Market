<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId = (String)session.getAttribute("userId");
		}
		String realFolder="";
		String saveFolder = "marketimg";
		String encType = "utf-8";
		String map="";
		int maxSize=5*1024*1024;
		
		ServletContext context = this.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
		String fileName = multi.getFilesystemName("fileName");
		String bbsTitle = multi.getParameter("bbsTitle");
		String bbsContent = multi.getParameter("bbsContent");
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
		if (userId == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userId, bbs.getBbsContent());
				if (result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
						script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(bbsDAO.loadBbsId(userId))+"사진.jpg");
						oldFile.renameTo(newFile);
					}
					script.println("<script>");
					script.println("location.href = 'market.jsp'");
					script.println("</script>");
					out.print(bbs.getBbsId());
			}
		}
	}
%>
</body>
</html>