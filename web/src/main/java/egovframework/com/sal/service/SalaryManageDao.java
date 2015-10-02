package egovframework.com.sal.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository("saralyManageDao")
public class SalaryManageDao extends EgovComAbstractDAO {

	public List selectDeptSchdulManageList(ComDefaultVO searchVO) {
		// TODO Auto-generated method stub
		return (List)list("SalaryManage.selectDeptSchdulManage", searchVO);
	}

	public List selectSalaryManageRetrieve(Map map) {
		// TODO Auto-generated method stub
		return (List)list("SalaryManage.selectDeptSchdulManageRetrieve", map);
	}

	/**
	 * 근무일 등록한다
	 * @param salarymanageVO
	 */
	public void insertSalaryManage(SalaryManageVO salarymanageVO) {
		// TODO Auto-generated method stub
		insert("SalaryManage.insertSalaryManage", salarymanageVO);
		
	}

	/**
	 * 근무일정 삭제
	 * @param salaryManageVO
	 */
	public void deleteSalaryManage(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		//일지 삭제
		//delete("SalaryManage.deleteDiaryManage",salaryManageVO);
		//부서일정 삭제
		delete("SalaryManage.deleteSalaryManage",salaryManageVO);
		
	}

	/**
	 * 근무일정 목록을 상세조회
	 * @param salaryManageVO
	 * @return
	 */
	public List selectSalaryManageDetail(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		return (List)list("SalaryManage.selectSalaryManageDetail", salaryManageVO);
	}

	/**
	 * 근무일정 목록을 VO(model)형식으로 조히(수정), DAO
	 * @param salaryManageVO
	 * @return
	 * @throws Exception
	 */
	public SalaryManageVO selectSalaryManageDetailVO(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		return (SalaryManageVO)select("SalaryManage.selectSalaryManageDetailVO", salaryManageVO);
	}

	/**
	 * 근무일정을 수정한다, DAO
	 * @param salaryManageVO
	 * @throws Exception
	 */
	public void updateSalaryManage(SalaryManageVO salaryManageVO) throws Exception{
		// TODO Auto-generated method stub
		insert("SalaryManage.updateSalaryManage", salaryManageVO);
	}

	/**
	 * 시급 등록
	 * @param salaryUserMonelyVO
	 * @throws Exception
	 */
	public void insertSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO) throws Exception{
		// TODO Auto-generated method stub
		insert("SalaryManage.insertSalaryUserMonely", salaryUserMonelyVO);
	}

	public String selectSalaryCalculation(Map commandMap) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("sumMode DAO : " +commandMap.get("mode"));
		return  (String) select("SalaryManage.selectSalaryCalculation", commandMap);
	}

	public List selectListSalaryCalculation(Map<String, String> commandMap) {
		// TODO Auto-generated method stub
		return (List)list("SalaryManage.selectListSalaryCalculation", commandMap);
	}

	/**
	 * 유저 급여정보 조회 (DAO)
	 * @param commandMap
	 * @return
	 */
	public SalaryUserMonelyVO selectUserMonelyDetail(Map<String, String> commandMap) {
		// TODO Auto-generated method stub
		return (SalaryUserMonelyVO)select("SalaryManage.selectUserMonelyDetail", commandMap);
	}

	/**
	 * 유저 급여정보 업데이트 (DAO)
	 * @param salaryUserMonelyVO
	 */
	public void updateSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO) {
		// TODO Auto-generated method stub
		insert("SalaryManage.updateSalaryUserMonely", salaryUserMonelyVO);
	}

}
