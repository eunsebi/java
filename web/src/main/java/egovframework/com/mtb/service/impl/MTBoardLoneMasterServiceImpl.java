package egovframework.com.mtb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mtb.service.MTBoardLoneMasterService;
import egovframework.com.mtb.service.MTBoardMaster;
import egovframework.com.mtb.service.MTBoardMasterVO;
import egovframework.com.mtb.service.MTBoardUseInf;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * 게시판 속성관리를 위한 서비스 구현 클래스
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

@Service("MTBoardLoneMasterService")
public class MTBoardLoneMasterServiceImpl extends AbstractServiceImpl implements MTBoardLoneMasterService {

    @Resource(name = "MTBoardLoneMasterDAO")
    private MTBoardLoneMasterDAO masterDAO;

    @Resource(name = "MTBoardUseInfoManageDAO")
    private MTBoardUseInfoManageDAO mtbUseDAO;

    @Resource(name = "egovBBSMstrIdGnrService")
    private EgovIdGnrService idgenService;
		
    /**
     * 등록된 게시판 속성정보를 삭제한다.
     */
    public void deleteMaster(MTBoardMaster mtboardMaster) throws Exception {
	masterDAO.deleteMaster(mtboardMaster);
	
	MTBoardUseInf bdUseInf = new MTBoardUseInf();
	
	bdUseInf.setBbsId(mtboardMaster.getBbsId());
	bdUseInf.setLastUpdusrId(mtboardMaster.getLastUpdusrId());
	
	mtbUseDAO.deleteBBSUseInfByBoardId(bdUseInf);
    }

    /**
     * 신규 게시판 속성정보를 생성한다.
     */
    public String insertMaster(MTBoardMaster mtboardMaster) throws Exception {
	String bbsId = idgenService.getNextStringId();
	
	mtboardMaster.setBbsId(bbsId);
	
	masterDAO.insertMaster(mtboardMaster);

	//----------------------------------------------
	// 게시판 사용 등록 (시스템)
	//----------------------------------------------
	MTBoardUseInf mtboardUseInf = new MTBoardUseInf();

	mtboardUseInf.setBbsId(bbsId);
	mtboardUseInf.setTrgetId("SYSTEM_DEFAULT_BOARD");
	mtboardUseInf.setRegistSeCode("REGC01");
	mtboardUseInf.setFrstRegisterId(mtboardMaster.getFrstRegisterId());
	mtboardUseInf.setUseAt("Y");

	mtbUseDAO.insertBBSUseInf(mtboardUseInf);
	    
	return bbsId;
    }

    /**
     * 게시판 속성정보 한 건을 상세조회한다.
     */
    public MTBoardMasterVO selectMaster(MTBoardMaster searchVO) throws Exception {
	return masterDAO.selectMaster(searchVO);
    }

    /**
     * 게시판 속성 정보의 목록을 조회 한다.
     */
    public Map<String, Object> selectMasterList(MTBoardMasterVO searchVO) throws Exception {
	List<MTBoardMasterVO> result = masterDAO.selectMasterList(searchVO);
	int cnt = masterDAO.selectMasterListCnt(searchVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 게시판 속성정보를 수정한다.
     */
    public void updateMaster(MTBoardMaster boardMaster) throws Exception {
	masterDAO.updateMaster(boardMaster);
    }
}