package egovframework.com.sal.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultVO;

public interface SalaryManageService {

	/**
	 * 급여 목록을 조회한다.
	 * @param searchVO
	 * @return
	 * @throws Exception 
	 */
	List<?> selectDeptSchdulManageList(ComDefaultVO searchVO) throws Exception;

	List<?> selectSalaryManageRetrieve(Map map) throws Exception;

	/**
	 * 근무일 등록(실행)
	 * @param salarymanageVO
	 * @throws Exception
	 */
	void insertSalaryManage(SalaryManageVO salarymanageVO) throws Exception;

	/**
	 * 근무일정 삭제
	 * @param salaryManageVO
	 */
	void deleteSalaryMange(SalaryManageVO salaryManageVO) throws Exception;

	/**
	 * 근무일정 목록 상세조회
	 * @param salaryManageVO
	 * @return
	 */
	List selectSamanageDetail(SalaryManageVO salaryManageVO) throws Exception;

	/**
	 * 근무일정 목록을 VO(model)형식으로 조히(수정)
	 * @param salaryManageVO
	 * @return
	 * @throws Exception
	 */
	SalaryManageVO selectSamanageDetailVO(SalaryManageVO salaryManageVO) throws Exception;

	/**
	 * 근무일정을 수정한다.(실행)
	 * @param salaryManageVO
	 * @throws Exception
	 */
	void updateSalaryManage(SalaryManageVO salaryManageVO)throws Exception;

	/**
	 * 급여 계산을 위한 목록 조회
	 * @param commandMap
	 * @return
	 * @throws Exception 
	 */
	String selectSalaryCalculation(Map commandMap) throws Exception;

	/**
	 * 급여 계산 조회 List형
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	List selectListSalaryCalculation(Map<String, String> commandMap) throws Exception;

	/**
	 * 기본 시급 등록
	 * @param salaryUserMonelyVO
	 * @throws Exception
	 */
	void insertSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO) throws Exception;

	/**
	 * 유저 급여 정보 조회
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	SalaryUserMonelyVO selectUserMonelyDetail(Map<String, String> commandMap) throws Exception;

	/**
	 * 유저 급여 정보 수정
	 * @param salaryUserMonelyVO
	 */
	void updateSalaryUserMonely(SalaryUserMonelyVO salaryUserMonelyVO) throws Exception;
}
