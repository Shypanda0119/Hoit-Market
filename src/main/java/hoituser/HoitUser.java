package hoituser;

public class HoitUser {
	
	private String userId;
	private String userPassword;
	private String userPassword_check;
	private String userDept;
	private String userName;
	private String userStudentNumber;
	private String userGender;
	private String userPhoneNumber;
	private int userRank;
	
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	public String getUserPassword_check() {
		return userPassword_check;
	}
	public void setUserPassword_check(String userPassword_check) {
		this.userPassword_check = userPassword_check;
	}
	public String getUserDept() {
		return userDept;
	}
	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserStudentNumber() {
		return userStudentNumber;
	}
	public void setUserStudentNumber(String userStudentNumber) {
		this.userStudentNumber = userStudentNumber;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}
	
}
