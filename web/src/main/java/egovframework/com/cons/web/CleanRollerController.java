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
import egovframework.com.sym.ccm.cca.service.CmmnCode;
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.com.uss.olp.mgt.service.EgovMeetingManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 크린롤러 및 DFR라미 핫롤러
 * @author IJMAIL
 *
 */

@Controller
public class CleanRollerController extends ConsumableTool {
	
	private static final Logger Loger = LoggerFactory.getLogger(CleanRollerController.class);
	
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

	/**
	 * 반출 대기 수량 리스트
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/cons/cleanRollerInventorylist.do")
	public String cleanRollerInventorylist(@ModelAttribute("searchVO") ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		String sLocation = "egovframework/com/cons/inventory/CleanRollerInventoryList";
		
		Loger.info("sLocation is {} ", sLocation);
		Loger.info("bbsId is {} ",consumableInventoryVO.getBbsId());
		Loger.info("Mode is {} ",consumableInventoryVO.getMode());
		
		consumableInventoryVO.setPageUnit(propertyService.getInt("pageUnit"));
		consumableInventoryVO.setPageSize(propertyService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(consumableInventoryVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(consumableInventoryVO.getPageUnit());
		paginationInfo.setPageSize(consumableInventoryVO.getPageSize());

		consumableInventoryVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		consumableInventoryVO.setLastIndex(paginationInfo.getLastRecordIndex());
		consumableInventoryVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		Map<String, Object> map = consumableBoardService.selectCleanRollerInventoryList(consumableInventoryVO);
		int totCnt = Integer.parseInt((String)map.get("resultCnt"));
		
		paginationInfo.setTotalRecordCount(totCnt);
		
		Loger.info("result is {} ", map.get("resultList"));
		Loger.info("resultCnt is {} ", map.get("resultCnt"));
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("consumableInventoryVO", consumableInventoryVO);
		model.addAttribute("paginationInfo", paginationInfo);

		return sLocation;
	}
	
	/**
	 * 크린롤러 및 Hot Roller 등록 화면 및 리스트
	 * @param searchVO
	 * @param commandMap
	 * @param bindingResult
	 * @param consumableInventoryVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("/com/cons/cleanRollerUseRegister.do")
	public String cleanRollerUseRegister(@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			BindingResult bindingResult,
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			ModelMap model) throws Exception {
		
		String sLocation = "egovframework/com/cons/use/CleanRoller/CleanRollerUseRegister";
		
		Loger.info("sLocation is {} ", sLocation);
		Loger.info("bbsId is {} ",consumableInventoryVO.getBbsId());
		Loger.info("mode is {} ",consumableInventoryVO.getMode());
		
		//공통코드 설비명종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId(consumableInventoryVO.getCodeId());
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	List<?> listComCode_hot = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("facility", listComCode);
    	
    	//공통코드  유포지 종류
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("IM030");
    	voComCode.setCode(consumableInventoryVO.getConsumable());
    	//ComDefaultCodeVO comCode = cmmUseService.selectCmmCodeDetailVO(voComCode);
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	
    	model.addAttribute("consumable", listComCode);
    	
    	//공통코드  유포지 종류
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM300");
    	voComCode.setCode(consumableInventoryVO.getConsumable());
    	//ComDefaultCodeVO comCode = cmmUseService.selectCmmCodeDetailVO(voComCode);
    	listComCode_hot = cmmUseService.selectCmmCodeDetail(voComCode);
    	
    	model.addAttribute("consumable_hot", listComCode_hot);
    	
    	
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
		
		Loger.info("사용 resultList is {} ",listMap.get("resultList"));
		
		// 공통코드 조회
		CmmnCode cmmnCode = new CmmnCode();
		cmmnCode.setCodeId(consumableInventoryVO.getCodeId());
		CmmnCode vo =cmmnCodeManageService.selectCmmnCodeDetail(cmmnCode);
		model.addAttribute("cmmnCode", vo);
		
		Map<String, Object> invenMap = consumableBoardService.selectInventoryArticles(consumableInventoryVO);
		//int invenTotCnt = Integer.parseInt((String)invenMap.get("resultCnt"));
		
		//paginationInfo.setTotalRecordCount(invenTotCnt);
		
		model.addAttribute("invenResultList", invenMap.get("resultList"));
		
		Loger.info("재고 resultList is {} ",invenMap.get("resultList"));
		
		return sLocation;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping("com/cons/cleanRollerUseRegisterActor.do")
	public String cleanRollerUseRegisterActor(
			@ModelAttribute("consumableInventoryVO") ConsumableInventoryVO consumableInventoryVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception{
		
		String sLocationUrl = "forward:/com/cons/cleanRollerUseRegister.do";
		
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
			
			if (consumableInventoryVO.getCodeId().equals("COM110")) {
				// 소모품 0번
				if (consumableInventoryVO.getUseCn().length() != 0) {
					map.put("bbsId", consumableInventoryVO.getBbsId());
					map.put("consumableImsi", consumableInventoryVO.getConsumableImsi());
					map.put("useCn", consumableInventoryVO.getUseCn());
					map.put("takeOut", consumableInventoryVO.getUseCn());
					
					HashMap url = rollerCalculator(map);			// 소모품 재고현황에서 사용수량 차감
					model.addAttribute("codeNm", url.get("codeNm"));
					sLocationUrl = (String) url.get("sLocationUrl");
				}
			}
			
			consumableInventoryVO.setFrstRegisterId(user.getUniqId());
			consumableInventoryVO.setOutId(consumableInventoryVO.getBbsId());
			consumableInventoryVO.setOutCn(consumableInventoryVO.getUseCn());
			
			Loger.info("sLocation is {} ", sLocationUrl);
			Loger.info("bbsId is {} ",consumableInventoryVO.getBbsId());
			Loger.info("CodeId is {} ",consumableInventoryVO.getCodeId());
			Loger.info("getUseCn is {} ",consumableInventoryVO.getUseCn());
			
			consumableInventoryVO.setNtcrId(user.getId()); //게시물 통계 집계를 위해 등록자 ID 저장
			consumableInventoryVO.setNtcrNm(user.getName()); //게시물 통계 집계를 위해 등록자 Name 저장
			
			// 사용현황 등록
			consumableBoardService.insertCleanPaperUseRegister(consumableInventoryVO);
			
			// 스켸쥴 등록
		
			if (consumableInventoryVO.getCodeId().equals("COM110") || consumableInventoryVO.getCodeId().equals("COM140") ||
					consumableInventoryVO.getCodeId().equals("COM150") || consumableInventoryVO.getCodeId().equals("COM190")) {
				rollerSchduleAdd(consumableInventoryVO);		// Hot Roller 교체 예정일 등록
			}
					
		}
		
		return sLocationUrl;
	}
	
	@RequestMapping("/com/cons/cleanRollerTakeOut.do")
	public String cleanRollerTakeOut(
			@ModelAttribute("searchVO") ConsumableInventoryVO consumableInventoryVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocationUrl = "forward:/com/cons/cleanRollerInventorylist.do";
		
		Loger.info("cleanRollerTakeOut ");
		Loger.info("cleanRollerTakeOut bbsId is : {} ", consumableInventoryVO.getBbsId());
		Loger.info("cleanRollerTakeOut nttNo is : {} ", consumableInventoryVO.getNttNo());
		
		consumableInventoryVO.setLastUpdusrId(user.getOrgnztId());
		
		consumableBoardService.deleteCleanRollerTakeOutList(consumableInventoryVO);
		
		model.addAttribute("consumbleInventoryVO", consumableInventoryVO);
		
		return sLocationUrl;
	}
	
	/**
	 * 계산
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private HashMap rollerCalculator(HashMap map) throws Exception {
		
		ConsumableInventoryVO consumableInventoryVO = new ConsumableInventoryVO();
		String sLocationUrl = "forward:/com/cons/cleanRollerUseRegister.do";

		Loger.info("재고 등록 계산식 " );
		Loger.info("sLocation is {} ", sLocationUrl);
		Loger.info("bbsId is {} ", map.get("bbsId"));
		Loger.info("consumableImsi is {} ", map.get("consumableImsi"));
		Loger.info("Input takeOut is {} ", map.get("takeOut"));
		
		ConsumableInventoryVO result = consumableBoardService.selectConsumableInventoryCnt(map);
		
		/*System.out.println("======================= calculator ==============================");
		System.out.println("result : " + result);*/
		
		Loger.info("result is : {} ", result);
		
		if (result == null) {
			//System.out.println("재고 부족");
			sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
			
			map.put("sLocationUrl", sLocationUrl);
			
			return map;
		}
		
		int inventory = Integer.parseInt(result.getInventory());
		
		//System.out.println(result.getCodeNm() + " 현재 재고 : " + inventory);
		
		inventory = inventory - Integer.parseInt((String) map.get("useCn"));
		
		
		//System.out.println(result.getCodeNm() + " 사용후 재고 : " + inventory);
		
		if (inventory < 0 ) {
			//System.out.println("재고 부족");
			sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
			
			map.put("sLocationUrl", sLocationUrl);
			map.put("codeNm", result.getCodeNm());
			
			return map;
			
		} else {
			consumableInventoryVO.setNttNo(result.getNttNo());
			consumableInventoryVO.setInventory(Integer.toString(inventory));
			consumableInventoryVO.setLastUpdusrId((String) map.get("user"));
			
			//재고현황에서 사용수량 차감
			consumableBoardService.updateConsumableInventoryUse(consumableInventoryVO);
			//반출리스트 등록
			consumableInventoryVO.setBbsId((String) map.get("bbsId"));
			consumableInventoryVO.setCodeId((String) map.get("consumableImsi"));
			consumableInventoryVO.setFrstRegisterId((String) map.get("user"));
			
			Loger.info("CodeID : {} ", consumableInventoryVO.getCodeId() );

			ConsumableInventoryVO selectResult = consumableBoardService.selectCleanRollerDetailVO(consumableInventoryVO);
			
			Loger.info("listMap Result is {} ", selectResult);
			
			int takeOut;
			if (selectResult == null) {
				takeOut = 0;
			} else {
				takeOut = Integer.parseInt(selectResult.getTakeOut());
			}
			
			Loger.info("takeOut is {} ", takeOut);
			
			if (takeOut == 0) {
				Loger.info("반출 재고 없다 " );
				consumableInventoryVO.setTakeOut((String) map.get("takeOut"));
				Loger.info("반출 재고 없다 takeOut에 대입 완료" );
				consumableBoardService.insertCleanRollerTakeOutList(consumableInventoryVO);
			} else {
				takeOut = takeOut + Integer.parseInt((String) map.get("takeOut"));
				
				consumableInventoryVO.setTakeOut(Integer.toString(takeOut));
				consumableInventoryVO.setNttNo(selectResult.getNttNo());
				
				consumableBoardService.updateCleanRollerTakeOutList(consumableInventoryVO);
			}
		}
		
		map.put("sLocationUrl", sLocationUrl);
		return map;
		
	}
}
