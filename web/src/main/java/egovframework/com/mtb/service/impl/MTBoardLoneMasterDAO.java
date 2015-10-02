package egovframework.com.mtb.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;

/**
 * 게시판 속성정보 관리를 위한 데이터 접근 클래스
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
 *
 * </pre>
 */

@Repository("MTBoardLoneMasterDAO")
public class MTBoardLoneMasterDAO extends EgovComAbstractDAO {
    /**
     * 등록된 게시판 속성정보를 삭제한다.
     * 
     * @param BoardMaster
     */
    public void deleteMaster(MTBoardMaster mtboardMaster) throws Exception {
	update("MTBLoneMasterDAO.deleteMaster", mtboardMaster);
    }

    /**
     * 신규 게시판 속성정보를 등록한다.
     * 
     * @param BoardMaster
     */
    public String insertMaster(MTBoardMaster mtboardMaster) throws Exception {
	return (String)insert("MTBLoneMasterDAO.insertMaster", mtboardMaster);
    }

    /**
     * 게시판 속성정보 한 건을 상세조회 한다.
     * 
     * @param BoardMasterVO
     */
    public MTBoardMasterVO selectMaster(MTBoardMaster vo) throws Exception {
	return (MTBoardMasterVO)selectByPk("MTBLoneMasterDAO.selectMaster", vo);
    }

    /**
     * 게시판 속성정보 목록을 조회한다.
     * 
     * @param BoardMasterVO
     */
    @SuppressWarnings("unchecked")
    public List<MTBoardMasterVO> selectMasterList(MTBoardMasterVO vo) throws Exception {
	return (List<MTBoardMasterVO>) list("MTBLoneMasterDAO.selectMasterList", vo);
    }

    /**
     * 게시판 속성정보 목록 숫자를 조회한다
     * 
     * @param vo
     * @return
     * @throws Exception
     */
    public int selectMasterListCnt(MTBoardMasterVO vo) throws Exception {
	return (Integer)getSqlMapClientTemplate().queryForObject("MTBLoneMasterDAO.selectMasterListCnt", vo);
    }

    /**
     * 게시판 속성정보를 수정한다.
     * 
     * @param BoardMaster
     */
    public void updateMaster(MTBoardMaster mtboardMaster) throws Exception {
	update("MTBLoneMasterDAO.updateMaster", mtboardMaster);
    }	
}
