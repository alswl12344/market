/*
 * Service는 DAO 호출을 담당한다.
 */

package kr.co.dong.emp;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EmpServiceImpl implements EmpService {

	@Inject
	private EmpDAO dao;
	
	@Override
	public int empCount() throws Exception {
		
		return dao.empCount();
	}

	@Override
	public List<EmpDTO> listAll() throws Exception {
		
		return null;
	}

	
	
}
