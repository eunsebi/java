package egovframework.com.mtb.web;

import java.util.List;
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

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.mtb.service.MTBoardLoneMasterService;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * 게시판 속성관리를 위한 컨트롤러 클래스
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.08.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------       --------    ---------------------------
 *   2009.08.25  한성곤          최초 생성
 *   2011.8.26	정진오			IncludedInfo annotation 추가
 *   2011.9.7	정진오			익명 게시판의 경우 provdUrl이 관련된 사항으로 표출되도록 수정
 *
 * </pre>
 */

@Controller
public class MTBoardLoneMasterController {

    @Resource(name = "MTBoardLoneMasterService")
    private MTBoardLoneMasterService mtbLoneService;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    @Resource(name = "propertiesService")
    protected EgovPropertyService propertyService;

    @Autowired
    private DefaultBeanValidator beanValidator;

    //protected Logger log = Logger.getLogger(this.getClass());

    /**
     * 신규 게시판 마스터 등록을 위한 등록페이지로 이동한다.
     *
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	@RequestMapping("/com/mtb/addMTBMaster.do")
    public String addMTBMaster(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, ModelMap model) throws Exception {
	MTBoardMaster mtboardMaster = new MTBoardMaster();

	ComDefaultCodeVO vo = new ComDefaultCodeVO();

	vo.setCodeId("COM004");

	List codeResult = cmmUseService.selectCmmCodeDetail(vo);

	model.addAttribute("typeList", codeResult);

	vo.setCodeId("COM009");

	codeResult = cmmUseService.selectCmmCodeDetail(vo);

	model.addAttribute("attrbList", codeResult);
	model.addAttribute("boardMaster", mtboardMaster);


	return "egovframework/com/mtb/EgovBBSLoneMstrRegist";
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
    @SuppressWarnings({ "rawtypes" })
    @RequestMapping("/com/mtb/insertMTBMaster.do")
    public String insertMTBMaster(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, @ModelAttribute("boardMaster") MTBoardMaster mtboardMaster,
	    BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(mtboardMaster, bindingResult);
	if (bindingResult.hasErrors()) {

	    ComDefaultCodeVO vo = new ComDefaultCodeVO();

	    vo.setCodeId("COM004");

	    List codeResult = cmmUseService.selectCmmCodeDetail(vo);

	    model.addAttribute("typeList", codeResult);

	    vo.setCodeId("COM009");

	    codeResult = cmmUseService.selectCmmCodeDetail(vo);

	    model.addAttribute("attrbList", codeResult);

	    return "egovframework/com/mtb/EgovBBSLoneMstrRegist";
	}

	if (isAuthenticated) {
		mtboardMaster.setFrstRegisterId(user.getUniqId());
		mtboardMaster.setUseAt("Y");
		mtboardMaster.setTrgetId("SYSTEMDEFAULT_REGIST");

	    mtbLoneService.insertMaster(mtboardMaster);
	}

	return "forward:/com/mtb/selectMTBMasterList.do";
    }

    /**
     * 게시판 마스터 목록을 조회한다.
     *
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
//    @IncludedInfo(name="게시판관리", order = 170 ,gid = 40)
    @RequestMapping("/com/mtb/selectMTBMasterList.do")
    public String selectMTBMasterList(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, ModelMap model) throws Exception {
    	mtboardMasterVO.setPageUnit(propertyService.getInt("pageUnit"));
    	mtboardMasterVO.setPageSize(propertyService.getInt("pageSize"));

	PaginationInfo paginationInfo = new PaginationInfo();

	paginationInfo.setCurrentPageNo(mtboardMasterVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(mtboardMasterVO.getPageUnit());
	paginationInfo.setPageSize(mtboardMasterVO.getPageSize());

	mtboardMasterVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	mtboardMasterVO.setLastIndex(paginationInfo.getLastRecordIndex());
	mtboardMasterVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	Map<String, Object> map = mtbLoneService.selectMasterList(mtboardMasterVO);
	int totCnt = Integer.parseInt((String)map.get("resultCnt"));

	paginationInfo.setTotalRecordCount(totCnt);

	model.addAttribute("resultList", map.get("resultList"));
	model.addAttribute("resultCnt", map.get("resultCnt"));
	model.addAttribute("paginationInfo", paginationInfo);

	return "egovframework/com/mtb/EgovBBSLoneMstrList";
    }

    /**
     * 게시판 마스터 상세내용을 조회한다.
     *
     * @param boardMasterVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/com/mtb/selectMTBMaster.do")
    public String selectMTBMaster(@ModelAttribute("searchVO") MTBoardMasterVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
    	MTBoardMasterVO vo = mtbLoneService.selectMaster(searchVO);

	/*2011.9.7 수정부분 시작*/
	String provideUrl;
	if (vo.getBbsTyCode().equals("BBST02")){ // 익명게시판인 경우
		provideUrl = "/com/mtb/anonymous/selectMTBList.do?bbsId=" + vo.getBbsId();
	}
	else {
	    provideUrl = "/com/mtb/selectMTBList.do?bbsId=" + vo.getBbsId();
	}
	/*2011.9.7 수정부분 종료*/

	model.addAttribute("result", vo);

	model.addAttribute("provdUrl", provideUrl);

	return "egovframework/com/mtb/EgovBBSLoneMstrUpdt";
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
    @RequestMapping("/com/mtb/updateMTBMaster.do")
    public String updateMTBMaster(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, @ModelAttribute("boardMaster") MTBoardMaster mtboardMaster,
	    BindingResult bindingResult, ModelMap model) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	beanValidator.validate(mtboardMaster, bindingResult);
	if (bindingResult.hasErrors()) {
		MTBoardMasterVO vo = mtbLoneService.selectMaster(mtboardMasterVO);

	    model.addAttribute("result", vo);

	    return "egovframework/com/mtb/EgovBBSLoneMstrUpdt";
	}

	if (isAuthenticated) {
		mtboardMaster.setLastUpdusrId(user.getUniqId());
	    mtbLoneService.updateMaster(mtboardMaster);
	}

	return "forward:/com/mtb/selectMTBMasterList.do";
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
    @RequestMapping("/com/mtb/deleteMTBMaster.do")
    public String deleteMTBMaster(@ModelAttribute("searchVO") MTBoardMasterVO mtboardMasterVO, @ModelAttribute("boardMaster") MTBoardMaster mtboardMaster,
	    SessionStatus status) throws Exception {

	LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

	if (isAuthenticated) {
		mtboardMaster.setLastUpdusrId(user.getUniqId());
	    mtbLoneService.deleteMaster(mtboardMaster);
	}
	// status.setComplete();
	return "forward:/com/mtb/selectMTBMasterList.do";
    }
}
