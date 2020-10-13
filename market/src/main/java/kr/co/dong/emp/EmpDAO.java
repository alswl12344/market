/*
 * Emp 테이블에 관련된 기능 작성
 * 1. 테이블의 인원수를 구하기 => int empCount()
 * 2. 전체 조회
 * 3. 선택된 글 조회
 * 4. 선택된 글 조회수 증가
 * 
 */


package kr.co.dong.emp;

import java.util.List;

public interface EmpDAO {
	public int empCount() throws Exception;
	public List<EmpDTO> listAll() throws Exception;

}
