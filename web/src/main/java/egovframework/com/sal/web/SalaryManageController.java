package egovframework.com.sal.web;

import java.text.DecimalFormat;
import java.util.ArrayList;
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
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sal.service.SalaryManageService;
import egovframework.com.sal.service.SalaryManageVO;
import egovframework.com.sal.service.SalaryUserMonelyVO;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;

@Controller
public class SalaryManageController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SalaryManageController.class);
	
	@Autowired
	private DefaultBeanValidator beanValidator;

	/** EgovMessageSource */
    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name="EgovCmmUseService")
	private EgovCmmUseService cmmUseService;
    
    @Resource(name = "salaryManageService")
	private SalaryManageService salaryManageService;
    
    /**
     * Main page용
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/sal/SalaryManageMainList.do")
	public String salaryMainList() throws Exception {
		return "egovframework/com/sal/SalaryManageMainList";
	}
	
	/**
	 * 근무일 목록을 조회한다.
	 * @param searchVO
	 * @param commandMap
	 * @param salaryManageVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name="근무일정관리", order = 321 ,gid = 41)
	@RequestMapping(value="/sal/SalaryManageList.do")
	public String egovDeptSchdulManageList(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			SalaryManageVO salaryManageVO,
    		ModelMap model)
    		throws Exception {

		//로그인 객체 선언
    	LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	
        List<?> resultList = salaryManageService.selectDeptSchdulManageList(searchVO);
        model.addAttribute("resultList", resultList);
        
        // 급여 정보 얻기
        commandMap.put("salaryUserId", loginVO.getUniqId());
        commandMap.put("mode", "DETAIL");
        SalaryUserMonelyVO result = salaryManageService.selectUserMonelyDetail(commandMap);
        
        LOGGER.info("Main list result is : {} ", result);
        if (result == null) {
        	return "forward:/sal/SalaryUserMonelyRegist.do";
        }

		return "egovframework/com/sal/SalaryManageList";
	}
	
	/**
	 * 근무일(월별) 목록을 조회한다.
	 * @param searchVO
	 * @param commandMap
	 * @param salaryManageVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/sal/SalaryManageMonthList.do")
	public String salaryManageMonthList(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<String, String> commandMap,
			SalaryManageVO salaryManageVO,
    		ModelMap model) throws Exception {
		
		//일정구분 검색 유지
        model.addAttribute("searchKeyword", commandMap.get("searchKeyword") == null ? "" : (String)commandMap.get("searchKeyword"));
        model.addAttribute("searchCondition", commandMap.get("searchCondition") == null ? "" : (String)commandMap.get("searchCondition"));

		java.util.Calendar cal = java.util.Calendar.getInstance();

		String sYear = (String)commandMap.get("year");
		String sMonth = (String)commandMap.get("month");

		int iYear = cal.get(java.util.Calendar.YEAR);
		int iMonth = cal.get(java.util.Calendar.MONTH);
		int iDate = cal.get(java.util.Calendar.DATE);

		//검색 설정
		String sSearchDate = "";
		if(sYear == null || sMonth == null){
			sSearchDate += Integer.toString(iYear);
			sSearchDate += Integer.toString(iMonth+1).length() == 1 ? "0" + Integer.toString(iMonth+1) : Integer.toString(iMonth+1);
		}else{
			iYear = Integer.parseInt(sYear);
			iMonth = Integer.parseInt(sMonth);
			sSearchDate += sYear;
			sSearchDate += Integer.toString(iMonth+1).length() == 1 ? "0" + Integer.toString(iMonth+1) :Integer.toString(iMonth+1);
		}

		commandMap.put("searchMonth", sSearchDate);

		//공통코드 부서일정종류
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	   	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM400");
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salarySe", listComCode);
    	
    	//공통코드  잔업유무 조회
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM410");
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salaryPro", listComCode);

    	/*voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM420");
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salaryPro2", listComCode);*/
    	//로그인 객체 선언
    	LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    	if(loginVO == null){ loginVO = new LoginVO();}
    	//commandMap.put("schdulDeptId", (String)loginVO.getOrgnztId());

    	commandMap.put("searchMode", "MONTH");
    	
   		commandMap.put("salaryUserId", loginVO.getUniqId());
        
    	List<?> resultList = salaryManageService.selectSalaryManageRetrieve(commandMap);
        model.addAttribute("resultList", resultList);

        // 급여 정보 얻기
        commandMap.put("mode", "DETAIL");
        SalaryUserMonelyVO result = salaryManageService.selectUserMonelyDetail(commandMap);

        /*if (result == null) {
        	return "redirect:/sal/SalaryUserMonelyRegist.do";
        }*/

        model.addAttribute("basic", result);
        LOGGER.info("급여 리스트 : {} ", resultList );

        if (resultList.size() == 0) {
        	return "egovframework/com/sal/SalaryManageMonthList";
        } else {
        	// 급여계산 메서드 호출
        	HashMap<String, ?> calModel = salaryCalculation(commandMap);
        	model.addAttribute("salarySum", calModel);

        	return "egovframework/com/sal/SalaryManageMonthList";
        	
        }
        
	}
	
	/**
	 * 근무일 등록화면으로 이동
	 * @param searchVO
	 * @param commandMap
	 * @param salaryManageVO
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sal/SalaryManageRegist.do")
	public String deptSchdulManageRegist(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			@ModelAttribute("salaryManageVO") SalaryManageVO salaryManageVO,
			BindingResult bindingResult,
    		ModelMap model)
    throws Exception {

		String sLocationUrl = "egovframework/com/sal/SalaryManageRegist";

    	// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovLoginUsr";
    	}

    	ComDefaultCodeVO voComCode = new ComDefaultCodeVO();

    	//공통코드 근무일정 조회
    	voComCode.setCodeId("COM400");
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salarySe", listComCode);
    	
    	//공통코드  잔업유무 조회
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM410");
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salaryPro", listComCode);

    	//일정시작일자(시)
    	model.addAttribute("schdulBgndeHH", (List<?>)getTimeHH());
    	//일정시작일자(분)
    	model.addAttribute("schdulBgndeMM", (List<?>)getTimeMM());
    	//일정종료일자(시)
    	model.addAttribute("schdulEnddeHH", (List<?>)getTimeHH());
    	//일정정료일자(분)
    	model.addAttribute("schdulEnddeMM", (List<?>)getTimeMM());
    	
    	return sLocationUrl;

	}
	
	/**
	 * 근무일 등록(실행)
	 * @param searchVO
	 * @param commandMap
	 * @param salarymanageVO
	 * @param bindngResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sal/SalaryManageRegistActor.do")
	public String SalaryManageRegistActor(
			@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?,?> commandMap,
			@ModelAttribute("salaryManageVO") SalaryManageVO salarymanageVO,
			BindingResult bindngResult, ModelMap model
			) throws Exception {
		
    	// 0. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		
		// 로그인 객체 선언
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sLocationUrl = "egovframework/com/sal/SalaryManageRegist";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		LOGGER.info("cmd => {} ", sCmd);
		
		if(sCmd.equals("save")) {
			// 서버 validate 체크
			beanValidator.validate(salarymanageVO, bindngResult);
			if(bindngResult.hasErrors()) {
				
				return sLocationUrl;
			}
			
			//아이디 설정
			salarymanageVO.setFrstRegisterId((String)loginVO.getUniqId());
			salarymanageVO.setLastUpdusrId((String)loginVO.getUniqId());
			
			salaryManageService.insertSalaryManage(salarymanageVO);
			sLocationUrl = "forward:/sal/SalaryManageList.do";
		}
		
		return sLocationUrl;
	}

	/**
	 * 근무일정 목록 상세조회
	 * @param searchVO
	 * @param salaryManageVO
	 * @param commandMap
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sal/SalaryManageDetail.do")
	public String salaryManageDetail(
			@ModelAttribute("searchVO") ComDefaultCodeVO searchVO,
			SalaryManageVO salaryManageVO,
			@CommandMap Map<?,?> commandMap,
			ModelMap model) throws Exception {
		
		String sLocationUrl = "egovframework/com/sal/SalaryManageDetail";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		if(sCmd.equals("del")) {
			salaryManageService.deleteSalaryMange(salaryManageVO);
			sLocationUrl = "forward:/sal/SalaryManageList.do";
		} else {
			
			//공통코드 근무일정 조회
			ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
	    	voComCode.setCodeId("COM400");
	    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
	    	model.addAttribute("salarySe", listComCode);
	    	
	    	//공통코드  잔업유무 조회
	    	voComCode = new ComDefaultCodeVO();
	    	voComCode.setCodeId("COM410");
	    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
	    	model.addAttribute("salaryPro", listComCode);
			
	    	List<?> sampleList = salaryManageService.selectSamanageDetail(salaryManageVO);
	    	model.addAttribute("resultList", sampleList);
			
		}
		
		return sLocationUrl;
		
	}
	
	/**
	 * 근무일정 수정폼
	 * @param searchVO
	 * @param salaryManageVO
	 * @param commandMap
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/sal/SalaryManageModify.do")
	public String salaryManageModify(
			@ModelAttribute("searchVO") ComDefaultCodeVO searchVO,
			SalaryManageVO salaryManageVO,
			@CommandMap Map<?,?> commandMap,
			ModelMap model) throws Exception {
		
		String sLocationUrl = "egovframework/com/sal/SalaryManageModify";
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		
		//공통코드 근무일정 조회
		ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM400");
    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salarySe", listComCode);
    	
    	//공통코드  잔업유무 조회
    	voComCode = new ComDefaultCodeVO();
    	voComCode.setCodeId("COM410");
    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	model.addAttribute("salaryPro", listComCode);
    	
    	//일정시작일자(시)
    	model.addAttribute("schdulBgndeHH", (List<?>)getTimeHH());
    	//일정시작일자(분)
    	model.addAttribute("schdulBgndeMM", (List<?>)getTimeMM());
    	//일정종료일자(시)
    	model.addAttribute("schdulEnddeHH", (List<?>)getTimeHH());
    	//일정정료일자(분)
    	model.addAttribute("schdulEnddeMM", (List<?>)getTimeMM());
		
    	SalaryManageVO resultSalaryManageVOResult = (SalaryManageVO)salaryManageService.selectSamanageDetailVO(salaryManageVO);
    	
    	String sSchdulBgnde = resultSalaryManageVOResult.getSalaryBgnde();
    	String sSchdulEndde = resultSalaryManageVOResult.getSalaryEndde();

    	resultSalaryManageVOResult.setSalaryBgndeYYYMMDD(sSchdulBgnde.substring(0,4) + "-" + sSchdulBgnde.substring(4, 6) + "-" + sSchdulBgnde.substring(6,8));
    	resultSalaryManageVOResult.setSchdulBgndeHH(sSchdulBgnde.substring(8,10));
    	resultSalaryManageVOResult.setSchdulBgndeMM(sSchdulBgnde.substring(10, 12));
    	resultSalaryManageVOResult.setSalaryEnddeYYYMMDD(sSchdulEndde.substring(0,4) + "-" + sSchdulEndde.substring(4, 6) + "-" + sSchdulEndde.substring(6,8));
    	resultSalaryManageVOResult.setSchdulEnddeHH(sSchdulEndde.substring(8, 10));
    	resultSalaryManageVOResult.setSchdulEnddeMM(sSchdulBgnde.substring(10, 12));
    	
    	model.addAttribute("salaryManageVO", resultSalaryManageVOResult);
		
		return sLocationUrl;
	}
	
	@RequestMapping(value="/sal/SalaryManageModifyActor.do")
	public String SalaryManageModifyActor(
			ComDefaultVO searchVo, 
			@CommandMap Map<?,?> commandMap,
			@ModelAttribute("salaryManageVO") SalaryManageVO salaryManageVO,
			BindingResult bindingResult,
			ModelMap model) throws Exception {
		
		// 0. Spring Security 사용자권한 처리
    	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
    	if(!isAuthenticated) {
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
        	return "egovframework/com/uat/uia/EgovLoginUsr";
    	}
    	
    	//로그인 객체 선언
    	LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
    			
    	String sLocationUrl = "egovframework/com/sal/SalaryManageModify";
    	
    	String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
    	
    	if(sCmd.equals("save")) {
    		// 서버 validate 체크
    		beanValidator.validate(salaryManageVO, bindingResult);
    		if(bindingResult.hasErrors()) {
    			//공통코드 근무일정 조회
    			ComDefaultCodeVO voComCode = new ComDefaultCodeVO();
    	    	voComCode.setCodeId("COM400");
    	    	List<?> listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	    	model.addAttribute("salarySe", listComCode);
    	    	
    	    	//공통코드  잔업유무 조회
    	    	voComCode = new ComDefaultCodeVO();
    	    	voComCode.setCodeId("COM410");
    	    	listComCode = cmmUseService.selectCmmCodeDetail(voComCode);
    	    	model.addAttribute("salaryPro", listComCode);
    	    	
    	    	//일정시작일자(시)
    	    	model.addAttribute("schdulBgndeHH", (List<?>)getTimeHH());
    	    	//일정시작일자(분)
    	    	model.addAttribute("schdulBgndeMM", (List<?>)getTimeMM());
    	    	//일정종료일자(시)
    	    	model.addAttribute("schdulEnddeHH", (List<?>)getTimeHH());
    	    	//일정정료일자(분)
    	    	model.addAttribute("schdulEnddeMM", (List<?>)getTimeMM());
    	    	
    	    	return sLocationUrl;
    		}
    		
    		/* *****************************************************************
        	// 아이디 설정
			****************************************************************** */
    		salaryManageVO.setFrstRegisterId((String)loginVO.getUniqId());
    		salaryManageVO.setLastUpdusrId((String)loginVO.getUniqId());
    		
    		System.out.println("시작 시간 : " + salaryManageVO.getSalaryBgnde());
    		System.out.println("종료 시간  : " + salaryManageVO.getSalaryEndde());
    		
    		/* *****************************************************************
        	// 일정관리정보 업데이트 처리
			****************************************************************** */
    		salaryManageService.updateSalaryManage(salaryManageVO);
    		sLocationUrl = "forward:/sal/SalaryManageList.do";
    	}
		
		return sLocationUrl;
	}
	
	@SuppressWarnings({ "rawtypes", "unused" })
	private HashMap<String, ?> salaryCalculation(Map<String, String> commandMap) throws Exception {
		
		HashMap<String, String> hm = new HashMap<String, String>();
		
		String str_holidayNightProTime = "sumHolidayNightProTime";	// 야간 특근 잔업시간
		String str_proTime = "sumProTime";							// 주간 잔업시간
		String str_nightProDay ="sumNightProDay";					// 야간 근무일
		String str_nightTime = "sumNightTime";						// 야간 잔업시간
		String str_holidayDay = "sumHolidayDay";					// 특근 근무일
		String str_holidayProTime = "sumHolidayProTime";			// 특근 잔업시간
		String str_holidayNightDay = "sumHolidayNightDay";			// 야간 특근 근무일
		
		// DB -> String 받아오는 함수
		String str_proTime_Sum;
		String str_nightProDay_Sum;
		String str_nightTime_Sum;
		String str_holidayDay_Sum;
		String str_holidayProTime_Sum;
		String str_holidayNightDay_Sum;
		String str_holidayNightProTime_Sum;
		
		// String -> Float 변환용(근무시간 합계
		Float num_proTime_Sum = null;
		Float num_nightProDay_Sum = null;
		Float num_nightTime_Sum = null;
		Float num_holidayDay_Sum = null;
		Float num_holidayProTime_Sum = null;
		Float num_holidayNightDay_Sum = null;
		Float num_holidayNightProTime_Sum = null;
		
		DecimalFormat df = new DecimalFormat("#,###");
		DecimalFormat dff = new DecimalFormat("#,###.#");
		DecimalFormat dfff = new DecimalFormat("####");
		DecimalFormat af = new DecimalFormat("####.#");
		
    	// 자바 Type 알아보기
    	/*for (Object o : resultList)	{
			System.out.println(" Type : " + o.getClass().getCanonicalName());
			Map map = (Map) o;
			for (Object key : map.keySet()) {
				System.out.println("        - " + key + " : " + map.get(key));
			}
		}
    	*/
		
		// 유저 급여정보 가져오기
		commandMap.put("mode", "CAL");
		SalaryUserMonelyVO result = salaryManageService.selectUserMonelyDetail(commandMap);
		
		List resultList = salaryManageService.selectListSalaryCalculation(commandMap);
		
		for (int i = 0; i < 1; i++) {
    		
			//Map<String, ?> map = (Map<String, ?>) resultList.get(i);
			String calculationList = resultList.get(i).toString();
			
			int int_holidayNightProTimeLength = calculationList.indexOf(str_holidayNightProTime);
			int int_proTimeLength = calculationList.indexOf(str_proTime);
			int int_nightProDayLength = calculationList.indexOf(str_nightProDay);
			int int_nightTimeLength = calculationList.indexOf(str_nightTime);
			int int_holidayDayLength = calculationList.indexOf(str_holidayDay);
			int int_holidayProTimeLength = calculationList.indexOf(str_holidayProTime );
			int int_holidayNightDayLength = calculationList.indexOf(str_holidayNightDay);
			
			//특근 잔업시간
			str_holidayNightProTime_Sum = calculationList.substring(
					int_holidayNightProTimeLength+str_holidayNightProTime.length()+1,
					calculationList.substring(int_holidayNightProTimeLength).indexOf(str_proTime)-1);
			num_holidayNightProTime_Sum = Float.parseFloat(str_holidayNightProTime_Sum);

			//잔업 시간
			str_proTime_Sum = calculationList.substring(
						int_proTimeLength+str_proTime.length()+1,
						calculationList.substring(int_holidayNightProTimeLength).indexOf(str_nightProDay)-1);
			num_proTime_Sum = Float.parseFloat(str_proTime_Sum);
			
			str_nightProDay_Sum = calculationList.substring(
					int_nightProDayLength+str_nightProDay.length()+1,
					calculationList.substring(int_holidayNightProTimeLength).indexOf(str_nightTime)-1);
			num_nightProDay_Sum = Float.parseFloat(str_nightProDay_Sum);
			
			//야간 시간
			str_nightTime_Sum = calculationList.substring(
					int_nightTimeLength+str_nightTime.length()+1,
					calculationList.substring(int_holidayNightProTimeLength).indexOf(str_holidayDay)-1);
			num_nightTime_Sum = Float.parseFloat(str_nightTime_Sum);
			
			//야간 특근 근무일
			str_holidayDay_Sum = calculationList.substring(
					int_holidayDayLength+str_holidayDay.length()+1,
					calculationList.substring(int_holidayNightProTimeLength).indexOf(str_holidayProTime)-1);
			num_holidayDay_Sum = Float.parseFloat(str_holidayDay_Sum);
			
			// 특근 잔업시간
			str_holidayProTime_Sum = calculationList.substring(
					int_holidayProTimeLength+str_holidayProTime.length()+1,
					calculationList.substring(int_holidayNightProTimeLength).indexOf(str_holidayNightDay)-1);
			num_holidayProTime_Sum = Float.parseFloat(str_holidayProTime_Sum);
			
			str_holidayNightDay_Sum = calculationList.substring(
					int_holidayNightDayLength+str_holidayNightDay.length()+1,
					calculationList.length()-1);
			num_holidayNightDay_Sum = Float.parseFloat(str_holidayNightDay_Sum);
			
		}

		//String str_proTime = "sumProTime";							// 주간 잔업시간
		//String str_nightProDay ="sumNightProDay";					// 야간 근무일
		//String str_nightTime = "sumNightTime";						// 야간 잔업시간
		//String str_holidayDay = "sumHolidayDay";					// 특근 근무일
		//String str_holidayProTime = "sumHolidayProTime";			// 특근 잔업시간
		//String str_holidayNightDay = "sumHolidayNightDay";			// 야간 특근 근무일
		//String str_holidayHightProTime = "sumHolidayHightProTime";	// 야간 특근 잔업시간
		
		// 잔업수당 시급
		float jansu = Float.parseFloat(result.getTimeSalary()) + (Float.parseFloat(result.getLongevityPension()) / Float.parseFloat(result.getJobTime()));
		/*String aa = af.format(a);
		float jansu = Float.parseFloat(aa);
		System.out.println("잔업 시급 : " +jansu);*/

		float calBasicTime = Float.parseFloat(result.getJobTime()) * Float.parseFloat(result.getTimeSalary());		//기본급
		float calHolidayDay = num_holidayDay_Sum + num_holidayNightDay_Sum;											//특근 근무일
		float calHolidayPro = num_holidayProTime_Sum + num_holidayNightProTime_Sum;									// 특근 잔업시간
		
		/*LOGGER.info("num_holidayProTime_Sum : {} ", num_holidayProTime_Sum);
		LOGGER.info("num_holidayNightProTime_Sum : {} ", num_holidayNightProTime_Sum);
		LOGGER.info("특근 잔업시간 : {} ", calHolidayPro);*/
		
		if (num_holidayProTime_Sum != 0) {
			num_proTime_Sum = num_proTime_Sum - num_holidayProTime_Sum;
		}
		
		float calProTime = (jansu * num_proTime_Sum * Float.parseFloat("1.5")) +			// 잔업
				(jansu * calHolidayPro * Float.parseFloat("2")); 							// 특근 잔업

		float calHolidayPersion = calHolidayDay * 8 * jansu * Float.parseFloat("1.5");	// 특근수당
		float calNightPersion = num_nightTime_Sum * (jansu * Float.parseFloat("0.5")) ;	// 야간수당

		float persionSum = calBasicTime + calProTime + calHolidayPersion + calNightPersion
				+ Float.parseFloat(result.getFamilyPension()) + Float.parseFloat(result.getFullWorkingPension())
				+ Float.parseFloat(result.getLongevityPension());							// 급여 합계
		
		/*System.out.println("잔업 수당 : " + calProTime);
		System.out.println("특근수당 : " + calHolidayPersion);
		System.out.println("야간수당 : " + calNightPersion);*/
		float calTotal = persionSum - Float.parseFloat(result.getTexes());					// 실지급액
		//float calnightTime = num_nightTime_Sum * result.getTimeSalary();
		
		hm.put("calBasicTime", df.format(calBasicTime));					// 기본급
		hm.put("calProDay", dff.format(num_proTime_Sum));					// 주간 잔업시간
		hm.put("calProTime", dff.format(calProTime));						// 연장수당
		hm.put("calNightProDay", df.format(num_nightProDay_Sum));			// 야간 근무일
		hm.put("calHolidayDay", df.format(calHolidayDay));					// 특근 근무일(야간 특근 포함)
		hm.put("calHolidayPro", dff.format(calHolidayPro));					// 특근 잔업시간(야특 포함)
		hm.put("calNightProTime", dff.format(num_nightTime_Sum));			// 야간 잔업시간
		hm.put("calHolidayPersion", df.format(calHolidayPersion));			// 특근수당
		hm.put("calNightPersion", df.format(calNightPersion));				// 야간수당
		hm.put("persionSum", df.format(persionSum));						// 총급여액
		hm.put("total", df.format(calTotal));										// 실지급액

		return hm;
	}
	
	
	/**
	 * 시간을 LIST를 반환한다.
	 * @return  List
	 * @throws
	 */
	@SuppressWarnings("unused")
	private List<ComDefaultCodeVO> getTimeHH (){
    	ArrayList<ComDefaultCodeVO> listHH = new ArrayList<ComDefaultCodeVO>();
    	HashMap<?, ?> hmHHMM;
    	for(int i=0;i <= 24; i++){
    		String sHH = "";
    		String strI = String.valueOf(i);
    		if(i<10){
    			sHH = "0" + strI;
    		}else{
    			sHH = strI;
    		}

    		ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
    		codeVO.setCode(sHH);
    		codeVO.setCodeNm(sHH);

    		listHH.add(codeVO);
    	}

    	return listHH;
	}

	/**
	 * 분을 LIST를 반환한다.
	 * @return  List
	 * @throws
	 */
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	private List getTimeMM (){
    	ArrayList listMM = new ArrayList();
    	HashMap hmHHMM;
    	for(int i=0;i <= 60; i++){

    		String sMM = "";
    		String strI = String.valueOf(i);
    		if(i<10){
    			sMM = "0" + strI;
    		}else{
    			sMM = strI;
    		}

    		ComDefaultCodeVO codeVO = new ComDefaultCodeVO();
    		codeVO.setCode(sMM);
    		codeVO.setCodeNm(sMM);

    		listMM.add(codeVO);
    	}
    	return listMM;
	}

	/**
	 * 0을 붙여 반환
	 * @return  String
	 * @throws
	 */
    public String dateTypeIntForString(int iInput){
		String sOutput = "";
		if(Integer.toString(iInput).length() == 1){
			sOutput = "0" + Integer.toString(iInput);
		}else{
			sOutput = Integer.toString(iInput);
		}

       return sOutput;
    }
}
