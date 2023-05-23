package comment;

import java.sql.Timestamp;

public class Comment {
	private int commentId;
	private int bbsId;
	private String userId;
	private Timestamp commentDate;
	private String commentText;
	private int commentAvilable;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getBbsId() {
		return bbsId;
	}
	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getCommentAvilable() {
		return commentAvilable;
	}
	public void setCommentAvilable(int commentAvilable) {
		this.commentAvilable = commentAvilable;
	}
}