/*
 * 글 읽기 : 1) 조회수 증가 2)글 읽기
 * read(){
 * 		dao 4 호출
 * 		dao 3 호출
 * }
 */

package kr.co.dong.emp;

import java.util.List;

public interface EmpService {
	public int empCount() throws Exception;
	public List<EmpDTO> listAll() throws Exception;
}
