package bbs;

import java.sql.Timestamp;

public class Bbs {
	private int bbsId;
	private String bbsTitle;
	private String userId;
	private Timestamp bbsDate;
	private String bbsContent;
	private int bbsAvailable;
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public Timestamp getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(Timestamp timestamp) {
		this.bbsDate = timestamp;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}

	
}
