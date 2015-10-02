package egovframework.com.mtb.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cop.com.service.EgovUserInfManageService;
import egovframework.com.cop.com.service.UserInfVO;
import egovframework.com.mtb.service.MTBoardAttributeManageService;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.com.mtb.service.MTBoardUseInf;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * PM 스케쥴 게시판 속성관리를 위한 서비스 구현 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.3.24  이삼섭          최초 생성
 *   2009.06.26	한성곤		2단계 기능 추가 (댓글관리, 만족도조사)
 *   2011.09.15 서준식       댓글, 만족도 조사 적용 방법 변경
 * </pre>
 */

@Service("MTBoardAttributeManageService")
public class MTBoardAttributeManageServiceImpl extends EgovAbstractServiceImpl implements MTBoardAttributeManageService {

	@Resource(name = "EgovUserInfManageService")
    private EgovUserInfManageService userService;
	
	@Resource(name ="MTBoardAttributeManageDAO")
	private MTBoardAttributeManageDAO mtboardAttrbMngDAO;
	
	@Resource(name = "egovMTBMstrIdGnrService")
    private EgovIdGnrService idgenService;
	
	@Resource(name = "MTBoardUseInfoManageDAO")
	private MTBoardUseInfoManageDAO mtboardUseDAO;
	
	//---------------------------------
    // 2009.06.26 : 2단계 기능 추가
    //---------------------------------
    @Resource(name = "MTBoardAddedOptionsDAO")
    private MTBoardAddedOptionsDAO addedOptionsDAO;
    ////-------------------------------
	
	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#deleteBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
	 */
	public void deleteBBSMasterInf(MTBoardMaster mtboardMaster) throws Exception {
		mtboardAttrbMngDAO.deleteBBSMasterInf(mtboardMaster);

		MTBoardUseInf mtboardUseInf = new MTBoardUseInf();

		mtboardUseInf.setBbsId(mtboardMaster.getBbsId());
		mtboardUseInf.setLastUpdusrId(mtboardMaster.getLastUpdusrId());

		mtboardUseDAO.deleteBBSUseInfByBoardId(mtboardUseInf);
	}

	/**
	 * 신규 게시판 속성정보를 생성한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#insertBBSMastetInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
	 */
	public String insertBBSMastetInf(MTBoardMaster mtboardMaster) throws Exception {
		String bbsId = idgenService.getNextStringId();

		mtboardMaster.setBbsId(bbsId);

		mtboardAttrbMngDAO.insertBBSMasterInf(mtboardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		if (mtboardMaster.getOption().equals("comment") || mtboardMaster.getOption().equals("stsfdg")) {
			addedOptionsDAO.insertAddedOptionsInf(mtboardMaster);
		}
		// //-------------------------------

		if ("Y".equals(mtboardMaster.getBbsUseFlag())) {
			MTBoardUseInf mtboardUseInf = new MTBoardUseInf();

			mtboardUseInf.setBbsId(bbsId);
			mtboardUseInf.setTrgetId(mtboardMaster.getTrgetId());
			mtboardUseInf.setRegistSeCode(mtboardMaster.getRegistSeCode());
			mtboardUseInf.setFrstRegisterId(mtboardMaster.getFrstRegisterId());
			mtboardUseInf.setUseAt("Y");

			mtboardUseDAO.insertBBSUseInf(mtboardUseInf);

			UserInfVO userVO = new UserInfVO();
			userVO.setTrgetId(mtboardMaster.getTrgetId());

			List<UserInfVO> tmpList = null;
			Iterator<UserInfVO> iter = null;

			if ("REGC05".equals(mtboardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllClubUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					mtboardUseInf = new MTBoardUseInf();

					mtboardUseInf.setBbsId(bbsId);
					mtboardUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					mtboardUseInf.setRegistSeCode("REGC07");
					mtboardUseInf.setUseAt("Y");
					mtboardUseInf.setFrstRegisterId(mtboardMaster.getFrstRegisterId());

					mtboardUseDAO.insertBBSUseInf(mtboardUseInf);
				}
			} else if ("REGC06".equals(mtboardMaster.getRegistSeCode())) {
				tmpList = userService.selectAllCmmntyUser(userVO);
				iter = tmpList.iterator();
				while (iter.hasNext()) {
					mtboardUseInf = new MTBoardUseInf();

					mtboardUseInf.setBbsId(bbsId);
					mtboardUseInf.setTrgetId(((UserInfVO) iter.next()).getUniqId());
					mtboardUseInf.setRegistSeCode("REGC07");
					mtboardUseInf.setUseAt("Y");
					mtboardUseInf.setFrstRegisterId(mtboardMaster.getFrstRegisterId());

					mtboardUseDAO.insertBBSUseInf(mtboardUseInf);
				}
			}
		}
		return bbsId;
	}

	/**
	 * 게시판 속성 정보의 목록을 조회 한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectAllBBSMasteInf(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
	 */
	public List<MTBoardMasterVO> selectAllBBSMasteInf(MTBoardMasterVO vo) throws Exception {
		return mtboardAttrbMngDAO.selectAllBBSMasteInf(vo);
	}

	/**
	 * 게시판 속성정보 한 건을 상세조회한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
	 */
	public MTBoardMasterVO selectBBSMasterInf(MTBoardMaster searchVO) throws Exception {
		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		// return attrbMngDAO.selectBBSMasterInf(searchVO);

		MTBoardMasterVO result = mtboardAttrbMngDAO.selectBBSMasterInf(searchVO);

		// String flag = EgovProperties.getProperty("Globals.addedOptions");
		// if (flag != null && flag.trim().equalsIgnoreCase("true")) {
		if (EgovComponentChecker.hasComponent("EgovBBSCommentService") || EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {// 2011.09.15
			MTBoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(searchVO);

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
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#selectBBSMasterInfs(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
	 */
	public Map<String, Object> selectBBSMasterInfs(MTBoardMasterVO searchVO) throws Exception {
		List<MTBoardMasterVO> result = mtboardAttrbMngDAO.selectBBSMasterInfs(searchVO);
		int cnt = mtboardAttrbMngDAO.selectBBSMasterInfsCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 게시판 속성정보를 수정한다.
	 * 
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#updateBBSMasterInf(egovframework.com.cop.bbs.brd.service.BoardMaster)
	 */
	public void updateBBSMasterInf(MTBoardMaster mtboardMaster) throws Exception {
		mtboardAttrbMngDAO.updateBBSMasterInf(mtboardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------

		if (mtboardMaster.getOption().equals("comment") || mtboardMaster.getOption().equals("stsfdg")) {
			if (mtboardMaster.getOption().equals("na")) {
				return;
			}
			MTBoardMasterVO options = addedOptionsDAO.selectAddedOptionsInf(mtboardMaster);

			if (options == null) {
				mtboardMaster.setFrstRegisterId(mtboardMaster.getLastUpdusrId());
				addedOptionsDAO.insertAddedOptionsInf(mtboardMaster);
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
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSAttributeManageService#validateTemplate(egovframework.com.cop.bbs.brd.service.BoardMasterVO)
	 */
	public void validateTemplate(MTBoardMasterVO searchVO) throws Exception {
		egovLogger.debug("validateTemplate method ignored...");
	}

	/**
	 * 사용중인 게시판 속성 정보의 목록을 조회 한다.
	 */
	public Map<String, Object> selectBdMstrListByTrget(MTBoardMasterVO vo) throws Exception {
		List<MTBoardMasterVO> result = mtboardAttrbMngDAO.selectBdMstrListByTrget(vo);
		int cnt = mtboardAttrbMngDAO.selectBdMstrListCntByTrget(vo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 커뮤니티, 동호회에서 사용중인 게시판 속성 정보의 목록을 전체조회 한다.
	 */
	public List<MTBoardMasterVO> selectAllBdMstrByTrget(MTBoardMasterVO vo) throws Exception {
		return mtboardAttrbMngDAO.selectAllBdMstrByTrget(vo);
	}

	/**
	 * 사용중이지 않은 게시판 속성 정보의 목록을 조회 한다.
	 */
	public Map<String, Object> selectNotUsedBdMstrList(MTBoardMasterVO searchVO) throws Exception {
		List<MTBoardMasterVO> result = mtboardAttrbMngDAO.selectNotUsedBdMstrList(searchVO);
		int cnt = mtboardAttrbMngDAO.selectNotUsedBdMstrListCnt(searchVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}
}
