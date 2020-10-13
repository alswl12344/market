package kr.co.dong.delivery;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
@Service
public class DeliveryServiceImpl implements DeliveryService{
	@Inject
	private DeliveryDAO deliveryDAO;

	@Override
	public List<DeliveryDTO> dview() {
		// 배송 목록
		return deliveryDAO.dview();
	}

	@Override
	public List<ManagementDTO> management() {
		// 주소록 목록
		return deliveryDAO.management();
	}

	@Override
	public int insert(ManagementDTO managementDTO) {
		// 주소 추가
		return deliveryDAO.insert(managementDTO);
	}

	@Override
	public int delete(int mcode) {
		// 주소 삭제
		return deliveryDAO.delete(mcode);
	}

	@Override
	public int update(ManagementDTO managementDTO) {
		// 주소 수정
		return deliveryDAO.update(managementDTO);
	}

	@Override
	public ManagementDTO managementdetail(int mcode) {
		// 주소 조회
		return deliveryDAO.managementdetail(mcode);
	}
}
