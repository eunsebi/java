package egovframework.com.fp.service;

import java.util.List;
import java.util.Map;

public interface FloorPlanAttributeManageService {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void deleteBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception;

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public String insertBBSMastetInf(FloorPlanMaster boardMaster)
			throws Exception;

	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public FloorPlanMasterVO selectBBSMasterInf(FloorPlanMaster searchVO)
			throws Exception;

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public Map<String, Object> selectBBSMasterInfs(FloorPlanMasterVO searchVO)
			throws Exception;

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void updateBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception;

	/**
	 * 템플릿의 유효여부를 점검한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public void validateTemplate(FloorPlanMasterVO searchVO) throws Exception;

	/**
	 * 유효한 게시판 마스터 정보를 호출한다.
	 * 
	 * @param searchVO
	 * @return
	 * @throws Exception
	 */
	public List<FloorPlanMasterVO> selectAllBBSMasteInf(FloorPlanMasterVO vo)
			throws Exception;

	/**
	 * 사용중인 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public Map<String, Object> selectBdMstrListByTrget(FloorPlanMasterVO vo)
			throws Exception;

	/**
	 * 커뮤니티, 동호회에서 사용중인 게시판 속성 정보의 목록을 전체조회 한다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<FloorPlanMasterVO> selectAllBdMstrByTrget(FloorPlanMasterVO vo)
			throws Exception;

	/**
	 * 사용중이지 않은 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectNotUsedBdMstrList(FloorPlanMasterVO vo)
			throws Exception;

}
