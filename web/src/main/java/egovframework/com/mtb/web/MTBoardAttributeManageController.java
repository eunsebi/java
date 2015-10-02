package egovframework.com.mtb.web;

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
import egovframework.com.mtb.service.MTBoardAttributeManageService;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * Maint Total 게시판 속성관리를 위한 컨트롤러 클래스
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
 *  -------       --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *   2009.06.26	한성곤		    2단계 기능 추가 (댓글관리, 만족도조사)
 *  2011.07.21 안민정          커뮤니티 관련 메소드 분리 (->EgovBBSAttributeManageController)
 *  2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.15 서준식           2단계 기능 추가 (댓글관리, 만족도조사) 적용방법 변경
 * </pre>
 */

@Controller
public class MTBoardAttributeManageController {

	@Resource(name = "MTBoardAttributeManageService")
	private MTBoardAttributeManageService mtboardAttrbService;

	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Autowired
	private DefaultBeanValidator beanValidator;

	// Logger log = Logger.getLogger(this.getClass());

	/**
	 * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/com/mtb/addMTBoardMaster.do")
	public String addMTBoardMaster(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, ModelMap model) throws Exception {
		MTBoardMaster mtboardMaster = new MTBoardMaster();

		ComDefaultCodeVO vo = new ComDefaultCodeVO();

		vo.setCodeId("MTB001");

		List codeResult = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("typeList", codeResult);

		vo.setCodeId("MTB002");

		codeResult = cmmUseService.selectCmmCodeDetail(vo);

		model.addAttribute("attrbList", codeResult);
		model.addAttribute("boardMaster", mtboardMaster);

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

		return "egovframework/com/mtb/EgovBoardMstrRegist";
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
	@SuppressWarnings("rawtypes")
	@RequestMapping("/com/mtb/insertMTBoardMasterInf.do")
	public String insertMTBoardMasterInf(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO,
			@ModelAttribute("boardMaster") MTBoardMaster mtboardMaster, BindingResult bindingResult, SessionStatus status, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(mtboardMaster, bindingResult);
		if (bindingResult.hasErrors()) {

			ComDefaultCodeVO vo = new ComDefaultCodeVO();

			vo.setCodeId("MTB001");

			List codeResult = cmmUseService.selectCmmCodeDetail(vo);

			model.addAttribute("typeList", codeResult);

			vo.setCodeId("MTB002");

			codeResult = cmmUseService.selectCmmCodeDetail(vo);

			model.addAttribute("attrbList", codeResult);

			return "egovframework/com/mtb/EgovBoardMstrRegist";
		}

		if (isAuthenticated) {
			mtboardMaster.setFrstRegisterId(user.getUniqId());
			mtboardMaster.setUseAt("Y");
			mtboardMaster.setTrgetId("SYSTEMDEFAULT_REGIST");

			mtboardAttrbService.insertBBSMastetInf(mtboardMaster);
		}

		return "forward:/com/mtb/SelectMTBoardMasterInfs.do";
	}

	/**
	 * 게시판 마스터 목록을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "Maint Total 게시판 속성관리", order = 5, gid = 5)
	@RequestMapping("/com/mtb/SelectMTBoardMasterInfs.do")
	public String selectMTBoardMasterInfs(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, ModelMap model) throws Exception {
		mtboardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		mtboardMasterVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(mtboardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(mtboardMasterVO.getPageUnit());
		paginationInfo.setPageSize(mtboardMasterVO.getPageSize());

		mtboardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		mtboardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		mtboardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = mtboardAttrbService.selectBBSMasterInfs(mtboardMasterVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/mtb/EgovBoardMstrList";
	}

	/**
	 * 게시판 마스터 상세내용을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/com/mtb/SelectMTBoardMasterInf.do")
	public String selectMTBoardMasterInf(@ModelAttribute("searchVO") MTBoardMasterVO searchVO, ModelMap model) throws Exception {
		ComDefaultCodeVO comVo = new ComDefaultCodeVO();

		comVo.setCodeId("MTB001");

		List codeResult = cmmUseService.selectCmmCodeDetail(comVo);

		model.addAttribute("typeList", codeResult);

		comVo.setCodeId("MTB002");

		codeResult = cmmUseService.selectCmmCodeDetail(comVo);

		model.addAttribute("attrbList", codeResult);
		
		MTBoardMasterVO vo = mtboardAttrbService.selectBBSMasterInf(searchVO);

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

		return "egovframework/com/mtb/EgovBoardMstrUpdt";
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
	@RequestMapping("/com/mtb/UpdateMTBoardMasterInf.do")
	public String updateMTBoardMasterInf(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO,
			@ModelAttribute("boardMaster") MTBoardMaster mtboardMaster, BindingResult bindingResult, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(mtboardMaster, bindingResult);
		if (bindingResult.hasErrors()) {
			MTBoardMasterVO vo = mtboardAttrbService.selectBBSMasterInf(mtboardMasterVO);

			model.addAttribute("result", vo);

			return "egovframework/com/mtb/EgovBoardMstrUpdt";
		}

		if (isAuthenticated) {
			mtboardMaster.setLastUpdusrId(user.getUniqId());
			mtboardAttrbService.updateBBSMasterInf(mtboardMaster);
		}

		return "forward:/com/mtb/SelectMTBoardMasterInfs.do";
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
	@RequestMapping("/com/mtb/DeleteMTBoardMasterInf.do")
	public String deleteMTBoardMasterInf(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO,
			@ModelAttribute("boardMaster") MTBoardMaster mtboardMaster, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			mtboardMaster.setLastUpdusrId(user.getUniqId());
			mtboardAttrbService.deleteBBSMasterInf(mtboardMaster);
		}
		// status.setComplete();
		return "forward:/com/mtb/SelectBBSMasterInfs.do";
	}

	/**
	 * 게시판 마스터 선택 팝업을 위한 목록을 조회한다.
	 * 
	 * @param boardMasterVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/SelectMTBoardMasterInfsPop.do")
	public String selectMTBoardMasterInfsPop(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, ModelMap model) throws Exception {
		mtboardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
		mtboardMasterVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(mtboardMasterVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(mtboardMasterVO.getPageUnit());
		paginationInfo.setPageSize(mtboardMasterVO.getPageSize());

		mtboardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		mtboardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
		mtboardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		mtboardMasterVO.setUseAt("Y");

		Map<String, Object> map = mtboardAttrbService.selectNotUsedBdMstrList(mtboardMasterVO);
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/mtb/EgovBoardMstrListPop";
	}
}