package bbs;

import java.sql.Connection;
import java.security.Timestamp;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsDAO() {
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
		public int getNext() {
			String ORACLE = "SELECT BBSID FROM BBS ORDER BY BBSID DESC";
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
		
		public int loadBbsId(String userId) {
			String ORACLE = "SELECT bbsID FROM bbs WHERE userId = ? ORDER BY BBSID DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				rs.next();
				return rs.getInt(1); 
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;
		}
		
		public int write(String bbsTitle, String userId, String bbsContent) {
			String ORACLE = "INSERT INTO bbs VALUES(?, ?, ?, ?, ?, ?)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, userId);
				pstmt.setString(4, getDate());
				pstmt.setString(5, bbsContent);
				pstmt.setInt(6, 1);
				return pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
		}
		public ArrayList<Bbs> getList(int pageNumber){
			String ORACLE = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 order by bbsID desc) WHERE ROWNUM <=10";
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsId(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserId(rs.getString(3));
					bbs.setBbsDate(rs.getTimestamp(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
		}
		
		public ArrayList<Bbs> userGetList(int pageNumber, String userId) {
			String ORACLE = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 and UserId = ? order by bbsID desc) WHERE ROWNUM <=10";
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				pstmt.setString(2, userId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsId(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserId(rs.getString(3));
					bbs.setBbsDate(rs.getTimestamp(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
		}
		
		public boolean nextPage(int pageNumber) {
			  String SQL = "select * from (select * from bbs where bbsid <? and bbsAvailable=1 order by bbsID desc) where rownum<=10";
			ArrayList<Bbs> list = new ArrayList<Bbs>();
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
		public Bbs getBbs(int bbsId) {
			String ORACLE = "SELECT * FROM BBS WHERE bbsId = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setInt(1, bbsId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsId(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserId(rs.getString(3));
					bbs.setBbsDate(rs.getTimestamp(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					return bbs;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		public int update(int bbsId, String bbsTitle, String bbsContent) {
			String ORACLE = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsId = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsId);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		public int delete(int bbsId) {
			String ORACLE = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsId = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(ORACLE);
				pstmt.setInt(1, bbsId);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		public ArrayList<Bbs> searchList(int pageNumber, String searchData, String searchType){
			String ORACLE;
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			if(searchType.equals("searchNumber")) {
				ORACLE = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 and bbsID = ? order by bbsID desc) WHERE ROWNUM <=10";
				try {
					PreparedStatement pstmt = conn.prepareStatement(ORACLE);
					pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
					pstmt.setInt(2, Integer.parseInt(searchData));
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setBbsId(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserId(rs.getString(3));
						bbs.setBbsDate(rs.getTimestamp(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						list.add(bbs);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
				
			} else if(searchType.equals("searchName")) {
				ORACLE = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 and UserId = ? order by bbsID desc) WHERE ROWNUM <=10";
				try {
					PreparedStatement pstmt = conn.prepareStatement(ORACLE);
					pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
					pstmt.setString(2, searchData);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setBbsId(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserId(rs.getString(3));
						bbs.setBbsDate(rs.getTimestamp(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						list.add(bbs);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				ORACLE = "SELECT * FROM (SELECT * FROM bbs WHERE bbsID < ? and bbsAvailable = 1 and LOWER(bbsTitle) LIKE LOWER(?) order by bbsID desc) WHERE ROWNUM <=10";
				try {
					PreparedStatement pstmt = conn.prepareStatement(ORACLE);
					pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
					pstmt.setString(2, "%" + searchData + "%");
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setBbsId(rs.getInt(1));
						bbs.setBbsTitle(rs.getString(2));
						bbs.setUserId(rs.getString(3));
						bbs.setBbsDate(rs.getTimestamp(4));
						bbs.setBbsContent(rs.getString(5));
						bbs.setBbsAvailable(rs.getInt(6));
						list.add(bbs);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}

			return list;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
		}
	}

	

