<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="service.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice" class="service.Notice" scope="page" />
<jsp:setProperty name="notice" property="noticeTitle" />
<jsp:setProperty name="notice" property="noticeContent" />

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

		if (userId == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (notice.getNoticeTitle() == null || notice.getNoticeContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				NoticeDAO NoticeDAO = new NoticeDAO();
				int result = NoticeDAO.write(notice.getNoticeTitle(), userId, notice.getNoticeContent());
				if (result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'service_notice.jsp'");
					script.println("</script>");
			}
		}
	}
%>
</body>
</html>