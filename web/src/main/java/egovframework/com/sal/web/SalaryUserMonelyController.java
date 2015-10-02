package egovframework.com.sal.web;

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

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sal.service.SalaryManageService;
import egovframework.com.sal.service.SalaryUserMonelyVO;
import egovframework.rte.ptl.mvc.bind.annotation.CommandMap;

@Controller
public class SalaryUserMonelyController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SalaryUserMonelyController.class);
	
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
	 * 기본정보 등록페이지로 이동(시급 입력)
	 * @param searchVO
	 * @param commandMap
	 * @param salaryUserMonelyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	 @RequestMapping(value="/sal/SalaryUserMonelyRegist.do")
	    public String salaryUserMonelyRegist(
	    		@ModelAttribute("searchVO") ComDefaultVO searchVO,
	    		@CommandMap Map<String, String> commandMap,
				SalaryUserMonelyVO salaryUserMonelyVO,
	    		ModelMap model) throws Exception {
	    	
	    	String sLocationUrl = "egovframework/com/sal/SalaryUserMonelyRegist";
	    	
	    	//로그인 객체 선언
	    	LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	    	if(loginVO == null){ loginVO = new LoginVO();}
	    	
	    	commandMap.put("salaryUserId", loginVO.getUniqId());
	    	
	    	// 급여 정보 얻기
	        commandMap.put("mode", "DETAIL");
	        SalaryUserMonelyVO result = salaryManageService.selectUserMonelyDetail(commandMap);
	        
	        if (result != null) {
	        	model.addAttribute("result", result);
	        	return sLocationUrl;
	        }
	    	
	    	return sLocationUrl;
	    }

	/**
	 * 기본정보 등록 처리
	 * @param searchVO
	 * @param commandMap
	 * @param salaryUserMonelyVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/sal/SalaryUserMonelyRegistActor.do")
    public String salaryUserMenelyRegistActor(
    		@ModelAttribute("searchVO") ComDefaultVO searchVO,
			@CommandMap Map<?, ?> commandMap,
			SalaryUserMonelyVO salaryUserMonelyVO,
			BindingResult bindngResult, ModelMap model) throws Exception {
    	
    	String sLocationUrl = "egovframework/com/sal/SalaryUserMonelyRegist";
    	
		String time_salary = salaryUserMonelyVO.getTimeSalary();
		String fullWorkingPension = salaryUserMonelyVO.getFullWorkingPension();
		String familyPension = salaryUserMonelyVO.getFamilyPension(); 
		String longevityPension = salaryUserMonelyVO.getLongevityPension();
		String texes = salaryUserMonelyVO.getTexes();
		
		if (time_salary.length() == 0) time_salary = "0";
		
		if (fullWorkingPension.length() == 0) fullWorkingPension = "0";
		
		if (familyPension.length() == 0) familyPension = "0";
		
		if (longevityPension.length() == 0) longevityPension = "0";
		
		if (texes.length() == 0) texes = "0";
    	
    	// 0. Spring Security 사용자권한 처리
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		if(!isAuthenticated) {
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}

		// 로그인 객체 선언
		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		String sCmd = commandMap.get("cmd") == null ? "" : (String)commandMap.get("cmd");
		LOGGER.info("cmd => {}", sCmd);
		
		if(sCmd.equals("save")) {
			// 서버 validate 체크
			beanValidator.validate(salaryUserMonelyVO, bindngResult);

			if(bindngResult.hasErrors()) {
				
				return sLocationUrl;
			}
			
			//아이디 설정
			salaryUserMonelyVO.setFrstRegisterId((String)loginVO.getUniqId());
			salaryUserMonelyVO.setLastUpdusrId((String)loginVO.getUniqId());
			salaryUserMonelyVO.setTimeSalary(time_salary);
			salaryUserMonelyVO.setFullWorkingPension(fullWorkingPension);
			salaryUserMonelyVO.setFamilyPension(familyPension);
			salaryUserMonelyVO.setLongevityPension(longevityPension);
			salaryUserMonelyVO.setTexes(texes);
			
			salaryManageService.insertSalaryUserMonely(salaryUserMonelyVO);
			sLocationUrl = "redirect:/sal/SalaryManageList.do";
			
		} else if (sCmd.equals("update")) {
			// 서버 validate 체크
			beanValidator.validate(salaryUserMonelyVO, bindngResult);

			if(bindngResult.hasErrors()) {
				
				return sLocationUrl;
			}
			
			//아이디 설정
			salaryUserMonelyVO.setFrstRegisterId((String)loginVO.getUniqId());
			salaryUserMonelyVO.setLastUpdusrId((String)loginVO.getUniqId());
			salaryUserMonelyVO.setTimeSalary(salaryUserMonelyVO.getTimeSalary().replace(",", ""));
			salaryUserMonelyVO.setFullWorkingPension(salaryUserMonelyVO.getFullWorkingPension().replace(",", ""));
			salaryUserMonelyVO.setFamilyPension(salaryUserMonelyVO.getFamilyPension().replace(",", ""));
			salaryUserMonelyVO.setLongevityPension(salaryUserMonelyVO.getLongevityPension().replace(",", ""));
			salaryUserMonelyVO.setTexes(salaryUserMonelyVO.getTexes().replace(",", ""));
			
			salaryManageService.updateSalaryUserMonely(salaryUserMonelyVO);
			sLocationUrl = "redirect:/sal/SalaryManageList.do";
		}
    	
    	return sLocationUrl;
    }

}
