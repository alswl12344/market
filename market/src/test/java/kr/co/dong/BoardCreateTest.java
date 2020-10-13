package kr.co.dong;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dong.board.BoardDAO;
import kr.co.dong.board.BoardDTO;

// 현재 테스트 코드를 실행할 때 스프링이 로딩되도록 하는 부분
@RunWith(SpringJUnit4ClassRunner.class)
// 속성 경로의 xml파일을 이용해 스프링이 로딩 된다.
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class BoardCreateTest {
	// 위에서 스프링이 정상적으로 동작할 경우 스프링이 생성해서 주입해준다.
	@Inject
	private BoardDAO boardDAO;
	
	@Test
	public void testInsert() throws Exception{
		BoardDTO boardDTO;
		
		for(int i=1; i<1000; i++) {
			boardDTO = new BoardDTO();
			boardDTO.setBtitle("Test Title ["+i+"]");
			boardDTO.setBcontent("Test Content"+i);
			boardDTO.setBwriter("root");
			
			boardDAO.Insert(boardDTO);
			
			// 1초 = 1000, 1초간 멈추는 것(과부하 때문에) 기억해두기
			// Thread = 언제든지 상태 대기 중, 각각의 작업 단위로 이루어짐
			// ex) 카카오톡 메신저 오면 알림 오는 것처럼
			Thread.sleep(1000);
		}
	}
}




