package egovframework.com.cons.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cons.service.ConsumableBoardService;
import egovframework.com.cons.service.ConsumableInventoryVO;
import egovframework.com.cop.smt.sdm.service.DeptSchdulManageVO;
import egovframework.com.cop.smt.sdm.service.EgovDeptSchdulManageService;
import egovframework.com.sym.ccm.cca.service.EgovCcmCmmnCodeManageService;
import egovframework.com.sym.ccm.cde.service.EgovCcmCmmnDetailCodeManageService;
import egovframework.com.uss.olp.mgt.service.EgovMeetingManageService;
import egovframework.rte.fdl.property.EgovPropertyService;

public class ConsumableTool {
	
private static final Logger Loger = LoggerFactory.getLogger(ConsumableTool.class);
	
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
	 * 게시물 등록시 필터교체일 등록 및 날짜 계산
	 * @param kind
	 * @param nextDate
	 * @param consumableInventoryVO 
	 * @throws Exception
	 */
	public void fillterSchduleAdd(String kind, int nextDate, ConsumableInventoryVO consumableInventoryVO ) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String day = consumableInventoryVO.getNtceBgndeView();
		
		String thisDay = day.replaceAll("-", "");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			date = dateFormat.parse(thisDay);
			
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, nextDate);
		//System.out.println(date);
		//System.out.println(cal.getTime());
		
		String strDate = dateFormat.format(cal.getTime());
		
		CmmnDetailCode cmmnDetailCode = new CmmnDetailCode();
		cmmnDetailCode.setCodeId(consumableInventoryVO.getCodeId());
		cmmnDetailCode.setCode(consumableInventoryVO.getFacility());
		
		CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode);
		
		Loger.info("vo Nm : {} ", vo);
		
		// 입력일 형식 변환
		//String change = mtboardVO.getChangedateView().substring(0, 4)+"-"+mtboardVO.getChangedateView().substring(4, 6)+"-"+mtboardVO.getChangedateView().substring(6, 8);
		
		/*System.out.println("nextDate : " + strDate);
		System.out.println("changeDate : " +change);
		System.out.println("원본 ChageDate : " +mtboardVO.getChangedateView());*/
		
		// 차기 교체 일정 스케쥴에 등록
		DeptSchdulManageVO deptSchdulManageVO = new DeptSchdulManageVO();
		/*if (kind == "des") {
			if (nextDate == 21) {	// DES PM주기 3주 적용 2015. 01. 04
				String schdulNm =  vo.getCodeNm() + " " + " PM 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			} else {
				String schdulNm =  vo.getCodeNm() + " " + " 필터 교체 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}
		} else {*/
			if (nextDate == 21) {		// PM주기 3주 적용 2015.03.29
				String schdulNm =  vo.getCodeNm() + " " + " PM 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			} else {
				String schdulNm =  vo.getCodeNm() + " " + " 필터 교체 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}
			
			if(nextDate == 15) {
				String schdulNm =  vo.getCodeNm() + " " + " 슬러지 제거 하는날";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}
		//}
		
		String schdulBgnde = strDate+"0000";
		String schdulEndde = strDate+"0000";
		
		deptSchdulManageVO.setSchdulSe("1");
		deptSchdulManageVO.setSchdulIpcrCode("A");
		deptSchdulManageVO.setSchdulDeptId(consumableInventoryVO.getSchdulDeptId());
		deptSchdulManageVO.setReptitSeCode("1");
		deptSchdulManageVO.setSchdulBgnde(schdulBgnde);
		deptSchdulManageVO.setSchdulEndde(schdulEndde);
		deptSchdulManageVO.setSchdulChargerId(user.getUniqId());
		deptSchdulManageVO.setSchdulKindCode("1");
		deptSchdulManageVO.setFrstRegisterId(user.getUniqId());
		deptSchdulManageVO.setLastUpdusrId(user.getUniqId());
		
		egovDeptSchdulManageService.insertDeptSchdulManage(deptSchdulManageVO);	// 차기 일정 스켸쥴 등록
		
	}
	
	/**
	 * 게시물 등록시 필터교체일 등록 및 날짜 계산
	 * @param kind
	 * @param nextDate
	 * @param consumableInventoryVO 
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	public void rollerSchduleAdd(ConsumableInventoryVO consumableInventoryVO ) throws Exception {
		
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String day = consumableInventoryVO.getNtceBgndeView();
		
		String thisDay = day.replaceAll("-", "");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Date date = null;
		try {
			date = dateFormat.parse(thisDay);
			
		} catch (ParseException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		CmmnDetailCode cmmnDetailCode = new CmmnDetailCode();
		cmmnDetailCode.setCodeId(consumableInventoryVO.getCodeId());
		cmmnDetailCode.setCode(consumableInventoryVO.getFacility());
		
		CmmnDetailCode vo = cmmnDetailCodeManageService.selectCmmnDetailCodeDetail(cmmnDetailCode);
		
		Loger.info("vo Nm : {} ", vo);
		
		String schdulNm = null;
		
		if (consumableInventoryVO.getCodeId().equals("COM110")) {
			cal.add(cal.MONTH, +4);
			schdulNm =  vo.getCodeNm() + " " + " Hot Roller 교체 예정일";
		} else if (consumableInventoryVO.getCodeId().equals("COM140") || consumableInventoryVO.getCodeId().equals("COM170")) {
			cal.add(cal.MONTH, +4);
			schdulNm =  vo.getCodeNm() + " " + " 인쇄기 크린롤러 교체 예정일";
		} else if (consumableInventoryVO.getCodeId().equals("COM150")) {
			cal.add(cal.MONTH, +3);
			schdulNm =  vo.getCodeNm() + " " + " DI노광 물류자동화 크린롤러 교체 예정일";
		} else if (consumableInventoryVO.getCodeId().equals("COM195")) {
			cal.add(cal.MONTH, +6);
			schdulNm =  vo.getCodeNm() + " " + " 롤라미 메인롤러 교체 예정일";
		} else if (consumableInventoryVO.getCodeId().equals("COM100")) {
			cal.add(cal.MONTH, +12);
			schdulNm =  vo.getCodeNm() + " " + " 전열로 크린롤러 교체 예정일";
		}
		
		//System.out.println(date);
		//System.out.println(cal.getTime());
		
		String strDate = dateFormat.format(cal.getTime());
		
		// 입력일 형식 변환
		//String change = mtboardVO.getChangedateView().substring(0, 4)+"-"+mtboardVO.getChangedateView().substring(4, 6)+"-"+mtboardVO.getChangedateView().substring(6, 8);
		
		/*System.out.println("nextDate : " + strDate);
		System.out.println("changeDate : " +change);
		System.out.println("원본 ChageDate : " +mtboardVO.getChangedateView());*/
		
		// 차기 교체 일정 스케쥴에 등록
		DeptSchdulManageVO deptSchdulManageVO = new DeptSchdulManageVO();
		/*if (kind == "des") {
			if (nextDate == 21) {	// DES PM주기 3주 적용 2015. 01. 04
				String schdulNm =  vo.getCodeNm() + " " + " PM 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			} else {
				String schdulNm =  vo.getCodeNm() + " " + " 필터 교체 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}
		} else {*/
			
		deptSchdulManageVO.setSchdulNm(schdulNm);
		deptSchdulManageVO.setSchdulCn(schdulNm);
		//}
		
		String schdulBgnde = strDate+"0000";
		String schdulEndde = strDate+"0000";
		
		deptSchdulManageVO.setSchdulSe("1");
		deptSchdulManageVO.setSchdulIpcrCode("A");
		deptSchdulManageVO.setSchdulDeptId(consumableInventoryVO.getSchdulDeptId());
		deptSchdulManageVO.setReptitSeCode("1");
		deptSchdulManageVO.setSchdulBgnde(schdulBgnde);
		deptSchdulManageVO.setSchdulEndde(schdulEndde);
		deptSchdulManageVO.setSchdulChargerId(user.getUniqId());
		deptSchdulManageVO.setSchdulKindCode("1");
		deptSchdulManageVO.setFrstRegisterId(user.getUniqId());
		deptSchdulManageVO.setLastUpdusrId(user.getUniqId());
		
		egovDeptSchdulManageService.insertDeptSchdulManage(deptSchdulManageVO);	// 차기 일정 스켸쥴 등록
		
	}
	
	/**
	 * 계산
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public HashMap calculator(HashMap map) throws Exception {
		ConsumableInventoryVO consumableInventoryVO = new ConsumableInventoryVO();
		//String sLocationUrl = "forward:/com/cons/consumableInventoryList.do";
		
		String sLocationUrl = (String) map.get("sLocationUrl");
		
		Loger.info("계산식 sLocationUrl : {} ", sLocationUrl);

		System.out.println("========================= Map ====================");
		System.out.println("bbsId : " +map.get("bbsId"));
		System.out.println("consumableImsi : " +map.get("consumableImsi"));
		System.out.println("사용수량 : " +map.get("useCn"));
		System.out.println("user : " +map.get("user"));
		
		ConsumableInventoryVO result = consumableBoardService.selectConsumableInventoryCnt(map);
		
		System.out.println("======================= calculator ==============================");
		System.out.println("result : " + result);
		
		if (result == null) {
			//System.out.println("재고 부족");
			sLocationUrl = "egovframework/com/cons/use/ConsumableUseRegisterError";
			
			map.put("sLocationUrl", sLocationUrl);
			
			return map;
		}
		
		/*System.out.println("result No : " +result.getNttNo());
		System.out.println("result Code : " +result.getCodeId());
		System.out.println("result Code Name : " +result.getCodeNm());
		System.out.println("result 재고수량 : " +result.getInventory());*/
		
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
		}
		
		Loger.info("return sLocationUrl : {} ", sLocationUrl);
		
		map.put("sLocationUrl", sLocationUrl);
		return map;
		
	}
}
