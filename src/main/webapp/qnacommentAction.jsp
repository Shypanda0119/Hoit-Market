<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="qnacomment.QnacommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="qnacomment" class="qnacomment.Qnacomment" scope="page" />
<jsp:setProperty name="qnacomment" property="qnacommentText" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	 <%
	 	String userId = null;
	 	if(session.getAttribute("userId") != null){
	 		userId = (String) session.getAttribute("userId");
	 	}
	 	if(userId == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	} 
	 	else{
		 	int questionId = 0; 
		 	if (request.getParameter("questionId") != null){
		 		questionId = Integer.parseInt(request.getParameter("questionId"));
		 	}	
		 	if (questionId == 0){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('유효하지 않은 글입니다.')");
		 		script.println("location.href = 'login.jsp'");
		 		script.println("</script>");
		 	}
	 		if (qnacomment.getQnacommentText() == null){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('입력이 안된 사항이 있습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	} else {
		 		QnacommentDAO qnacommentDAO = new QnacommentDAO();
		 		int qnacommentID = qnacommentDAO.write(questionId, userId, qnacomment.getQnacommentText());
		 		if (qnacommentID == -1){
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("alert('댓글 쓰기에 실패했습니다.')");
			 		script.println("history.back()");
			 		script.println("</script>");
			 	}
		 		else{
			 		PrintWriter script = response.getWriter();
			 		script.println("<script>");
			 		script.println("location.href=document.referrer;");
			 		script.println("</script>");
			 	}
		 	}
		 }
	 %>
</body>
</html>