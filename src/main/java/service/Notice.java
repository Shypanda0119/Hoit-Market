package service;

import java.sql.Timestamp;

public class Notice {
	private int noticeId;
	private String noticeTitle;
	private String userId;
	private Timestamp noticeDate;
	private String noticeContent;
	private int noticeAvailable;
	
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Timestamp noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeAvailable() {
		return noticeAvailable;
	}
	public void setNoticeAvailable(int noticeAvailable) {
		this.noticeAvailable = noticeAvailable;
	}
	
}
