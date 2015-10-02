package egovframework.com.fp.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.fp.service.FloorPlanAttributeManageService;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;
import egovframework.com.fp.service.FloorPlanUseInf;
import egovframework.com.fp.service.dao.FloorPlanAddedOptionsDAO;
import egovframework.com.fp.service.dao.FloorPlanAttributeManageDAO;
import egovframework.com.fp.service.dao.FloorPlanUseInfoManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("FloorPlanAttributeManageService")
public class FloorPlanAttributeManageServiceImpl extends
		EgovAbstractServiceImpl implements FloorPlanAttributeManageService {

	@Resource(name = "FloorPlanAttributeManageDAO")
	private FloorPlanAttributeManageDAO attrbMngDAO;

	@Resource(name = "FloorPlanUseInfoManageDAO")
	private FloorPlanUseInfoManageDAO bbsUseDAO;

	@Resource(name = "EgovUserInfManageService")
	private EgovUserInfManageService userService;

	@Resource(name = "egovFloorPlanMstrIdGnrService")
	private EgovIdGnrService idgenService;

	// ---------------------------------
	// 2009.06.26 : 2단계 기능 추가
	// ---------------------------------
	@Resource(name = "FloorPlanAddedOptionsDAO")
	private FloorPlanAddedOptionsDAO addedOptionsDAO;

	// //-------------------------------

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#deleteBBSMasterInf(egovframework.com.cop.bbs.FloorPlanMaster.service.BoardMaster)
	 */
	public void deleteBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception {
		attrbMngDAO.deleteBBSMasterInf(boardMaster);

		FloorPlanUseInf bdUseInf = new FloorPlanUseInf();

		bdUseInf.setBbsId(boardMaster.getBbsId());
		bdUseInf.setLastUpdusrId(boardMaster.getLastUpdusrId());

		bbsUseDAO.deleteBBSUseInfByBoardId(bdUseInf);
	}

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#insertBBSMastetInf(egovframework.com.cop.bbs.FloorPlanMaster.service.BoardMaster)
	 */
	public String insertBBSMastetInf(FloorPlanMaster boardMaster)
			throws Exception {
		String bbsId = idgenService.getNextStringId();

		boardMaster.setBbsId(bbsId);

		attrbMngDAO.insertBBSMasterInf(boardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		if (boardMaster.getOption().equals("comment")
				|| boardMaster.getOption().equals("stsfdg")) {
			addedOptionsDAO.insertAddedOptionsInf(boardMaster);
		}
		// //-------------------------------

		if ("Y".equals(boardMaster.getBbsUseFlag())) {
			FloorPlanUseInf bdUseInf = new FloorPlanUseInf();

			bdUseInf.setBbsId(bbsId);
			bdUseInf.setTrgetId(boardMaster.getTrgetId());
			bdUseInf.setRegistSeCode(boardMaster.getRegistSeCode());
			bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());
			bdUseInf.setUseAt("Y");

			bbsUseDAO.insertBBSUseInf(bdUseInf);

			UserInfVO userVO = new UserInfVO();
			userVO.setTrgetId(boardMaster.getTrgetId());

			List<UserInfVO> tmpList = null;
			Iterator<UserInfVO> iter = null;

			if ("REGC05".equals(boardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllClubUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					bdUseInf = new FloorPlanUseInf();

					bdUseInf.setBbsId(bbsId);
					bdUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					bdUseInf.setRegistSeCode("REGC07");
					bdUseInf.setUseAt("Y");
					bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());

					bbsUseDAO.insertBBSUseInf(bdUseInf);
				}
			} else if ("REGC06".equals(boardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllCmmntyUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					bdUseInf = new FloorPlanUseInf();

					bdUseInf.setBbsId(bbsId);
					bdUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					bdUseInf.setRegistSeCode("REGC07");
					bdUseInf.setUseAt("Y");
					bdUseInf.setFrstRegisterId(boardMaster.getFrstRegisterId());

					bbsUseDAO.insertBBSUseInf(bdUseInf);
				}
			}
		}
		return bbsId;
	}

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectAllBBSMasteInf(egovframework.com.cop.bbs.FloorPlanMasterVO.service.BoardMasterVO)
	 */
	public List<FloorPlanMasterVO> selectAllBBSMasteInf(FloorPlanMasterVO vo)
			throws Exception {
		return attrbMngDAO.selectAllBBSMasteInf(vo);
	}

	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInf(egovframework.com.cop.bbs.FloorPlanMasterVO.service.BoardMasterVO)
	 */
	public FloorPlanMasterVO selectBBSMasterInf(FloorPlanMaster searchVO)
			throws Exception {
		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		// return attrbMngDAO.selectBBSMasterInf(searchVO);

		FloorPlanMasterVO result = attrbMngDAO.selectBBSMasterInf(searchVO);

		// String flag = EgovProperties.getProperty("Globals.addedOptions");
		// if (flag != null && flag.trim().equalsIgnoreCase("true")) {
		if (EgovComponentChecker.hasComponent("EgovBBSCommentService")
				|| EgovComponentChecker
						.hasComponent("EgovBBSSatisfactionService")) {// 2011.09.15
			FloorPlanMasterVO options = addedOptionsDAO
					.selectAddedOptionsInf(searchVO);

			if (options != null) {
				if (options.getCommentAt().equals("Y")) {
					result.setOption("comment");
				}

				if (options.getStsfdgAt().equals("Y")) {
					result.setOption("stsfdg");
				}
			} else {
				result.setOption("na"); // 미지정 상태로 수정 가능 (이미 지정된 경우는 수정 불가로 처리)
			}
		}

		return result;
		// //-------------------------------

	}

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInfs(egovframework.com.cop.bbs.FloorPlanMasterVO.service.BoardMasterVO)
	 */
	public Map<String, Object> selectBBSMasterInfs(FloorPlanMasterVO searchVO)
			throws Exception {
		List<FloorPlanMasterVO> result = attrbMngDAO
				.selectBBSMasterInfs(searchVO);
		int cnt = attrbMngDAO.selectBBSMasterInfsCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#updateBBSMasterInf(egovframework.com.cop.bbs.FloorPlanMaster.service.BoardMaster)
	 */
	public void updateBBSMasterInf(FloorPlanMaster boardMaster)
			throws Exception {
		attrbMngDAO.updateBBSMasterInf(boardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------

		if (boardMaster.getOption().equals("comment")
				|| boardMaster.getOption().equals("stsfdg")) {
			if (boardMaster.getOption().equals("na")) {
				return;
			}
			FloorPlanMasterVO options = addedOptionsDAO
					.selectAddedOptionsInf(boardMaster);

			if (options == null) {
				boardMaster.setFrstRegisterId(boardMaster.getLastUpdusrId());
				addedOptionsDAO.insertAddedOptionsInf(boardMaster);
			} else {
				// 수정 기능 제외 (새롭게 선택사항을 지정한 insert만 처리함)
				// addedOptionsDAO.updateAddedOptionsInf(boardMaster);
				egovLogger.debug("BBS Master update ignored...");
			}
		}
		// //-------------------------------
	}

	/**
	 * 템플릿의 유효여부를 점검한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#validateTemplate(egovframework.com.cop.bbs.FloorPlanMasterVO.service.BoardMasterVO)
	 */
	public void validateTemplate(FloorPlanMasterVO searchVO) throws Exception {
		egovLogger.debug("validateTemplate method ignored...");
	}

	/**
	 * 사용중인 게시판 속성 정보의 목록을 조회 한다.
	 */
	public Map<String, Object> selectBdMstrListByTrget(FloorPlanMasterVO vo)
			throws Exception {
		List<FloorPlanMasterVO> result = attrbMngDAO
				.selectBdMstrListByTrget(vo);
		int cnt = attrbMngDAO.selectBdMstrListCntByTrget(vo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 커뮤니티, 동호회에서 사용중인 게시판 속성 정보의 목록을 전체조회 한다.
	 */
	public List<FloorPlanMasterVO> selectAllBdMstrByTrget(FloorPlanMasterVO vo)
			throws Exception {
		return attrbMngDAO.selectAllBdMstrByTrget(vo);
	}

	/**
	 * 사용중이지 않은 게시판 속성 정보의 목록을 조회 한다.
	 */
	public Map<String, Object> selectNotUsedBdMstrList(
			FloorPlanMasterVO searchVO) throws Exception {
		List<FloorPlanMasterVO> result = attrbMngDAO
				.selectNotUsedBdMstrList(searchVO);
		int cnt = attrbMngDAO.selectNotUsedBdMstrListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

}
