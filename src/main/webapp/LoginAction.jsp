<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="hoituser.HoitUserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="HoitUser" class="hoituser.HoitUser" scope="page" />
<jsp:setProperty name="HoitUser" property="userId" />
<jsp:setProperty name="HoitUser" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String userId = null;
		if(session.getAttribute("userId") != null){
			userId =(String)session.getAttribute("userid");
		}
		if (userId != null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
	%>
	<%
		HoitUserDAO userDao = new HoitUserDAO();
		int result = userDao.login(HoitUser.getUserId(), HoitUser.getUserPassword());
		if (result == 1 ){
			session.setAttribute("userId", HoitUser.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}else if (result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else if (result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>