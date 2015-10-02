package egovframework.com.mtb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mtb.service.MTBoardUseInf;
import egovframework.com.mtb.service.MTBoardUseInfVO;
import egovframework.com.mtb.service.MTBoardUseInfoManageService;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("MTBoardUseInfoManageService")
public class MTBoardUseInfoManageServiceImpl extends AbstractServiceImpl implements MTBoardUseInfoManageService {

	@Resource(name = "MTBoardUseInfoManageDAO")
	private MTBoardUseInfoManageDAO mtboardUseDAO;
	
    /**
     * 게시판 사용 정보를 삭제한다.
     * 
     * @see egovframework.com.cop.bbs.service.com.service.EgovBBSUseInfoManageService#deleteBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void deleteBBSUseInf(MTBoardUseInf bdUseInf) throws Exception {
    	mtboardUseDAO.deleteBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보를 등록한다.
     * 
     * @see egovframework.com.cop.bbs.service.com.service.EgovBBSUseInfoManageService#insertBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void insertBBSUseInf(MTBoardUseInf bdUseInf) throws Exception {
    	mtboardUseDAO.insertBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보 목록을 조회한다.
     * 
     * @see egovframework.com.cop.bbs.service.com.service.EgovBBSUseInfoManageService#selectBBSUseInfs(egovframework.com.cop.bbs.service.com.service.BoardUseInfVO)
     */
    public Map<String, Object> selectBBSUseInfs(MTBoardUseInfVO bdUseVO) throws Exception {

	List<MTBoardUseInfVO> result = mtboardUseDAO.selectBBSUseInfs(bdUseVO);
	int cnt = mtboardUseDAO.selectBBSUseInfsCnt(bdUseVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 게시판 사용정보를 수정한다.
     * 
     * @see egovframework.com.cop.bbs.service.com.service.EgovBBSUseInfoManageService#updateBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInf)
     */
    public void updateBBSUseInf(MTBoardUseInf bdUseInf) throws Exception {
    	mtboardUseDAO.updateBBSUseInf(bdUseInf);
    }

    /**
     * 게시판 사용정보에 대한 상세정보를 조회한다.
     * 
     * @see egovframework.com.cop.bbs.service.com.service.EgovBBSUseInfoManageService#selectBBSUseInf(egovframework.com.cop.bbs.service.com.service.BoardUseInfVO)
     */
    public MTBoardUseInfVO selectBBSUseInf(MTBoardUseInfVO bdUseVO) throws Exception {
	return mtboardUseDAO.selectBBSUseInf(bdUseVO);
    }

    /**
     * 게시판에 대한 사용정보를 삭제한다.
     * 
     * @see egovframework.com.cop.bbs.service.EgovBBSUseInfoManageService#deleteBBSUseInfByBoardId(egovframework.com.cop.bbs.service.BoardUseInf)
     */
    public void deleteBBSUseInfByBoardId(MTBoardUseInf bdUseInf) throws Exception {
    	mtboardUseDAO.deleteBBSUseInfByBoardId(bdUseInf);
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보에 대한 목록을 조회한다.
     * 
     * @see egovframework.com.cop.bbs.service.EgovBBSUseInfoManageService#selectBBSUseInfsByTrget(egovframework.com.cop.bbs.service.BoardUseInfVO)
     */
    public Map<String, Object> selectBBSUseInfsByTrget(MTBoardUseInfVO bdUseVO) throws Exception {
	List<MTBoardUseInfVO> result = mtboardUseDAO.selectBBSUseInfsByTrget(bdUseVO);
	int cnt = mtboardUseDAO.selectBBSUseInfsCntByTrget(bdUseVO);
	
	Map<String, Object> map = new HashMap<String, Object>();
	
	map.put("resultList", result);
	map.put("resultCnt", Integer.toString(cnt));

	return map;
    }

    /**
     * 커뮤니티, 동호회에 사용되는 게시판 사용정보를 수정한다.
     */
    public void updateBBSUseInfByTrget(MTBoardUseInf bdUseInf) throws Exception {
    	mtboardUseDAO.updateBBSUseInfByTrget(bdUseInf);
    }
}
