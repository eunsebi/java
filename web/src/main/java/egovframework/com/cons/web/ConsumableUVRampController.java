package egovframework.com.cons.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cons.service.ConsumableBoardService;
import egovframework.com.cons.service.ConsumableInventoryVO;
import egovframework.com.cop.smt.sdm.service.EgovDeptSchdulManageService;
import egovframework.com.sym.ccm.cca.service.CmmnCode;
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.com.uss.olp.mgt.service.EgovMeetingManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ConsumableUVRampController extends ConsumableTool {
	
	//private static final Logger Loger = LoggerFactory.getLogger(ConsumableUVRampController.class);
	
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
    
    @Resource(name = "CmmnCodeManageService")
    private EgovCcmCmmnCodeManageService cmmnCodeManageService;
    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;
    
    /** egovMeetingManageService Member Variable */
	@Resource(name = "egovMeetingManageService")
	private EgovMeetingManageService egovMeetingManageService;
	
	/** ConsaumableBoardService */
	@Resource(name="ConsumableBoardService")
	ConsumableBoardService consumableBoardService;
	
	@Resource(name = "CmmnDetailCodeManageService")
    private EgovCcmCmmnDetailCodeManageService cmmnDetailCodeManageService;
	
	@Resource(name = "egovDeptSchdulManageService")
	private EgovDeptSchdulManageService egovDeptSchdulManageService;
	
	/**
	 * UV Ramp 등록 이동화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableUVRampUseList.do")
	public String consumableUVRampUseList(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		//System.out.println("============================ UV Ramp 등록페이지 =============================");
		
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		
		return "egovframework/com/cons/use/UVRamp/UVRampUseList";
	}
	
	
	/**
	 * UV Ramp 사용 등록화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/consumableUVRampUseRegister.do")
	public String consumableUVRampUseRegister(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			BindingResult bindingResult,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		//System.out.println("============================ UV Ramp 사용 등록  =============================");
		
		//공통코드 설비명종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId(consumableInventoryVO.getCodeId());
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("facility", listComCode);
    	
    	//공통코드 상세  유포지 종류
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("IM030");
    	voComCode.setCode(consumableInventoryVO.getConsumable());
    	//ComDefaultCodeVO comCode = cmmUseService.selectCmmCodeDetailVO(voComCode);
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	
    	model.addAttribute("consumable", listComCode);
    	
		List<?> schdulDeptName = egovMeetingManageService.egovMeetingManageLisAuthorGroupPopup(searchVO);
        model.addAttribute("schdulDeptName", schdulDeptName);
        
        consumableInventoryVO.setPageUnit(propertyService.getInt("pageUnit"));
		consumableInventoryVO.setPageSize(propertyService.getInt("pageSize"));
        
        PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(consumableInventoryVO.getPageIndex());
		//paginationInfo.setRecordCountPerPage(consumableInventoryVO.getPageUnit());
		paginationInfo.setRecordCountPerPage(5);
		//paginationInfo.setPageSize(consumableInventoryVO.getPageSize());
		paginationInfo.setPageSize(5);
		
		consumableInventoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		consumableInventoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		consumableInventoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		consumableInventoryVO.setBbsId(consumableInventoryVO.getBbsId());
		consumableInventoryVO.setCodeId(consumableInventoryVO.getCodeId());
		consumableInventoryVO.setMode(consumableInventoryVO.getMode());
		consumableInventoryVO.setConsumable(consumableInventoryVO.getConsumableImsi());
		
		// 설비별 소모품 사용 리스트
		HashMap map = new HashMap();
		map.put("bbsId", consumableInventoryVO.getBbsId());
		map.put("codeId", consumableInventoryVO.getCodeId());
		map.put("consumable", consumableInventoryVO.getConsumableImsi());
		map.put("mode", consumableInventoryVO.getMode());
				
        Map<String, Object> listMap = consumableBoardService.selectUseList(consumableInventoryVO);
        int totCnt = consumableBoardService.selectUseListCnt(consumableInventoryVO);
        //int totCnt = Integer.parseInt((String)listMap.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		model.addAttribute("resultList", listMap.get("resultList"));
		
		// 공통코드 조회
		CmmnCode cmmnCode = new CmmnCode();
		cmmnCode.setCodeId(consumableInventoryVO.getCodeId());
		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
		model.addAttribute("cmmnCode", vo);
		
		// 소모품 코드별 수량 파악
		Map<String, Object> invenMap = consumableBoardService.selectInventoryArticles(consumableInventoryVO);
		//int invenTotCnt = Integer.parseInt((String)invenMap.get("resultCnt"));
		
		//paginationInfo.setTotalRecordCount(invenTotCnt);
		
		model.addAttribute("invenResultList", invenMap.get("resultList"));
        
		return "egovframework/com/cons/use/UVRamp/UVRampUseRegister";
	}
	
	/**
	 * UV Ramp 사용현황 등록처리
	 * @param consumableInventoryVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/com/cons/consumableUVRampUseRegisterActor.do")
	public String consumableUVRampUseRegisterActor(
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception {
		
		/*System.out.println("공정명 : " + consumableInventoryVO.getCodeId());
		System.out.println("부서ID: " + consumableInventoryVO.getSchdulDeptId());
		System.out.println("부서명: " + consumableInventoryVO.getSchdulDeptName());
		System.out.println("설비명 : " + consumableInventoryVO.getFacility());
		System.out.println("소모품명 : " + consumableInventoryVO.getConsumableImsi());
		System.out.println("사용수량 : " + consumableInventoryVO.getUseCn());
		System.out.println("교체일 : " + consumableInventoryVO.getNtceBgndeView());
		System.out.println("bbsId : " + consumableInventoryVO.getBbsId());*/
		
		String sLocationUrl = "forward:/com/cons/consumableUVRampUseRegister.do";
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		beanValidator.validate(consumableInventoryVO, bindingResult);
		
		// 임시 삭제
		/*if(bindingResult.hasErrors()) {
			return "egovframework/com/cons/use/cleanPaper/CleanPaperUseRegister";
		}*/
		
		if (isAuthenticated) {
			HashMap map = new HashMap();
			map.put("user", user.getUniqId());
			
			// 소모품 0번
			if (consumableInventoryVO.getUseCn().length() != 0) {
				map.put("bbsId", consumableInventoryVO.getBbsId());
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi());
				map.put("useCn", consumableInventoryVO.getUseCn());
				map.put("sLocationUrl", sLocationUrl);
				
				HashMap url = calculator(map);
				model.addAttribute("codeNm", url.get("codeNm"));
				sLocationUrl = (String) url.get("sLocationUrl");
			}
			
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			
			consumableInventoryVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			consumableInventoryVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			// 사용현황 등록
			consumableBoardService.insertCleanPaperUseRegister(consumableInventoryVO);

		}
		
		return sLocationUrl;
	}
	
}
