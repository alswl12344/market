/*
 * Table: friend
Columns:
usercode int 
friendcode int 
friendname varchar(45) 
friendid varchar(45) 
userid varchar(45)*/

package kr.co.dong.user;

public class FriendDTO {

		private int usercode;
		private int friendcode;
		private String friendname;
		private String friendid;
		private String userid;
		private int friendno;
		
		
		public int getUsercode() {
			return usercode;
		}
		public void setUsercode(int usercode) {
			this.usercode = usercode;
		}
		public int getFriendcode() {
			return friendcode;
		}
		public void setFriendcode(int friendcode) {
			this.friendcode = friendcode;
		}
		public String getFriendname() {
			return friendname;
		}
		public void setFriendname(String friendname) {
			this.friendname = friendname;
		}
		public String getFriendid() {
			return friendid;
		}
		public void setFriendid(String friendid) {
			this.friendid = friendid;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		
		public int getFriendno() {
			return friendno;
		}
		public void setFriendno(int friendno) {
			this.friendno = friendno;
		}
		@Override
		public String toString() {
			return "FriendDTO [usercode=" + usercode + ", friendcode=" + friendcode + ", friendname=" + friendname
					+ ", friendid=" + friendid + ", userid=" + userid + ", friendno=" + friendno + "]";
		}


}
