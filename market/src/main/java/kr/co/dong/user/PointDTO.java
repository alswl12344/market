package kr.co.dong.user;

import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class PointDTO {

	int pointhiscode;
	int pointhisplus;
	int pointhisminus;
	String pointhisuser;
	
	public int getPointhiscode() {
		return pointhiscode;
	}
	public void setPointhiscode(int pointhiscode) {
		this.pointhiscode = pointhiscode;
	}
	public int getPointhisplus() {
		return pointhisplus;
	}
	public void setPointhisplus(int pointhisplus) {
		this.pointhisplus = pointhisplus;
	}
	public int getPointhisminus() {
		return pointhisminus;
	}
	public void setPointhisminus(int pointhisminus) {
		this.pointhisminus = pointhisminus;
	}
	public String getPointhisuser() {
		return pointhisuser;
	}
	public void setPointhisuser(String pointhisuser) {
		this.pointhisuser = pointhisuser;
	}
	@Override
	public String toString() {
		return "PointDTO [pointhiscode=" + pointhiscode + ", pointhisplus=" + pointhisplus + ", pointhisminus="
				+ pointhisminus + ", pointhisuser=" + pointhisuser + "]";
	}
	
	


}
