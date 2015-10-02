package egovframework.com.cons.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cons.service.ConsumableBoardService;
import egovframework.com.cons.service.ConsumableInventoryVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("ConsumableBoardService")
public class ConsumableBoardServiceImpl extends EgovAbstractServiceImpl implements ConsumableBoardService {

	@Resource(name = "egovNttIdGnrService")
    private EgovIdGnrService nttIdgenService;
	
	@Resource(name = "ConsumableBoardDAO")
	private ConsumableBoardDAO consumableBoardDAO;
	
	/**
	 * 게시판에 게시물 또는 답변 게시물을 등록 한다.
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	@Override
	public void insertCleanPaperUseRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.insertCleanPaperUseRegister(consumableInventoryVO);
	}

	/*
	 * 유포지 재고 등록
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#insertConsumableInventoryRegister(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void insertConsumableInventoryRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.insertConsumableInventoryRegister(consumableInventoryVO);
	}

	/*
	 * CodeId(소모품명)별 조회
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectConsumableCodeInventory(java.lang.String)
	 */
	@Override
	public ConsumableInventoryVO selectConsumableCodeInventory(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return consumableBoardDAO.selectConsumableCodeInventory(consumableInventoryVO);
	}

	/*
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectConsumableInventoryArticles(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public Map<String, Object> selectConsumableInventoryArticles(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		
		List<ConsumableInventoryVO> list = consumableBoardDAO.selectConsumableInventoryArticles(consumableInventoryVO);
		
		
		int cnt = consumableBoardDAO.selectConsumableInventoryArticlesListCnt(consumableInventoryVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}

	/**
	 * 소모품 코드별 재고 현황
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public ConsumableInventoryVO selectConsumableInventoryCnt(HashMap map)
			throws Exception {
		// TODO Auto-generated method stub
		return consumableBoardDAO.selectConsumableInventoryCnt(map);
		
	}

	/**
	 * 소모품 사용분 처리
	 */
	@Override
	public void updateConsumableInventoryUse(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.updateConsumableInventoryUse(consumableInventoryVO);
	}

	/**
	 * 유형별 등록현황 내 사용리스트
	 */
	public Map<String, Object> selectUseList(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		List<ConsumableInventoryVO> list = consumableBoardDAO.selectUseList(consumableInventoryVO);
		
		
		Map<String, Object> invenMap = new HashMap<String, Object>();
		
		invenMap.put("resultList", list);
		
		return invenMap;
	}
	
	@Override
	public int selectUseListCnt(ConsumableInventoryVO consumableInventoryVO)
			throws Exception {
		// TODO Auto-generated method stub
		int cnt = consumableBoardDAO.selectUseListCnt(consumableInventoryVO);
		
		return cnt;
	}

	/*
	 * 설비별 소모품 재고파악용
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectInventoryArticles(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public Map<String, Object> selectInventoryArticles(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		List<ConsumableInventoryVO> list = consumableBoardDAO.selectInventoryArticles(consumableInventoryVO);
		
		//int cnt = consumableBoardDAO.selectConsumableInventoryArticlesListCnt(consumableInventoryVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", list);
		//map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}

	/*
	 * 소모품 재고현황 수정
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectInventoryDetailVO(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public ConsumableInventoryVO selectInventoryDetailVO(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return consumableBoardDAO.selectInventoryDetailVO(consumableInventoryVO);
	}

	/*
	 * 소모품 재고 삭제
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#deleteConsumableInventory(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void deleteConsumableInventory(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableInventoryVO.setNote("이 글은 작성자에 의해서 삭제되었습니다.");
		
		consumableBoardDAO.deleteConsumableInventory(consumableInventoryVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public ConsumableInventoryVO selectUseModify(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		
		return consumableBoardDAO.selectUseModify(map);
		
	}

	/*
	 * 설비별 소모품 수정
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#updateCleanPaperUseRegister(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void updateUseRegister(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.updateUseRegister(consumableInventoryVO);
	}

	@Override
	public Map<String, Object> selectCleanRollerInventoryList(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		List<ConsumableInventoryVO> list = consumableBoardDAO.selectCleanRollerInventoryList(consumableInventoryVO);
		
		
		int cnt = consumableBoardDAO.selectCleanRollerInventoryListCnt(consumableInventoryVO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultList", list);
		map.put("resultCnt", Integer.toString(cnt));
		
		return map;
	}

	/*
	 * 크린롤러 반출리스트
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectCleanRollerInventory(java.util.HashMap)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public ConsumableInventoryVO selectCleanRollerInventory(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		return consumableBoardDAO.selectCleanRollerInventory(map);
	}

	/*
	 * 반출리스트 등록
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#insertCleanRollerTakeOutList(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void insertCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.insertCleanRollerTakeOutList(consumableInventoryVO);
	}

	/*
	 * 반출리스트 상세조회
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#selectCleanRollerDetailVO(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public ConsumableInventoryVO selectCleanRollerDetailVO(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return consumableBoardDAO.selectCleanRollerDetailVO(consumableInventoryVO);
	}

	/*
	 * 반출리스트 업데이트
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#updateCleanRollerTakeOutList(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void updateCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.updateCleanRollerTakeOutList(consumableInventoryVO);
	}

	/*
	 * 반출 진행
	 * (non-Javadoc)
	 * @see egovframework.com.cons.service.ConsumableBoardService#deleteCleanRollerTakeOutList(egovframework.com.cons.service.ConsumableInventoryVO)
	 */
	@Override
	public void deleteCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		consumableBoardDAO.deleteCleanRollerTakeOutList(consumableInventoryVO);
	}

}
