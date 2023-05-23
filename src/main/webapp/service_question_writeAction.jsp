<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="question.QuestionDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="question" class="question.Question" scope="page" />
<jsp:setProperty name="question" property="questionTitle" />
<jsp:setProperty name="question" property="questionContent" />

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
			if (question.getQuestionTitle() == null || question.getQuestionContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				QuestionDAO reportDAO = new QuestionDAO();
				int result = reportDAO.write(question.getQuestionTitle(), userId, question.getQuestionContent());
				if (result == -1 ){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'service_question.jsp'");
					script.println("</script>");
			}
		}
	}
%>
</body>
</html>