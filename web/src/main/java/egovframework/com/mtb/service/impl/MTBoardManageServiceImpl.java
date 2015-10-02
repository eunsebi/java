package egovframework.com.mtb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cop.bbs.service.impl.EgovBBSManageServiceImpl;
import egovframework.com.mtb.service.MTBoard;
import egovframework.com.mtb.service.MTBoardManageService;
import egovframework.com.mtb.service.MTBoardVO;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Service("MTBoardManageService")
public class MTBoardManageServiceImpl extends AbstractServiceImpl implements MTBoardManageService {

	@Resource(name = "MTBoardManageDAO")
	private MTBoardManageDAO mtboardMngDAO;

	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	@Resource(name = "egovMTBNttIdGnrService")
	private EgovIdGnrService nttIdgenService;

	@SuppressWarnings("unused")
	private static final Logger LOG = Logger.getLogger(EgovBBSManageServiceImpl.class.getClass());

	/**
	 * 게시물 한 건을 삭제 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void deleteBoardArticle(MTBoard mtboard) throws Exception {
		FileVO fvo = new FileVO();

		fvo.setAtchFileId(mtboard.getAtchFileId());

		mtboard.setNttSj("이 글은 작성자에 의해서 삭제되었습니다.");

		mtboardMngDAO.deleteBoardArticle(mtboard);

		if (!"".equals(fvo.getAtchFileId()) || fvo.getAtchFileId() != null) {
			fileService.deleteAllFileInf(fvo);
		}
	}

	/**
	 * 게시판에 게시물 또는 답변 게시물을 등록 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#insertBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void insertBoardArticle(MTBoard mtboard) throws Exception {
		// SORT_ORDR는 부모글의 소트 오더와 같게, NTT_NO는 순서대로 부여

		if ("Y".equals(mtboard.getReplyAt())) {
			// 답글인 경우 1. Parnts를 세팅, 2.Parnts의 sortOrdr을 현재글의 sortOrdr로 가져오도록,
			// 3.nttNo는 현재 게시판의 순서대로
			// replyLc는 부모글의 ReplyLc + 1

			mtboard.setNttId(nttIdgenService.getNextIntegerId()); // 답글에 대한
																	// nttId 생성
			mtboardMngDAO.replyBoardArticle(mtboard);

		} else {
			// 답글이 아닌경우 Parnts = 0, replyLc는 = 0, sortOrdr = nttNo(Query에서 처리)
			mtboard.setParnts("0");
			mtboard.setReplyLc("0");
			mtboard.setReplyAt("N");
			mtboard.setNttId(nttIdgenService.getNextIntegerId());// 2011.09.22

			mtboardMngDAO.insertBoardArticle(mtboard);
		}
	}

	/**
	 * 게시물 대하여 상세 내용을 조회 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticle(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public MTBoardVO selectBoardArticle(MTBoardVO mtboardVO) throws Exception {
		if (mtboardVO.isPlusCount()) {
			int iniqireCo = mtboardMngDAO.selectMaxInqireCo(mtboardVO);

			mtboardVO.setInqireCo(iniqireCo);
			mtboardMngDAO.updateInqireCo(mtboardVO);
		}

		return mtboardMngDAO.selectBoardArticle(mtboardVO);
	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectBoardArticles(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public Map<String, Object> selectBoardArticles(MTBoardVO mtboardVO, String attrbFlag) throws Exception {
		List<MTBoardVO> list = mtboardMngDAO.selectBoardArticleList(mtboardVO);
		List<MTBoardVO> result = new ArrayList<MTBoardVO>();

		if ("BBSA01".equals(attrbFlag)) {
			// 유효게시판 임
			String today = EgovDateUtil.getToday();

			MTBoardVO vo;
			Iterator<MTBoardVO> iter = list.iterator();
			while (iter.hasNext()) {
				vo = (MTBoardVO) iter.next();

				if (!"".equals(vo.getNtceBgnde()) || !"".equals(vo.getNtceEndde())) {
					if (EgovDateUtil.getDaysDiff(today, vo.getNtceBgnde()) > 0 || EgovDateUtil.getDaysDiff(today, vo.getNtceEndde()) < 0) {
						// 시작일이 오늘날짜보다 크거나, 종료일이 오늘 날짜보다 작은 경우
						vo.setIsExpired("Y");
					}
				}
				result.add(vo);
			}
		} else {
			result = list;
		}

		int cnt = mtboardMngDAO.selectBoardArticleListCnt(mtboardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 게시물 한 건의 내용을 수정 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#updateBoardArticle(egovframework.com.cop.bbs.brd.service.Board)
	 */
	public void updateBoardArticle(MTBoard mtboard) throws Exception {
		mtboardMngDAO.updateBoardArticle(mtboard);
	}

	/**
	 * 방명록 내용을 삭제 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#deleteGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public void deleteGuestList(MTBoardVO mtboardVO) throws Exception {
		mtboardMngDAO.deleteGuestList(mtboardVO);
	}

	/**
	 * 방명록에 대한 목록을 조회 한다.
	 *
	 * @see egovframework.com.cop.bbs.brd.service.EgovBBSManageService#selectGuestList(egovframework.com.cop.bbs.brd.service.BoardVO)
	 */
	public Map<String, Object> selectGuestList(MTBoardVO mtboardVO) throws Exception {
		List<MTBoardVO> result = mtboardMngDAO.selectGuestList(mtboardVO);
		int cnt = mtboardMngDAO.selectGuestListCnt(mtboardVO);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 방명록에 대한 패스워드를 조회 한다.
	 *
	 * @param board
	 * @return
	 * @throws Exception
	 */
	public String getPasswordInf(MTBoard mtboard) throws Exception {
		return mtboardMngDAO.getPasswordInf(mtboard);
	}

}