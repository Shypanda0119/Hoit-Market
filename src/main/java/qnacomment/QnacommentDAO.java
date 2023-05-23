package qnacomment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class QnacommentDAO {
	private Connection conn;	
	private ResultSet rs;
	
	public QnacommentDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "C##WEB02";
			String dbPassword = "1234";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL, dbId, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
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
		return "";
	}
	public int getNext() {
		String ORACLE = "SELECT qnacommentID FROM QNACOMMENT ORDER BY qnacommentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; 
	}
	public int write(int qnabbsId, String userId, String qnacommentText) {
		String ORACLE = "INSERT INTO QNACOMMENT VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, qnabbsId);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, qnacommentText);
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	public String getUpdateComment(int qnacommentId) {
		String ORACLE = "SELECT qnacommentText FROM QNACOMMENT WHERE qnacommentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, qnacommentId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //占쏙옙占쏙옙
	}
	public ArrayList<Qnacomment> getList(int bbsId){
		String ORACLE = "SELECT * FROM QNACOMMENT WHERE qnabbsID= ? AND qnacommentAvailable = 1 ORDER BY qnabbsID DESC"; 
		ArrayList<Qnacomment> list = new ArrayList<Qnacomment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1,  bbsId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qnacomment qnacomment = new Qnacomment();
				qnacomment.setQnacommentId(rs.getInt(1));
				qnacomment.setQnabbsId(rs.getInt(2));
				qnacomment.setUserId(rs.getString(3));
				qnacomment.setQnacommentDate(rs.getTimestamp(4));
				qnacomment.setQnacommentText(rs.getString(5));
				qnacomment.setQnacommentAvilable(rs.getInt(6));
				list.add(qnacomment);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	public int update(int qnacommentId, String qnacommentText) {
		String ORACLE = "UPDATE QNACOMMENT SET qnacommentText = ? WHERE qnacommentID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, qnacommentText);
			pstmt.setInt(2, qnacommentId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	public Qnacomment getComment(int qnacommentId) {
		String ORACLE = "SELECT * FROM QNACOMMENT WHERE qnacommentID = ? ORDER BY qnacommentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1,  qnacommentId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qnacomment cmt = new Qnacomment();
				cmt.setQnacommentId(rs.getInt(1));
				cmt.setQnabbsId(rs.getInt(2));
				cmt.setUserId(rs.getString(3));
				cmt.setQnacommentDate(rs.getTimestamp(4));
				cmt.setQnacommentText(rs.getString(5));
				cmt.setQnacommentAvilable(rs.getInt(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int qnacommentId) {
		String ORACLE = "DELETE FROM QNACOMMENT WHERE qnacommentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, qnacommentId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
}