package egovframework.com.fp.service;

import java.util.Map;

public interface FloorPlanManageService {

	/**
	 * 게시물 한 건을 삭제 한다.
	 * 
	 * @param Board
	 * @throws Exception
	 */
	public void deleteBoardArticle(FloorPlan Board) throws Exception;

	/**
	 * 게시판에 게시물 또는 답변 게시물을 등록 한다.
	 * 
	 * @param Board
	 * @throws Exception
	 */
	public void insertBoardArticle(FloorPlan Board) throws Exception;

	/**
	 * 게시물 대하여 상세 내용을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public FloorPlanVO selectBoardArticle(FloorPlanVO boardVO) throws Exception;

	/**
	 * 조건에 맞는 게시물 목록을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardArticles(FloorPlanVO boardVO,
			String attrbFlag) throws Exception;

	/**
	 * 게시물 한 건의 내용을 수정 한다.
	 * 
	 * @param Board
	 * @throws Exception
	 */
	public void updateBoardArticle(FloorPlan Board) throws Exception;

	/**
	 * 방명록에 대한 목록을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectGuestList(FloorPlanVO boardVO)
			throws Exception;

	/**
	 * 방명록 내용을 삭제 한다.
	 * 
	 * @param boardVO
	 * @throws Exception
	 */
	public void deleteGuestList(FloorPlanVO boardVO) throws Exception;

	/**
	 * 방명록에 대한 패스워드를 조회 한다.
	 * 
	 * @param Board
	 * @return
	 * @throws Exception
	 */
	public String getPasswordInf(FloorPlan Board) throws Exception;

	/**
	 * 상세조회 내 리스트 조건에 맞는 게시물 목록을 조회 한다.
	 * 
	 * @param boardVO
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectSmallBoardArticles(FloorPlanVO boardVO,
			String bbsAttrbCode) throws Exception;
}
