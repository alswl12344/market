package kr.co.dong.Product;

public class ProductDTO {
	private int pcode;
	private String pname;
	private String pprice;
	private String pcount;
	private String pdate;
	private String plimit;
	private String pimage;
	private int ptcode;
	private String pcontent;
	private int pdel;
	
	public int getPcode() {
		return pcode;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPdel() {
		return pdel;
	}
	public void setPdel(int pdel) {
		this.pdel = pdel;
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
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getPcount() {
		return pcount;
	}
	public void setPcount(String pcount) {
		this.pcount = pcount;
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
	public int getPtcode() {
		return ptcode;
	}
	public void setPtcode(int ptcode) {
		this.ptcode = ptcode;
	}
	@Override
	public String toString() {
		return "ProductDTO [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pcount=" + pcount
				+ ", pdate=" + pdate + ", plimit=" + plimit + ", pimage=" + pimage + ", ptcode=" + ptcode
				+ ", pcontent=" + pcontent + ", pdel=" + pdel + "]";
	}


}
