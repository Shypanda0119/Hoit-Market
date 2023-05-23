<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.PrintWriter"%>    
<%@ page import="java.sql.Timestamp" %>
<%@ page import="question.Question"%>
<%@ page import="question.QuestionDAO"%>
<%@ page import="qnacomment.Qnacomment"%>
<%@ page import="qnacomment.QnacommentDAO"%>
<%@ page import="hoituser.HoitUserDAO" %>
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
		int userRank = 0;
		if (session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			HoitUserDAO hoituser = new HoitUserDAO();
			userRank = hoituser.userRankGet(userId);
		}
		int questionId = 0;
		if (request.getParameter("questionId") != null) {
			questionId = Integer.parseInt(request.getParameter("questionId"));
		}
		if (questionId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'service_question.jsp'");
			script.println("</script>");
		}
		Question question = new QuestionDAO().getQuestion(questionId);
		Qnacomment qnacomment = new QnacommentDAO().getComment(questionId);
		
		if (!question.getUserId().equals(userId) && userRank != 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('해당 게시글에 접근할 수 있는 권한이 없습니다.')");
			script.println("location.href = 'service_question.jsp'");
			script.println("</script>");
		}
%>
<div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
		    <h3 style="text-align:center;">- 신고게시판 -</h3>
			<hr>

		<div class="container">
			<div align="center">
				<table align="center" class="container__table" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td style="width: 20%; background-color: #eeeeee;">작성자</td>
							<td><%=question.getUserId()%></td>
							<td style="width: 20%; background-color: #eeeeee;">작성일</td>
							<td colspan="2"><%=question.getQuestionDate()%></td>
						</tr>
						<tr>
							<td style="width: 20%; background-color: #eeeeee;">글 제목</td>
							<td colspan="3" style="width: 800px;"><%=question.getQuestionTitle()%></td>
						</tr>		
						<tr>
							<td colspan="4" style="min-height: 200px; height: 500px; text-align: left; word-break:break-all;"><%=question.getQuestionContent()%></td>
						</tr>						
					</tbody>
			</table>
			<input type="button" value="목록" class="mypage_button" id="info_change_now" onclick="location.href='service_question.jsp'">
	</div>
<div class="container">
			<div align="center">
			<table align="center" class="container__table" style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<%
							QnacommentDAO qnacommentDAO = new QnacommentDAO();
							ArrayList<Qnacomment> list = qnacommentDAO.getList(questionId);
							for(int i=0; i<list.size(); i++){
						%>
						<table class="container__table" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
										<tr>
											<td style="width:1000px; background-color: #eeeeee;"colspan="4">댓글</td>
										</tr>
										<tr>						
											<td style="width:180px;" align="center"><%=list.get(i).getQnacommentDate()%></td>		
											<td style="width:170px;"><%=list.get(i).getUserId()%></td>
											<td style="width:600px;"><%=list.get(i).getQnacommentText()%></td>
											<td style="width:50px;"align="center"><%
													if(list.get(i).getUserId() != null && list.get(i).getUserId().equals(userId)){
												%>
												<%
													}
												%>	
										</td>
										</tr>
										</tbody>
								</table>			
						<%
							}
						%>
				</table>
			</div>
		</div>
		<div class="container">
			<div class="center">
			<form method="post" action="qnacommentAction.jsp?questionId=<%=questionId%>">
				<div align="center">
					<table style="text-align: center;">
						<tr>
							<td><input type="text" style="height:30px; width:400px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "qnacommentText"></td>
							<td><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
						</tr>
					</table>
				</div>
			</form>
			<div align="center">
				<input type="button" value="목록" class="mypage_button" id="info_change_now" onclick="location.href='market.jsp'">
					<%
						//글작성자 본인일시 수정 삭제 가능
						if (userId != null && userId.equals(question.getUserId())) {
					%>
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<input type="button" value="수정" class="mypage_button" id="info_change_now" onclick="location.href='Update.jsp?bbsId=<%=questionId%>'">
					&nbsp;&nbsp;|&nbsp;&nbsp;
					<a style="color:black;" class="mypage_button" id="info_change_now" onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsId=<%=questionId %>">삭제</a>
					<%
						}
					%>
			</div>
			</div>
		</div>
		</div>
<div id="load_footer"></div>
</body>
</html>