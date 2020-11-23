package kr.co.dong.user;

import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class UserDTO {

	private int usercode;
	
	@NotEmpty
	@Pattern(regexp="^[0-9a-zA-Z]*$")
	@Length(min=4, max=8)
	private String userid;

	@NotEmpty
	@Pattern(regexp="^[0-9a-zA-Z!@#$%^&]*$")
	@Length(min=4)
	private String userpw;
	
	@NotEmpty
	private String username;	
	
	@NotEmpty
	@Length(min=5, max=6)
	private String birth;
	
	@NotEmpty
	private String email;
	
	@NotEmpty
	private String phone;
	
	
	
	private String userdel;
	private String lvname;	
	private int point;
	private int lvcode;
	
	
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
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
