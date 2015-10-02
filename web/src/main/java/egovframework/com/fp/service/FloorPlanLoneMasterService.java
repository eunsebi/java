package egovframework.com.fp.service;

import java.util.Map;

/**
 * 게시판 속성관리를 위한 서비스 인터페이스 클래스
 * 
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.08.25
 * @version 1.0
 * @see
 * 
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.08.25  한성곤          최초 생성
 * 
 * </pre>
 */

public interface FloorPlanLoneMasterService {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void deleteMaster(FloorPlanMaster boardMaster) throws Exception;

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public String insertMaster(FloorPlanMaster boardMaster) throws Exception;

	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public FloorPlanMasterVO selectMaster(FloorPlanMaster searchVO)
			throws Exception;

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public Map<String, Object> selectMasterList(FloorPlanMasterVO searchVO)
			throws Exception;

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void updateMaster(FloorPlanMaster boardMaster) throws Exception;

}
