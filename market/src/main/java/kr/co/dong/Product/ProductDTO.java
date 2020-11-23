package kr.co.dong.Product;

public class ProductDTO {
	private int pcode;
	private String pname;
	private int pprice;
	private int pcount;
	private int pbuycount;
	private String pdate;
	private String plimit;
	private String pimage;
	private int ptcodesub;
	private int ptcodemain;
	private String pcontent;
	private String puserid;
	private int pdel;
	
	
	
	public int getPtcodemain() {
		return ptcodemain;
	}
	public void setPtcodemain(int ptcodemain) {
		this.ptcodemain = ptcodemain;
	}
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public int getPbuycount() {
		return pbuycount;
	}
	public void setPbuycount(int pbuycount) {
		this.pbuycount = pbuycount;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPlimit() {
		return plimit;
	}
	public void setPlimit(String plimit) {
		this.plimit = plimit;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPtcodesub() {
		return ptcodesub;
	}
	public void setPtcodesub(int ptcodesub) {
		this.ptcodesub = ptcodesub;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPuserid() {
		return puserid;
	}
	public void setPuserid(String puserid) {
		this.puserid = puserid;
	}
	public int getPdel() {
		return pdel;
	}
	public void setPdel(int pdel) {
		this.pdel = pdel;
	}
	
	@Override
	public String toString() {
		return "ProductDTO [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pcount=" + pcount
				+ ", pdate=" + pdate + ", plimit=" + plimit + ", pimage=" + pimage + ", ptcodesub=" + ptcodesub
				+ ", pcontent=" + pcontent + ", puserid=" + puserid + ", pdel=" + pdel + "]";
	}
}

	