<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="hoituser.HoitUserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="HoitUser" class="hoituser.HoitUser" scope="page" />
<jsp:setProperty name="HoitUser" property="userId" />
<jsp:setProperty name="HoitUser" property="userPassword" />
<jsp:setProperty name="HoitUser" property="userPassword_check" />
<jsp:setProperty name="HoitUser" property="userDept" />
<jsp:setProperty name="HoitUser" property="userName" />
<jsp:setProperty name="HoitUser" property="userStudentNumber" />
<jsp:setProperty name="HoitUser" property="userGender" />
<jsp:setProperty name="HoitUser" property="userPhoneNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(HoitUser.getUserId() == null || HoitUser.getUserPassword() == null ||
				HoitUser.getUserName() == null || HoitUser.getUserStudentNumber() == null ||
				HoitUser.getUserGender() == null || HoitUser.getUserPhoneNumber() == null
				|| HoitUser.getUserPassword_check() == null || HoitUser.getUserDept() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
		}else{
			HoitUserDAO userDao = new HoitUserDAO();
			int result = userDao.join(HoitUser);
			if (result == -1 ){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
		}
	}
	%>	
</body>
</html>