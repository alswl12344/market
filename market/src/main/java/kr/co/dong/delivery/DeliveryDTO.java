package kr.co.dong.delivery;

public class DeliveryDTO {
	   private int dcode;
	   private String dname;
	   private String address;
	   private String phone;
	   private String status;   
	   private String userid;
	   
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getDcode() {
		return dcode;
	}
	public void setDcode(int dcode) {
		this.dcode = dcode;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "deliveryDTO [dcode=" + dcode + ", dname=" + dname + ", address=" + address + ", phone=" + phone
				+ ", userid=" + userid + ", status=" + status + "]";
	}
	
}
