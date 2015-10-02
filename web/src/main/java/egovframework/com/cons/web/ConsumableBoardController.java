package egovframework.com.cons.web;

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
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.com.uss.olp.mgt.service.EgovMeetingManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class ConsumableBoardController extends ConsumableTool {
	
	private static final Logger Loger = LoggerFactory.getLogger(ConsumableBoardController.class);
	
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
	 * 소모품 재고현황 List
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableInventoryList.do")
	public String materialInventoryList(
			@ModelAttribute("searchVO") ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		consumableInventoryVO.setPageUnit(propertyService.getInt("pageUnit"));
		consumableInventoryVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(consumableInventoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(consumableInventoryVO.getPageUnit());
		paginationInfo.setPageSize(consumableInventoryVO.getPageSize());

		consumableInventoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		consumableInventoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		consumableInventoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = consumableBoardService.selectConsumableInventoryArticles(consumableInventoryVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		Loger.info("bbsId is {} ",consumableInventoryVO.getBbsId());
		Loger.info("result is {} ", map.get("resultList"));
		Loger.info("resultCnt is {} ", map.get("resultCnt"));
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "egovframework/com/cons/inventory/ConsumableInventoryList";
	}
	
	/**
	 * 소모품 재고 등록화면 이동
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableInventoryRegister.do")
	public String consumableInventoryRegister(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
    	//공통코드  유포지 종류
    	ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
    	voComCode = new ComDefaultCodeVO();
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	voComCode.setCodeId("COM300");
    	//ComDefaultCodeVO comCode = cmmUseService.selectCmmCodeDetailVO(voComCode);
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	
    	model.addAttribute("consumable", listComCode);
    	model.addAttribute("consumableInventoryVO", consumableInventoryVO);
    	
		return "egovframework/com/cons/inventory/ConsumableInventoryRegister";
	}
	
	/**
	 * 소모품 재고현황 등록 처리
	 * @param consumableInventoryVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableInventoryRegisterActor.do")
	public String consumableInventoryRegisterActor(
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception {
		
		/*System.out.println("부서: " + consumableInventoryVO.getSchdulDeptName());
		System.out.println("부서 code: " + consumableInventoryVO.getSchdulDeptId());
		System.out.println("소모품명 : " + consumableInventoryVO.getConsumable());
		System.out.println("사용수량 : " + consumableInventoryVO.getUseCn());
		System.out.println("교체일 : " + consumableInventoryVO.getNtceBgndeView());
		System.out.println("bbsId : " + consumableInventoryVO.getBbsId());*/
		
		int inventory = 0;
		String t1 = "ORGNZT_0000000000011";
		String t2 = "ORGNZT_0000000000000";
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		beanValidator.validate(consumableInventoryVO, bindingResult);
		
		/*if(bindingResult.hasErrors()) {
			return "egovframework/com/cons/inventory/consumableInventoryRegister";
		}*/
		
		//해당 부서 확인
		if (consumableInventoryVO.getBbsId().equals("CONS_001")) {
			consumableInventoryVO.setSchdulDeptId(t1);
		} else if (consumableInventoryVO.getBbsId() == "CONS_002") {
			consumableInventoryVO.setSchdulDeptId(t2);
		}
		//System.out.println("해당 부서 : " + consumableInventoryVO.getSchdulDeptId());
		
		// 소모품 재고 확인
		ConsumableInventoryVO result = consumableBoardService.selectConsumableCodeInventory(consumableInventoryVO);
		
		
		if (result != null) {
			inventory = Integer.parseInt(result.getInventory());
			//System.out.println("재고 : " + inventory);
			inventory = inventory + Integer.parseInt(consumableInventoryVO.getUseCn());

			consumableInventoryVO.setInventory(Integer.toString(inventory));
		} else {
			consumableInventoryVO.setInventory(consumableInventoryVO.getUseCn());
		}
		
		//System.out.println("입고 + 재고 : " + consumableInventoryVO.getInventory());
		
		if (isAuthenticated) {
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			consumableInventoryVO.setLastUpdusrId(user.getUniqId());
			
			consumableInventoryVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			consumableInventoryVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			consumableBoardService.insertConsumableInventoryRegister(consumableInventoryVO);
		}
		
		return "forward:/com/cons/consumableInventoryList.do";
	}
	
	/**
	 * 소모품 재고 수정 페이지
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableInventoryModify.do")
	public String consumableInventoryModify(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception{
		
		String sLocationUrl = "egovframework/com/cons/inventory/ConsumableInventoryModify";
		
		//String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		ConsumableInventoryVO result = consumableBoardService.selectInventoryDetailVO(consumableInventoryVO);
		
		model.addAttribute("result", result);
		
		return sLocationUrl;
	}
	
	/**
	 * 수정처리
	 * @param searchVO
	 * @param commandMap
	 * @param consumableInventoryVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/consumableInventoryModifyActor.do")
	public String consumableInventoryModifyActor(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocationUrl = "forward:/com/cons/consumableInventoryList.do";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		consumableInventoryVO.setLastUpdusrId(user.getUniqId());
		
		if(sCmd.equals("del")){
			consumableBoardService.deleteConsumableInventory(consumableInventoryVO);
		} else {
			
			//서버  validate 체크
			// 임시 삭제
            /*beanValidator.validate(consumableInventoryVO, bindingResult);
    		if(bindingResult.hasErrors()){

    			return sLocationUrl;
    		}*/
			consumableBoardService.updateConsumableInventoryUse(consumableInventoryVO);
		}
		
		return sLocationUrl;
	}
	
	@SuppressWarnings("unused")
	@RequestMapping("/com/cons/consumableInventoryMoveActor.do")
	public String consumableInventoryMoveActor(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception {
		
		Loger.info("공장 : {} ", consumableInventoryVO.getBbsId());
		Loger.info("No: {} ", consumableInventoryVO.getNttNo());
		Loger.info("consumable : {} ", consumableInventoryVO.getConsumableImsi());
		Loger.info("inventory : {} ", consumableInventoryVO.getInventory());
		
		String t1 = "CONS_001";
		String t2 = "CONS_002";
		String consumable = consumableInventoryVO.getConsumableImsi();
		String site = consumableInventoryVO.getBbsId();
		
		if (site.equals(t1)) {
			Loger.info("1공장입니당~~~~~ " );
			
		} else if (site.equals(t2)) {
			Loger.info("2공장입니당~~~~~ " );
		}
		
		return "forward:/com/cons/consumableInventoryList.do";
	}
	
	
	@RequestMapping("/com/cons/use/ConsumableUseRegisterError.do")
	public String userRegisterError() {
		
		String sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
		
		return sLocationUrl;
	}
	

}
