package egovframework.com.fp.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.com.fp.service.FloorPlan;
import egovframework.com.fp.service.FloorPlanAttributeManageService;
import egovframework.com.fp.service.FloorPlanManageService;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;
import egovframework.com.fp.service.FloorPlanVO;
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FloorPlanController {
	private static final Logger LOGGER = LoggerFactory.getLogger(FloorPlanController.class);

	@Autowired
	private DefaultBeanValidator beanValidator;

	@Resource(name = "FloorPlanManageService")
	private FloorPlanManageService bbsMngService;

	@Resource(name = "FloorPlanAttributeManageService")
	private FloorPlanAttributeManageService bbsAttrbService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "CmmnCodeManageService")
	private EgovCcmCmmnCodeManageService cmmnCodeManageService;
	
	//---------------------------------
    // 2009.06.29 : 2단계 기능 추가
    // 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
    //---------------------------------
    @Autowired(required=false)
    private EgovBBSCommentService bbsCommentService;
    
    @Autowired(required=false)
    private EgovBBSSatisfactionService bbsSatisfactionService;
    
    @Autowired(required=false)
    private EgovBBSScrapService bbsScrapService;
    ////-------------------------------

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	/**
	 * 도면관리 리스트 보기
	 * @param boardVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/selectFloorPlanList.do")
	public String selectDiFloorPlanList(
			@ModelAttribute("searchVO") FloorPlanVO boardVO,
			@ModelAttribute("board") FloorPlanVO board, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocation = "egovframework/com/fp/di/DIFloorPlanList";

		LOGGER.info("sLocation is {} ", sLocation);
		
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());

		FloorPlanMasterVO vo = new FloorPlanMasterVO();
		
		vo.setBbsId(boardVO.getBbsId());
		vo.setUniqId(user.getUniqId());
		
		FloorPlanMasterVO master = bbsAttrbService.selectBBSMasterInf(vo);
		
		//-------------------------------
		// 방명록이면 방명록 URL로 forward
		//-------------------------------
		if (master.getBbsTyCode().equals("BBST04")) {
		    return "forward:/cop/bbs/selectGuestList.do";
		}
		////-----------------------------

		boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setPageSize(boardVO.getPageSize());

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정 
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		////-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		return sLocation;
	}
	
	/**
	 * 선택 게시물 상세조회 페이지로 이동한다.
	 * @param boardVO
	 * @param board
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unused", "rawtypes" })
	@RequestMapping("/com/fp/selectFloorPlanSmallArticle.do")
	public String selectFloorPlanSmallArticle(@ModelAttribute("searchVO") FloorPlanVO boardVO,
			@ModelAttribute("board") FloorPlan board,
			ModelMap model) throws Exception{
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		List auth = EgovUserDetailsHelper.getAuthorities();
		
		// 조회수 증가 여부 지정
		boardVO.setPlusCount(true);

		//---------------------------------
		// 2009.06.29 : 2단계 기능 추가
		//---------------------------------
		if (!boardVO.getSubPageIndex().equals("")) {
		    boardVO.setPlusCount(false);
		}
		////-------------------------------

		boardVO.setLastUpdusrId(user.getUniqId());
		FloorPlanVO vo = bbsMngService.selectBoardArticle(boardVO);

		model.addAttribute("result", vo);
		//CommandMap의 형태로 개선????

		model.addAttribute("sessionUniqId", user.getUniqId());

		//----------------------------
		// template 처리 (기본 BBS template 지정  포함)
		//----------------------------
		FloorPlanMasterVO master = new FloorPlanMasterVO();
		
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());
		
		FloorPlanMasterVO masterVo = bbsAttrbService.selectBBSMasterInf(master);

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
		    masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		////-----------------------------
		
		//----------------------------
		// 2009.06.29 : 2단계 기능 추가
		// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
		//----------------------------
		if (bbsCommentService != null){
			if (bbsCommentService.canUseComment(boardVO.getBbsId())) {
			    model.addAttribute("useComment", "true");
			}
		}
		if (bbsSatisfactionService != null) {
			if (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
			    model.addAttribute("useSatisfaction", "true");
			}
		}
		if (bbsScrapService != null ) {
			if (bbsScrapService.canUseScrap()) {
			    model.addAttribute("useScrap", "true");
			}
		}
		////--------------------------
		
		// 상세뷰내 리느스
		boardVO.setBbsId(boardVO.getBbsId());
		boardVO.setBbsNm(boardVO.getBbsNm());
		boardVO.setDivision(boardVO.getDivision());

		////-----------------------------

		/*boardVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardVO.setPageSize(propertyService.getInt("pageSize"));*/
		//boardVO.setPageUnit(5);
		//boardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
		//paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
		paginationInfo.setRecordCountPerPage(5);
		//paginationInfo.setPageSize(boardVO.getPageSize());
		paginationInfo.setPageSize(5);

		boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		//Map<String, Object> map = bbsMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = bbsMngService.selectSmallBoardArticles(boardVO, master.getBbsAttrbCode());//2011.09.07
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);

		//-------------------------------
		// 기본 BBS template 지정 
		//-------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
		    master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		////-----------------------------
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/fp/di/DIFloorPlanSmallinqire";
	}

	/**
	 * 게시물 수정을 위한 수정페이지로 이동한다.
	 * @param boardVO
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/forUpdateFloorPlanArticl.do")
	public String forUpdateFloorPlanArticl(
			@ModelAttribute("searchVO") FloorPlanVO boardVO, @ModelAttribute("board") FloorPlanVO vo, ModelMap model)
			throws Exception {

		String sLocation = "egovframework/com/fp/di/DIFloorPlanUpdt";

		LOGGER.info("sLocation is {} ", sLocation);
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		boardVO.setFrstRegisterId(user.getUniqId());
		
		FloorPlanMaster master = new FloorPlanMaster();
		FloorPlanMasterVO bmvo = new FloorPlanMasterVO();
		FloorPlanVO bdvo = new FloorPlanVO();
		
		vo.setBbsId(boardVO.getBbsId());
		
		master.setBbsId(boardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		if (isAuthenticated) {
		    bmvo = bbsAttrbService.selectBBSMasterInf(master);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);
		}

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);

		//----------------------------
		// 기본 BBS template 지정 
		//----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
		    bmvo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		
		// 공통코드 유포지 종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode = new ComDefaultCodeVO();
		List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		voComCode.setCodeId("IM002");
		// ComDefaultCodeVO comCode =
		// cmmUseService.selectCmmCodeDetailVO(voComCode);
		listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("process", listComCode);
		
		voComCode.setCodeId("IM001");
		listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("spec", listComCode);

		model.addAttribute("brdMstrVO", bmvo);
		////-----------------------------
		
		return sLocation;
	}
	
	/**
	 * 게시물에 대한 내용을 수정한다.
	 * @param multiRequest
	 * @param boardVO
	 * @param bdMstr
	 * @param board
	 * @param bindingResult
	 * @param model
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/updateBoardArticle.do")
	public String updateBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") FloorPlanVO boardVO,
		    @ModelAttribute("bdMstr") FloorPlanMaster bdMstr, @ModelAttribute("board") FloorPlan board, BindingResult bindingResult, ModelMap model,
		    SessionStatus status) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String atchFileId = boardVO.getAtchFileId();

		beanValidator.validate(board, bindingResult);
		if (bindingResult.hasErrors()) {

		    boardVO.setFrstRegisterId(user.getUniqId());
		    
		    FloorPlanMaster master = new FloorPlanMaster();
		    FloorPlanMasterVO bmvo = new FloorPlanMasterVO();
		    FloorPlanVO bdvo = new FloorPlanVO();
		    
		    master.setBbsId(boardVO.getBbsId());
		    master.setUniqId(user.getUniqId());

		    bmvo = bbsAttrbService.selectBBSMasterInf(master);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);

		    model.addAttribute("result", bdvo);
		    model.addAttribute("bdMstr", bmvo);

		    return "egovframework/com/fp/DIFloorPlanUpdt";
		}
		
		/*
		boardVO.setFrstRegisterId(user.getUniqId());
		BoardMaster _bdMstr = new BoardMaster();
		BoardMasterVO bmvo = new BoardMasterVO();
		BoardVO bdvo = new BoardVO();
		vo.setBbsId(boardVO.getBbsId());
		_bdMstr.setBbsId(boardVO.getBbsId());
		_bdMstr.setUniqId(user.getUniqId());

		if (isAuthenticated) {
		    bmvo = bbsAttrbService.selectBBSMasterInf(_bdMstr);
		    bdvo = bbsMngService.selectBoardArticle(boardVO);
		}
		//*/

		if (isAuthenticated) {
		    final Map<String, MultipartFile> files = multiRequest.getFileMap();
		    if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
				    List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
				    atchFileId = fileMngService.insertFileInfs(result);
				    board.setAtchFileId(atchFileId);
				} else {
				    FileVO fvo = new FileVO();
				    fvo.setAtchFileId(atchFileId);
				    int cnt = fileMngService.getMaxFileSN(fvo);
				    List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
				    fileMngService.updateFileInfs(_result);
				}
		    }
		    
		    String division = "";
		    if(board.getDivision().equals("COM01")) {
				division = "양산용";
			} else {
				division = "개발용";
			}
		    
			String title = division + " " + board.getModel() + "모델 " + board.getNumber() + "호기에 등록";
			board.setNttSj(title);

		    board.setLastUpdusrId(user.getUniqId());
		    
		    board.setNtcrNm("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    board.setPassword("");	// dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
		    
		    board.setNttCn(unscript(board.getNttCn()));	// XSS 방지
		    
		    bbsMngService.updateBoardArticle(board);
		}
		
		return "forward:/com/fp/selectFloorPlanList.do";
	}

	/**
	 * 도면 등록화면 이동
	 * 
	 * @param floorPlanVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/addFloorPlanArticle.do")
	public String addDifloorPlanArticle(
			@ModelAttribute("searchVO") FloorPlanVO floorPlanVO, ModelMap model)
			throws Exception {

		String sLocation = "egovframework/com/fp/di/DIFloorPlanRegist";

		LOGGER.info("sLocation is {} ", sLocation);

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		// 공통코드 유포지 종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
		voComCode = new ComDefaultCodeVO();
		List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		voComCode.setCodeId("IM001");
		// ComDefaultCodeVO comCode =
		// cmmUseService.selectCmmCodeDetailVO(voComCode);
		listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("spec", listComCode);
		
		// 공통코드 유포지 종류
		voComCode.setCodeId("IM002");
		// ComDefaultCodeVO comCode =
		// cmmUseService.selectCmmCodeDetailVO(voComCode);
		listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("process", listComCode);
		
		voComCode.setCodeId("IM010");
		// ComDefaultCodeVO comCode =
		// cmmUseService.selectCmmCodeDetailVO(voComCode);
		listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
		model.addAttribute("model", listComCode);

		FloorPlanMasterVO fpMstr = new FloorPlanMasterVO();

		if (isAuthenticated) {

			FloorPlanMasterVO vo = new FloorPlanMasterVO();
			vo.setBbsId(floorPlanVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			fpMstr = bbsAttrbService.selectBBSMasterInf(vo);
			model.addAttribute("fpMstr", fpMstr);
		}

		// ----------------------------
		// 기본 BBS template 지정
		// ----------------------------
		if (fpMstr.getTmplatCours() == null
				|| fpMstr.getTmplatCours().equals("")) {
			fpMstr.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("fpMstrVO", fpMstr);
		model.addAttribute("floorPlanVO", floorPlanVO);

		return sLocation;
	}

	/**
	 * 게시물을 등록한다.
	 * 
	 * @param multiRequest
	 * @param floorPlanVO
	 * @param fpMstr
	 * @param floorPlan
	 * @param bindingResult
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/insertFloorPlanArticle.do")
	public String insertDIfloorPlanArticle(
			final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("searchVO") FloorPlanVO floorPlanVO,
			@ModelAttribute("fpMstr") FloorPlanMasterVO fpMstr,
			@ModelAttribute("board") FloorPlan floorPlan,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {

		String division = "";
		String sLocation = "forward:/com/fp/selectFloorPlanList.do";

		LOGGER.info("sLocation is {} ", sLocation);

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(floorPlan, bindingResult);
		if (bindingResult.hasErrors()) {
			FloorPlanMasterVO master = new FloorPlanMasterVO();
			FloorPlanMasterVO vo = new FloorPlanMasterVO();

			vo.setBbsId(floorPlanVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			master = bbsAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("fpMstr", master);

			// ----------------------------
			// 기본 BBS template 지정
			// ----------------------------
			if (master.getTmplatCours() == null
					|| master.getTmplatCours().equals("")) {
				master.setTmplatCours("css/egovframework/com/cop/tpl/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			// //-----------------------------

			return "egovframework/com/fp/di/DIFloorPlanRegist";

		}

		if (isAuthenticated) {
			List<FileVO> result = null;
			String atchFileId = "";

			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "DI_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			floorPlan.setAtchFileId(atchFileId);
			floorPlan.setFrstRegisterId(user.getUniqId());
			floorPlan.setBbsId(floorPlan.getBbsId());
			
			if(floorPlan.getDivision().equals("COM01")) {
				division = "양산용";
			} else {
				division = "개발용";
			}
			String title = division + " " + floorPlan.getModel() + "모델 " + floorPlan.getNumber() + "호기에 등록";
			floorPlan.setNttSj(title);

			// board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)
			floorPlan.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해 dummy로 지정됨)

			floorPlan.setNtcrId(user.getId()); // 게시물 통계 집계를 위해 등록자 ID 저장
			floorPlan.setNtcrNm(user.getName()); // 게시물 통계 집계를 위해 등록자 Name 저장

			floorPlan.setNttCn(unscript(floorPlan.getNttCn())); // XSS 방지

			bbsMngService.insertBoardArticle(floorPlan);
		}

		return sLocation;
	}
	
	/**
	 * 게시물에 대한 내용을 삭제한다.
	 * @param boardVO
	 * @param board
	 * @param bdMstr
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/deleteBoardArticle.do")
	public String deleteBoardArticle(@ModelAttribute("searchVO") FloorPlanVO boardVO, @ModelAttribute("board") FloorPlan board,
		    @ModelAttribute("bdMstr") FloorPlanMaster bdMstr, ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
		    board.setLastUpdusrId(user.getUniqId());
		    
		    bbsMngService.deleteBoardArticle(board);
		}

		return "forward:/com/fp/selectFloorPlanList.do";
	}

	/**
	 * XSS 방지 처리.
	 * 
	 * @param data
	 * @return
	 */
	protected String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}

		String ret = data;

		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}

}
