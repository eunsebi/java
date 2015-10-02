package egovframework.com.cons.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class ConsumableInventory implements Serializable{
	
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
	/**
	 * 소모품 아이디
	 */
	private String codeId = "";
	/**
	 * 소모품 이름
	 */
	private String codeNm = "";
	
	private String codeNm_1 = "";
	
	private String codeNm_2 = "";
	
	private String codeNm_3 = "";
	
	private String codeNm_4 = "";
	
	private String codeNm_5 = "";
	/**
	 * 최초등록자 아이디
	 */
	private String frstRegisterId = "";
	/**
	 * 최초등록시점
	 */
	private String frstRegisterPnttm = "";
	/**
	 * 최종수정자 아이디
	 */
	private String lastUpdusrId = "";
	/**
	 * 최종수정시점
	 */
	private String lastUpdusrPnttm = "";
	/**
	 * 게시시작일
	 */
	private String ntceBgnde = "";
	/**
	 * 게시종료일
	 */
	private String ntceEndde = "";
	/**
	 * 게시자 아이디
	 */
	private String ntcrId = "";
	/**
	 * 게시자명
	 */
	private String ntcrNm = "";
	
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부
	 */
	private String useAt = "";
	/**
	 * 설비명
	 */
	private String facility = "";
	
	private String facilityNm = "";
	/**
	 * 소모품명
	 */
	private String consumable = "";
	/**
	 * 소모수량
	 */
	private String useCn = "";
	/**
	 * 소모품명
	 */
	private String consumable_1 = "";
	/**
	 * 소모수량
	 */
	private String useCn_1 = "";
	/**
	 * 소모품명
	 */
	private String consumable_2 = "";
	/**
	 * 소모수량
	 */
	private String useCn_2 = "";
	/**
	 * 소모품명
	 */
	private String consumable_3 = "";
	/**
	 * 소모수량
	 */
	private String useCn_3 = "";
	/**
	 * 소모품명
	 */
	private String consumable_4 = "";
	/**
	 * 소모수량
	 */
	private String useCn_4 = "";
	/**
	 * 소모품명
	 */
	private String consumable_5 = "";
	/**
	 * 소모수량
	 */
	private String useCn_5 = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = ""; 
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";
	/**
	 * 부서명
	 */
	private String schdulDeptName = "";
	
	/**
	 * 부서ID
	 */
	private String schdulDeptId = "";
	/**
	 * 재고수량
	 */
	private String inventory = "";
	
	private String takeOut = "";
	/**
	 * 수령인
	 */
	private String receiveName = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi_1 = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi_2 = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi_3 = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi_4 = "";
	/**
	 * 소모품 코드 임시 사용
	 */
	private String consumableImsi_5 = "";
	/**
	 * 비고
	 */
	private String note = "";
	
	private String outId = "";
	
	private String outCn = "";
	
	private String pm = "";

		
	public String getBbsId() {
		return bbsId;
	}


	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}


	public String getCodeId() {
		return codeId;
	}


	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}


	public String getCodeNm() {
		return codeNm;
	}


	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}


	public String getCodeNm_1() {
		return codeNm_1;
	}


	public void setCodeNm_1(String codeNm_1) {
		this.codeNm_1 = codeNm_1;
	}


	public String getCodeNm_2() {
		return codeNm_2;
	}


	public void setCodeNm_2(String codeNm_2) {
		this.codeNm_2 = codeNm_2;
	}


	public String getCodeNm_3() {
		return codeNm_3;
	}


	public void setCodeNm_3(String codeNm_3) {
		this.codeNm_3 = codeNm_3;
	}


	public String getCodeNm_4() {
		return codeNm_4;
	}


	public void setCodeNm_4(String codeNm_4) {
		this.codeNm_4 = codeNm_4;
	}


	public String getCodeNm_5() {
		return codeNm_5;
	}


	public void setCodeNm_5(String codeNm_5) {
		this.codeNm_5 = codeNm_5;
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


	public String getLastUpdusrId() {
		return lastUpdusrId;
	}


	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}


	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}


	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}


	public String getNtceBgnde() {
		return ntceBgnde;
	}


	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}


	public String getNtceEndde() {
		return ntceEndde;
	}


	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}


	public String getNtcrId() {
		return ntcrId;
	}


	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}


	public String getNtcrNm() {
		return ntcrNm;
	}


	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}


	public long getNttId() {
		return nttId;
	}


	public void setNttId(long nttId) {
		this.nttId = nttId;
	}


	public long getNttNo() {
		return nttNo;
	}


	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}


	public int getInqireCo() {
		return inqireCo;
	}


	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}


	public long getSortOrdr() {
		return sortOrdr;
	}


	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}


	public String getUseAt() {
		return useAt;
	}


	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}


	public String getFacility() {
		return facility;
	}


	public void setFacility(String facility) {
		this.facility = facility;
	}


	public String getFacilityNm() {
		return facilityNm;
	}


	public void setFacilityNm(String facilityNm) {
		this.facilityNm = facilityNm;
	}


	public String getConsumable() {
		return consumable;
	}


	public void setConsumable(String consumable) {
		this.consumable = consumable;
	}


	public String getUseCn() {
		return useCn;
	}


	public void setUseCn(String useCn) {
		this.useCn = useCn;
	}


	public String getConsumable_1() {
		return consumable_1;
	}


	public void setConsumable_1(String consumable_1) {
		this.consumable_1 = consumable_1;
	}


	public String getUseCn_1() {
		return useCn_1;
	}


	public void setUseCn_1(String useCn_1) {
		this.useCn_1 = useCn_1;
	}


	public String getConsumable_2() {
		return consumable_2;
	}


	public void setConsumable_2(String consumable_2) {
		this.consumable_2 = consumable_2;
	}


	public String getUseCn_2() {
		return useCn_2;
	}


	public void setUseCn_2(String useCn_2) {
		this.useCn_2 = useCn_2;
	}


	public String getConsumable_3() {
		return consumable_3;
	}


	public void setConsumable_3(String consumable_3) {
		this.consumable_3 = consumable_3;
	}


	public String getUseCn_3() {
		return useCn_3;
	}


	public void setUseCn_3(String useCn_3) {
		this.useCn_3 = useCn_3;
	}


	public String getConsumable_4() {
		return consumable_4;
	}


	public void setConsumable_4(String consumable_4) {
		this.consumable_4 = consumable_4;
	}


	public String getUseCn_4() {
		return useCn_4;
	}


	public void setUseCn_4(String useCn_4) {
		this.useCn_4 = useCn_4;
	}


	public String getConsumable_5() {
		return consumable_5;
	}


	public void setConsumable_5(String consumable_5) {
		this.consumable_5 = consumable_5;
	}


	public String getUseCn_5() {
		return useCn_5;
	}


	public void setUseCn_5(String useCn_5) {
		this.useCn_5 = useCn_5;
	}


	public String getNtceEnddeView() {
		return ntceEnddeView;
	}


	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}


	public String getNtceBgndeView() {
		return ntceBgndeView;
	}


	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}


	public String getSchdulDeptName() {
		return schdulDeptName;
	}


	public void setSchdulDeptName(String schdulDeptName) {
		this.schdulDeptName = schdulDeptName;
	}


	public String getSchdulDeptId() {
		return schdulDeptId;
	}


	public void setSchdulDeptId(String schdulDeptId) {
		this.schdulDeptId = schdulDeptId;
	}


	public String getInventory() {
		return inventory;
	}


	public void setInventory(String inventory) {
		this.inventory = inventory;
	}


	public String getReceiveName() {
		return receiveName;
	}


	public void setReceiveName(String receiveName) {
		this.receiveName = receiveName;
	}


	public String getConsumableImsi() {
		return consumableImsi;
	}


	public void setConsumableImsi(String consumableImsi) {
		this.consumableImsi = consumableImsi;
	}


	public String getConsumableImsi_1() {
		return consumableImsi_1;
	}


	public void setConsumableImsi_1(String consumableImsi_1) {
		this.consumableImsi_1 = consumableImsi_1;
	}


	public String getConsumableImsi_2() {
		return consumableImsi_2;
	}


	public void setConsumableImsi_2(String consumableImsi_2) {
		this.consumableImsi_2 = consumableImsi_2;
	}


	public String getConsumableImsi_3() {
		return consumableImsi_3;
	}


	public void setConsumableImsi_3(String consumableImsi_3) {
		this.consumableImsi_3 = consumableImsi_3;
	}


	public String getConsumableImsi_4() {
		return consumableImsi_4;
	}


	public void setConsumableImsi_4(String consumableImsi_4) {
		this.consumableImsi_4 = consumableImsi_4;
	}


	public String getConsumableImsi_5() {
		return consumableImsi_5;
	}


	public void setConsumableImsi_5(String consumableImsi_5) {
		this.consumableImsi_5 = consumableImsi_5;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public String getOutId() {
		return outId;
	}


	public void setOutId(String outId) {
		this.outId = outId;
	}


	public String getOutCn() {
		return outCn;
	}


	public void setOutCn(String outCn) {
		this.outCn = outCn;
	}


	public String getTakeOut() {
		return takeOut;
	}


	public void setTakeOut(String takeOut) {
		this.takeOut = takeOut;
	}

	public String getPm() {
		return pm;
	}


	public void setPm(String pm) {
		this.pm = pm;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}

}
