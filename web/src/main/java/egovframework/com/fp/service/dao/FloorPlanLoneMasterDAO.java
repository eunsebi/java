package egovframework.com.fp.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;

/**
 * 게시판 속성정보 관리를 위한 데이터 접근 클래스
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

@Repository("FloorPlanLoneMasterDAO")
public class FloorPlanLoneMasterDAO extends EgovComAbstractDAO {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void deleteMaster(FloorPlanMaster boardMaster) throws Exception {
		update("FloorPlanLoneMasterDAO.deleteMaster", boardMaster);
	}

	/**
	 * 신규 게시판 속성정보를 등록한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public String insertMaster(FloorPlanMaster boardMaster) throws Exception {
		return (String) insert("FloorPlanLoneMasterDAO.insertMaster",
				boardMaster);
	}

	/**
	 * 게시판 속성정보 한 건을 상세조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public FloorPlanMasterVO selectMaster(FloorPlanMaster vo) throws Exception {
		return (FloorPlanMasterVO) select(
				"FloorPlanLoneMasterDAO.selectMaster", vo);
	}

	/**
	 * 게시판 속성정보 목록을 조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectMasterList(FloorPlanMasterVO vo)
			throws Exception {
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanLoneMasterDAO.selectMasterList", vo);
	}

	/**
	 * 게시판 속성정보 목록 숫자를 조회한다
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectMasterListCnt(FloorPlanMasterVO vo) throws Exception {
		return (Integer) select("FloorPlanLoneMasterDAO.selectMasterListCnt",
				vo);
	}

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void updateMaster(FloorPlanMaster boardMaster) throws Exception {
		update("FloorPlanLoneMasterDAO.updateMaster", boardMaster);
	}

}
