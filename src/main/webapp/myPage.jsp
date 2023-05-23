<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="hoituser.HoitUserDAO" %>
<%@ page import="hoituser.HoitUser" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
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
	    <title>(HoIt! Market) MyPage</title>
	</head>
	
	<body>
	    <div id="load_headers"></div>
		<div class="body_start">
			<h1 style="text-align:center;">Ho It! Market</h1>
		    <h3 style="text-align:center;">- 마이페이지 -</h3>
			<hr>
			
			<div align="center">
				<input type="button" class="mypage_button" id="info_change" value="정보수정" onclick="info_change_b()">
				<span style="font-size:20px;">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
				<input type="button" class="mypage_button" id="trade_log" value="내가 작성한 글 보기" onclick="trade_log_b()">
			</div>
			<br>
			<div id="info_page_load" style="display:none;">
			
				<%
				String userId = null;
				if(session.getAttribute("userId") != null){
					userId = (String)session.getAttribute("userId");
				}
				
				HoitUserDAO userDAO = new HoitUserDAO();
				ArrayList<HoitUser> list = userDAO.mypageInfo(userId);
				%>
				
				<div id="info_page_body" align="center">
					<table border="1" style="width:500px;">
						<tr>
							<th colspan="2" style="background-color:#d1d1d1;">현재 내 정보</th>
						</tr>
						<tr>
							<th class="info_page_body_th"> 이름 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserName()%> </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 아이디 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserId()%> </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 비밀번호 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;******** </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 학과 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserDept()%> </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 학번 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserStudentNumber()%> </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 전화번호 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserPhoneNumber()%> </td>
						</tr>
						<tr>
							<th class="info_page_body_th"> 성별 </th>
							<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserGender()%> </td>
						</tr>
					</table>
					<br>
					<input type="button" value="수정" class="mypage_button" id="info_change_now" style="border: 1px solid grey; border-radius: 5px;" onclick="info_change_edit()">
				</div>
			</div>
			
			
			
			<div id="trade_page_load" style="display:none;">
				<div class="container">
					<div class="" align="center">
					최근 사용자가 작성한 10개의 게시글을 출력합니다.
						<table class="container__table" style="text-align: center;">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center; width: 50px; border: 1px solid #dddddd;">번호</th>
									<th style="background-color: #eeeeee; text-align: center; width: 700px; border: 1px solid #dddddd;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width: 150px; border: 1px solid #dddddd;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center; width: 220px; border: 1px solid #dddddd;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
								BbsDAO bbsDAO = new BbsDAO();
								ArrayList<Bbs> writelist = bbsDAO.userGetList(1,userId);
								for (int i = 0; i < writelist.size(); i++) {
								%>
							<tr>
								<td style="width: 50px;"><%=writelist.get(i).getBbsId()%></td>
								<td style="width: 700px; text-align: left;"><a style="color: black;"href="View.jsp?bbsId=<%=writelist.get(i).getBbsId()%>">
								<%=writelist.get(i).getBbsTitle()%></a></td>
								<td style="width: 150px;"><%=writelist.get(i).getUserId()%></td>
								<td style="width: 220px;"><%=writelist.get(i).getBbsDate() %></td>
							</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			
			
			<div id="info_page_edit" style="display:none;">
				<div id="info_page_body" align="center">
					<form method="post" action="myPageAction.jsp">
						<table border="1" style="width:500px;">
							<tr>
								<th colspan="2" style="background-color:#d1d1d1;">내 정보 수정하기</th>
							</tr>
							<tr>
								<th class="info_page_body_th"> 이름 </th>
								<td class="info_page_body_td"><input type="text" class="info_page_edit" name="userName" placeholder="이름"></td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 아이디 </th>
								<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserId()%></td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 비밀번호 </th>
								<td class="info_page_body_td"><input type="password" id="edit_pw" class="info_page_edit" name="userPassword" placeholder="비밀번호"></td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 비밀번호 재확인</th>
								<td class="info_page_body_td"><input type="password" id="edit_pw_check" class="info_page_edit" name="userPassword_check" onchange="isSame(this)" placeholder="비밀번호 재확인">
	                				<span id="edit_check_same"></span></td>
							</tr>			
							<tr>
								<th class="info_page_body_th"> 학과 </th>
								<td class="info_page_body_td"><input type="text" class="info_page_edit" name="userDept" placeholder="학과"></td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 학번 </th>
								<td class="info_page_body_td">&nbsp;&nbsp;<%=list.get(0).getUserStudentNumber()%></td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 성별 </th>
								<td class="info_page_body_td">
									<label>
				                		<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
				                	</label>
				                	<label>
				                		<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
				                	</label>
								</td>
							</tr>
							<tr>
								<th class="info_page_body_th"> 전화번호 </th>
								<td class="info_page_body_td"><input type="text" class="info_page_edit" name="userPhoneNumber" placeholder="전화번호"></td>
							</tr>
						</table>
						<br>
						<%String old_pw_jsp = list.get(0).getUserPassword(); %>
						<script>
							function isSame(obj) {
								var pw = document.getElementById('edit_pw').value;
								var pw_check = document.getElementById('edit_pw_check').value;
								var old_pw = "<%=old_pw_jsp%>";
								if(pw != '' || pw_check != '') {
									if(pw == pw_check) {
										if(pw_check == old_pw) {
											document.getElementById('edit_check_same').innerHTML='기존에 사용하던 비밀번호 입니다.';
											document.getElementById('edit_check_same').style.fontSize='12px';
											document.getElementById('edit_check_same').style.color='red';
											document.getElementById('edit_pw').value=null;
											document.getElementById('edit_pw_check').value=null;
										} else {
											document.getElementById('edit_check_same').innerHTML='비밀번호가 일치합니다.';
											document.getElementById('edit_check_same').style.fontSize='12px';
											document.getElementById('edit_check_same').style.color='blue';
										}
									} else {
										document.getElementById('edit_check_same').innerHTML='비밀번호가 일치하지 않습니다.';
										document.getElementById('edit_check_same').style.fontSize='12px';
										document.getElementById('edit_check_same').style.color='red';
										document.getElementById('edit_pw_check').value=null;
									}
								}
							}
						</script>
						<input type="submit" value="저장" class="mypage_button" id="info_change_now" style="border: 1px solid grey; border-radius: 5px;">
					</form>
				</div>
			</div>
			
			<script src="script/mypage_change_page.js"></script>
		</div>
		<div id="load_footer"></div>
	</body>
</html>