package egovframework.com.fp.service;

import java.util.Map;

/**
 * 게시판 이용정보를 관리하기 위한 서비스 인터페이스 클래스
 * 
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 * 
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.2   이삼섭          최초 생성
 *  2011.7.27  안민정			동호회, 커뮤니티 로직 분리  (EgovBBSUseInfoManageService -> EgovCmyBBSUseInfoManageService)
 * </pre>
 */

public interface FloorPlanUseInfoManageService {

	/**
	 * 게시판 사용 정보를 삭제한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void deleteBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception;

	/**
	 * 게시판 사용정보를 등록한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void insertBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception;

	/**
	 * 게시판 사용정보 목록을 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectBBSUseInfs(FloorPlanUseInfVO bdUseVO)
			throws Exception;

	/**
	 * 게시판 사용정보를 수정한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void updateBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception;

	/**
	 * 게시판 사용정보에 대한 상세정보를 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public FloorPlanUseInfVO selectBBSUseInf(FloorPlanUseInfVO bdUseVO)
			throws Exception;

	/**
	 * 게시판에 대한 사용정보를 삭제한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void deleteBBSUseInfByBoardId(FloorPlanUseInf bdUseInf)
			throws Exception;

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectBBSUseInfsByTrget(FloorPlanUseInfVO bdUseVO)
			throws Exception;

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void updateBBSUseInfByTrget(FloorPlanUseInf bdUseInf)
			throws Exception;

}
