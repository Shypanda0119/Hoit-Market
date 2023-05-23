<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
    //response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
 <%
	String userId = null;
	if (session.getAttribute("userId") != null) {
		userId = (String) session.getAttribute("userId");
	}
	if (userId == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}int bbsId = 0;
	if (request.getParameter("bbsId") != null) {
		bbsId = Integer.parseInt(request.getParameter("bbsId"));
	}
	if (bbsId == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'market.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsId);
	if (!userId.equals(bbs.getUserId())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'market.jsp'");
		script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
            int result = bbsDAO.delete(bbsId);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='market.jsp'");
                script.println("</script>");
            }
        }
    %>
</body>
</html>