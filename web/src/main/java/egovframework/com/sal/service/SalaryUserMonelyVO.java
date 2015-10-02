package egovframework.com.sal.service;

public class SalaryUserMonelyVO {
	
	/** User Esntl Id */
	private String esntlId;
	
	/** User Id */
	private String emplyrId;
	
	/** user Name */
	private String userNm;
	
	/** 시급 */
	private String timeSalary;
	
	/** 근무시간 */
	private String jobTime;
	
	/** 만근 수당 */
	private String fullWorkingPension;
	
	/** 잔업 수당 */
	private String proPension;
	
	/** 특근 수당 */
	private String holidayPersion;
	
	/** 특근 잔업 수당 */
	private String holidayAfterPersion;
	
	/** 가족 수당 */
	private String familyPension;
	
	/** 근속 수당 */
	private String longevityPension;
	
	/** 세금 예상액 */
	private String texesPension;
	
	/** 야간 수당 */
	private String nightPension;
	
	/** 최초등록자ID */
	private String frstRegisterId = "";

	/** 최초등록시점 */
	private String frstRegisterPnttm = "";
	
	/** 등록자 이름 */
	private String frstRegisterName = "";
	
	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";
	
	/** 최종수정ID */
	private String lastUpdusrId = "";

	public String getEsntlId() {
		return esntlId;
	}

	public void setEsntlId(String esntlId) {
		this.esntlId = esntlId;
	}

	public String getEmplyrId() {
		return emplyrId;
	}

	public void setEmplyrId(String emplyrId) {
		this.emplyrId = emplyrId;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getTimeSalary() {
		return timeSalary;
	}

	public void setTimeSalary(String timeSalary) {
		this.timeSalary = timeSalary;
	}

	public String getJobTime() {
		return jobTime;
	}

	public void setJobTime(String jobTime) {
		this.jobTime = jobTime;
	}

	public String getFullWorkingPension() {
		return fullWorkingPension;
	}

	public void setFullWorkingPension(String fullWorkingPension) {
		this.fullWorkingPension = fullWorkingPension;
	}

	public String getProPension() {
		return proPension;
	}

	public void setProPension(String proPension) {
		this.proPension = proPension;
	}

	public String getHolidayPersion() {
		return holidayPersion;
	}

	public void setHolidayPersion(String holidayPersion) {
		this.holidayPersion = holidayPersion;
	}

	public String getHolidayAfterPersion() {
		return holidayAfterPersion;
	}

	public void setHolidayAfterPersion(String holidayAfterPersion) {
		this.holidayAfterPersion = holidayAfterPersion;
	}

	public String getFamilyPension() {
		return familyPension;
	}

	public void setFamilyPension(String familyPension) {
		this.familyPension = familyPension;
	}

	public String getLongevityPension() {
		return longevityPension;
	}

	public void setLongevityPension(String longevityPension) {
		this.longevityPension = longevityPension;
	}

	public String getTexes() {
		return texesPension;
	}

	public void setTexes(String texes) {
		this.texesPension = texes;
	}

	public String getNightPension() {
		return nightPension;
	}

	public void setNightPension(String nightPension) {
		this.nightPension = nightPension;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
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
	
}
