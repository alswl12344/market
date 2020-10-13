package kr.co.dong.delivery;

public class ManagementDTO {
	
		private int mcode;
		private	String mname;
		private String maddress;
		private String mnum;
		private String userid;
		
		public int getMcode() {
			return mcode;
		}
		public void setMcode(int mcode) {
			this.mcode = mcode;
		}
		public String getMname() {
			return mname;
		}
		public void setMname(String mname) {
			this.mname = mname;
		}
		public String getMaddress() {
			return maddress;
		}
		public void setMaddress(String maddress) {
			this.maddress = maddress;
		}
		public String getMnum() {
			return mnum;
		}
		public void setMnum(String mnum) {
			this.mnum = mnum;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		@Override
		public String toString() {
			return "ManagementDTO [mcode=" + mcode + ", mname=" + mname + ", maddress=" + maddress + ", mnum=" + mnum
					+ ", userid=" + userid + "]";
		}
		
}
