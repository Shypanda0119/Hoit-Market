<%@ page import="java.io.File" %>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter"%>    
<%@ page import="java.sql.Timestamp" %>
<%@ page import="service.Notice"%>
<%@ page import="service.NoticeDAO"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="style.css">
	    <link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap" rel="stylesheet">
	    <script
	    src="https://kit.fontawesome.com/b86cbc37dc.js"
	    crossorigin="anonymous"
	    ></script>
	    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
		$(document).ready( function() {
			$("#load_headers").load("header.jsp");  // Header Load
			$("#load_footer").load("footer.html");  // Footer Load
		});</script>
	    <title>호서대의 잇템을 찾다! 호잇마켓</title>
</head>

<body>
<%
		String userId = null;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
		int nId = 0;
		if (request.getParameter("nId") != null) {
			nId = Integer.parseInt(request.getParameter("nId"));
		}
		if (nId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'service_notice.jsp'");
			script.println("</script>");
		}
		Notice notice = new NoticeDAO().getNotice(nId);
%>
<div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
		    <h3 style="text-align:center;">- 공지사항 -</h3>
			<hr>

		<div class="container">
			<div align="center">
				<table align="center" class="container__table" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td style="width: 20%; background-color: #eeeeee;">작성자</td>
							<td><%=notice.getUserId()%></td>
							<td style="width: 20%; background-color: #eeeeee;">작성일</td>
							<td colspan="2"><%=notice.getNoticeDate()%></td>
						</tr>
						<tr>
							<td style="width: 20%; background-color: #eeeeee;">글 제목</td>
							<td colspan="3" style="width: 800px;"><%=notice.getNoticeTitle()%></td>
						</tr>		
						<tr>
							<td colspan="4" style="min-height: 200px; height: 500px; text-align: left; word-break:break-all;"><%=notice.getNoticeContent()%></td>
						</tr>						
					</tbody>
			</table>
			<input type="button" value="목록" class="mypage_button" id="info_change_now" onclick="location.href='service_notice.jsp'">
			<%
				//글작성자 본인일시 수정 삭제 가능
				if (userId != null && userId.equals(notice.getUserId())) {
			%>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<a style="color:black;" class="mypage_button" id="info_change_now" onclick="return confirm('정말로 삭제하시겠습니까?')" href="service_notice_deleteAction.jsp?nId=<%=nId %>">삭제</a>
			<%
				}
			%>
	</div>
</div>
</div>
<div id="load_footer"></div>
</body>
</html>