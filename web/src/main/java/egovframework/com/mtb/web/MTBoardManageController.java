package egovframework.com.mtb.web;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cop.bbs.service.EgovBBSCommentService;
import egovframework.com.cop.bbs.service.EgovBBSSatisfactionService;
import egovframework.com.cop.bbs.service.EgovBBSScrapService;
import egovframework.com.cop.smt.sdm.service.DeptSchdulManageVO;
import egovframework.com.cop.smt.sdm.service.EgovDeptSchdulManageService;
import egovframework.com.mtb.service.MTBoard;
import egovframework.com.mtb.service.MTBoardAttributeManageService;
import egovframework.com.mtb.service.MTBoardManageService;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.com.mtb.service.MTBoardVO;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.UserManageVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/**
 * Maint Total 게시판 관리를 위한 컨트롤러 클래스
 * 
 * @author 심은섭
 * @since 2014.09.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *      수정일                        수정자                   수정내용
 *   ----------		--------	---------------------------
 *   2014.09.13		심은섭			 최초 생성
 * </pre>
 */

@Controller
public class MTBoardManageController {

	@Resource(name = "MTBoardManageService")
	private MTBoardManageService mtboardMngService;

	@Resource(name = "MTBoardAttributeManageService")
	private MTBoardAttributeManageService mtboardAttrbService;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	/** userManageService */
	@Resource(name = "userManageService")
	private EgovUserManageService userManageService;
	
	@Resource(name = "egovDeptSchdulManageService")
	private EgovDeptSchdulManageService egovDeptSchdulManageService;

	// ---------------------------------
	// 2009.06.29 : 2단계 기능 추가
	// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
	// ---------------------------------
	@Autowired(required = false)
	private EgovBBSCommentService bbsCommentService;

	@Autowired(required = false)
	private EgovBBSSatisfactionService bbsSatisfactionService;

	@Autowired(required = false)
	private EgovBBSScrapService bbsScrapService;
	// //-------------------------------

	@Autowired
	private DefaultBeanValidator beanValidator;

	// protected Logger log = Logger.getLogger(this.getClass());

	/**
	 * XSS 방지 처리.
	 * 
	 * @param data
	 * @return
	 */
	protected String unscript(String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}

		String ret = data;

		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}

	/**
	 * 게시물에 대한 목록을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/selectMTBoardList.do")
	public String selectMTBoardList(@ModelAttribute("searchVO") MTBoardVO mtboardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// log.debug(this.getClass().getName() + " user.getId() "+
		// user.getId());
		// log.debug(this.getClass().getName() + " user.getName() "+
		// user.getName());
		// log.debug(this.getClass().getName() + " user.getUniqId() "+
		// user.getUniqId());
		// log.debug(this.getClass().getName() + " user.getOrgnztId() "+
		// user.getOrgnztId());
		// log.debug(this.getClass().getName() + " user.getUserSe() "+
		// user.getUserSe());
		// log.debug(this.getClass().getName() + " user.getEmail() "+
		// user.getEmail());

		// String attrbFlag = "";

		mtboardVO.setBbsId(mtboardVO.getBbsId());
		mtboardVO.setBbsNm(mtboardVO.getBbsNm());
		mtboardVO.setOrgnztId(user.getOrgnztId());

		MTBoardMasterVO vo = new MTBoardMasterVO();

		vo.setBbsId(mtboardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		MTBoardMasterVO master = mtboardAttrbService.selectBBSMasterInf(vo);

		// -------------------------------
		// 방명록이면 방명록 URL로 forward
		// -------------------------------
		if (master.getBbsTyCode().equals("BBST04")) {
			return "forward:/com/mtb/selectGuestList.do";
		}
		// //-----------------------------

		mtboardVO.setPageUnit(propertyService.getInt("pageUnit"));
		mtboardVO.setPageSize(propertyService.getInt("pageSize"));

		PaginationInfo paginationInfo = new PaginationInfo();

		paginationInfo.setCurrentPageNo(mtboardVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(mtboardVO.getPageUnit());
		paginationInfo.setPageSize(mtboardVO.getPageSize());

		mtboardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		mtboardVO.setLastIndex(paginationInfo.getLastRecordIndex());
		mtboardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// Map<String, Object> map =
		// mtboardMngService.selectBoardArticles(boardVO, vo.getBbsAttrbCode());
		Map<String, Object> map = mtboardMngService.selectBoardArticles(mtboardVO, master.getBbsAttrbCode());// 2011.09.07
		int totCnt = Integer.parseInt((String) map.get("resultCnt"));

		paginationInfo.setTotalRecordCount(totCnt);

		// -------------------------------
		// 기본 BBS template 지정
		// -------------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}
		// //-----------------------------

		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultCnt", map.get("resultCnt"));
		model.addAttribute("boardVO", mtboardVO);
		model.addAttribute("brdMstrVO", master);
		model.addAttribute("paginationInfo", paginationInfo);

		return "egovframework/com/mtb/EgovNoticeList";
	}

	/**
	 * 게시물에 대한 상세 정보를 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping("/com/mtb/selectMTBoardArticle.do")
	public String selectMTBoardArticle(@ModelAttribute("searchVO") MTBoardVO mtboardVO, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		// 조회수 증가 여부 지정
		mtboardVO.setPlusCount(true);

		// ---------------------------------
		// 2009.06.29 : 2단계 기능 추가
		// ---------------------------------
		if (!mtboardVO.getSubPageIndex().equals("")) {
			mtboardVO.setPlusCount(false);
		}
		// //-------------------------------

		mtboardVO.setLastUpdusrId(user.getUniqId());
		MTBoardVO vo = mtboardMngService.selectBoardArticle(mtboardVO);

		model.addAttribute("result", vo);
		// CommandMap의 형태로 개선????

		model.addAttribute("sessionUniqId", user.getUniqId());

		// 현재 접속자 GroupId 조회
		UserManageVO userManageVO = new UserManageVO();
		UserManageVO userManageVO1 = new UserManageVO();
		userManageVO = userManageService.selectUser(user.getUniqId());
		userManageVO1 = userManageService.selectUser(vo.getFrstRegisterId());

		model.addAttribute("loginUserGroupId", userManageVO.getGroupId());
		model.addAttribute("boardFrstRegisterGroupId", userManageVO1.getGroupId());

		/*
		 * System.out.println("loginUserGroupId : " +
		 * userManageVO.getGroupId());
		 * System.out.println("boardFrstRegisterGroupId : " +
		 * userManageVO1.getGroupId()); System.out.println("boardBbsId : " +
		 * vo.getBbsId());
		 */

		//

		// ----------------------------
		// template 처리 (기본 BBS template 지정 포함)
		// ----------------------------
		MTBoardMasterVO master = new MTBoardMasterVO();

		master.setBbsId(mtboardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		MTBoardMasterVO masterVo = mtboardAttrbService.selectBBSMasterInf(master);

		if (masterVo.getTmplatCours() == null || masterVo.getTmplatCours().equals("")) {
			masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", masterVo);
		// //-----------------------------

		// ----------------------------
		// 2009.06.29 : 2단계 기능 추가
		// 2011.07.01 : 댓글, 스크랩, 만족도 조사 기능의 종속성 제거
		// ----------------------------
		if (bbsCommentService != null) {
			if (bbsCommentService.canUseComment(mtboardVO.getBbsId())) {
				model.addAttribute("useComment", "true");
			}
		}
		if (bbsSatisfactionService != null) {
			if (bbsSatisfactionService.canUseSatisfaction(mtboardVO.getBbsId())) {
				model.addAttribute("useSatisfaction", "true");
			}
		}
		if (bbsScrapService != null) {
			if (bbsScrapService.canUseScrap()) {
				model.addAttribute("useScrap", "true");
			}
		}
		// //--------------------------

		// -----------------------------
		// 2014. 01. 20 : 관리자 권한 추가
		// 2014. 01. 20 : 관리자 권한일 경우 게시물 수정/삭제 기능 추가
		// -----------------------------
		List userAuthorities = (List) EgovUserDetailsHelper.getAuthorities();

		System.out.println("userAuthorities : " + userAuthorities);

		String i = userAuthorities.toString();

		model.addAttribute("userAuthorities", userAuthorities);
		model.addAttribute("userAuthorities_size", i);
		
		// 추가
		String[] spec01 = vo.getSpec_01().split(",");
		String[] spec02 = vo.getSpec_02().split(",");
		String[] spec03 = vo.getSpec_03().split(",");
		String[] size = vo.getSize().split(",");
		String[] name01 = vo.getName_01().split(",");
		String[] name02 = vo.getName_02().split(",");

		model.addAttribute("result", vo);
		model.addAttribute("spec01", spec01);
		model.addAttribute("spec02", spec02);
		model.addAttribute("spec03", spec03);
		model.addAttribute("size", size);
		model.addAttribute("name01", name01);
		model.addAttribute("name02", name02);

		return "egovframework/com/mtb/EgovNoticeInqire";
	}

	/**
	 * 게시물 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/addMTBoardArticle.do")
	public String addMTBoardArticle(@ModelAttribute("searchVO") MTBoardVO mtboardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		MTBoardMasterVO mtboarddMstr = new MTBoardMasterVO();

		if (isAuthenticated) {

			MTBoardMasterVO vo = new MTBoardMasterVO();
			vo.setBbsId(mtboardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			mtboarddMstr = mtboardAttrbService.selectBBSMasterInf(vo);
			model.addAttribute("bdMstr", mtboarddMstr);
		}

		// ----------------------------
		// 기본 BBS template 지정
		// ----------------------------
		if (mtboarddMstr.getTmplatCours() == null || mtboarddMstr.getTmplatCours().equals("")) {
			mtboarddMstr.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", mtboarddMstr);
		// //-----------------------------

		return "egovframework/com/mtb/EgovNoticeRegist";
	}

	/**
	 * 게시물을 등록한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/insertMTBoardArticle.do")
	public String insertMTBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") MTBoardVO mtboardVO, @ModelAttribute("bdMstr") MTBoardMaster mtbdMstr,
			@ModelAttribute("board") MTBoard mtboard, BindingResult bindingResult, SessionStatus status, ModelMap model) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		mtboard.setOrgnztId(mtboard.getSchdulDeptId());

		if(mtboard.getKind().equals("1")) {
			mtboard.setKind("DES");
			mtboardVO.setKind("DES");
		} else if(mtboard.getKind().equals("2")) {
			mtboard.setKind("현상");
			mtboardVO.setKind("현상");
		}
		
		if (mtboardVO.getBbsAttrbCode().equals("MTBBSA02")) {
			String des = "des";
			String dev = "dev";
			if (mtboardVO.getKind().equals("DES")) {
				fillterSchduleAdd(des, 7, mtboard, mtboardVO, user);		// 필터 1차 교쳬 예정일
				fillterSchduleAdd(des, 14, mtboard, mtboardVO, user);		// 필터 2차 교쳬 예정일
				fillterSchduleAdd(des, 21, mtboard, mtboardVO, user);		// PM 예정일
			} else {
				fillterSchduleAdd(dev, 7, mtboard, mtboardVO, user);		// 필터 1차 교쳬 예정일
				fillterSchduleAdd(dev, 14, mtboard, mtboardVO, user);		// PM 예정일
			}
			
			String nextPmDate =mtboard.getNextdate().substring(0, 4)+"-"+mtboard.getNextdate().substring(4, 6)+"-"+mtboard.getNextdate().substring(6, 8);
			
			mtboard.setNextdate(nextPmDate);
		}
		
		if (mtboardVO.getBbsAttrbCode().equals("MTBBSA01")) {				// DI 거버등록
			// 제목 수정
			String title = mtboardVO.getNttSj();
						
			title = mtboardVO.getModel() + " " + title;
						
			mtboard.setNttSj(title);
		}
		

		
		/*String orgnztId = user.getOrgnztId();
		
		mtboard.setOrgnztId(orgnztId);*/
		
		beanValidator.validate(mtboard, bindingResult);
		if (bindingResult.hasErrors()) {
			MTBoardMasterVO master = new MTBoardMasterVO();
			MTBoardMasterVO vo = new MTBoardMasterVO();

			vo.setBbsId(mtboardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			master = mtboardAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);

			// ----------------------------
			// 기본 BBS template 지정
			// ----------------------------
			if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
				master.setTmplatCours("css/egovframework/com/cop/tpl/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			// //-----------------------------

			return "egovframework/com/mtb/EgovNoticeRegist";
		}

		if (isAuthenticated) {
			List<FileVO> result = null;
			String atchFileId = "";

			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				result = fileUtil.parseFileInf(files, "MTBBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}
			mtboard.setAtchFileId(atchFileId);
			mtboard.setFrstRegisterId(user.getUniqId());
			mtboard.setBbsId(mtboard.getBbsId());

			// board.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
			// dummy로 지정됨)
			mtboard.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
										// dummy로 지정됨)

			mtboard.setNtcrId(user.getId()); // 게시물 통계 집계를 위해 등록자 ID 저장
			mtboard.setNtcrNm(user.getName()); // 게시물 통계 집계를 위해 등록자 Name 저장

			mtboard.setNttCn(unscript(mtboard.getNttCn())); // XSS 방지

			mtboardMngService.insertBoardArticle(mtboard);
			
		}

		// status.setComplete();
		return "forward:/com/mtb/selectMTBoardList.do";
	}
	
	/**
	 * 게시물 등록시 필터교체일 등록 및 날짜 계산
	 * @param kind
	 * @param nextDate
	 * @param mtboard
	 * @param mtboardVO
	 * @param user
	 * @throws Exception
	 */
	public void fillterSchduleAdd(String kind, int nextDate, MTBoard mtboard, MTBoardVO mtboardVO,
			LoginVO user ) throws Exception {
		
		String day = mtboardVO.getChangedateView();
		
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
		
		// 제목 수정
		String title = mtboardVO.getLocation() +" " + mtboardVO.getKind() + " " + mtboardVO.getNttSj();

		// 입력일 형식 변환
		//String change = mtboardVO.getChangedateView().substring(0, 4)+"-"+mtboardVO.getChangedateView().substring(4, 6)+"-"+mtboardVO.getChangedateView().substring(6, 8);
		
		/*System.out.println("nextDate : " + strDate);
		System.out.println("changeDate : " +change);
		System.out.println("원본 ChageDate : " +mtboardVO.getChangedateView());*/
		
		mtboard.setNttSj(title);
		mtboard.setChangedate(mtboardVO.getChangedateView());
		mtboard.setNextdate(strDate);
		
		// 차기 교체 일정 스케쥴에 등록
		DeptSchdulManageVO deptSchdulManageVO = new DeptSchdulManageVO();
		if (kind == "des") {
			if (nextDate == 21) {	// DES PM주기 2주 적용 2014. 01. 04
				String schdulNm =  mtboardVO.getKind() + " " + mtboardVO.getNumber() + "호기 PM 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			} else {
				String schdulNm =  mtboardVO.getKind() + " " + mtboardVO.getNumber() + "호기 필터 교체 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}
		} else {
			if (nextDate == 14) {
				String schdulNm =  mtboardVO.getKind() + " " + mtboardVO.getNumber() + "호기 PM 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			} else {
				String schdulNm =  mtboardVO.getKind() + " " + mtboardVO.getNumber() + "호기 필터 교체 예정일";
				deptSchdulManageVO.setSchdulNm(schdulNm);
				deptSchdulManageVO.setSchdulCn(schdulNm);
			}			
		}
		
		String schdulBgnde = strDate+"0000";
		String schdulEndde = strDate+"0000";
		
		deptSchdulManageVO.setSchdulSe("1");
		deptSchdulManageVO.setSchdulIpcrCode("A");
		deptSchdulManageVO.setSchdulDeptId(mtboard.getOrgnztId());
		deptSchdulManageVO.setReptitSeCode("1");
		deptSchdulManageVO.setSchdulBgnde(schdulBgnde);
		deptSchdulManageVO.setSchdulEndde(schdulEndde);
		deptSchdulManageVO.setSchdulChargerId(user.getUniqId());
		deptSchdulManageVO.setSchdulKindCode("1");
		deptSchdulManageVO.setFrstRegisterId((String)user.getUniqId());
		deptSchdulManageVO.setLastUpdusrId((String)user.getUniqId());
		
		egovDeptSchdulManageService.insertDeptSchdulManage(deptSchdulManageVO);	// 차기 일정 스켸쥴 등록
		
	}

	/**
	 * 게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/addReplyMTBoardArticle.do")
	public String addReplyMTBoardArticle(@ModelAttribute("searchVO") MTBoardVO mtboardVO, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		MTBoardMasterVO master = new MTBoardMasterVO();
		MTBoardMasterVO vo = new MTBoardMasterVO();

		vo.setBbsId(mtboardVO.getBbsId());
		vo.setUniqId(user.getUniqId());

		master = mtboardAttrbService.selectBBSMasterInf(vo);

		model.addAttribute("bdMstr", master);
		model.addAttribute("result", mtboardVO);

		// ----------------------------
		// 기본 BBS template 지정
		// ----------------------------
		if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
			master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", master);
		// //-----------------------------

		return "egovframework/com/mtb/EgovNoticeReply";
	}

	/**
	 * 게시물에 대한 답변을 등록한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/replyMTBoardArticle.do")
	public String replyMTBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") MTBoardVO mtboardVO, @ModelAttribute("bdMstr") MTBoardMaster mtbdMstr,
			@ModelAttribute("board") MTBoard mtboard, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		beanValidator.validate(mtboard, bindingResult);
		if (bindingResult.hasErrors()) {
			MTBoardMasterVO master = new MTBoardMasterVO();
			MTBoardMasterVO vo = new MTBoardMasterVO();

			vo.setBbsId(mtboardVO.getBbsId());
			vo.setUniqId(user.getUniqId());

			master = mtboardAttrbService.selectBBSMasterInf(vo);

			model.addAttribute("bdMstr", master);
			model.addAttribute("result", mtboardVO);

			// ----------------------------
			// 기본 BBS template 지정
			// ----------------------------
			if (master.getTmplatCours() == null || master.getTmplatCours().equals("")) {
				master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
			}

			model.addAttribute("brdMstrVO", master);
			// //-----------------------------

			return "egovframework/com/mtb/EgovNoticeReply";
		}

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			String atchFileId = "";

			if (!files.isEmpty()) {
				List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, "", "");
				atchFileId = fileMngService.insertFileInfs(result);
			}

			mtboard.setAtchFileId(atchFileId);
			mtboard.setReplyAt("Y");
			mtboard.setFrstRegisterId(user.getUniqId());
			mtboard.setBbsId(mtboard.getBbsId());
			mtboard.setParnts(Long.toString(mtboardVO.getNttId()));
			mtboard.setSortOrdr(mtboardVO.getSortOrdr());
			mtboard.setReplyLc(Integer.toString(Integer.parseInt(mtboardVO.getReplyLc()) + 1));

			mtboard.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
									// dummy로 지정됨)
			mtboard.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
										// dummy로 지정됨)

			mtboard.setNttCn(unscript(mtboard.getNttCn())); // XSS 방지

			mtboardMngService.insertBoardArticle(mtboard);
		}

		return "forward:/com/mtb/selectMTBoardList.do";
	}

	/**
	 * 게시물 수정을 위한 수정페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param vo
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/forUpdateMTBoardArticle.do")
	public String selectMTBoardArticleForUpdt(@ModelAttribute("searchVO") MTBoardVO mtboardVO, @ModelAttribute("board") MTBoardVO vo, ModelMap model) throws Exception {

		// log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getNttId "+boardVO.getNttId());
		// log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getBbsId "+boardVO.getBbsId());

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		mtboardVO.setFrstRegisterId(user.getUniqId());

		MTBoardMaster master = new MTBoardMaster();
		MTBoardMasterVO bmvo = new MTBoardMasterVO();
		MTBoardVO bdvo = new MTBoardVO();

		vo.setBbsId(mtboardVO.getBbsId());

		master.setBbsId(mtboardVO.getBbsId());
		master.setUniqId(user.getUniqId());

		if (isAuthenticated) {
			bmvo = mtboardAttrbService.selectBBSMasterInf(master);
			bdvo = mtboardMngService.selectBoardArticle(mtboardVO);
		}

		String[] array = bdvo.getNumber().split(",");
		String[] spec01 = bdvo.getSpec_01().split(",");
		String[] spec02 = bdvo.getSpec_02().split(",");
		String[] spec03 = bdvo.getSpec_03().split(",");
		String[] name01 = bdvo.getName_01().split(",");
		String[] name02 = bdvo.getName_02().split(",");

		model.addAttribute("result", bdvo);
		model.addAttribute("bdMstr", bmvo);
		model.addAttribute("number", array);
		model.addAttribute("spec01", spec01);
		model.addAttribute("spec02", spec02);
		model.addAttribute("spec03", spec03);
		model.addAttribute("name01", name01);
		model.addAttribute("name02", name02);

		// ----------------------------
		// 기본 BBS template 지정
		// ----------------------------
		if (bmvo.getTmplatCours() == null || bmvo.getTmplatCours().equals("")) {
			bmvo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css");
		}

		model.addAttribute("brdMstrVO", bmvo);
		// //-----------------------------

		return "egovframework/com/mtb/EgovNoticeUpdt";
	}

	/**
	 * 게시물에 대한 내용을 수정한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/updateMTBoardArticle.do")
	public String updateMTBoardArticle(final MultipartHttpServletRequest multiRequest, @ModelAttribute("searchVO") MTBoardVO mtboardVO, @ModelAttribute("bdMstr") MTBoardMaster mtboardMstr,
			@ModelAttribute("board") MTBoard mtboard, BindingResult bindingResult, ModelMap model, SessionStatus status) throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		String atchFileId = mtboardVO.getAtchFileId();

		beanValidator.validate(mtboard, bindingResult);
		if (bindingResult.hasErrors()) {

			mtboardVO.setFrstRegisterId(user.getUniqId());

			MTBoardMaster master = new MTBoardMaster();
			MTBoardMasterVO bmvo = new MTBoardMasterVO();
			MTBoardVO bdvo = new MTBoardVO();

			master.setBbsId(mtboardVO.getBbsId());
			master.setUniqId(user.getUniqId());

			bmvo = mtboardAttrbService.selectBBSMasterInf(master);
			bdvo = mtboardMngService.selectBoardArticle(mtboardVO);

			model.addAttribute("result", bdvo);
			model.addAttribute("bdMstr", bmvo);

			return "egovframework/com/mtb/EgovNoticeUpdt";
		}

		/*
		 * boardVO.setFrstRegisterId(user.getUniqId()); BoardMaster _bdMstr =
		 * new BoardMaster(); BoardMasterVO bmvo = new BoardMasterVO(); BoardVO
		 * bdvo = new BoardVO(); vo.setBbsId(boardVO.getBbsId());
		 * _bdMstr.setBbsId(boardVO.getBbsId());
		 * _bdMstr.setUniqId(user.getUniqId());
		 * 
		 * if (isAuthenticated) { bmvo =
		 * mtboardAttrbService.selectBBSMasterInf(_bdMstr); bdvo =
		 * mtboardMngService.selectBoardArticle(boardVO); } //
		 */
		
		if (mtboardVO.getBbsAttrbCode().equals("MTBBSA02")) {
			String des = "des";
			String dev = "dev";
			if (mtboardVO.getKind().equals("DES")) {
				changeDayUpdate(des, 21, mtboard, mtboardVO, user);	// PM 예정일
			} else {
				changeDayUpdate(dev, 14, mtboard, mtboardVO, user);	// PM 예정일
			}
			
		}
		
		//System.out.println("입력 일 : " +mtboard.getChangedate());
		//System.out.println("차주 : " +mtboard.getNextdate());
		
		
		/*if (mtboardVO.getBbsAttrbCode().equals("MTBBSA02")) {
			
			// 차기 교체일 계산
			String day = mtboardVO.getChangedateView();
			
			String thisDayMore = day.replaceAll("-", "");
			
			SimpleDateFormat asdf = new SimpleDateFormat("yyyyMMdd");
			Date thisDay = asdf.parse(thisDayMore);
			
			thisDayMore = new java.text.SimpleDateFormat("yyyyMMdd").format(thisDay);
			
			int thisDayMoreInt = Integer.parseInt(thisDayMore);
			thisDayMoreInt = thisDayMoreInt + 14;
			thisDayMore = String.valueOf(thisDayMoreInt);
			
			SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd");
			Date date = sdfmt.parse(thisDayMore);
			
			thisDayMore = new java.text.SimpleDateFormat("yyyy-MM-dd").format(date);
			
			mtboard.setChangedate(mtboardVO.getChangedateView());
			mtboard.setNextdate(thisDayMore);
		}*/

		if (isAuthenticated) {
			final Map<String, MultipartFile> files = multiRequest.getFileMap();
			if (!files.isEmpty()) {
				if ("".equals(atchFileId)) {
					List<FileVO> result = fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, "");
					atchFileId = fileMngService.insertFileInfs(result);
					mtboard.setAtchFileId(atchFileId);
				} else {
					FileVO fvo = new FileVO();
					fvo.setAtchFileId(atchFileId);
					int cnt = fileMngService.getMaxFileSN(fvo);
					List<FileVO> _result = fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
					fileMngService.updateFileInfs(_result);
				}
			}

			mtboard.setLastUpdusrId(user.getUniqId());

			mtboard.setNtcrNm(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
									// dummy로 지정됨)
			mtboard.setPassword(""); // dummy 오류 수정 (익명이 아닌 경우 validator 처리를 위해
										// dummy로 지정됨)

			mtboard.setNttCn(unscript(mtboard.getNttCn())); // XSS 방지

			mtboardMngService.updateBoardArticle(mtboard);
		}

		return "forward:/com/mtb/selectMTBoardList.do";
	}

	/**
	 * 게시물 수정시 차기교체일 계산
	 * @param kind
	 * @param nextDate
	 * @param mtboard
	 * @param mtboardVO
	 * @param user
	 * @throws Exception
	 */
	public MTBoard changeDayUpdate(String kind, int nextDate, MTBoard mtboard, MTBoardVO mtboardVO,
			LoginVO user ) throws Exception {
		
		String day = mtboardVO.getChangedateView();
		
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
		//System.out.println("nextDate : " + strDate);
		
		// 입력일 형식 변환
		//String change = mtboardVO.getChangedateView().substring(0, 4)+"-"+mtboardVO.getChangedateView().substring(3, 5)+"-"+mtboardVO.getChangedateView().substring(5, 7);
		
		String nextPmDate =strDate.substring(0, 4)+"-"+strDate.substring(4, 6)+"-"+strDate.substring(6, 8); 
		mtboard.setChangedate(mtboardVO.getChangedateView());
		mtboard.setNextdate(nextPmDate);
		
		return mtboard;
	}
	
	/**
	 * 게시물에 대한 내용을 삭제한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/com/mtb/deleteBoardArticle.do")
	public String deleteBoardArticle(@ModelAttribute("searchVO") MTBoardVO mtboardVO, @ModelAttribute("board") MTBoard mtboard, @ModelAttribute("bdMstr") MTBoardMaster mtboarddMstr, ModelMap model)
			throws Exception {

		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {
			mtboard.setLastUpdusrId(user.getUniqId());

			mtboardMngService.deleteBoardArticle(mtboard);
		}

		return "forward:/com/mtb/selectMTBoardList.do";
	}

	/*
	    *//**
	 * 방명록에 대한 목록을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/selectGuestList.do") public String
	 * selectGuestList(@ModelAttribute("searchVO") BoardVO boardVO, ModelMap
	 * model) throws Exception {
	 * 
	 * LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * @SuppressWarnings("unused") Boolean isAuthenticated =
	 * EgovUserDetailsHelper.isAuthenticated();
	 * 
	 * // 수정 및 삭제 기능 제어를 위한 처리 model.addAttribute("sessionUniqId",
	 * user.getUniqId());
	 * 
	 * BoardVO vo = new BoardVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setBbsNm(boardVO.getBbsNm());
	 * vo.setNtcrNm(user.getName()); vo.setNtcrId(user.getUniqId());
	 * 
	 * BoardMasterVO masterVo = new BoardMasterVO();
	 * 
	 * masterVo.setBbsId(vo.getBbsId()); masterVo.setUniqId(user.getUniqId());
	 * 
	 * BoardMasterVO mstrVO = mtboardAttrbService.selectBBSMasterInf(masterVo);
	 * 
	 * vo.setPageUnit(propertyService.getInt("pageUnit"));
	 * vo.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * paginationInfo.setCurrentPageNo(vo.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(vo.getPageUnit());
	 * paginationInfo.setPageSize(vo.getPageSize());
	 * 
	 * vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * vo.setLastIndex(paginationInfo.getLastRecordIndex());
	 * vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * Map<String, Object> map = mtboardMngService.selectGuestList(vo); int
	 * totCnt = Integer.parseInt((String)map.get("resultCnt"));
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("brdMstrVO", mstrVO); model.addAttribute("boardVO",
	 * vo); model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * return "egovframework/com/mtb/EgovGuestList"; }
	 *//**
	 * 방명록 수정을 위한 특정 내용을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/selectSingleGuestList.do") public String
	 * selectSingleGuestList(@ModelAttribute("searchVO") BoardVO boardVO,
	 * @ModelAttribute("brdMstrVO") BoardMasterVO brdMstrVO, ModelMap model)
	 * throws Exception {
	 * 
	 * LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * @SuppressWarnings("unused") Boolean isAuthenticated =
	 * EgovUserDetailsHelper.isAuthenticated();
	 * 
	 * BoardVO vo = mtboardMngService.selectBoardArticle(boardVO);
	 * 
	 * boardVO.setBbsId(boardVO.getBbsId());
	 * boardVO.setBbsNm(boardVO.getBbsNm()); boardVO.setNtcrNm(user.getName());
	 * 
	 * boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	 * boardVO.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
	 * paginationInfo.setPageSize(boardVO.getPageSize());
	 * 
	 * boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	 * boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * Map<String, Object> map = mtboardMngService.selectGuestList(boardVO); int
	 * totCnt = Integer.parseInt((String)map.get("resultCnt"));
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("boardVO", vo); model.addAttribute("brdMstrVO",
	 * brdMstrVO); model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * return "egovframework/com/mtb/EgovGuestList"; }
	 *//**
	 * 방명록에 대한 내용을 삭제한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/deleteGuestList.do") public String
	 * deleteGuestList(@ModelAttribute("searchVO") BoardVO boardVO,
	 * @ModelAttribute("board") Board board, ModelMap model) throws Exception {
	 * 
	 * @SuppressWarnings("unused") LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser(); Boolean
	 * isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * 
	 * if (isAuthenticated) { mtboardMngService.deleteGuestList(boardVO); }
	 * 
	 * return "forward:/cop/bbs/selectGuestList.do"; }
	 *//**
	 * 방명록 수정의 위한 목록을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/updateGuestList.do") public String
	 * updateGuestList(@ModelAttribute("searchVO") BoardVO boardVO,
	 * @ModelAttribute("board") Board board, BindingResult bindingResult,
	 * ModelMap model) throws Exception {
	 * 
	 * //BBST02, BBST04 LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser(); Boolean
	 * isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * 
	 * beanValidator.validate(board, bindingResult); if
	 * (bindingResult.hasErrors()) {
	 * 
	 * BoardVO vo = new BoardVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setBbsNm(boardVO.getBbsNm());
	 * vo.setNtcrNm(user.getName()); vo.setNtcrId(user.getUniqId());
	 * 
	 * BoardMasterVO masterVo = new BoardMasterVO();
	 * 
	 * masterVo.setBbsId(vo.getBbsId()); masterVo.setUniqId(user.getUniqId());
	 * 
	 * BoardMasterVO mstrVO = mtboardAttrbService.selectBBSMasterInf(masterVo);
	 * 
	 * vo.setPageUnit(propertyService.getInt("pageUnit"));
	 * vo.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * paginationInfo.setCurrentPageNo(vo.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(vo.getPageUnit());
	 * paginationInfo.setPageSize(vo.getPageSize());
	 * 
	 * vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * vo.setLastIndex(paginationInfo.getLastRecordIndex());
	 * vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * Map<String, Object> map = mtboardMngService.selectGuestList(vo); int
	 * totCnt = Integer.parseInt((String)map.get("resultCnt"));
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("brdMstrVO", mstrVO); model.addAttribute("boardVO",
	 * vo); model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * return "egovframework/com/mtb/EgovGuestList"; }
	 * 
	 * if (isAuthenticated) { mtboardMngService.updateBoardArticle(board);
	 * boardVO.setNttCn(""); boardVO.setPassword(""); boardVO.setNtcrId("");
	 * boardVO.setNttId(0); }
	 * 
	 * return "forward:/cop/bbs/selectGuestList.do"; }
	 *//**
	 * 방명록에 대한 내용을 등록한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/insertGuestList.do") public String
	 * insertGuestList(@ModelAttribute("searchVO") BoardVO boardVO,
	 * @ModelAttribute("board") Board board, BindingResult bindingResult,
	 * ModelMap model) throws Exception {
	 * 
	 * //그러니까 무인증은 아니고 - _- 익명으로 등록이 가능한 부분임 // 무인증이 되려면 별도의 컨트롤러를 하나 더 등록해야함
	 * 
	 * LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * 
	 * beanValidator.validate(board, bindingResult); if
	 * (bindingResult.hasErrors()) {
	 * 
	 * BoardVO vo = new BoardVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setBbsNm(boardVO.getBbsNm());
	 * vo.setNtcrNm(user.getName()); vo.setNtcrId(user.getUniqId());
	 * 
	 * BoardMasterVO masterVo = new BoardMasterVO();
	 * 
	 * masterVo.setBbsId(vo.getBbsId()); masterVo.setUniqId(user.getUniqId());
	 * 
	 * BoardMasterVO mstrVO = mtboardAttrbService.selectBBSMasterInf(masterVo);
	 * 
	 * vo.setPageUnit(propertyService.getInt("pageUnit"));
	 * vo.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * paginationInfo.setCurrentPageNo(vo.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(vo.getPageUnit());
	 * paginationInfo.setPageSize(vo.getPageSize());
	 * 
	 * vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * vo.setLastIndex(paginationInfo.getLastRecordIndex());
	 * vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * Map<String, Object> map = mtboardMngService.selectGuestList(vo); int
	 * totCnt = Integer.parseInt((String)map.get("resultCnt"));
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("brdMstrVO", mstrVO); model.addAttribute("boardVO",
	 * vo); model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * return "egovframework/com/mtb/EgovGuestList";
	 * 
	 * }
	 * 
	 * if (isAuthenticated) { board.setFrstRegisterId(user.getUniqId());
	 * 
	 * mtboardMngService.insertBoardArticle(board);
	 * 
	 * boardVO.setNttCn(""); boardVO.setPassword(""); boardVO.setNtcrId("");
	 * boardVO.setNttId(0); }
	 * 
	 * return "forward:/cop/bbs/selectGuestList.do"; }
	 *//**
	 * 익명게시물에 대한 목록을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/selectBoardList.do") public String
	 * selectAnonymousBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO,
	 * ModelMap model) throws Exception { //LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * //log.debug(this.getClass().getName() + " user.getId() "+ user.getId());
	 * //log.debug(this.getClass().getName() + " user.getName() "+
	 * user.getName()); //log.debug(this.getClass().getName() +
	 * " user.getUniqId() "+ user.getUniqId());
	 * //log.debug(this.getClass().getName() + " user.getOrgnztId() "+
	 * user.getOrgnztId()); //log.debug(this.getClass().getName() +
	 * " user.getUserSe() "+ user.getUserSe());
	 * //log.debug(this.getClass().getName() + " user.getEmail() "+
	 * user.getEmail());
	 * 
	 * //String attrbFlag = "";
	 * 
	 * boardVO.setBbsId(boardVO.getBbsId());
	 * boardVO.setBbsNm(boardVO.getBbsNm());
	 * 
	 * BoardMasterVO vo = new BoardMasterVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setUniqId("ANONYMOUS"); // 익명
	 * 
	 * BoardMasterVO master = mtboardAttrbService.selectBBSMasterInf(vo);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!master.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/selectBoardList.do"; }
	 * ////-----------------------------
	 * 
	 * boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	 * boardVO.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * 
	 * paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
	 * paginationInfo.setPageSize(boardVO.getPageSize());
	 * 
	 * boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	 * boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * Map<String, Object> map = mtboardMngService.selectBoardArticles(boardVO,
	 * vo.getBbsAttrbCode()); int totCnt =
	 * Integer.parseInt((String)map.get("resultCnt"));
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * //------------------------------- // 기본 BBS template 지정
	 * //------------------------------- if (master.getTmplatCours() == null ||
	 * master.getTmplatCours().equals("")) {
	 * master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); } ////-----------------------------
	 * 
	 * model.addAttribute("resultList", map.get("resultList"));
	 * model.addAttribute("resultCnt", map.get("resultCnt"));
	 * model.addAttribute("boardVO", boardVO); model.addAttribute("brdMstrVO",
	 * master); model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeList"; }
	 *//**
	 * 익명게시물 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/addBoardArticle.do") public String
	 * addAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO,
	 * ModelMap model) throws Exception { //LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser(); //Boolean
	 * isAuthenticated = EgovUserDetailsHelper.isAuthenticated(); Boolean
	 * isAuthenticated = true;
	 * 
	 * BoardMasterVO bdMstr = new BoardMasterVO();
	 * 
	 * if (isAuthenticated) { BoardMasterVO vo = new BoardMasterVO();
	 * vo.setBbsId(boardVO.getBbsId()); vo.setUniqId("ANONYMOUS");
	 * 
	 * bdMstr = mtboardAttrbService.selectBBSMasterInf(vo);
	 * model.addAttribute("bdMstr", bdMstr); }
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!bdMstr.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/addBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * //---------------------------- // 기본 BBS template 지정
	 * //---------------------------- if (bdMstr.getTmplatCours() == null ||
	 * bdMstr.getTmplatCours().equals("")) {
	 * bdMstr.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", bdMstr);
	 * ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeRegist"; }
	 *//**
	 * 익명게시물을 등록한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @RequestMapping("/com/mtb/anonymous/insertBoardArticle.do") public String
	 * insertAnonymousBoardArticle(final MultipartHttpServletRequest
	 * multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	 * 
	 * @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board")
	 * Board board, BindingResult bindingResult, SessionStatus status, ModelMap
	 * model) throws Exception {
	 * 
	 * //LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * //Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * Boolean isAuthenticated = true;
	 * 
	 * beanValidator.validate(board, bindingResult); if
	 * (bindingResult.hasErrors()) {
	 * 
	 * BoardMasterVO master = new BoardMasterVO(); BoardMasterVO vo = new
	 * BoardMasterVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setUniqId("ANONYMOUS");
	 * 
	 * master = mtboardAttrbService.selectBBSMasterInf(vo);
	 * 
	 * model.addAttribute("bdMstr", master);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!bdMstr.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/insertBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * //---------------------------- // 기본 BBS template 지정
	 * //---------------------------- if (master.getTmplatCours() == null ||
	 * master.getTmplatCours().equals("")) {
	 * master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", master);
	 * ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeRegist"; }
	 * 
	 * if (isAuthenticated) { List<FileVO> result = null; String atchFileId =
	 * "";
	 * 
	 * final Map<String, MultipartFile> files = multiRequest.getFileMap(); if
	 * (!files.isEmpty()) { result = fileUtil.parseFileInf(files, "BBS_", 0, "",
	 * ""); atchFileId = fileMngService.insertFileInfs(result); }
	 * board.setAtchFileId(atchFileId); board.setFrstRegisterId("ANONYMOUS");
	 * board.setBbsId(board.getBbsId());
	 * 
	 * // 익명게시판 관련 board.setNtcrNm(board.getNtcrNm());
	 * board.setPassword(EgovFileScrty.encryptPassword(board.getPassword()));
	 * 
	 * board.setNttCn(unscript(board.getNttCn())); // XSS 방지
	 * 
	 * mtboardMngService.insertBoardArticle(board); }
	 * 
	 * //status.setComplete(); return
	 * "forward:/cop/bbs/anonymous/selectBoardList.do"; }
	 *//**
	 * 익명게시물에 대한 상세 정보를 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/selectBoardArticle.do") public String
	 * selectAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO,
	 * ModelMap model) throws Exception { //LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * // 조회수 증가 여부 지정 boardVO.setPlusCount(true);
	 * 
	 * //--------------------------------- // 2009.06.29 : 2단계 기능 추가
	 * //--------------------------------- if
	 * (!boardVO.getSubPageIndex().equals("")) { boardVO.setPlusCount(false); }
	 * ////-------------------------------
	 * 
	 * boardVO.setLastUpdusrId("ANONYMOUS"); BoardVO vo =
	 * mtboardMngService.selectBoardArticle(boardVO);
	 * 
	 * model.addAttribute("result", vo); //CommandMap의 형태로 개선????
	 * 
	 * model.addAttribute("sessionUniqId", "ANONYMOUS");
	 * 
	 * //---------------------------- // template 처리 (기본 BBS template 지정 포함)
	 * //---------------------------- BoardMasterVO master = new
	 * BoardMasterVO();
	 * 
	 * master.setBbsId(boardVO.getBbsId()); master.setUniqId("ANONYMOUS");
	 * 
	 * BoardMasterVO masterVo = mtboardAttrbService.selectBBSMasterInf(master);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!masterVo.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/selectBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * if (masterVo.getTmplatCours() == null ||
	 * masterVo.getTmplatCours().equals("")) {
	 * masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", masterVo);
	 * ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * //---------------------------- // 2009.06.29 : 2단계 기능 추가 // 2011.07.01 :
	 * 댓글, 스크랩, 만족도 조사 기능의 종속성 제거 //---------------------------- if
	 * (bbsCommentService != null){ if
	 * (bbsCommentService.canUseComment(boardVO.getBbsId())) {
	 * model.addAttribute("useComment", "true"); } } if (bbsSatisfactionService
	 * != null){ if
	 * (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
	 * model.addAttribute("useSatisfaction", "true"); } } if (bbsScrapService !=
	 * null){ if (bbsScrapService.canUseScrap()) {
	 * model.addAttribute("useScrap", "true"); } }
	 * ////--------------------------
	 * 
	 * return "egovframework/com/mtb/EgovNoticeInqire"; }
	 *//**
	 * 익명게시물에 대한 내용을 삭제한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/deleteBoardArticle.do") public String
	 * deleteAnonymousBoardArticle(@ModelAttribute("searchVO") BoardVO boardVO,
	 * @ModelAttribute("board") Board board,
	 * 
	 * @ModelAttribute("bdMstr") BoardMaster bdMstr, ModelMap model) throws
	 * Exception {
	 * 
	 * //LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * //Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * Boolean isAuthenticated = true;
	 * 
	 * //-------------------------------------------------- // 마스터 정보 얻기
	 * //-------------------------------------------------- BoardMasterVO master
	 * = new BoardMasterVO();
	 * 
	 * master.setBbsId(boardVO.getBbsId()); master.setUniqId("ANONYMOUS");
	 * 
	 * BoardMasterVO masterVo = mtboardAttrbService.selectBBSMasterInf(master);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!masterVo.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/deleteBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * //------------------------------- // 패스워드 비교
	 * //------------------------------- String dbpassword =
	 * mtboardMngService.getPasswordInf(board); String enpassword =
	 * EgovFileScrty.encryptPassword(board.getPassword());
	 * 
	 * if (!dbpassword.equals(enpassword)) {
	 * 
	 * model.addAttribute("msg",
	 * egovMessageSource.getMessage("cop.password.not.same.msg"));
	 * 
	 * return "forward:/cop/bbs/anonymous/selectBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * if (isAuthenticated) { board.setLastUpdusrId("ANONYMOUS");
	 * 
	 * mtboardMngService.deleteBoardArticle(board); }
	 * 
	 * return "forward:/cop/bbs/anonymous/selectBoardList.do"; }
	 *//**
	 * 익명게시물 수정을 위한 수정페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param vo
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/forUpdateBoardArticle.do") public
	 * String selectAnonymousBoardArticleForUpdt(@ModelAttribute("searchVO")
	 * BoardVO boardVO, @ModelAttribute("board") BoardVO vo, ModelMap model)
	 * throws Exception {
	 * 
	 * //log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getNttId "
	 * +boardVO.getNttId());
	 * //log.debug(this.getClass().getName()+"selectBoardArticleForUpdt getBbsId "
	 * +boardVO.getBbsId());
	 * 
	 * //LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * //Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * Boolean isAuthenticated = true;
	 * 
	 * boardVO.setFrstRegisterId("ANONYMOUS");
	 * 
	 * BoardMaster master = new BoardMaster(); BoardMasterVO bmvo = new
	 * BoardMasterVO(); BoardVO bdvo = new BoardVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId());
	 * 
	 * master.setBbsId(boardVO.getBbsId()); master.setUniqId("ANONYMOUS");
	 * 
	 * if (isAuthenticated) { bmvo =
	 * mtboardAttrbService.selectBBSMasterInf(master);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!bmvo.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/forUpdateBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * //------------------------------- // 패스워드 비교
	 * //------------------------------- String dbpassword =
	 * mtboardMngService.getPasswordInf(boardVO); String enpassword =
	 * EgovFileScrty.encryptPassword(boardVO.getPassword());
	 * 
	 * if (!dbpassword.equals(enpassword)) {
	 * 
	 * model.addAttribute("msg",
	 * egovMessageSource.getMessage("cop.password.not.same.msg"));
	 * 
	 * return "forward:/cop/bbs/anonymous/selectBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * bdvo = mtboardMngService.selectBoardArticle(boardVO); }
	 * 
	 * model.addAttribute("result", bdvo); model.addAttribute("bdMstr", bmvo);
	 * 
	 * //---------------------------- // 기본 BBS template 지정
	 * //---------------------------- if (bmvo.getTmplatCours() == null ||
	 * bmvo.getTmplatCours().equals("")) {
	 * bmvo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", bmvo); ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeUpdt"; }
	 *//**
	 * 익명게시물에 대한 내용을 수정한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @RequestMapping("/com/mtb/anonymous/updateBoardArticle.do") public String
	 * updateAnonymousBoardArticle(final MultipartHttpServletRequest
	 * multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	 * 
	 * @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board")
	 * Board board, BindingResult bindingResult, ModelMap model, SessionStatus
	 * status) throws Exception {
	 * 
	 * //LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * //Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * Boolean isAuthenticated = true;
	 * 
	 * String atchFileId = boardVO.getAtchFileId();
	 * 
	 * beanValidator.validate(board, bindingResult); if
	 * (bindingResult.hasErrors()) {
	 * 
	 * boardVO.setFrstRegisterId("ANONYMOUS");
	 * 
	 * BoardMaster master = new BoardMaster(); BoardMasterVO bmvo = new
	 * BoardMasterVO(); BoardVO bdvo = new BoardVO();
	 * 
	 * master.setBbsId(boardVO.getBbsId()); master.setUniqId("ANONYMOUS");
	 * 
	 * bmvo = mtboardAttrbService.selectBBSMasterInf(master);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!bdMstr.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/updateBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * bdvo = mtboardMngService.selectBoardArticle(boardVO);
	 * 
	 * model.addAttribute("result", bdvo); model.addAttribute("bdMstr", bmvo);
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeUpdt"; }
	 * 
	 * if (isAuthenticated) { final Map<String, MultipartFile> files =
	 * multiRequest.getFileMap(); if (!files.isEmpty()) { if
	 * ("".equals(atchFileId)) { List<FileVO> result =
	 * fileUtil.parseFileInf(files, "BBS_", 0, atchFileId, ""); atchFileId =
	 * fileMngService.insertFileInfs(result); board.setAtchFileId(atchFileId); }
	 * else { FileVO fvo = new FileVO(); fvo.setAtchFileId(atchFileId); int cnt
	 * = fileMngService.getMaxFileSN(fvo); List<FileVO> _result =
	 * fileUtil.parseFileInf(files, "BBS_", cnt, atchFileId, "");
	 * fileMngService.updateFileInfs(_result); } }
	 * 
	 * board.setLastUpdusrId("ANONYMOUS");
	 * 
	 * // 익명게시판 관련 board.setNtcrNm(board.getNtcrNm());
	 * board.setPassword(EgovFileScrty.encryptPassword(board.getPassword()));
	 * 
	 * board.setNttCn(unscript(board.getNttCn())); // XSS 방지
	 * 
	 * mtboardMngService.updateBoardArticle(board); }
	 * 
	 * return "forward:/cop/bbs/anonymous/selectBoardList.do"; }
	 *//**
	 * 익명게시물에 대한 답변 등록을 위한 등록페이지로 이동한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/anonymous/addReplyBoardArticle.do") public
	 * String addAnonymousReplyBoardArticle(@ModelAttribute("searchVO") BoardVO
	 * boardVO, ModelMap model) throws Exception { //LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * BoardMasterVO master = new BoardMasterVO(); BoardMasterVO vo = new
	 * BoardMasterVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setUniqId("ANONYMOUS");
	 * 
	 * master = mtboardAttrbService.selectBBSMasterInf(vo);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!master.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/addReplyBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * model.addAttribute("bdMstr", master); model.addAttribute("result",
	 * boardVO);
	 * 
	 * //---------------------------- // 기본 BBS template 지정
	 * //---------------------------- if (master.getTmplatCours() == null ||
	 * master.getTmplatCours().equals("")) {
	 * master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", master);
	 * ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeReply"; }
	 *//**
	 * 익명게시물에 대한 답변을 등록한다.
	 * 
	 * @param boardVO
	 * @param board
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @RequestMapping("/com/mtb/anonymous/replyBoardArticle.do") public String
	 * replyAnonymousBoardArticle(final MultipartHttpServletRequest
	 * multiRequest, @ModelAttribute("searchVO") BoardVO boardVO,
	 * 
	 * @ModelAttribute("bdMstr") BoardMaster bdMstr, @ModelAttribute("board")
	 * Board board, BindingResult bindingResult, ModelMap model, SessionStatus
	 * status) throws Exception {
	 * 
	 * //LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * //Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
	 * Boolean isAuthenticated = true;
	 * 
	 * beanValidator.validate(board, bindingResult); if
	 * (bindingResult.hasErrors()) { BoardMasterVO master = new BoardMasterVO();
	 * BoardMasterVO vo = new BoardMasterVO();
	 * 
	 * vo.setBbsId(boardVO.getBbsId()); vo.setUniqId("ANONYMOUS");
	 * 
	 * master = mtboardAttrbService.selectBBSMasterInf(vo);
	 * 
	 * //------------------------------- // 익명게시판이 아니면.. 원래 게시판 URL로 forward
	 * //------------------------------- if
	 * (!master.getBbsTyCode().equals("BBST02")) { return
	 * "forward:/cop/bbs/replyBoardArticle.do"; }
	 * ////-----------------------------
	 * 
	 * model.addAttribute("bdMstr", master); model.addAttribute("result",
	 * boardVO);
	 * 
	 * //---------------------------- // 기본 BBS template 지정
	 * //---------------------------- if (master.getTmplatCours() == null ||
	 * master.getTmplatCours().equals("")) {
	 * master.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", master);
	 * ////-----------------------------
	 * 
	 * model.addAttribute("anonymous", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeReply"; }
	 * 
	 * if (isAuthenticated) { final Map<String, MultipartFile> files =
	 * multiRequest.getFileMap(); String atchFileId = "";
	 * 
	 * if (!files.isEmpty()) { List<FileVO> result =
	 * fileUtil.parseFileInf(files, "BBS_", 0, "", ""); atchFileId =
	 * fileMngService.insertFileInfs(result); }
	 * 
	 * board.setAtchFileId(atchFileId); board.setReplyAt("Y");
	 * board.setFrstRegisterId("ANONYMOUS"); board.setBbsId(board.getBbsId());
	 * board.setParnts(Long.toString(boardVO.getNttId()));
	 * board.setSortOrdr(boardVO.getSortOrdr());
	 * board.setReplyLc(Integer.toString(Integer.parseInt(boardVO.getReplyLc())
	 * + 1));
	 * 
	 * // 익명게시판 관련 board.setNtcrNm(board.getNtcrNm());
	 * board.setPassword(EgovFileScrty.encryptPassword(board.getPassword()));
	 * 
	 * board.setNttCn(unscript(board.getNttCn())); // XSS 방지
	 * 
	 * mtboardMngService.insertBoardArticle(board); }
	 * 
	 * return "forward:/cop/bbs/anonymous/selectBoardList.do"; }
	 *//**
	 * 템플릿에 대한 미리보기용 게시물 목록을 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/previewBoardList.do") public String
	 * previewBoardArticles(@ModelAttribute("searchVO") BoardVO boardVO,
	 * ModelMap model) throws Exception { //LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * String template = boardVO.getSearchWrd(); // 템플릿 URL
	 * 
	 * BoardMasterVO master = new BoardMasterVO();
	 * 
	 * master.setBbsNm("미리보기 게시판");
	 * 
	 * boardVO.setPageUnit(propertyService.getInt("pageUnit"));
	 * boardVO.setPageSize(propertyService.getInt("pageSize"));
	 * 
	 * PaginationInfo paginationInfo = new PaginationInfo();
	 * 
	 * paginationInfo.setCurrentPageNo(boardVO.getPageIndex());
	 * paginationInfo.setRecordCountPerPage(boardVO.getPageUnit());
	 * paginationInfo.setPageSize(boardVO.getPageSize());
	 * 
	 * boardVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	 * boardVO.setLastIndex(paginationInfo.getLastRecordIndex());
	 * boardVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	 * 
	 * BoardVO target = null; List<BoardVO> list = new ArrayList<BoardVO>();
	 * 
	 * target = new BoardVO(); target.setNttSj("게시판 기능 설명");
	 * target.setFrstRegisterId("ID"); target.setFrstRegisterNm("관리자");
	 * target.setFrstRegisterPnttm("2009-01-01"); target.setInqireCo(7);
	 * target.setParnts("0"); target.setReplyAt("N"); target.setReplyLc("0");
	 * target.setUseAt("Y");
	 * 
	 * list.add(target);
	 * 
	 * target = new BoardVO(); target.setNttSj("게시판 부가 기능 설명");
	 * target.setFrstRegisterId("ID"); target.setFrstRegisterNm("관리자");
	 * target.setFrstRegisterPnttm("2009-01-01"); target.setInqireCo(7);
	 * target.setParnts("0"); target.setReplyAt("N"); target.setReplyLc("0");
	 * target.setUseAt("Y");
	 * 
	 * list.add(target);
	 * 
	 * boardVO.setSearchWrd("");
	 * 
	 * int totCnt = list.size();
	 * 
	 * paginationInfo.setTotalRecordCount(totCnt);
	 * 
	 * master.setTmplatCours(template);
	 * 
	 * model.addAttribute("resultList", list); model.addAttribute("resultCnt",
	 * Integer.toString(totCnt)); model.addAttribute("boardVO", boardVO);
	 * model.addAttribute("brdMstrVO", master);
	 * model.addAttribute("paginationInfo", paginationInfo);
	 * 
	 * model.addAttribute("preview", "true");
	 * 
	 * return "egovframework/com/mtb/EgovNoticeList"; }
	 *//**
	 * MainPage Notice PopUp 게시물에 대한 상세 정보를 조회한다.
	 * 
	 * @param boardVO
	 * @param sessionVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	/*
	 * @RequestMapping("/com/mtb/selectBoardArticlePopup.do") public String
	 * selectBoardArticlePopup(@ModelAttribute("searchVO") BoardVO boardVO,
	 * ModelMap model) throws Exception { LoginVO user =
	 * (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
	 * 
	 * // 조회수 증가 여부 지정 boardVO.setPlusCount(true);
	 * 
	 * //--------------------------------- // 2009.06.29 : 2단계 기능 추가
	 * //--------------------------------- if
	 * (!boardVO.getSubPageIndex().equals("")) { boardVO.setPlusCount(false); }
	 * ////-------------------------------
	 * 
	 * boardVO.setLastUpdusrId(user.getUniqId()); BoardVO vo =
	 * mtboardMngService.selectBoardArticle(boardVO);
	 * 
	 * model.addAttribute("result", vo); //CommandMap의 형태로 개선????
	 * 
	 * model.addAttribute("sessionUniqId", user.getUniqId());
	 * 
	 * //---------------------------- // template 처리 (기본 BBS template 지정 포함)
	 * //---------------------------- BoardMasterVO master = new
	 * BoardMasterVO();
	 * 
	 * master.setBbsId(boardVO.getBbsId()); master.setUniqId(user.getUniqId());
	 * 
	 * BoardMasterVO masterVo = mtboardAttrbService.selectBBSMasterInf(master);
	 * 
	 * if (masterVo.getTmplatCours() == null ||
	 * masterVo.getTmplatCours().equals("")) {
	 * masterVo.setTmplatCours("/css/egovframework/com/cop/tpl/egovBaseTemplate.css"
	 * ); }
	 * 
	 * model.addAttribute("brdMstrVO", masterVo);
	 * ////-----------------------------
	 * 
	 * //---------------------------- // 2009.06.29 : 2단계 기능 추가 // 2011.07.01 :
	 * 댓글, 스크랩, 만족도 조사 기능의 종속성 제거 //---------------------------- if
	 * (bbsCommentService != null){ if
	 * (bbsCommentService.canUseComment(boardVO.getBbsId())) {
	 * model.addAttribute("useComment", "true"); } } if (bbsSatisfactionService
	 * != null) { if
	 * (bbsSatisfactionService.canUseSatisfaction(boardVO.getBbsId())) {
	 * model.addAttribute("useSatisfaction", "true"); } } if (bbsScrapService !=
	 * null ) { if (bbsScrapService.canUseScrap()) {
	 * model.addAttribute("useScrap", "true"); } }
	 * ////--------------------------
	 * 
	 * return "egovframework/com/mtb/EgovNoticeInqirePopup"; } }
	 */
}