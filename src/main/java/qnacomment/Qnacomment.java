package qnacomment;

import java.sql.Timestamp;

public class Qnacomment {
	private int qnacommentId;
	private int qnabbsId;
	private String userId;
	private Timestamp qnacommentDate;
	private String qnacommentText;
	private int qnacommentAvilable;
	public int getQnacommentId() {
		return qnacommentId;
	}
	public void setQnacommentId(int qnacommentId) {
		this.qnacommentId = qnacommentId;
	}
	public int getQnabbsId() {
		return qnabbsId;
	}
	public void setQnabbsId(int qnabbsId) {
		this.qnabbsId = qnabbsId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getQnacommentDate() {
		return qnacommentDate;
	}
	public void setQnacommentDate(Timestamp qnacommentDate) {
		this.qnacommentDate = qnacommentDate;
	}
	public String getQnacommentText() {
		return qnacommentText;
	}
	public void setQnacommentText(String qnacommentText) {
		this.qnacommentText = qnacommentText;
	}
	public int getQnacommentAvilable() {
		return qnacommentAvilable;
	}
	public void setQnacommentAvilable(int qnacommentAvilable) {
		this.qnacommentAvilable = qnacommentAvilable;
	}
	
}
