package kr.co.dong.user;

public class UserDTO {

	private int usercode, birth, point, lvcode;
	private String userid, userpw, username, email, phone, userdel, lvname;	
	
	
	public String getLvname() {
		return lvname;
	}
	public void setLvname(String lvname) {
		this.lvname = lvname;
	}
	public int getUsercode() {
		return usercode;
	}
	public void setUsercode(int usercode) {
		this.usercode = usercode;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLvcode() {
		return lvcode;
	}
	public void setLvcode(int lvcode) {
		this.lvcode = lvcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserdel() {
		return userdel;
	}
	public void setUserdel(String userdel) {
		this.userdel = userdel;
	}
	@Override
	public String toString() {
		return "UserDTO [usercode=" + usercode + ", birth=" + birth + ", point=" + point + ", lvcode=" + lvcode
				+ ", userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", email=" + email
				+ ", phone=" + phone + ", userdel=" + userdel + ", lvname=" + lvname + "]";
	}
	


}
