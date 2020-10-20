package kr.co.dong;

public class ImgDTO {
	private int imgno;
	private String imgfrom;
	private int imgfromno;
	private String imgrealpath;
	private String imgviewpath;
	
	public ImgDTO(){	
	}
	public ImgDTO(String imgfrom, int imgfromno, String imgrealpath, String imgviewpath) {
		setImgfrom(imgfrom);
		setImgfromno(imgfromno);
		setImgrealpath(imgrealpath);
		setImgviewpath(imgviewpath);
	}
	public int getImgno() {
		return imgno;
	}
	public void setImgno(int imgno) {
		this.imgno = imgno;
	}
	public String getImgfrom() {
		return imgfrom;
	}
	public void setImgfrom(String imgfrom) {
		this.imgfrom = imgfrom;
	}
	public int getImgfromno() {
		return imgfromno;
	}
	public void setImgfromno(int imgfromno) {
		this.imgfromno = imgfromno;
	}
	public String getImgrealpath() {
		return imgrealpath;
	}
	public void setImgrealpath(String imgrealpath) {
		this.imgrealpath = imgrealpath;
	}
	public String getImgviewpath() {
		return imgviewpath;
	}
	public void setImgviewpath(String imgviewpath) {
		this.imgviewpath = imgviewpath;
	}
	@Override
	public String toString() {
		return "ImgDTO [imgno=" + imgno + ", imgfrom=" + imgfrom + ", imgfromno=" + imgfromno + ", imgrealpath="
				+ imgrealpath + ", imgviewpath=" + imgviewpath + "]";
	}
	
	
	
}
