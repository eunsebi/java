package egovframework.com.fp.service.dao;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;

@Repository("FloorPlanAddedOptionsDAO")
public class FloorPlanAddedOptionsDAO extends EgovComAbstractDAO {

	/**
	 * 신규 게시판 추가기능 정보를 등록한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public String insertAddedOptionsInf(FloorPlanMaster boardMaster)
			throws Exception {
		return (String) insert(
				"FloorPlanAddedOptionsDAO.insertAddedOptionsInf", boardMaster);
	}

	/**
	 * 게시판 추가기능 정보 한 건을 상세조회 한다.
	 * 
	 * @param FloorPlanMasterVO
	 */
	public FloorPlanMasterVO selectAddedOptionsInf(FloorPlanMaster vo)
			throws Exception {
		return (FloorPlanMasterVO) select(
				"FloorPlanAddedOptionsDAO.selectAddedOptionsInf", vo);
	}

	/**
	 * 게시판 추가기능 정보를 수정한다.
	 * 
	 * @param FloorPlanMaster
	 */
	public void updateAddedOptionsInf(FloorPlanMaster boardMaster)
			throws Exception {
		update("FloorPlanAddedOptionsDAO.updateAddedOptionsInf", boardMaster);
	}
}
