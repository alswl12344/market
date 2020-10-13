package kr.co.dong.delivery;

import java.util.List;

public interface DeliveryService {
	 
	//배송지 목록
	public List<DeliveryDTO> dview();
	//주소록 관리 목록
	public List<ManagementDTO> management();
	// 주소 추가
	public int insert(ManagementDTO managementDTO); 
	// 주소 삭제 
	public int delete(int mcode);
	// 주소 수정 처리
	public int update(ManagementDTO managementDTO);
	// 주소지 선택 조회
	public ManagementDTO managementdetail(int mcode);	
}
