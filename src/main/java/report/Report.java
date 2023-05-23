package report;

import java.sql.Timestamp;

public class Report {
	private int reportId;
	private String reportTitle;
	private String userId;
	private Timestamp reportDate;
	private String reportContent;
	private int reportCheck;
	
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getReportDate() {
		return reportDate;
	}
	public void setReportDate(Timestamp reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getReportCheck() {
		return reportCheck;
	}
	public void setReportCheck(int reportCheck) {
		this.reportCheck = reportCheck;
	}
}
