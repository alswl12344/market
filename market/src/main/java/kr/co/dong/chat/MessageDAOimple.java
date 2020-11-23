package kr.co.dong.chat;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class MessageDAOimple implements MessageDAO {

	
	@Inject
	private SqlSession sqlsession;
	
	private static final String namespace ="kr.co.dong.chat";

	@Override
	public int getChatroom(ChatroomDTO chatroomDTO) {
		// TODO Auto-generated method stub

		return sqlsession.insert(namespace+".getChatroom", chatroomDTO);
	}


	
}
