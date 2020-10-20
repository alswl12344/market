package kr.co.dong.board;

public class BoardDTO {

	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private String bdate;
	private int breadcnt;
	private int bcategory;
	private String bcategorydetail;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBreadcnt() {
		return breadcnt;
	}
	public void setBreadcnt(int breadcnt) {
		this.breadcnt = breadcnt;
	}
	public int getbcategory() {
		return bcategory;
	}
	public void setbcategory(int bcategory) {
		this.bcategory = bcategory;
	}
	
	
	public String getbcategorydetail() {
		return bcategorydetail;
	}
	public void setbcategorydetail(String bcategorydetail) {
		this.bcategorydetail = bcategorydetail;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter
				+ ", bdate=" + bdate + ", breadcnt=" + breadcnt + ", bcategory=" + bcategory + ", bcategorydetail=" + bcategorydetail + "]";
	}
	
	
	
}
