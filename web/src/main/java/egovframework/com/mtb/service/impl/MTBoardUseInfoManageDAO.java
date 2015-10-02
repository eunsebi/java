package egovframework.com.mtb.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.mtb.service.MTBoardUseInf;
import egovframework.com.mtb.service.MTBoardUseInfVO;
import egovframework.com.mtb.service.MTBoardVO;

/**
 * Maint Total 게시판 이용정보를 관리하기 위한 데이터 접근 클래스
 * 
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------     --------    ---------------------------
 *   2009.4.2    이삼섭          최초 생성
 *   2011.07.27  안민정			 동호회, 커뮤니티 로직 분리 (BBSUseInfoManageDAO -> BBSCmyUseInfoManageDAO)
 *
 * </pre>
 */

@Repository("MTBoardUseInfoManageDAO")
public class MTBoardUseInfoManageDAO extends EgovComAbstractDAO {

    /**
     * 게시판 사용 정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInf(MTBoardUseInf mtboardUseInf) throws Exception {
	update("MTBUseInfoManageDAO.deleteBBSUseInf", mtboardUseInf);
    }

    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void insertBBSUseInf(MTBoardUseInf mtboardUseInf) throws Exception {
	insert("MTBUseInfoManageDAO.insertBBSUseInf", mtboardUseInf);
    }

    /**
     * 게시판 사용정보 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardUseInfVO> selectBBSUseInfs(MTBoardUseInfVO mtboardUseInfVO) throws Exception {
	return (List<MTBoardUseInfVO>) list("MTBUseInfoManageDAO.selectBBSUseInfs", mtboardUseInfVO);
    }

    /**
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCnt(MTBoardUseInfVO mtboardUseInfVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBUseInfoManageDAO.selectBBSUseInfsCnt", mtboardUseInfVO);
    }

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public MTBoardUseInfVO selectBBSUseInf(MTBoardUseInfVO mtboardUseInfVO) throws Exception {
	return (MTBoardUseInfVO)selectByPk("MTBUseInfoManageDAO.selectBBSUseInf", mtboardUseInfVO);
    }

    /**
     * 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInf(MTBoardUseInf mtboardUseInf) throws Exception {
	update("MTBUseInfoManageDAO.updateBBSUseInf", mtboardUseInf);
    }

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void deleteBBSUseInfByBoardId(MTBoardUseInf mtboardUseInf) throws Exception {
	update("MTBUseInfoManageDAO.deleteBBSUseInfByBoardId", mtboardUseInf);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardUseInfVO> selectBBSUseInfsByTrget(MTBoardUseInfVO mtboardUseInfVO) throws Exception {
	return (List<MTBoardUseInfVO>) list("MTBUseInfoManageDAO.selectBBSUseInfsByTrget", mtboardUseInfVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 전체 건수를 조회한다.
     * 
     * @param bdUseVO
     * @return
     * @throws Exception
     */
    public int selectBBSUseInfsCntByTrget(MTBoardUseInfVO mtboardUseInfVO) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBUseInfoManageDAO.selectBBSUseInfsCntByTrget", mtboardUseInfVO);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     * 
     * @param bdUseInf
     * @throws Exception
     */
    public void updateBBSUseInfByTrget(MTBoardUseInf mtboardUseInf) throws Exception {
	update("MTBUseInfoManageDAO.updateBBSUseInfByTrget", mtboardUseInf);
    }	
}