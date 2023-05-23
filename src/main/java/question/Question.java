package question;

import java.sql.Timestamp;

public class Question{
	private int questionId;
	private String questionTitle;
	private String userId;
	private Timestamp questionDate;
	private String questionContent;
	private int questionCheck;
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(Timestamp questionDate) {
		this.questionDate = questionDate;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getQuestionCheck() {
		return questionCheck;
	}
	public void setQuestionCheck(int questionCheck) {
		this.questionCheck = questionCheck;
	}
	
}