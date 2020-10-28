package kr.co.dong.Product;

public class ProductReply {
	private int preno; //상품평 번호
	private String pwriter; //상품평 작성자
	private String pmemo; // 상품평
	private String predate; //상품평 게시일 
	private int pcode; //상품번호 
	public int getPreno() {
		return preno;
	}
	public void setPreno(int preno) {
		this.preno = preno;
	}
	public String getPwriter() {
		return pwriter;
	}
	public void setPwriter(String pwriter) {
		this.pwriter = pwriter;
	}
	public String getPmemo() {
		return pmemo;
	}
	public void setPmemo(String pmemo) {
		this.pmemo = pmemo;
	}
	public String getPredate() {
		return predate;
	}
	public void setPredate(String predate) {
		this.predate = predate;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	@Override
	public String toString() {
		return "ProductReply [preno=" + preno + ", pwriter=" + pwriter + ", pmemo=" + pmemo + ", predate=" + predate
				+ ", pcode=" + pcode + "]";
	}




}
