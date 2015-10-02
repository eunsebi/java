package egovframework.com.fp.service.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.fp.service.FloorPlan;
import egovframework.com.fp.service.FloorPlanVO;

@Repository("FloorPlanManageDAO")
public class FloorPlanManageDAO extends EgovComAbstractDAO {

	/**
	 * 게시판에 게시물을 등록 한다.
	 * 
	 * @param board
	 * @throws Exception
	 */
	public void insertBoardArticle(FloorPlan board) throws Exception {
		// long nttId = (Long)select("FloorPlanManageDAO.selectMaxNttId");//2011.09.22
		// board.setNttId(nttId);//2011.09.22

		insert("FloorPlanManageDAO.insertBoardArticle", board);
	}

	/**
	 * 게시판에 답변 게시물을 등록 한다.
	 * 
	 * @param board
	 * @throws Exception
	 */
	public long replyBoardArticle(FloorPlan board) throws Exception {
		long nttId = (Long) select("FloorPlanManageDAO.selectMaxNttId");
		board.setNttId(nttId);

		insert("FloorPlanManageDAO.replyBoardArticle", board);

		// ----------------------------------------------------------
		// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
		// ----------------------------------------------------------
		// String parentId = board.getParnts();
		long nttNo = (Long) select("FloorPlanManageDAO.getParentNttNo", board);

		board.setNttNo(nttNo);
		update("FloorPlanManageDAO.updateOtherNttNo", board);

		board.setNttNo(nttNo + 1);
		update("FloorPlanManageDAO.updateNttNo", board);

		return nttId;
	}

	/**
	 * 게시물 한 건에 대하여 상세 내용을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public FloorPlanVO selectBoardArticle(FloorPlanVO boardVO) throws Exception {
		return (FloorPlanVO) select("FloorPlanManageDAO.selectBoardArticle", boardVO);
	}

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanVO> selectBoardArticleList(FloorPlanVO boardVO)
			throws Exception {
		return (List<FloorPlanVO>) list("FloorPlanManageDAO.selectBoardArticleList", boardVO);
	}

	/**
	 * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public int selectBoardArticleListCnt(FloorPlanVO boardVO) throws Exception {
		return (Integer) select("FloorPlanManageDAO.selectBoardArticleListCnt",	boardVO);
	}

	/**
	 * 게시물 한 건의 내용을 수정 한다.
	 * 
	 * @param board
	 * @throws Exception
	 */
	public void updateBoardArticle(FloorPlan board) throws Exception {
		update("FloorPlanManageDAO.updateBoardArticle", board);
	}

	/**
	 * 게시물 한 건을 삭제 한다.
	 * 
	 * @param board
	 * @throws Exception
	 */
	public void deleteBoardArticle(FloorPlan board) throws Exception {
		update("FloorPlanManageDAO.deleteBoardArticle", board);
	}

	/**
	 * 게시물에 대한 조회 건수를 수정 한다.
	 * 
	 * @param board
	 * @throws Exception
	 */
	public void updateInqireCo(FloorPlanVO boardVO) throws Exception {
		update("FloorPlanManageDAO.updateInqireCo", boardVO);
	}

	/**
	 * 게시물에 대한 현재 조회 건수를 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public int selectMaxInqireCo(FloorPlanVO boardVO) throws Exception {
		return (Integer) select("FloorPlanManageDAO.selectMaxInqireCo", boardVO);
	}

	/**
	 * 게시판에 대한 목록을 정렬 순서로 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanVO> selectNoticeListForSort(FloorPlan board)
			throws Exception {
		return (List<FloorPlanVO>) list("FloorPlanManageDAO.selectNoticeListForSort", board);
	}

	/**
	 * 게사판에 대한 정렬 순서를 수정 한다.
	 * 
	 * @param sortList
	 * @throws Exception
	 */
	public void updateSortOrder(List<FloorPlanVO> sortList) throws Exception {
		FloorPlanVO vo;
		Iterator<FloorPlanVO> iter = sortList.iterator();
		while (iter.hasNext()) {
			vo = (FloorPlanVO) iter.next();
			update("FloorPlanManageDAO.updateSortOrder", vo);
		}
	}

	/**
	 * 게시판에 대한 현재 게시물 번호의 최대값을 구한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public long selectNoticeItemForSort(FloorPlan board) throws Exception {
		return (Long) select("FloorPlanManageDAO.selectNoticeItemForSort", board);
	}

	/**
	 * 방명록에 대한 목록을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<FloorPlanVO> selectGuestList(FloorPlanVO boardVO)
			throws Exception {
		return (List<FloorPlanVO>) list("FloorPlanManageDAO.selectGuestList", boardVO);
	}

	/**
	 * 방명록에 대한 목록 건수를 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public int selectGuestListCnt(FloorPlanVO boardVO) throws Exception {
		return (Integer) select("FloorPlanManageDAO.selectGuestListCnt", boardVO);
	}

	/**
	 * 방명록 내용을 삭제 한다.
	 * 
	 * @param boardVO
	 * @throws Exception
	 */
	public void deleteGuestList(FloorPlanVO boardVO) throws Exception {
		update("FloorPlanManageDAO.deleteGuestList", boardVO);
	}

	/**
	 * 방명록에 대한 패스워드를 조회 한다.
	 * 
	 * @param board
	 * @return
	 * @throws Exception
	 */
	public String getPasswordInf(FloorPlan board) throws Exception {
		return (String) select("FloorPlanManageDAO.getPasswordInf", board);
	}

	@SuppressWarnings("unchecked")
	public List<FloorPlanVO> selectSmallBoardArticleList(FloorPlanVO boardVO) {
		// TODO Auto-generated method stub
		return (List<FloorPlanVO>) list("FloorPlanManageDAO.selectSmallBoardArticleList", boardVO);
	}

	public int selectSmallBoardArticleListCnt(FloorPlanVO boardVO) {
		// TODO Auto-generated method stub
		return (Integer) select("FloorPlanManageDAO.selectSmallBoardArticleListCnt", boardVO);
	}
}
