package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public NoticeDAO() {
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
	
	public Notice getNotice(int nId) {
		String ORACLE = "SELECT * FROM NOTICEPAGE WHERE nId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, nId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getTimestamp(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getInt(6));
				return notice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
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
		return "";// 占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int write(String nTitle, String userId, String nContent) {
		String ORACLE = "INSERT INTO NOTICEPAGE VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, nTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, nContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int getNext() {
		String ORACLE = "SELECT NID FROM NOTICEPAGE ORDER BY NID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 占쏙옙占쏙옙 占쌉시뱄옙占쏙옙 占쏙옙占�
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public ArrayList<Notice> getList(int pageNumber){
		String ORACLE = "SELECT * FROM (SELECT * FROM NOTICEPAGE WHERE NID < ? and NAvailable = 1 order by NID desc) WHERE ROWNUM <=10";
		ArrayList<Notice> list = new ArrayList<Notice>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Notice notice = new Notice();
				notice.setNoticeId(rs.getInt(1));
				notice.setNoticeTitle(rs.getString(2));
				notice.setUserId(rs.getString(3));
				notice.setNoticeDate(rs.getTimestamp(4));
				notice.setNoticeContent(rs.getString(5));
				notice.setNoticeAvailable(rs.getInt(6));
				list.add(notice);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public boolean nextPage(int pageNumber) {
		  String SQL = "select * from (select * from NOTICEPAGE where nId <? and nAvailable=1 order by nID desc) where rownum<=10";
		ArrayList<Notice> list = new ArrayList<Notice>();
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
	
	public int delete(int nId) {
		String ORACLE = "UPDATE NOTICEPAGE SET nAvailable = 0 WHERE nId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, nId);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
