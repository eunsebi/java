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
 * 액절롤러 관리 화면
 * @author IJMAIL
 *
 */

@Controller
public class ConsumableDryController extends ConsumableTool {
	private static final Logger Loger = LoggerFactory.getLogger(ConsumableFilterController.class);
	
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
	 * 액절롤러 등록 이동화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableDryUseList.do")
	public String consumableDryUseList(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		Loger.info("consumable Dry Use List " );
		
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		
		return "egovframework/com/cons/use/Dry/DryUseList";
	}
	
	/**
	 * 액절롤러 사용 등록화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/consumableDryUseRegister.do")
	public String consumableDryUseRegister(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			BindingResult bindingResult,
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		//System.out.println("=========================== 필터 등록페이지 ============================");
		
		Loger.info("Dry Use Register " );
		
		//공통코드 설비명종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId(consumableInventoryVO.getCodeId());
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("facility", listComCode);
    	
    	//공통코드  유포지 종류
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
		map.put("mode", consumableInventoryVO.getMode());
				
        Map<String, Object> listMap = consumableBoardService.selectUseList(consumableInventoryVO);
        int totCnt = consumableBoardService.selectUseListCnt(consumableInventoryVO);
       // int totCnt = Integer.parseInt((String)listMap.get("resultCnt"));
		
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
		
		Map<String, Object> invenMap = consumableBoardService.selectInventoryArticles(consumableInventoryVO);
		//int invenTotCnt = Integer.parseInt((String)invenMap.get("resultCnt"));
		
		//paginationInfo.setTotalRecordCount(invenTotCnt);
		
		model.addAttribute("invenResultList", invenMap.get("resultList"));
		String sLocationUrl ="egovframework/com/cons/use/Dry/DryUseRegister";
		
		Loger.info(sLocationUrl);
        
		return sLocationUrl;
	}
	
	/**
	 * 필터 사용현황 등록처리
	 * @param consumableInventoryVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/consumableDryUseRegisterActor.do")
	public String consumableDryUseRegisterActor(
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
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		String sLocationUrl = "forward:/com/cons/consumableDryUseRegister.do";
		
		beanValidator.validate(consumableInventoryVO, bindingResult);
		
		// 임시 삭제
		/*if(bindingResult.hasErrors()) {
			return "egovframework/com/cons/use/filter/FilterUseRegister";
		}*/
		
		if (isAuthenticated) {

			HashMap map = new HashMap();
			map.put("user", user.getUniqId());
			
			// 소모품
			/*if (consumableInventoryVO.getUseCn().length() != 0) {
				map.put("bbsId", consumableInventoryVO.getBbsId());
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi());
				map.put("useCn", consumableInventoryVO.getUseCn());
				map.put("sLocationUrl", sLocationUrl);
				
				HashMap url = calculator(map);
				model.addAttribute("codeNm", url.get("codeNm"));
				sLocationUrl = (String) url.get("sLocationUrl");
			}
			// 소모품 1번
			if (consumableInventoryVO.getUseCn_1().length() != 0) {
				map.put("bbsId", consumableInventoryVO.getBbsId());
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi_1());
				map.put("useCn", consumableInventoryVO.getUseCn_1());
				map.put("sLocationUrl", sLocationUrl);
				HashMap url = calculator(map);
				model.addAttribute("codeNm", url.get("codeNm"));
				sLocationUrl = (String) url.get("sLocationUrl");
			}
			// 소모품 2번
			if (consumableInventoryVO.getUseCn_2().length() != 0) {
				map.put("bbsId", consumableInventoryVO.getBbsId());
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi_2());
				map.put("useCn", consumableInventoryVO.getUseCn_2());
				map.put("sLocationUrl", sLocationUrl);
				HashMap url = calculator(map);
				model.addAttribute("codeNm", url.get("codeNm"));
				sLocationUrl = (String) url.get("sLocationUrl");
			}*/

			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			
			consumableInventoryVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			consumableInventoryVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			consumableBoardService.insertCleanPaperUseRegister(consumableInventoryVO);

		}
		
		return sLocationUrl;
	}

	/**
	 * 필터 설비별 소모품 사용현황 수정 화면
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/use/consumableDryUseModify.do")
	public String consumableFilterUseModify(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		String sLocationUrl = "egovframework/com/cons/use/Dry/DryUseModify";
		
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
        
        Map<String, Object> invenMap = consumableBoardService.selectInventoryArticles(consumableInventoryVO);
		//int invenTotCnt = Integer.parseInt((String)invenMap.get("resultCnt"));
		
		//paginationInfo.setTotalRecordCount(invenTotCnt);
		
		model.addAttribute("invenResultList", invenMap.get("resultList"));
		
		return sLocationUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping("/com/cons/use/consumableDryUseModifyActor.do")
	public String consumableFilterUseModifyActor(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		HashMap map = new HashMap();
		
		String sLocationUrl = "forward:/com/cons/consumableDryUseRegister.do";

		String oldFacility = "";
		String newFacility = "";
		String oldUseCn = "";
		String oldUseCn_1 = "";
		String oldUseCn_2 = "";
		String newUseCn = "";
		String newUseCn_1 = "";
		String newUseCn_2 = "";
		String newUseCn_3 = "";
		String newUseCn_4 = "";
		String newUseCn_5 = "";
		HashMap<String, Object> url = null;
		
		String codeId = consumableInventoryVO.getCodeId();
		String bbsId = consumableInventoryVO.getBbsId();
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		// 수정전 사용한 소모품 현황 가져오기 (nttNo)
		map.put("nttNo", consumableInventoryVO.getNttNo());
				
       ConsumableInventoryVO oldResult = consumableBoardService.selectUseModify(map);
       
       Loger.info("수정전 Result is : {} ", oldResult);
		
       oldFacility = oldResult.getFacility();
       oldUseCn = oldResult.getUseCn();
       oldUseCn_1 = oldResult.getUseCn_1();
       oldUseCn_2 = oldResult.getUseCn_2();
       
       if (codeId.equals("COM130")) {		// DES
    	   // 수정 변수 대입
    	   newFacility = consumableInventoryVO.getFacility();
    	   newUseCn = consumableInventoryVO.getUseCn();
    	   newUseCn_1 = consumableInventoryVO.getUseCn_1();
    	   newUseCn_2 = consumableInventoryVO.getUseCn_2();
       } else if (codeId.equals("COM160")) {
    	   // 수정 변수 대입
    	   newFacility = consumableInventoryVO.getFacility();
    	   newUseCn = consumableInventoryVO.getUseCn();
    	   newUseCn_1 = consumableInventoryVO.getUseCn_1();
       }
       
      /* Loger.info("수정전 호기 is : {} ", oldFacility);
       Loger.info("수정전 수량 is : {} ", oldUseCn);
       Loger.info("수정전 수량_1 is : {} ", oldUseCn_1);
       Loger.info("수정전 수량_2 is : {} ", oldUseCn_2);
       Loger.info("수정전 수량_3 is : {} ", oldUseCn_3);
       Loger.info("수정전 수량_4 is : {} ", oldUseCn_4);
       Loger.info("수정전 수량_5 is : {} ", oldUseCn_5);
       
       Loger.info("수정후 대입 호기 is : {} ", newFacility);
       Loger.info("수정후 대입 수량 is : {} ", newUseCn);
       Loger.info("수정후 대입 수량_1 is : {} ", newUseCn_1);
       Loger.info("수정후 대입 수량_2 is : {} ", newUseCn_2);
       Loger.info("수정후 대입 수량_3 is : {} ", newUseCn_3);
       Loger.info("수정후 대입 수량_4 is : {} ", newUseCn_4);
       Loger.info("수정후 대입 수량_5 is : {} ", newUseCn_5);*/
       
		
		if (sCmd.equals("modify")) {
			map.put("bbsId", bbsId);
			map.put("codeId", codeId);
			map.put("oldFacility", oldFacility);
			map.put("newFacility", newFacility);
			
			if (newUseCn.length() != 0 ) {
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi());
				map.put("oldUseCn", oldUseCn);
				map.put("newUseCn", newUseCn);
				url = calculatorModify(map);	// 소모품 재고 수정
			}
			
			if (newUseCn_1.length() != 0) {
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi_1());
				map.put("oldUseCn", oldUseCn_1);
				map.put("newUseCn", newUseCn_1);
				url = calculatorModify(map);	// 소모품 재고 수정
			}
			
			if (newUseCn_2.length() != 0) {
				map.put("consumableImsi", consumableInventoryVO.getConsumableImsi_2());
				map.put("oldUseCn", oldUseCn_2);
				map.put("newUseCn", newUseCn_2);
				url = calculatorModify(map);	// 소모품 재고 수정
			}
			
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
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			
			consumableBoardService.updateUseRegister(consumableInventoryVO);
			
		}
		
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		
		return sLocationUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private HashMap calculatorModify(HashMap map) throws Exception {

		ConsumableInventoryVO consumableInventoryVO = new ConsumableInventoryVO();
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

		String sLocationUrl = "forward:/com/cons/consumableDryUseRegister.do";
		
		int useCn = 0;
		int inventoryUseCn;
		
		int oldUseCn = 0;
		int newUseCn = 0;
		
		
		if (map.get("oldUseCn").equals("")) {
			oldUseCn = 0;
		} else {
			oldUseCn = Integer.parseInt((String) map.get("oldUseCn"));
		}
		newUseCn = Integer.parseInt((String) map.get("newUseCn"));
		
		
		/*Loger.info("계산 전 넘어온 수정전 수량 is : {} ", oldUseCn );
		Loger.info("계산 전 넘어온 수정 후 수량 Code is : {} ", newUseCn );*/

		// 재고 수량 가저오기
		ConsumableInventoryVO inventoryResult = consumableBoardService.selectConsumableInventoryCnt(map);	// bbsId, consumableImsi
		
		inventoryUseCn = Integer.parseInt(inventoryResult.getInventory());	// 현재 재고수량
		
		if (oldUseCn < newUseCn) {		// 기존수량보다 수정수량이 많으면
			
			useCn = newUseCn - oldUseCn;
			
			inventoryUseCn = inventoryUseCn - useCn;
			
			if (inventoryUseCn < 0) {
				
				sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
				
				map.put("sLocationUrl", sLocationUrl);
				map.put("codeNm", inventoryResult.getCodeNm());
				
			}
			
			
		} else if (oldUseCn > newUseCn) {		// 수정수량이 기존 수량보다 많으면
			useCn = oldUseCn - newUseCn;
			
			inventoryUseCn = inventoryUseCn + useCn;
			
			/*if (inventoryUseCn <= 0) {
				System.out.println("재고 수량보다 적다~~~~~");
				
				sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
				
				map.put("sLocationUrl", sLocationUrl);
				map.put("codeNm", inventoryResult.getCodeNm());
				
				return map;
			}*/
			
			
		}
		
		/*Loger.info("재고현황 소모품명: {} ", inventoryResult.getCodeNm());
		Loger.info("재고현황 재고 수량 : {} ", inventoryResult.getInventory());
		Loger.info("계산 후 남은사용 수량 : {} ", inventoryUseCn);*/

		consumableInventoryVO.setNttNo(inventoryResult.getNttNo());
		consumableInventoryVO.setInventory(Integer.toString(inventoryUseCn));
		consumableInventoryVO.setLastUpdusrId(user.getUniqId());
		//재고현황에서 사용수량 차감
		consumableBoardService.updateConsumableInventoryUse(consumableInventoryVO);
		
		map.put("sLocationUrl", sLocationUrl);
		return map;
	}


}
