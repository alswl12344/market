package kr.co.dong.chat;



import javax.inject.Inject;

import org.springframework.stereotype.Service;



@Service
public class MessageServiceImple implements MessageService {

	@Inject
	private MessageDAO mDAO;

	@Override
	public int getChatroom(ChatroomDTO chatroomDTO) {
		// TODO Auto-generated method stub

		return mDAO.getChatroom(chatroomDTO);
	}

		
	
}
