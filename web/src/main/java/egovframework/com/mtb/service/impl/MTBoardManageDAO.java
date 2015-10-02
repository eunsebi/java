package egovframework.com.mtb.service.impl;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.mtb.service.MTBoard;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.com.mtb.service.MTBoardVO;

@Repository("MTBoardManageDAO")
public class MTBoardManageDAO extends EgovComAbstractDAO{
	
    /**
     * 게시판에 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void insertBoardArticle(MTBoard mtboard) throws Exception {
	//long nttId = (Long)getSqlMapClientTemplate().queryForObject("BBSManageDAO.selectMaxNttId");//2011.09.22
	//board.setNttId(nttId);//2011.09.22
	
	insert("MTBManageDAO.insertBoardArticle", mtboard);
    }

    /**
     * 게시판에 답변 게시물을 등록 한다.
     * 
     * @param board
     * @throws Exception
     */
    public long replyBoardArticle(MTBoard mtboard) throws Exception {
	long nttId = (Long)getSqlMapClientTemplate().queryForObject("MTBManageDAO.selectMaxNttId");
	mtboard.setNttId(nttId);
	
	insert("MTBManageDAO.replyBoardArticle", mtboard);

	//----------------------------------------------------------
	// 현재 글 이후 게시물에 대한 NTT_NO를 증가 (정렬을 추가하기 위해)
	//----------------------------------------------------------
	//String parentId = board.getParnts();
	long nttNo = (Long)getSqlMapClientTemplate().queryForObject("MTBManageDAO.getParentNttNo", mtboard);

	mtboard.setNttNo(nttNo);
	update("MTBManageDAO.updateOtherNttNo", mtboard);

	mtboard.setNttNo(nttNo + 1);
	update("MTBManageDAO.updateNttNo", mtboard);

	return nttId;
    }
	
    /**
     * 게시물 한 건에 대하여 상세 내용을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public MTBoardVO selectBoardArticle(MTBoardVO mtboardVO) throws Exception {
	return (MTBoardVO)selectByPk("MTBManageDAO.selectBoardArticle", mtboardVO);
    }

    /**
     * 조건에 맞는 게시물 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardVO> selectBoardArticleList(MTBoardVO mtboardVO) throws Exception {
	return (List<MTBoardVO>) list("MTBManageDAO.selectBoardArticleList", mtboardVO);
    }

    /**
     * 조건에 맞는 게시물 목록에 대한 전체 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectBoardArticleListCnt(MTBoardVO mtboardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBManageDAO.selectBoardArticleListCnt", mtboardVO);
    }

    /**
     * 게시물 한 건의 내용을 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateBoardArticle(MTBoard mtboard) throws Exception {
	update("MTBManageDAO.updateBoardArticle", mtboard);
    }

    /**
     * 게시물 한 건을 삭제 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void deleteBoardArticle(MTBoard mtboard) throws Exception {
	update("MTBManageDAO.deleteBoardArticle", mtboard);
    }

    /**
     * 게시물에 대한 조회 건수를 수정 한다.
     * 
     * @param board
     * @throws Exception
     */
    public void updateInqireCo(MTBoardVO mtboardVO) throws Exception {
	update("MTBManageDAO.updateInqireCo", mtboardVO);
    }

    /**
     * 게시물에 대한 현재 조회 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectMaxInqireCo(MTBoardVO mtboardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBManageDAO.selectMaxInqireCo", mtboardVO);
    }

    /**
     * 게시판에 대한 목록을 정렬 순서로 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardVO> selectNoticeListForSort(MTBoard mtboard) throws Exception {
	return (List<MTBoardVO>) list("MTBManageDAO.selectNoticeListForSort", mtboard);
    }

    /**
     * 게사판에 대한 정렬 순서를 수정 한다.
     * 
     * @param sortList
     * @throws Exception
     */
    public void updateSortOrder(List<MTBoardVO> sortList) throws Exception {
    	MTBoardVO vo;
	Iterator<MTBoardVO> iter = sortList.iterator();
	while (iter.hasNext()) {
	    vo = (MTBoardVO)iter.next();
	    update("MTBManageDAO.updateSortOrder", vo);
	}
    }

    /**
     * 게시판에 대한 현재 게시물 번호의 최대값을 구한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public long selectNoticeItemForSort(MTBoard mtboard) throws Exception {
	return (Long)getSqlMapClientTemplate().queryForObject("MTBManageDAO.selectNoticeItemForSort", mtboard);
    }

    /**
     * 방명록에 대한 목록을 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardVO> selectGuestList(MTBoardVO mtboardVO) throws Exception {
	return (List<MTBoardVO>) list("MTBManageDAO.selectGuestList", mtboardVO);
    }

    /**
     * 방명록에 대한 목록 건수를 조회 한다.
     * 
     * @param boardVO
     * @return
     * @throws Exception
     */
    public int selectGuestListCnt(MTBoardVO mtboardVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBManageDAO.selectGuestListCnt", mtboardVO);
    }

    /**
     * 방명록 내용을 삭제 한다.
     * 
     * @param boardVO
     * @throws Exception
     */
    public void deleteGuestList(MTBoardVO mtboardVO) throws Exception {
	update("MTBManageDAO.deleteGuestList", mtboardVO);
    }

    /**
     * 방명록에 대한 패스워드를 조회 한다.
     * 
     * @param board
     * @return
     * @throws Exception
     */
    public String getPasswordInf(MTBoard mtboard) throws Exception {
	return (String)getSqlMapClientTemplate().queryForObject("MTBManageDAO.getPasswordInf", mtboard);
    }
}