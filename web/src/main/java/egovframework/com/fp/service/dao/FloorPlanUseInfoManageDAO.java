package egovframework.com.fp.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.fp.service.FloorPlanUseInf;
import egovframework.com.fp.service.FloorPlanUseInfVO;

/**
 * 게시판 이용정보를 관리하기 위한 서비스 구현 클래스
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
 *   2011.7.27  안민정			동호회, 커뮤니티 로직 분리 (EgovBBSUseInfoManageServiceImpl -> EgovCmyBBSUseInfoManageServiceImpl)
 * 
 * </pre>
 */

@Repository("FloorPlanUseInfoManageDAO")
public class FloorPlanUseInfoManageDAO extends EgovComAbstractDAO {

	/**
	 * 게시판 사용 정보를 삭제한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void deleteBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception {
		update("FloorPlanUseInfoManageDAO.deleteBBSUseInf", bdUseInf);
	}

	/**
	 * 게시판 사용정보를 등록한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void insertBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception {
		insert("FloorPlanUseInfoManageDAO.insertBBSUseInf", bdUseInf);
	}

	/**
	 * 게시판 사용정보 목록을 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanUseInfVO> selectBBSUseInfs(FloorPlanUseInfVO bdUseVO)
			throws Exception {
		return (List<FloorPlanUseInfVO>) list(
				"FloorPlanUseInfoManageDAO.selectBBSUseInfs", bdUseVO);
	}

	/**
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public int selectBBSUseInfsCnt(FloorPlanUseInfVO bdUseVO) throws Exception {
		return (Integer) select(
				"FloorPlanUseInfoManageDAO.selectBBSUseInfsCnt", bdUseVO);
	}

	/**
	 * 게시판 사용정보에 대한 상세정보를 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public FloorPlanUseInfVO selectBBSUseInf(FloorPlanUseInfVO bdUseVO)
			throws Exception {
		return (FloorPlanUseInfVO) select(
				"FloorPlanUseInfoManageDAO.selectBBSUseInf", bdUseVO);
	}

	/**
	 * 게시판 사용정보를 수정한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void updateBBSUseInf(FloorPlanUseInf bdUseInf) throws Exception {
		update("FloorPlanUseInfoManageDAO.updateBBSUseInf", bdUseInf);
	}

	/**
	 * 게시판에 대한 사용정보를 삭제한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void deleteBBSUseInfByBoardId(FloorPlanUseInf bdUseInf)
			throws Exception {
		update("FloorPlanUseInfoManageDAO.deleteBBSUseInfByBoardId", bdUseInf);
	}

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanUseInfVO> selectBBSUseInfsByTrget(
			FloorPlanUseInfVO bdUseVO) throws Exception {
		return (List<FloorPlanUseInfVO>) list(
				"FloorPlanUseInfoManageDAO.selectBBSUseInfsByTrget", bdUseVO);
	}

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 전체 건수를 조회한다.
	 * 
	 * @param bdUseVO
	 * @return
	 * @throws Exception
	 */
	public int selectBBSUseInfsCntByTrget(FloorPlanUseInfVO bdUseVO)
			throws Exception {
		return (Integer) select(
				"FloorPlanUseInfoManageDAO.selectBBSUseInfsCntByTrget", bdUseVO);
	}

	/**
	 * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
	 * 
	 * @param bdUseInf
	 * @throws Exception
	 */
	public void updateBBSUseInfByTrget(FloorPlanUseInf bdUseInf)
			throws Exception {
		update("FloorPlanUseInfoManageDAO.updateBBSUseInfByTrget", bdUseInf);
	}
}
