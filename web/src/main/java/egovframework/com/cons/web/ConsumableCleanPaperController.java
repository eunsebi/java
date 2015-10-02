package egovframework.com.cons.web;

import java.util.HashMap;
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

/**
 * 크린롤러
 * @author IJMAIL
 *
 */

@Controller
public class ConsumableCleanPaperController extends ConsumableTool {
	
private static final Logger Loger = LoggerFactory.getLogger(ConsumableCleanPaperController.class);
	
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
	 * 크린페이퍼(유포지) 등록 이동화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableCleanPaperUseList.do")
	public String consumableUseRegister(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		//System.out.println("============================ 크린롤러 등록페이지 =============================");
		
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		
		return "egovframework/com/cons/use/CleanPaper/CleanPaperUseList";
	}
	
	
	/**
	 * 크린페이퍼(유포지) 사용 등록화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/consumableCleanPaperUseRegister.do")
	public String consumableCleanPaperUseRegister(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			BindingResult bindingResult,
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
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
		
		Loger.info("Clean Paper Register bbsId : {} ", consumableInventoryVO.getBbsId());
		Loger.info("Clean Paper Register codeId : {} ", consumableInventoryVO.getCodeId());
		Loger.info("Clean Paper Register mode : {} ", consumableInventoryVO.getMode());
		
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
        
        System.out.println("listMap : " + listMap);
		
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
		
		// 코드별 소모품 수량 확인
		Map<String, Object> invenMap = consumableBoardService.selectInventoryArticles(consumableInventoryVO);
		//int invenTotCnt = Integer.parseInt((String)invenMap.get("resultCnt"));
		
		//paginationInfo.setTotalRecordCount(invenTotCnt);
		
		model.addAttribute("invenResultList", invenMap.get("resultList"));
		//model.addAttribute("invenResultCnt", invenMap.get("resultCnt"));
        
		return "egovframework/com/cons/use/CleanPaper/CleanPaperUseRegister";
	}
	
	/**
	 * 크린페이퍼(유포지) 사용현황 등록처리
	 * @param consumableInventoryVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/com/cons/consumableCleanPaperUseRegisterActor.do")
	public String consumableCleanPaperUseRegisterActor(
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
		
		String sLocationUrl = "forward:/com/cons/consumableCleanPaperUseRegister.do";
		
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
				
				HashMap url = calculator(map);			// 소모품 재고현황에서 사용수량 차감
				model.addAttribute("codeNm", url.get("codeNm"));
				sLocationUrl = (String) url.get("sLocationUrl");
			}
			
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			
			consumableInventoryVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			consumableInventoryVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			// 사용현황 등록
			consumableBoardService.insertCleanPaperUseRegister(consumableInventoryVO);

		}
		/*ConsumableInventoryVO vo = new ConsumableInventoryVO();
		vo.setBbsId(consumableInventoryVO.getBbsId());
		vo.setCodeId(consumableInventoryVO.getCodeId());
		vo.setMode(consumableInventoryVO.getMode());
		
		model.addAttribute("consumableInventoryVO", vo);*/
		
		return sLocationUrl;
	}
	
	/**
	 * 설비별 소모품 사용현황 수정 화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/use/consumableUseModify.do")
	public String consumableUseModify(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		String sLocationUrl = "egovframework/com/cons/use/ConsumableUseModify";
		
		//String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		// 공통코드 조회
		CmmnCode cmmnCode = new CmmnCode();
		cmmnCode.setCodeId(consumableInventoryVO.getCodeId());
		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
		model.addAttribute("cmmnCode", vo);
		
		//공통코드 설비명종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId(consumableInventoryVO.getCodeId());
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("facility", listComCode);
    	
    	//공통코드 상세  유포지 종류
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM300");
    	voComCode.setCode(consumableInventoryVO.getConsumable());
    	//ComDefaultCodeVO comCode = cmmUseService.selectCmmCodeDetailVO(voComCode);
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	
    	model.addAttribute("consumable", listComCode);

    	//ConsumableBoardDAO.selectUseList
    	
    	// 설비별 소모품 사용 리스트
		HashMap map = new HashMap();
		map.put("nttNo", consumableInventoryVO.getNttNo());
				
       ConsumableInventoryVO result = consumableBoardService.selectUseModify(map);
    	
		//ConsumableInventoryVO result = consumableBoardService.selectInventoryDetailVO(consumableInventoryVO);
		
        model.addAttribute("result", result);
		
		return sLocationUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/com/cons/use/consumableUseModifyActor.do")
	public String consumableUseModifyActor(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		HashMap map = new HashMap();
		
		String sLocationUrl = "forward:/com/cons/consumableCleanPaperUseRegister.do";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		String newUseCn = "";
		String newUseCn_1 = "";
		String newUseCn_2 = "";
		String newUseCn_3 = "";
		String newUseCn_4 = "";
		String newUseCn_5 = "";
		
		Loger.info("ntceBgndeView is : {} " , consumableInventoryVO.getNtceBgndeView() );
		
		String newFacility = consumableInventoryVO.getFacility();
		newUseCn = consumableInventoryVO.getUseCn();
		
		// 설비별 소모품 사용 리스트
		map.put("bbsId", consumableInventoryVO.getBbsId());
		map.put("codeId", consumableInventoryVO.getCodeId());
		map.put("consumable", consumableInventoryVO.getConsumableImsi());
		map.put("nttNo", consumableInventoryVO.getNttNo());
		map.put("mode", consumableInventoryVO.getMode());
				
       ConsumableInventoryVO oldResult = consumableBoardService.selectUseModify(map);
       
       String oldFacility = oldResult.getFacility();
       String oldUseCn = oldResult.getUseCn();
		
		if (sCmd.equals("modify")) {
			map.put("bbsId", consumableInventoryVO.getBbsId());
			map.put("consumableImsi", consumableInventoryVO.getConsumableImsi());
			map.put("oldFacility", oldFacility);
			map.put("oldUseCn", oldUseCn);
			map.put("newFacility", newFacility);
			map.put("newUseCn", newUseCn);
			
			HashMap url = calculatorModify(map);	// 소모품 재고 수정
			
			sLocationUrl = (String) url.get("sLocationUrl");
			model.addAttribute("codeNm", url.get("codeNm"));
	       
			// 사용현황 등록
			consumableInventoryVO.setFacility(newFacility);
			consumableInventoryVO.setUseCn(newUseCn);
			consumableInventoryVO.setUseCn_1(newUseCn_1);
			consumableInventoryVO.setUseCn_2(newUseCn_2);
			consumableInventoryVO.setUseCn_3(newUseCn_3);
			consumableInventoryVO.setUseCn_4(newUseCn_4);
			consumableInventoryVO.setUseCn_5(newUseCn_5);
			consumableInventoryVO.setNtceBgnde(consumableInventoryVO.getNtceBgndeView());
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			
			consumableBoardService.updateUseRegister(consumableInventoryVO);
			
		}
		
		if (consumableInventoryVO.getMode().equals("UV")) {
			sLocationUrl = "forward:/com/cons/consumableUVRampUseRegister.do";
		}
		
		if (consumableInventoryVO.getMode().equals("ROLLER")) {
			sLocationUrl = "forward:/com/cons/cleanRollerUseRegister.do";
		}

		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		
		return sLocationUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private HashMap calculatorModify(HashMap map) throws Exception {

		ConsumableInventoryVO consumableInventoryVO = new ConsumableInventoryVO();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		String sLocationUrl = "forward:/com/cons/consumableCleanPaperUseRegister.do";
		int useCn = 0;
		int inventoryUseCn = 0;
		
		int oldUseCn = Integer.parseInt((String) map.get("oldUseCn"));
		int newUseCn = Integer.parseInt((String) map.get("newUseCn"));
		
		// 재고 수량 가저오기
		ConsumableInventoryVO inventoryResult = consumableBoardService.selectConsumableInventoryCnt(map);	// bbsId, consumableImsi
		
		if (oldUseCn < newUseCn) {		// 기존수량보다 수정수량이 많으면
			inventoryUseCn = Integer.parseInt(inventoryResult.getInventory());
			
			useCn = newUseCn - oldUseCn;
			
			inventoryUseCn = inventoryUseCn - useCn;
			
			if (inventoryUseCn < 0) {
				
				sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
				
				map.put("sLocationUrl", sLocationUrl);
				map.put("codeNm", inventoryResult.getCodeNm());
				
				return map;
			}
			
		} else if (oldUseCn > newUseCn) {		// 수정수량이 기존 수량보다 많으면
			inventoryUseCn = Integer.parseInt(inventoryResult.getInventory());
			
			useCn = oldUseCn - newUseCn;
			
			inventoryUseCn = inventoryUseCn + useCn;
			
			/*if (inventoryUseCn <= 0) {
				System.out.println("재고 수량보다 적다~~~~~");
				
				sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
				
				map.put("sLocationUrl", sLocationUrl);
				map.put("codeNm", inventoryResult.getCodeNm());
				
				return map;
			}*/
			
		} else {
			map.put("sLocationUrl", sLocationUrl);
			return map;
		}

		consumableInventoryVO.setNttNo(inventoryResult.getNttNo());
		consumableInventoryVO.setInventory(Integer.toString(inventoryUseCn));
		consumableInventoryVO.setLastUpdusrId(user.getUniqId());
		//재고현황에서 사용수량 차감
		consumableBoardService.updateConsumableInventoryUse(consumableInventoryVO);
		
		map.put("sLocationUrl", sLocationUrl);
		return map;
	}

}
