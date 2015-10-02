package egovframework.com.sal.service;

import java.io.Serializable;

public class SalaryManageVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/** 일정ID */
	private String salaryId;
	
	/** 등록자 ID */
	private String salaryUserId;
	
	/** 근무구분(주간/야간/특근/년차/휴무/기타) */
	private String salarySe;
	
	/** 연장여부(잔업/특근잔업) */
	private String salaryPro;
	
	/** 지각여부(지각/조퇴/기타) */
	private String salaryLate;
	
	/** 일정시작일자 */
	private String salaryBgnde;
	
	/** 일정종료일자 */
	private String salaryEndde;
	
	/** 일정시작일자(시간) */
	private String schdulBgndeHH = "";
	
	/** 일정시작일자(분) */
	private String schdulBgndeMM = "";
	
	/** 일정종료일자(시간) */
	private String schdulEnddeHH = "";
	
	/** 일정종료일자(분) */
	private String schdulEnddeMM = "";
	
	/** 연장시간 */
	private String salaryProTime;
	
	/** 지각시간 */
	private String salaryLateTime;
	
	/** 야간수당 시간 */
	private String salaryNightTime;
	
	/** 시급 */
	private String salaryCharge;
	
	/** 등록자 Id */
	private String salaryChargerId;
	
	/** 등록자 이름 */
	private String salaryChargerName;
	
	/** 등록자 이름 */
	private String salaryUserName;
	
	/** 최초등록시점 */
	private String frstRegisterPnttm = "";
	
	/** 최초등록자ID */
	private String frstRegisterId = "";
	
	/** 등록자 이름 */
	private String frstRegisterName = "";
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";
	
	/** 최종수정ID */
	private String lastUpdusrId = "";
	
	/** 일정시작일자(Year/Month/Day) */
	private String salaryBgndeYYYMMDD = "";
	
	/** 일정종료일자(Year/Month/Day) */
	private String salaryEnddeYYYMMDD = "";

	public String getSalaryId() {
		return salaryId;
	}

	public void setSalaryId(String salaryId) {
		this.salaryId = salaryId;
	}

	public String getSalaryUserId() {
		return salaryUserId;
	}

	public void setSalaryUserId(String salaryUserId) {
		this.salaryUserId = salaryUserId;
	}

	public String getSalarySe() {
		return salarySe;
	}

	public void setSalarySe(String salarySe) {
		this.salarySe = salarySe;
	}

	public String getSalaryPro() {
		return salaryPro;
	}

	public void setSalaryPro(String salaryPro) {
		this.salaryPro = salaryPro;
	}

	public String getSalaryLate() {
		return salaryLate;
	}

	public void setSalaryLate(String salaryLate) {
		this.salaryLate = salaryLate;
	}

	public String getSalaryBgnde() {
		return salaryBgnde;
	}

	public void setSalaryBgnde(String salaryBgnde) {
		this.salaryBgnde = salaryBgnde;
	}

	public String getSalaryEndde() {
		return salaryEndde;
	}

	public void setSalaryEndde(String salaryEndde) {
		this.salaryEndde = salaryEndde;
	}

	public String getSchdulBgndeHH() {
		return schdulBgndeHH;
	}

	public void setSchdulBgndeHH(String schdulBgndeHH) {
		this.schdulBgndeHH = schdulBgndeHH;
	}

	public String getSchdulBgndeMM() {
		return schdulBgndeMM;
	}

	public void setSchdulBgndeMM(String schdulBgndeMM) {
		this.schdulBgndeMM = schdulBgndeMM;
	}

	public String getSchdulEnddeHH() {
		return schdulEnddeHH;
	}

	public void setSchdulEnddeHH(String schdulEnddeHH) {
		this.schdulEnddeHH = schdulEnddeHH;
	}

	public String getSchdulEnddeMM() {
		return schdulEnddeMM;
	}

	public void setSchdulEnddeMM(String schdulEnddeMM) {
		this.schdulEnddeMM = schdulEnddeMM;
	}

	public String getSalaryProTime() {
		return salaryProTime;
	}

	public void setSalaryProTime(String salaryProTime) {
		this.salaryProTime = salaryProTime;
	}

	public String getSalaryLateTime() {
		return salaryLateTime;
	}

	public void setSalaryLateTime(String salaryLateTime) {
		this.salaryLateTime = salaryLateTime;
	}

	public String getSalaryCharge() {
		return salaryCharge;
	}

	public void setSalaryCharge(String salaryCharge) {
		this.salaryCharge = salaryCharge;
	}

	public String getSalaryChargerId() {
		return salaryChargerId;
	}

	public void setSalaryChargerId(String salaryChargerId) {
		this.salaryChargerId = salaryChargerId;
	}

	public String getSalaryChargerName() {
		return salaryChargerName;
	}

	public void setSalaryChargerName(String salaryChargerName) {
		this.salaryChargerName = salaryChargerName;
	}

	public String getSalaryUserName() {
		return salaryUserName;
	}

	public void setSalaryUserName(String salaryUserName) {
		this.salaryUserName = salaryUserName;
	}

	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getFrstRegisterName() {
		return frstRegisterName;
	}

	public void setFrstRegisterName(String frstRegisterName) {
		this.frstRegisterName = frstRegisterName;
	}

	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	public String getSalaryBgndeYYYMMDD() {
		return salaryBgndeYYYMMDD;
	}

	public void setSalaryBgndeYYYMMDD(String salaryBgndeYYYMMDD) {
		this.salaryBgndeYYYMMDD = salaryBgndeYYYMMDD;
	}

	public String getSalaryEnddeYYYMMDD() {
		return salaryEnddeYYYMMDD;
	}

	public void setSalaryEnddeYYYMMDD(String salaryEnddeYYYMMDD) {
		this.salaryEnddeYYYMMDD = salaryEnddeYYYMMDD;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getSalaryHolidayTime() {
		return salaryNightTime;
	}

	public void setSalaryHolidayTime(String salaryHolidayTime) {
		this.salaryNightTime = salaryHolidayTime;
	}

}
