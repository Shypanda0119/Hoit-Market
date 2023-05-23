package report;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import service.Notice;


public class ReportDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReportDAO() {
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
	
	public Report getReport(int reportId) {
		String ORACLE = "SELECT * FROM REPORTPAGE WHERE ReportId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, reportId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Report report = new Report();
				report.setReportId(rs.getInt(1));
				report.setReportTitle(rs.getString(2));
				report.setUserId(rs.getString(3));
				report.setReportDate(rs.getTimestamp(4));
				report.setReportContent(rs.getString(5));
				report.setReportCheck(rs.getInt(6));
				return report;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getNext() {
		String ORACLE = "SELECT ReportID FROM REPORTPAGE ORDER BY ReportID DESC";
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
	
	public boolean nextPage(int pageNumber) {
		  String SQL = "select * from (select * from REPORTPAGE where ReportId <? order by ReportID desc) where rownum<=10";
		ArrayList<Report> list = new ArrayList<Report>();
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
	
	public ArrayList<Report> getList(int pageNumber){
		String ORACLE = "SELECT * FROM (SELECT * FROM REPORTPAGE WHERE ReportID < ? order by ReportID desc) WHERE ROWNUM <=10";
		ArrayList<Report> list = new ArrayList<Report>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Report report = new Report();
				report.setReportId(rs.getInt(1));
				report.setReportTitle(rs.getString(2));
				report.setUserId(rs.getString(3));
				report.setReportDate(rs.getTimestamp(4));
				report.setReportContent(rs.getString(5));
				report.setReportCheck(0);
				list.add(report);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
	}
	
	public int write(String reportTitle, String userId, String reportContent) {
		String ORACLE = "INSERT INTO REPORTPAGE VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(ORACLE);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, reportTitle);
			pstmt.setString(3, userId);
			pstmt.setString(4, getDate());
			pstmt.setString(5, reportContent);
			pstmt.setInt(6, 0);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
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
}
