package egovframework.com.cons.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.cons.service.ConsumableInventoryVO;

@Repository("ConsumableBoardDAO")
public class ConsumableBoardDAO extends EgovComAbstractDAO {

	/**
	 * 시판에 게시물을 등록 한다.
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void insertCleanPaperUseRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		insert("ConsumableBoardDAO.insertCleanPaperUseRegister",consumableInventoryVO);
	}

	/**
	 * 유포지 재고 등록
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void insertConsumableInventoryRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		insert("ConsumableBoardDAO.insertConsumableInventoryRegister",consumableInventoryVO);
	}

	/**
	 * CodeId(소모품명)별 조회
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public ConsumableInventoryVO selectConsumableCodeInventory(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		return (ConsumableInventoryVO) select("ConsumableBoardDAO.selectConsumableCodeInventory", consumableInventoryVO);
	}

	/**
	 * 유포지 재고 현황 List 조회
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ConsumableInventoryVO> selectConsumableInventoryArticles(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<ConsumableInventoryVO>) list("ConsumableBoardDAO.selectConsumableInventoryArticles", consumableInventoryVO);
	}

	/**
	 * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public int selectConsumableInventoryArticlesListCnt(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return (Integer)select("ConsumableBoardDAO.selectBoardArticleListCnt", consumableInventoryVO);
	}

	/**
	 * 소모품 코드별 재고 현황
	 * @param string
	 * @param string2 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public ConsumableInventoryVO selectConsumableInventoryCnt(HashMap map) throws Exception{
		// TODO Auto-generated method stub
		return  (ConsumableInventoryVO) select("ConsumableBoardDAO.selectConsumableInventoryCnt", map);
	}

	/**
	 * 소모품 사용분 처리
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void updateConsumableInventoryUse(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		update("ConsumableBoardDAO.updateConsumableInventoryUse", consumableInventoryVO);
	}

	/**
	 * 유형별 등록현황 내 사용리스트
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked" })
	public List<ConsumableInventoryVO> selectUseList(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<ConsumableInventoryVO>) list("ConsumableBoardDAO.selectUseList", consumableInventoryVO);
	}

	/**
	 * 
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public int selectUseListCnt(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		return (Integer)select("ConsumableBoardDAO.selectUseListCnt", consumableInventoryVO);
	}

	/**
	 * 설비별 소모품 재고 파악용
	 * @param consumableInventoryVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ConsumableInventoryVO> selectInventoryArticles(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return (List<ConsumableInventoryVO>) list("ConsumableBoardDAO.selectInventoryArticles", consumableInventoryVO);
	}

	/**
	 * 소모품 재고현황 수정
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public ConsumableInventoryVO selectInventoryDetailVO(
			ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		return (ConsumableInventoryVO) select("ConsumableBoardDAO.selectInventoryDetailVO", consumableInventoryVO);
	}

	/**
	 * 소모품 재고현황 삭제
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void deleteConsumableInventory(
			ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		update("ConsumableBoardDAO.deleteConsumableInventory", consumableInventoryVO);
	}

	/**
	 * 설비별 소모품 사용현황 수정
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public ConsumableInventoryVO selectUseModify(HashMap map) throws Exception {
		// TODO Auto-generated method stub
		
		return  (ConsumableInventoryVO) select("ConsumableBoardDAO.selectUseModify", map);
	}

	/**
	 * 섭비별 소모품 수정
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void updateUseRegister(
			ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		update("ConsumableBoardDAO.updateUseRegister", consumableInventoryVO);
	}

	/**
	 * 크린롤러 반출 리스트
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<ConsumableInventoryVO> selectCleanRollerInventoryList(
			ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		return (List<ConsumableInventoryVO>) list("ConsumableBoardDAO.selectCleanRollerInventoryList", consumableInventoryVO);
	}

	/**
	 * 크린롤러 반출 리스트 카운트
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public int selectCleanRollerInventoryListCnt(
			ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		return (Integer)select("ConsumableBoardDAO.selectCleanRollerInventoryListCnt", consumableInventoryVO);
	}

	/**
	 * 크린롤러 반출 리스트
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public ConsumableInventoryVO selectCleanRollerInventory(HashMap map) throws Exception{
		// TODO Auto-generated method stub
		return  (ConsumableInventoryVO) select("ConsumableBoardDAO.selectCleanRollerInventory", map);
	}

	/**
	 * 크린롤러 반출 리스트 등록
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void insertCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		insert("ConsumableBoardDAO.insertCleanRollerTakeOutList",consumableInventoryVO);
	}

	/**
	 * 크린롤러 반출리스트 상세조회
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	public ConsumableInventoryVO selectCleanRollerDetailVO(ConsumableInventoryVO consumableInventoryVO) throws Exception {
		// TODO Auto-generated method stub
		return  (ConsumableInventoryVO) select("ConsumableBoardDAO.selectCleanRollerDetailVO", consumableInventoryVO);
	}

	/**
	 * 반출리스트 업데이트
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void updateCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		update("ConsumableBoardDAO.updateCleanRollerTakeOutList", consumableInventoryVO);
	}

	/**
	 * 반출 진행
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	public void deleteCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception{
		// TODO Auto-generated method stub
		update("ConsumableBoardDAO.deleteCleanRollerTakeOutList", consumableInventoryVO);
	}

}
