package kr.co.dong.board;

public class BoardDTO {

	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private String bdate;
	private int breadcnt;
	private int sbcode;
	private String sbname;
	
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
	public int getSbcode() {
		return sbcode;
	}
	public void setSbcode(int sbcode) {
		this.sbcode = sbcode;
	}
	
	
	public String getSbname() {
		return sbname;
	}
	public void setSbname(String sbname) {
		this.sbname = sbname;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter
				+ ", bdate=" + bdate + ", breadcnt=" + breadcnt + ", sbcode=" + sbcode + ", sbname=" + sbname + "]";
	}
	
	
	
}
