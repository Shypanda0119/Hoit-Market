package question;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import report.Report;

public class QuestionDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public QuestionDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "C##WEB02";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Question getQuestion(int questionId) {
		String ORACLE = "SELECT * FROM QUESTIONPAGE WHERE questionId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, questionId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Question question = new Question();
				question.setQuestionId(rs.getInt(1));
				question.setQuestionTitle(rs.getString(2));
				question.setUserId(rs.getString(3));
				question.setQuestionDate(rs.getTimestamp(4));
				question.setQuestionContent(rs.getString(5));
				question.setQuestionCheck(rs.getInt(6));
				return question;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getNext() {
		String ORACLE = "SELECT QuestionID FROM QUESTIONPAGE ORDER BY QuestionID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 泥� �뜝�룞�삕�뜝�룞�삕 �뜝�뙃�떆諭꾩삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//�뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕�뜝�룞�삕
	}
	
	public boolean nextPage(int pageNumber) {
		  String SQL = "select * from (select * from QUESTIONPAGE where QuestionId <? order by QuestionID desc) where rownum<=10";
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Question> getList(int pageNumber){
		String ORACLE = "SELECT * FROM (SELECT * FROM QuestionPAGE WHERE QuestionID < ? order by QuestionID desc) WHERE ROWNUM <=10";
		ArrayList<Question> list = new ArrayList<Question>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Question question = new Question();
				question.setQuestionId(rs.getInt(1));
				question.setQuestionTitle(rs.getString(2));
				question.setUserId(rs.getString(3));
				question.setQuestionDate(rs.getTimestamp(4));
				question.setQuestionContent(rs.getString(5));
				question.setQuestionCheck(0);
				list.add(question);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;//�뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕�뜝�룞�삕
	}
	
	public int write(String questionTitle, String userId, String questionContent) {
		String ORACLE = "INSERT INTO QUESTIONPAGE VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, questionTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, questionContent);
			pstmt.setInt(6, 0);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//�뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕�뜝�룞�삕
	}
	
	public String getDate() {
		String ORACLE = "SELECT SYSDATE FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";// �뜝�룞�삕�뜝�룞�삕�뜝�떢釉앹삕�뜝�떛�룞�삕 �뜝�룞�삕�뜝�룞�삕
	}
}
