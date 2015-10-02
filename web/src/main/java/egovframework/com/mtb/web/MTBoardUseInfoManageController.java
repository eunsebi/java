package egovframework.com.mtb.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.mtb.service.MTBoardUseInf;
import egovframework.com.mtb.service.MTBoardUseInfVO;
import egovframework.com.mtb.service.MTBoardUseInfoManageService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * Maint Total 게시판의 이용정보를 관리하기 위한 컨트롤러 클래스
 * 
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.4.2   이삼섭          최초 생성
 *   2011.07.21 안민정          커뮤니티 관련 메소드 분리 (-> EgovCmyUserInfController)
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.09.15 서준식          커뮤니티, 동호회 컴포넌트 사용여부 체크 로직 추가
 * </pre>
 */

@Controller
public class MTBoardUseInfoManageController {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "MTBoardUseInfoManageService")
	private MTBoardUseInfoManageService mtboardUseService;
	
	@Autowired
    private DefaultBeanValidator beanValidator;

	/**
	 * Maint Total 게시판 사용정보 목록을 조회한다.
	 * 
	 * @param mtbUserVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "Maint Total 게시판 사용정보", order = 6, gid = 5)
	@RequestMapping("/com/mtb/selectMTBoardUseInfs.do")
	public String selectMTBoardUseInfs(@ModelAttribute("searchVO") MTBoardUseInfVO mtbUserVO, ModelMap model) throws Exception {

		mtbUserVO.setPageUnit(propertyService.getInt("pageUnit"));
		mtbUserVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(mtbUserVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(mtbUserVO.getPageUnit());
		paginationInfo.setPageSize(mtbUserVO.getPageSize());

		mtbUserVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		mtbUserVO.setLastIndex(paginationInfo.getLastRecordIndex());
		mtbUserVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		Map<String, Object> map = mtboardUseService.selectBBSUseInfs(mtbUserVO);
		int toCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(toCnt);

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("paginationInfo", paginationInfo);

		if (EgovComponentChecker.hasComponent("EgovCommunityManageService")) {// 2011.09.15
			model.addAttribute("useCommunity", "true");
		}
		if (EgovComponentChecker.hasComponent("EgovClubManageService")) {// 2011.09.15
			model.addAttribute("useClub", "true");
		}

		return "egovframework/com/mtb/com/EgovBoardUseInfList";
	}

	/**
	 * Maint Total 게사판 사용정보 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param mtbUseVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/addMTBoardUseInf.do")
	public String addMTBoardUseInf(@ModelAttribute("searchVO") MTBoardUseInfVO mtbUseVO, ModelMap model) throws Exception {

		if (EgovComponentChecker.hasComponent("EgovCommunityManageService")) {// 2011.09.15
			model.addAttribute("useCommunity", "true");
		}
		if (EgovComponentChecker.hasComponent("EgovClubManageService")) {// 2011.09.15
			model.addAttribute("useClub", "true");
		}

		return "egovframework/com/mtb/com/EgovBoardUseInfRegist";
	}
	
	/**
	 * Maint Total 게시판 사용정보를 등록한다.
	 * 
	 * @param mtbUseVO
	 * @param mtboardUseinf
	 * @param bindingResult
	 * @param commandMap
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/insertMTBoardUseInf.do")
	public String insertMTBoardUseInf(@ModelAttribute("searchVO") MTBoardUseInfVO mtbUseVO, @ModelAttribute("boardUseInf") MTBoardUseInf mtboardUseInf,
			BindingResult bindingResult, Map<String, Object> commandMap, SessionStatus status, ModelMap model) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		beanValidator.validate(mtboardUseInf, bindingResult);
		
		if(bindingResult.hasErrors()) {
			return "egovframework/com/mtb/EgovBoardUseInfRegist";
		}
		
		String trgetType = (String)commandMap.get("param_trgetType");
		String registSeCode = "";
		
		// CMMNTY 06/CLUB 05/SYSTEM(REGC01)
		if ("CMMNTY".equals(trgetType)) {
			registSeCode = "REGC06";
		} else if ("CLUB".equals(trgetType)) {
			registSeCode = "REGC05";
		} else {
			registSeCode = "REGC01";
		}
		
		mtboardUseInf.setUseAt("Y");
		mtboardUseInf.setFrstRegisterId(user.getUniqId());
		mtboardUseInf.setRegistSeCode(registSeCode);
		
		if (isAuthenticated) {
			mtboardUseService.insertBBSUseInf(mtboardUseInf);
		}
		
		return "forward:/com/mtb/selectMTBoardUseInfs.do";
	}
	
	@RequestMapping("/com/mtb/selectMTBoardUseInf")
	public String selectMTBoardUseInf(@ModelAttribute("searchVO") MTBoardUseInfVO mtboardUseVO, ModelMap model, HttpServletRequest request) throws Exception {
		MTBoardUseInfVO vo = mtboardUseService.selectBBSUseInf(mtboardUseVO);
		
		String url = request.getContextPath();
		System.out.println("Url = " + url);
		
		// 시스템 사용 게시판의 경우 URL 표시
		if ("SYSTEM_DEFAULT_BOARD".equals(vo.getTrgetId())) {
			if (vo.getBbsTyCode().equals("MTBBST03")) {			// 익명게시판
				vo.setProvdUrl(request.getContextPath()+"/com/mtb/anonymouse/selectMTBoardList.do?bbsid=" + vo.getBbsId());
			} else {
				vo.setProvdUrl(request.getContextPath()+ "/com/mtb/selectMTBoardList.do?bbsId=" + vo.getBbsId());
			}
		}
		
		model.addAttribute("bdUseVO", vo);
		
		return "egovframework/com/mtb/com/EgovBoardUseInfInqire";
		
	}
	
	/**
	 * Maint Total 게시판 사용정보를 수정한다.
	 * 
	 * @param mtboardUseVO
	 * @param mtboardUseInf
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/updateMTBoardUseInf.do")
	public String updateMTBoardUseInf(@ModelAttribute("searchVO") MTBoardUseInfVO mtboardUseVO, @ModelAttribute("boardUseInf") MTBoardUseInf mtboardUseInf, 
			SessionStatus status, ModelMap model) throws Exception {
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
			mtboardUseService.updateBBSUseInf(mtboardUseInf);
		}
		
		return "forward:/com/mtb/selectMTBoardUseInfs.do";
	}
	
	/**
	 * Maint Total 게시판 사용 정보를 삭제한다.
	 * 
	 * @param mtboardUseVO
	 * @param mtboardUseInf
	 * @param status
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/deleteMTBoardUseInf.do")
	public String deleteMTBoardUseInf(@ModelAttribute("searchVO") MTBoardUseInfVO mtboardUseVO, @ModelAttribute("bdUseInf") MTBoardUseInf mtboardUseInf,
			SessionStatus status, ModelMap model) throws Exception {
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if (isAuthenticated) {
			mtboardUseService.deleteBBSUseInf(mtboardUseInf);
		}
		
		return "forward:/com/mtb/selectMTBoardUseInfs.do";
	}

}
