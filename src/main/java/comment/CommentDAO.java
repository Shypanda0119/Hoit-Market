package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class CommentDAO {
	private Connection conn;	
	private ResultSet rs;
	
	public CommentDAO() {
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
		String ORACLE = "SELECT commentID FROM BBSCOMMENT ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //ù��° ����� ���
	}
	public int write(int bbsId, String userId, String commentText) {
		String ORACLE = "INSERT INTO BBSCOMMENT VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, bbsId);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, commentText);
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public String getUpdateComment(int commentId) {
		String ORACLE = "SELECT commentText FROM BBSCOMMENT WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, commentId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //����
	}
	public ArrayList<Comment> getList(int bbsId){
		String ORACLE = "SELECT * FROM BBSCOMMENT WHERE bbsID= ? AND commentAvailable = 1 ORDER BY bbsID DESC"; 
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1,  bbsId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentId(rs.getInt(1));
				cmt.setBbsId(rs.getInt(2));
				cmt.setUserId(rs.getString(3));
				cmt.setCommentDate(rs.getTimestamp(4));
				cmt.setCommentText(rs.getString(5));
				cmt.setCommentAvilable(rs.getInt(6));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�����ͺ��̽� ����
	}
	public int update(int commentId, String commentText) {
		String ORACLE = "UPDATE BBSCOMMENT SET commentText = ? WHERE commentID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, commentText);
			pstmt.setInt(2, commentId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	public Comment getComment(int commentId) {
		String ORACLE = "SELECT * FROM BBSCOMMENT WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1,  commentId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment cmt = new Comment();
				cmt.setCommentId(rs.getInt(1));
				cmt.setBbsId(rs.getInt(2));
				cmt.setUserId(rs.getString(3));
				cmt.setCommentDate(rs.getTimestamp(4));
				cmt.setCommentText(rs.getString(5));
				cmt.setCommentAvilable(rs.getInt(6));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int commentId) {
		String ORACLE = "DELETE FROM BBSCOMMENT WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, commentId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
}