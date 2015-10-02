package egovframework.com.sal.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("salaryManageService")
public class SalaryManageServiceImpl extends EgovAbstractServiceImpl implements SalaryManageService {
	
	@Resource(name="saralyManageDao")
	private SalaryManageDao dao;
	
	@Resource(name="salaryManageIdGnrService")
	private EgovIdGnrService idgenService;

	@Override
	public List<?> selectDeptSchdulManageList(ComDefaultVO searchVO) throws Exception {
		// TODO Auto-generated method stub
		return (List)dao.selectDeptSchdulManageList(searchVO);
	}

	@Override
	public List<?> selectSalaryManageRetrieve(Map map)
			throws Exception {
		// TODO Auto-generated method stub
		return (List)dao.selectSalaryManageRetrieve(map);
	}

	/*8
	 * 부서일정 등록
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#insertSalaryManage(egovframework.com.sal.service.SalaryManageVO)
	 */
	@Override
	public void insertSalaryManage(SalaryManageVO salarymanageVO)
			throws Exception {
		// TODO Auto-generated method stub
		
		String sMakeId = idgenService.getNextStringId();
		salarymanageVO.setSalaryId(sMakeId);
		
		dao.insertSalaryManage(salarymanageVO);
		
	}

	/**
	 * 근무 일정 삭제
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#deleteSalaryMange(egovframework.com.sal.service.SalaryManageVO)
	 */
	@Override
	public void deleteSalaryMange(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		dao.deleteSalaryManage(salaryManageVO);
		
	}

	/*
	 * 근무일정 목록을 상세조회
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#selectSamanageDetail(egovframework.com.sal.service.SalaryManageVO)
	 */
	@Override
	public List selectSamanageDetail(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		return (List)dao.selectSalaryManageDetail(salaryManageVO);
	}

	/*
	 * 근무일정 목록을 VO(model)형식으로 조히(수정), Impl
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#selectSamanageDetailVO(egovframework.com.sal.service.SalaryManageVO)
	 */
	@Override
	public SalaryManageVO selectSamanageDetailVO(SalaryManageVO salaryManageVO)
			throws Exception {
		// TODO Auto-generated method stub
		return (SalaryManageVO)dao.selectSalaryManageDetailVO(salaryManageVO);
	}

	/*
	 * 근무일정을 수정한다, Impl
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#updateSalaryManage(egovframework.com.sal.service.SalaryManageVO)
	 */
	@Override
	public void updateSalaryManage(SalaryManageVO salaryManageVO)
			throws Exception {
		// TODO Auto-generated method stub
		dao.updateSalaryManage(salaryManageVO);
	}

	/*
	 * 급여계산을 위한 목록 조회
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#selectSalaryCalculation(java.util.Map)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public String selectSalaryCalculation(Map commandMap) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("sumMode Service : " +commandMap.get("mode"));
		return dao.selectSalaryCalculation(commandMap);
	}

	@Override
	public List selectListSalaryCalculation(Map<String, String> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (List) dao.selectListSalaryCalculation(commandMap);
	}

	/*
	 * 기본 시급 등록
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#insertSalaryUserMonely(egovframework.com.sal.service.SalaryUserMonelyVO)
	 */
	@Override
	public void insertSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO) throws Exception {
		// TODO Auto-generated method stub
		dao.insertSalaryUserMonely(salaryUserMonelyVO);
	}

	/*
	 * 유져 급여 정보 조회
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#selectUserMonelyDetail(java.util.Map)
	 */
	@Override
	public SalaryUserMonelyVO selectUserMonelyDetail(Map<String, String> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return (SalaryUserMonelyVO) dao.selectUserMonelyDetail(commandMap);
	}

	/*
	 * 유저 급여정보 업데이트
	 * (non-Javadoc)
	 * @see egovframework.com.sal.service.SalaryManageService#updateSalaryUserMonely(egovframework.com.sal.service.SalaryUserMonelyVO)
	 */
	@Override
	public void updateSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO)
			throws Exception {
		// TODO Auto-generated method stub
		dao.updateSalaryUserMonely(salaryUserMonelyVO);
	}
}
