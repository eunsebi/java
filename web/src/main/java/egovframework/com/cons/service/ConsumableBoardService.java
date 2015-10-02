package egovframework.com.cons.service;

import java.util.HashMap;
import java.util.Map;

public interface ConsumableBoardService {

	/**
	 * 유포지 게시물 등록한다.
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void insertCleanPaperUseRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 유포지 재고 등록
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void insertConsumableInventoryRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * CodeId(소모품명)별 조회
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	ConsumableInventoryVO selectConsumableCodeInventory(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 유포지 재고현황 List
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectConsumableInventoryArticles(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 유포지 코드별 재고 현황
	 * @param map
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	ConsumableInventoryVO selectConsumableInventoryCnt(HashMap map) throws Exception;

	/**
	 * 유포지 사용분 처리
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void updateConsumableInventoryUse(ConsumableInventoryVO consumableInventoryVO) throws Exception;


	/**
	 * 유형별 등록현황 내 사용리스트
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectUseList(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 설비별 소모품 재고파악용
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception 
	 */
	Map<String, Object> selectInventoryArticles(
			ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 설비별 리스트 출력 총 갯수
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	int selectUseListCnt(ConsumableInventoryVO consumableInventoryVO)throws Exception;

	/**
	 * 소모품 재고현황 수정
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	ConsumableInventoryVO selectInventoryDetailVO(
			ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 소모품 재고 삭제
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void deleteConsumableInventory(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 설비별 소모품 사용현황 수정
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	ConsumableInventoryVO selectUseModify(HashMap map) throws Exception;

	/**
	 * 설비별 소모품 수정
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void updateUseRegister(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 크린롤러 반출 리스트
	 * @param consumableInventoryVO
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectCleanRollerInventoryList(
			ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 크닐롤러 반출 리스트
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	ConsumableInventoryVO selectCleanRollerInventory(HashMap map) throws Exception;

	/**
	 * 반출리스트 등록
	 * @param consumableInventoryVO
	 * @throws Exception
	 */
	void insertCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 반출리스트 상세조회
	 * @param consumableInventoryVO
	 * @return 
	 * @throws Exception
	 */
	ConsumableInventoryVO selectCleanRollerDetailVO(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 반출리스트 업데이트
	 * @param consumableInventoryVO
	 */
	void updateCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception;

	/**
	 * 반출
	 * @param consumbleInventoryVO
	 * @throws Exception
	 */
	void deleteCleanRollerTakeOutList(ConsumableInventoryVO consumableInventoryVO) throws Exception;

}
