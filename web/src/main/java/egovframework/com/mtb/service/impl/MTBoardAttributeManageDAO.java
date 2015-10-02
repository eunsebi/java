package egovframework.com.mtb.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;

/**
 * PM 스케쥴 게시판 속성정보 관리를 위한 데이터 접근 클래스
 * @author 공통서비스개발팀 이삼섭
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------      --------    ---------------------------
 *   2009.3.12  이삼섭          최초 생성
 *
 * </pre>
 */

@Repository("MTBoardAttributeManageDAO")
public class MTBoardAttributeManageDAO extends EgovComAbstractDAO{

    /**
     * 등록된 게시판 속성정보를 삭제한다.
     * 
     * @param BoardMaster
     */
    public void deleteBBSMasterInf(MTBoardMaster mtboardMaster) throws Exception {
	update("MTBAttributeManageDAO.deleteBBSMasterInf", mtboardMaster);
    }

    /**
     * 신규 게시판 속성정보를 등록한다.
     * 
     * @param BoardMaster
     */
    public String insertBBSMasterInf(MTBoardMaster mtboardMaster) throws Exception {
	return (String)insert("MTBAttributeManageDAO.insertBBSMasterInf", mtboardMaster);
    }

    /**
     * 게시판 속성정보 한 건을 상세조회 한다.
     * 
     * @param BoardMasterVO
     */
    public MTBoardMasterVO selectBBSMasterInf(MTBoardMaster vo) throws Exception {
	return (MTBoardMasterVO)selectByPk("MTBAttributeManageDAO.selectBBSMasterInf", vo);
    }

    /**
     * 게시판 속성정보 목록을 조회한다.
     * 
     * @param BoardMasterVO
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectBBSMasterInfs(MTBoardMasterVO vo) throws Exception {
    	return (List<MTBoardMasterVO>) list("MTBAttributeManageDAO.selectBBSMasterInfs", vo);
    }

    /**
     * 게시판 속성정보 목록 숫자를 조회한다
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public int selectBBSMasterInfsCnt(MTBoardMasterVO vo) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBAttributeManageDAO.selectBBSMasterInfsCnt", vo);
    }

    /**
     * 게시판 속성정보를 수정한다.
     * 
     * @param BoardMaster
     */
    public void updateBBSMasterInf(MTBoardMaster mtboardMaster) throws Exception {
	update("MTBAttributeManageDAO.updateBBSMasterInf", mtboardMaster);
    }

    /**
     * 템플릿의 유효여부를 점검한다.
     * 
     * @param BoardMasterVO
     */
    public boolean validateTemplate(MTBoardMasterVO vo) throws Exception {
	return true;
    }

    /**
     * 유효한 게시판 목록을 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectAllBBSMasteInf(MTBoardMasterVO vo) throws Exception {
	// 커뮤니티, 동호회의 게시판이 나오지 않도록 COMTNBBSUSE 테이블과 Join 필요
	return (List<MTBoardMasterVO>) list("MTBAttributeManageDAO.selectAllBBSMaster", vo);
    }

    /**
     * 사용중인 게시판 속성정보 목록을 조회한다.
     * 
     * @param BoardMasterVO
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectBdMstrListByTrget(MTBoardMasterVO vo) throws Exception {
	return (List<MTBoardMasterVO>) list("MTBAttributeManageDAO.selectBdMstrListByTrget", vo);
    }

    /**
     * 사용중인 게시판 속성정보 목록 숫자를 조회한다
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public int selectBdMstrListCntByTrget(MTBoardMasterVO vo) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBAttributeManageDAO.selectBdMstrListCntByTrget", vo);
    }

    /**
     * 커뮤니티, 동호회등 게시판 사용등록이 된 게시판 목록 전체를 불러온다.
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectAllBdMstrByTrget(MTBoardMasterVO vo) throws Exception {
	return (List<MTBoardMasterVO>) list("MTBAttributeManageDAO.selectAllBdMstrByTrget", vo);
    }

    /**
     * 사용 중이지 않은 게시판 속성정보 목록을 조회한다.
     * 
     * @param BoardMasterVO
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectNotUsedBdMstrList(MTBoardMasterVO vo) throws Exception {
	return (List<MTBoardMasterVO>) list("MTBAttributeManageDAO.selectNotUsedBdMstrList", vo);
    }

    /**
     * 사용 중이지 않은 게시판 속성정보 목록 숫자를 조회한다
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public int selectNotUsedBdMstrListCnt(MTBoardMasterVO vo) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBAttributeManageDAO.selectNotUsedBdMstrListCnt", vo);
    }		
}
