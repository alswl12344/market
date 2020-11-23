package kr.co.dong.order;

public class OrderDTO {

	int ordercode; // 오더 테이블 pk 
	int ordernumber; // 주문번호
	int orderprice;  // 결제 금액 
	int orderpaytype; // 결제 방식 ( 1:무통장집금 / 2:포인트결제)
	int ordertypecode; // 결제 방식 ( 1:무통장집금 / 2:포인트결제)
	String orderreceivename; // 받는사람 이름
	String orderuserid; // 주문자 id
	String orderstatus; // 결제상태 (1:무통장입금으로 인한 입금확인 상태 / 2: 결제완료)
	String ordermanagementaddress; // 받는 주소지 
	String orderdate; // 주문일자
	String ordertypename; // 주문일자
	
	
	
	
	
	

	public int getOrdertypecode() {
		return ordertypecode;
	}
	public void setOrdertypecode(int ordertypecode) {
		this.ordertypecode = ordertypecode;
	}
	public String getOrdertypename() {
		return ordertypename;
	}
	public void setOrdertypename(String ordertypename) {
		this.ordertypename = ordertypename;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public int getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(int ordernumber) {
		this.ordernumber = ordernumber;
	}
	public int getOrdercode() {
		return ordercode;
	}
	public void setOrdercode(int ordercode) {
		this.ordercode = ordercode;
	}
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public int getOrderpaytype() {
		return orderpaytype;
	}
	public void setOrderpaytype(int orderpaytype) {
		this.orderpaytype = orderpaytype;
	}
	public String getOrderreceivename() {
		return orderreceivename;
	}
	public void setOrderreceivename(String orderreceivename) {
		this.orderreceivename = orderreceivename;
	}
	public String getOrderuserid() {
		return orderuserid;
	}
	public void setOrderuserid(String orderuserid) {
		this.orderuserid = orderuserid;
	}
	public String getOrderstatus() {
		return orderstatus;
	}
	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}
	public String getOrdermanagementaddress() {
		return ordermanagementaddress;
	}
	public void setOrdermanagementaddress(String ordermanagementaddress) {
		this.ordermanagementaddress = ordermanagementaddress;
	}
	@Override
	public String toString() {
		return "OrderDTO [ordercode=" + ordercode + ", orderprice=" + orderprice + ", orderpaytype=" + orderpaytype
				+ ", orderreceivename=" + orderreceivename + ", orderuserid=" + orderuserid + ", orderstatus="
				+ orderstatus + ", ordermanagementaddress=" + ordermanagementaddress + "]";
	}

	
	
}
