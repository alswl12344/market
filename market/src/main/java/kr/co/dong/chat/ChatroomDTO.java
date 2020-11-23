/*roomcode varchar(100) PK 
userid varchar(45) 
message varchar(500) 
friendid varchar(45) 
chatdate varchar(50)*/

package kr.co.dong.chat;

public class ChatroomDTO {

		private String roomcode;
		private String userid;
		private String message;
		private String friendid;
		private String chatdate;
		
	
		public String getRoomcode() {
			return roomcode;
		}
		public void setRoomcode(String roomcode) {
			this.roomcode = roomcode;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getMessage() {
			return message;
		}
		public void setMessage(String message) {
			this.message = message;
		}
		public String getFriendid() {
			return friendid;
		}
		public void setFriendid(String friendid) {
			this.friendid = friendid;
		}
		public String getChatdate() {
			return chatdate;
		}
		public void setChatdate(String chatdate) {
			this.chatdate = chatdate;
		}
		@Override
		public String toString() {
			return "ChatroomDTO [roomcode=" + roomcode + ", userid=" + userid + ", message=" + message + ", friendid="
					+ friendid + ", chatdate=" + chatdate + "]";
		}
		
		
	
	
}
