package egovframework.com.fp.service.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;

@Repository("FloorPlanAttributeManageDAO")
public class FloorPlanAttributeManageDAO extends EgovComAbstractDAO {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void deleteBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception {
		update("FloorPlanAttributeManageDAO.deleteBBSMasterInf", boardMaster);
	}

	/**
	 * 신규 게시판 속성정보를 등록한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public String insertBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception {
		return (String) insert(
				"FloorPlanAttributeManageDAO.insertBBSMasterInf", boardMaster);
	}

	/**
	 * 게시판 속성정보 한 건을 상세조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public FloorPlanMasterVO selectBBSMasterInf(FloorPlanMaster vo)
			throws Exception {
		return (FloorPlanMasterVO) select(
				"FloorPlanAttributeManageDAO.selectBBSMasterInf", vo);
	}

	/**
	 * 게시판 속성정보 목록을 조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectBBSMasterInfs(FloorPlanMasterVO vo)
			throws Exception {
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanAttributeManageDAO.selectBBSMasterInfs", vo);
	}

	/**
	 * 게시판 속성정보 목록 숫자를 조회한다
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectBBSMasterInfsCnt(FloorPlanMasterVO vo) throws Exception {
		return (Integer) select(
				"FloorPlanAttributeManageDAO.selectBBSMasterInfsCnt", vo);
	}

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void updateBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception {
		update("FloorPlanAttributeManageDAO.updateBBSMasterInf", boardMaster);
	}

	/**
	 * 템플릿의 유효여부를 점검한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public boolean validateTemplate(FloorPlanMasterVO vo) throws Exception {
		return true;
	}

	/**
	 * 유효한 게시판 목록을 불러온다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectAllBBSMasteInf(FloorPlanMasterVO vo)
			throws Exception {
		// 커뮤니티, 동호회의 게시판이 나오지 않도록 COMTNBBSUSE 테이블과 Join 필요
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanAttributeManageDAO.selectAllBBSMaster", vo);
	}

	/**
	 * 사용중인 게시판 속성정보 목록을 조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectBdMstrListByTrget(FloorPlanMasterVO vo)
			throws Exception {
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanAttributeManageDAO.selectBdMstrListByTrget", vo);
	}

	/**
	 * 사용중인 게시판 속성정보 목록 숫자를 조회한다
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectBdMstrListCntByTrget(FloorPlanMasterVO vo)
			throws Exception {
		return (Integer) select(
				"FloorPlanAttributeManageDAO.selectBdMstrListCntByTrget", vo);
	}

	/**
	 * 커뮤니티, 동호회등 게시판 사용등록이 된 게시판 목록 전체를 불러온다.
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectAllBdMstrByTrget(FloorPlanMasterVO vo)
			throws Exception {
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanAttributeManageDAO.selectAllBdMstrByTrget", vo);
	}

	/**
	 * 사용 중이지 않은 게시판 속성정보 목록을 조회한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanMasterVO> selectNotUsedBdMstrList(FloorPlanMasterVO vo)
			throws Exception {
		return (List<FloorPlanMasterVO>) list(
				"FloorPlanAttributeManageDAO.selectNotUsedBdMstrList", vo);
	}

	/**
	 * 사용 중이지 않은 게시판 속성정보 목록 숫자를 조회한다
	 * 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectNotUsedBdMstrListCnt(FloorPlanMasterVO vo)
			throws Exception {
		return (Integer) select(
				"FloorPlanAttributeManageDAO.selectNotUsedBdMstrListCnt", vo);
	}

}
