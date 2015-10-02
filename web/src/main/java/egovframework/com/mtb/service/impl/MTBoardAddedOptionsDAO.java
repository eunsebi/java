package egovframework.com.mtb.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;

/**
 * 2단계 기능 추가 (댓글관리, 만족도조사) 관리를 위한 데이터 접근 클래스
 * @author 공통컴포넌트개발팀 한성곤
 * @since 2009.06.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.06.26  한성곤          최초 생성
 *
 * </pre>
 */

@Repository("MTBoardAddedOptionsDAO")
public class MTBoardAddedOptionsDAO extends EgovComAbstractDAO {

	/**
	 * Maint Total 신규 게시판 추가기능 정보를 등록한다
	 * 
	 * @param mtbMaster
	 */
	public String insertAddedOptionsInf(MTBoardMaster mtboardMaster) throws Exception {
		
		return (String)insert("MTBoardAddedOptionsDAO.insertAddedOptionsInf", mtboardMaster);
	}

	/**
	 * Maint Total 게시판 추가기능 정보 한 건을 상세조회 한다.
	 * 
	 * @param mtboardMasterVO
	 * @return
	 */
	public MTBoardMasterVO selectAddedOptionsInf(MTBoardMaster vo) throws Exception{
		return (MTBoardMasterVO)selectByPk("MTBoardAddedOptionsDAO.selectAddedOptionsInf", vo);
	}
	
	/**
     * Maint Total 게시판 추가기능 정보를 수정한다.
     * 
     * @param BoardMaster
     */
    public void updateAddedOptionsInf(MTBoardMaster mtboardMaster) throws Exception {
    	update("MTBoardAddedOptionsDAO.updateAddedOptionsInf", mtboardMaster);
    }

}
