package kr.co.dong.domain;

public class LoginVO {
	private String userID;
	private String name;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "LoginVO [userID=" + userID + ", name=" + name + "]";
	}
	
	

}
