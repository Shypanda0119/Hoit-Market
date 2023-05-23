<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="hoituser.HoitUserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="HoitUser" class="hoituser.HoitUser" scope="page" />
<jsp:setProperty name="HoitUser" property="userName" />
<jsp:setProperty name="HoitUser" property="userStudentNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(HoitUser.getUserStudentNumber() == null || HoitUser.getUserName() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
		}else{
			HoitUserDAO userDao = new HoitUserDAO();
			String result = userDao.searchId(HoitUser.getUserStudentNumber(),HoitUser.getUserName());
			if(result.equals("ErrorNoneData")){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입을 하신적이 없거나, 입력 정보가 올바르지 않습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{

				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원님의 아이디 찾기 결과입니다 : "+result + "')");
				script.println("history.back()");
				script.println("</script>");
		}
	}
	%>	
</body>
</html>