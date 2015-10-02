package egovframework.com.cop.smt.yea.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cop.smt.yea.service.YearlySchdulManageService;
import egovframework.com.cop.smt.yea.service.YearlySchdulManageVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
/**
 * 부서일정관리를 처리하는 ServiceImpl Class 구현
 * @author 공통서비스 장동한
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  장동한          최초 생성
 *
 * </pre>
 */
@Service("yearlySchdulManageService")
public class YearlySchdulManageServiceImpl extends EgovAbstractServiceImpl implements YearlySchdulManageService{

	//final private Log log = LogFactory.getLog(this.getClass());
	
	@Resource(name="yearlySchdulManageDao")
	private YearlySchdulManageDao dao;

	
	@Resource(name="yearlySchdulManageIdGnrService")
	private EgovIdGnrService idgenService;

    /**
	 * 부서일정관리조회
	 * @param Map(map) - 조회할 정보가 담긴 VO
	 * @return List
	 * @exception Exception
	 */
	public List selectDeptSchdulManageMainList(Map map) throws Exception{
		return (List)dao.selectDeptSchdulManageMainList(map);
	}
	
    /**
	 * 부서일정 목록을 Map(map)형식으로 조회한다. 
	 * @param Map(map) - 조회할 정보가 담긴 VO
	 * @return List
	 * @exception Exception
	 */
	public List selectDeptSchdulManageRetrieve(Map map) throws Exception{
		return (List)dao.selectDeptSchdulManageRetrieve(map);
	}
	
    /**
	 * 부서일정 목록을 VO(model)형식으로 조회한다. 
	 * @param deptSchdulManageVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @exception Exception
	 */
	public YearlySchdulManageVO selectDeptSchdulManageDetailVO(YearlySchdulManageVO deptSchdulManageVO) throws Exception{
		return (YearlySchdulManageVO)dao.selectDeptSchdulManageDetailVO(deptSchdulManageVO);
	}
	
    /**
	 * 부서일정 목록을 조회한다. 
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return List
	 * @exception Exception
	 */
	public List selectDeptSchdulManageList(ComDefaultVO searchVO) throws Exception{
		

		return (List)dao.selectDeptSchdulManageList(searchVO);
	}
	
    /**
	 * 부서일정를(을) 상세조회 한다.
	 * @param DeptSchdulManage - 회정정보가 담김 VO
	 * @return List
	 * @exception Exception
	 */
	public List selectDeptSchdulManageDetail(YearlySchdulManageVO deptSchdulManageVO) throws Exception{
		

		return (List)dao.selectDeptSchdulManageDetail(deptSchdulManageVO);
	}
	
    /**
	 * 부서일정를(을) 목록 전체 건수를(을) 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return int
	 * @exception Exception
	 */
	public int selectDeptSchdulManageListCnt(ComDefaultVO searchVO) throws Exception{
		

		return (Integer)dao.selectDeptSchdulManageListCnt(searchVO);
	}

    /**
	 * 부서일정를(을) 등록한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @exception Exception
	 */
	public void insertDeptSchdulManage(YearlySchdulManageVO deptSchdulManageVO) throws Exception {
		String sMakeId = idgenService.getNextStringId();
		deptSchdulManageVO.setSchdulId(sMakeId);

		dao.insertDeptSchdulManage(deptSchdulManageVO);
	}
	
    /**
	 * 부서일정를(을) 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @exception Exception
	 */
	public void updateDeptSchdulManage(YearlySchdulManageVO deptSchdulManageVO) throws Exception{
		dao.updateDeptSchdulManage(deptSchdulManageVO);
	}
	
    /**
	 * 부서일정를(을) 삭제한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @exception Exception
	 */
	public void deleteDeptSchdulManage(YearlySchdulManageVO deptSchdulManageVO) throws Exception{
		dao.deleteDeptSchdulManage(deptSchdulManageVO);
	}
}
