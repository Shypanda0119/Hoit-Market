package hoituser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class HoitUserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public HoitUserDAO() {
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
	
	public int login(String UserId, String UserPassword) {
		String ORACLE = "SELECT UserPassword FROM HOITUSER WHERE UserId = ?";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(UserPassword)) {
					return 1;
				}else
					return 0; 
			}
			return -1; 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; 
	}
	
	public int join(HoitUser user) {
		String ORACLE = "INSERT INTO HoitUser VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserDept());
			pstmt.setString(5, user.getUserStudentNumber());
			pstmt.setString(6, user.getUserGender());
			pstmt.setString(7, user.getUserPhoneNumber());
			pstmt.setInt(8, 0);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public ArrayList<HoitUser> mypageInfo(String UserId) {
		String ORACLE = "SELECT * FROM HOITUSER WHERE UserId = ?";
		ArrayList<HoitUser> list = new ArrayList<HoitUser>();
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				HoitUser user = new HoitUser();
				user.setUserId(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserDept(rs.getString(4));
				user.setUserStudentNumber(rs.getString(5));
				user.setUserGender(rs.getString(6));
				user.setUserPhoneNumber(rs.getString(7));
				list.add(user);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int updateUserInfo(HoitUser user) {
		String ORACLE = "UPDATE HoitUser SET UserPassword = ?, UserName = ?, UserDept = ?, UserGender = ?, UserPhoneNumber = ? WHERE UserId = ?";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getUserDept());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserPhoneNumber());
			pstmt.setString(6, user.getUserId());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public String searchId(String UserSN, String UserName) {
		String ORACLE = "SELECT UserId FROM HOITUSER WHERE UserStudentNumber = ? AND UserName = ?";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, UserSN);
			pstmt.setString(2, UserName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "ErrorNoneData"; 
	}
	
	public String searchPw(String UserSN, String UserName, String UserId) {
		String ORACLE = "SELECT UserPassword FROM HOITUSER WHERE UserStudentNumber = ? AND UserName = ? AND UserId = ?";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, UserSN);
			pstmt.setString(2, UserName);
			pstmt.setString(3, UserId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "ErrorNoneData"; 
	}
	
	public int userRankGet(String UserId) {
		String ORACLE = "SELECT UserRank FROM HOITUSER WHERE UserId = ?";
		try {
			pstmt = conn.prepareStatement(ORACLE);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
}
