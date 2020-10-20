package kr.co.dong.cart;

public class CartDTO {
	private int cartcode;
	private int ccode;
	private String cserid;
	private int count;
	private int pcode;
	private String userid;
	private int pprice;
	private int money;
	
	public int getCartcode() {
		return cartcode;
	}
	public void setCartcode(int cartcode) {
		this.cartcode = cartcode;
	}
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public String getCserid() {
		return cserid;
	}
	public void setCserid(String cserid) {
		this.cserid = cserid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartcode=" + cartcode + ", ccode=" + ccode + ", cserid=" + cserid + ", count=" + count
				+ ", pcode=" + pcode + ", userid=" + userid + ", pprice=" + pprice + ", money=" + money + "]";
	}
	
	

}
