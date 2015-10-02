package egovframework.com.fp.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.fp.service.FloorPlanAttributeManageService;
import egovframework.com.fp.service.FloorPlanMaster;
import egovframework.com.fp.service.FloorPlanMasterVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class FloorPlanAttributeManageController {

	@Resource(name = "FloorPlanAttributeManageService")
	private FloorPlanAttributeManageService bbsAttrbService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	// Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("rawtypes")
	@RequestMapping("/com/fp/addBBSMaster.do")
	public String addBBSMaster(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			ModelMap model) throws Exception {
		FloorPlanMaster boardMaster = new FloorPlanMaster();

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		vo.setCodeId("COM004");

		List codeResult = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("typeList", codeResult);

		vo.setCodeId("COM009");

		codeResult = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("attrbList", codeResult);
		model.addAttribute("boardMaster", boardMaster);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		// String flag = EgovProperties.getProperty("Globals.addedOptions");
		// if (flag != null && flag.trim().equalsIgnoreCase("true")) {
		// model.addAttribute("addedOptions", "true");
		// }
		// //-------------------------------

		// ---------------------------------
		// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
		// ---------------------------------

		if (EgovComponentChecker.hasComponent("EgovBBSCommentService")) {
			model.addAttribute("useComment", "true");
		}
		if (EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {
			model.addAttribute("useSatisfaction", "true");
		}

		// //-------------------------------

		return "egovframework/com/fp/EgovBoardMstrRegist";
	}

	/**
	 * 신규 게시판 마스터 정보를 등록한다.
	 * 
	 * @param boardMasterVO
	 * @param boardMaster
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping("/com/fp/insertBBSMasterInf.do")
	public String insertBBSMasterInf(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			@ModelAttribute("boardMaster") FloorPlanMaster boardMaster,
			BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {

			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			vo.setCodeId("COM004");

			List codeResult = cmmUseService.selectCmmCodeDetail(vo);

			model.addAttribute("typeList", codeResult);

			vo.setCodeId("COM009");

			codeResult = cmmUseService.selectCmmCodeDetail(vo);

			model.addAttribute("attrbList", codeResult);

			return "egovframework/com/fp/EgovBoardMstrRegist";
		}

		if (isAuthenticated) {
			boardMaster.setFrstRegisterId(user.getUniqId());
			boardMaster.setUseAt("Y");
			boardMaster.setTrgetId("SYSTEMDEFAULT_REGIST");

			bbsAttrbService.insertBBSMastetInf(boardMaster);
		}

		return "forward:/com/fp/SelectBBSMasterInfs.do";
	}

	/**
	 * 게시판 마스터 목록을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "도면관리 게시판속성관리", order = 7, gid = 7)
	@RequestMapping("/com/fp/SelectBBSMasterInfs.do")
	public String selectBBSMasterInfs(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			ModelMap model) throws Exception {
		boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
		paginationInfo.setPageSize(boardMasterVO.getPageSize());

		boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardMasterVO.setRecordCountPerPage(paginationInfo
				.getRecordCountPerPage());

		Map<String, Object> map = bbsAttrbService
				.selectBBSMasterInfs(boardMasterVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/fp/EgovBoardMstrList";
	}

	/**
	 * 게시판 마스터 상세내용을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/SelectBBSMasterInf.do")
	public String selectBBSMasterInf(
			@ModelAttribute("searchVO") FloorPlanMasterVO searchVO,
			ModelMap model) throws Exception {
		FloorPlanMasterVO vo = bbsAttrbService.selectBBSMasterInf(searchVO);

		model.addAttribute("result", vo);

		// ---------------------------------
		// 2009.06.26 : 2단계 기능 추가
		// ---------------------------------
		// String flag = EgovProperties.getProperty("Globals.addedOptions");
		// if (flag != null && flag.trim().equalsIgnoreCase("true")) {
		// model.addAttribute("addedOptions", "true");
		// }
		// //-------------------------------

		// ---------------------------------
		// 2011.09.15 : 2단계 기능 추가 반영 방법 변경
		// ---------------------------------

		if (EgovComponentChecker.hasComponent("EgovBBSCommentService")) {
			model.addAttribute("useComment", "true");
		}
		if (EgovComponentChecker.hasComponent("EgovBBSSatisfactionService")) {
			model.addAttribute("useSatisfaction", "true");
		}

		// //-------------------------------

		return "egovframework/com/fp/EgovBoardMstrUpdt";
	}

	/**
	 * 게시판 마스터 정보를 수정한다.
	 * 
	 * @param boardMasterVO
	 * @param boardMaster
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/UpdateBBSMasterInf.do")
	public String updateBBSMasterInf(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			@ModelAttribute("boardMaster") FloorPlanMaster boardMaster,
			BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(boardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
			FloorPlanMasterVO vo = bbsAttrbService
					.selectBBSMasterInf(boardMasterVO);

			model.addAttribute("result", vo);

			return "egovframework/com/fp/EgovBoardMstrUpdt";
		}

		if (isAuthenticated) {
			boardMaster.setLastUpdusrId(user.getUniqId());
			bbsAttrbService.updateBBSMasterInf(boardMaster);
		}

		return "forward:/com/fp/SelectBBSMasterInfs.do";
	}

	/**
	 * 게시판 마스터 정보를 삭제한다.
	 * 
	 * @param boardMasterVO
	 * @param boardMaster
	 * @param status
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/DeleteBBSMasterInf.do")
	public String deleteBBSMasterInf(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			@ModelAttribute("boardMaster") FloorPlanMaster boardMaster,
			SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			boardMaster.setLastUpdusrId(user.getUniqId());
			bbsAttrbService.deleteBBSMasterInf(boardMaster);
		}
		// status.setComplete();
		return "forward:/com/fp/SelectBBSMasterInfs.do";
	}

	/**
	 * 게시판 마스터 선택 팝업을 위한 목록을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/fp/SelectBBSMasterInfsPop.do")
	public String selectBBSMasterInfsPop(
			@ModelAttribute("searchVO") FloorPlanMasterVO boardMasterVO,
			ModelMap model) throws Exception {
		boardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		boardMasterVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(boardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(boardMasterVO.getPageUnit());
		paginationInfo.setPageSize(boardMasterVO.getPageSize());

		boardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		boardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		boardMasterVO.setRecordCountPerPage(paginationInfo
				.getRecordCountPerPage());

		boardMasterVO.setUseAt("Y");

		Map<String, Object> map = bbsAttrbService
				.selectNotUsedBdMstrList(boardMasterVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/fp/EgovBoardMstrListPop";
	}
}
