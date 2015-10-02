package egovframework.com.fp.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @Class Name : PmSchdule.java
 * @Description : 게시물에 대한 데이터 처리 모델
 * @Modification Information
 * 
 *               수정일 수정자 수정내용 ---------- -------- ---------------------------
 *               2014.09.13 심은섭 최초 생성
 * 
 * @author 심은섭
 * @since 2014. 09. 16
 * @version 1.0
 * @see
 * 
 */
@SuppressWarnings("serial")
public class FloorPlan implements Serializable {

	/**
	 * 게시물 첨부파일 아이디
	 */
	private String atchFileId = "";
	/**
	 * 게시판 아이디
	 */
	private String bbsId = "";
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
	 * 게시물 내용
	 */
	private String nttCn = "";
	/**
	 * 게시물 아이디
	 */
	private long nttId = 0L;
	/**
	 * 게시물 번호
	 */
	private long nttNo = 0L;
	/**
	 * 게시물 제목
	 */
	private String nttSj = "";
	/**
	 * 부모글번호
	 */
	private String parnts = "0";
	/**
	 * 패스워드
	 */
	private String password = "";
	/**
	 * 조회수
	 */
	private int inqireCo = 0;
	/**
	 * 답장여부
	 */
	private String replyAt = "";
	/**
	 * 답장위치
	 */
	private String replyLc = "0";
	/**
	 * 정렬순서
	 */
	private long sortOrdr = 0L;
	/**
	 * 사용여부(Y/N, 삭제시 사용)
	 */
	private String useAt = "";
	/**
	 * 게시 종료일
	 */
	private String ntceEnddeView = "";
	/**
	 * 게시 시작일
	 */
	private String ntceBgndeView = "";

	/**
	 * 댓글
	 */
	private long cmtAnswerCnt = 0L;

	// MTBBS01(거버 등록게시판용)
	/**
	 * 종류(양산/개발)
	 */
	private String kind = "";

	/**
	 * Model
	 */
	private String model = "";
	
	private String modelNm = "";

	/**
	 * Revision
	 */
	private String rev = "";

	/**
	 * 등록명 상판/메인탱크(현상/에칭/박리)
	 */
	private String name_01 = "";

	/**
	 * 등록명 하판/Zone(현상/에칭/박리)
	 */
	private String name_02 = "";

	/**
	 * 조건(광량)/(하우징필터)
	 */
	private String spec_01 = "";

	/**
	 * 조건(파장)/(수세필터)
	 */
	private String spec_02 = "";

	/**
	 * 조건(offset)/(액절롤러)
	 */
	private String spec_03 = "";

	/**
	 * 조건(Numbering)/
	 */
	private String spec_04 = "";

	/**
	 * 사이즈(노즐)
	 */
	private String size = "";

	/**
	 * 파일위치
	 */
	private String location = "";

	/**
	 * 등록호기
	 */
	private String number = "";

	/**
	 * 교체일
	 */
	private String changedate = "";
	/**
	 * 차기교체일
	 */
	private String nextdate = "";

	/**
	 * 교체일
	 */
	private String changedateView = "";
	/**
	 * 차기교체일
	 */
	private String nextdateView = "";

	private String orgnztId = "";

	private String schdulDeptName = "";

	private String schdulDeptId = "";
	
	private String division = "";
	
	private String divisionCode = "";
	
	private String divisionNm = "";
	
	/**
	 * 비고(수정 요청자)
	 */
	private String note = "";
	/**
	 * spec 변경용
	 */
	private String spec = "";
	
	private String offset = "";

	/**
	 * atchFileId attribute를 리턴한다.
	 * 
	 * @return the atchFileId
	 */
	public String getAtchFileId() {
		return atchFileId;
	}

	/**
	 * atchFileId attribute 값을 설정한다.
	 * 
	 * @param atchFileId
	 *            the atchFileId to set
	 */
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	/**
	 * bbsId attribute를 리턴한다.
	 * 
	 * @return the bbsId
	 */
	public String getBbsId() {
		return bbsId;
	}

	/**
	 * bbsId attribute 값을 설정한다.
	 * 
	 * @param bbsId
	 *            the bbsId to set
	 */
	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	/**
	 * frstRegisterId attribute를 리턴한다.
	 * 
	 * @return the frstRegisterId
	 */
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	/**
	 * frstRegisterId attribute 값을 설정한다.
	 * 
	 * @param frstRegisterId
	 *            the frstRegisterId to set
	 */
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	/**
	 * frstRegisterPnttm attribute를 리턴한다.
	 * 
	 * @return the frstRegisterPnttm
	 */
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	/**
	 * frstRegisterPnttm attribute 값을 설정한다.
	 * 
	 * @param frstRegisterPnttm
	 *            the frstRegisterPnttm to set
	 */
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}

	/**
	 * lastUpdusrId attribute를 리턴한다.
	 * 
	 * @return the lastUpdusrId
	 */
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	/**
	 * lastUpdusrId attribute 값을 설정한다.
	 * 
	 * @param lastUpdusrId
	 *            the lastUpdusrId to set
	 */
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}

	/**
	 * lastUpdusrPnttm attribute를 리턴한다.
	 * 
	 * @return the lastUpdusrPnttm
	 */
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}

	/**
	 * lastUpdusrPnttm attribute 값을 설정한다.
	 * 
	 * @param lastUpdusrPnttm
	 *            the lastUpdusrPnttm to set
	 */
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}

	/**
	 * ntceBgnde attribute를 리턴한다.
	 * 
	 * @return the ntceBgnde
	 */
	public String getNtceBgnde() {
		return ntceBgnde;
	}

	/**
	 * ntceBgnde attribute 값을 설정한다.
	 * 
	 * @param ntceBgnde
	 *            the ntceBgnde to set
	 */
	public void setNtceBgnde(String ntceBgnde) {
		this.ntceBgnde = ntceBgnde;
	}

	/**
	 * ntceEndde attribute를 리턴한다.
	 * 
	 * @return the ntceEndde
	 */
	public String getNtceEndde() {
		return ntceEndde;
	}

	/**
	 * ntceEndde attribute 값을 설정한다.
	 * 
	 * @param ntceEndde
	 *            the ntceEndde to set
	 */
	public void setNtceEndde(String ntceEndde) {
		this.ntceEndde = ntceEndde;
	}

	/**
	 * ntcrId attribute를 리턴한다.
	 * 
	 * @return the ntcrId
	 */
	public String getNtcrId() {
		return ntcrId;
	}

	/**
	 * ntcrId attribute 값을 설정한다.
	 * 
	 * @param ntcrId
	 *            the ntcrId to set
	 */
	public void setNtcrId(String ntcrId) {
		this.ntcrId = ntcrId;
	}

	/**
	 * ntcrNm attribute를 리턴한다.
	 * 
	 * @return the ntcrNm
	 */
	public String getNtcrNm() {
		return ntcrNm;
	}

	/**
	 * ntcrNm attribute 값을 설정한다.
	 * 
	 * @param ntcrNm
	 *            the ntcrNm to set
	 */
	public void setNtcrNm(String ntcrNm) {
		this.ntcrNm = ntcrNm;
	}

	/**
	 * nttCn attribute를 리턴한다.
	 * 
	 * @return the nttCn
	 */
	public String getNttCn() {
		return nttCn;
	}

	/**
	 * nttCn attribute 값을 설정한다.
	 * 
	 * @param nttCn
	 *            the nttCn to set
	 */
	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	/**
	 * nttId attribute를 리턴한다.
	 * 
	 * @return the nttId
	 */
	public long getNttId() {
		return nttId;
	}

	/**
	 * nttId attribute 값을 설정한다.
	 * 
	 * @param nttId
	 *            the nttId to set
	 */
	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	/**
	 * nttNo attribute를 리턴한다.
	 * 
	 * @return the nttNo
	 */
	public long getNttNo() {
		return nttNo;
	}

	/**
	 * nttNo attribute 값을 설정한다.
	 * 
	 * @param nttNo
	 *            the nttNo to set
	 */
	public void setNttNo(long nttNo) {
		this.nttNo = nttNo;
	}

	/**
	 * nttSj attribute를 리턴한다.
	 * 
	 * @return the nttSj
	 */
	public String getNttSj() {
		return nttSj;
	}

	/**
	 * nttSj attribute 값을 설정한다.
	 * 
	 * @param nttSj
	 *            the nttSj to set
	 */
	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	/**
	 * parnts attribute를 리턴한다.
	 * 
	 * @return the parnts
	 */
	public String getParnts() {
		return parnts;
	}

	/**
	 * parnts attribute 값을 설정한다.
	 * 
	 * @param parnts
	 *            the parnts to set
	 */
	public void setParnts(String parnts) {
		this.parnts = parnts;
	}

	/**
	 * password attribute를 리턴한다.
	 * 
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * password attribute 값을 설정한다.
	 * 
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * inqireCo attribute를 리턴한다.
	 * 
	 * @return the inqireCo
	 */
	public int getInqireCo() {
		return inqireCo;
	}

	/**
	 * inqireCo attribute 값을 설정한다.
	 * 
	 * @param inqireCo
	 *            the inqireCo to set
	 */
	public void setInqireCo(int inqireCo) {
		this.inqireCo = inqireCo;
	}

	/**
	 * replyAt attribute를 리턴한다.
	 * 
	 * @return the replyAt
	 */
	public String getReplyAt() {
		return replyAt;
	}

	/**
	 * replyAt attribute 값을 설정한다.
	 * 
	 * @param replyAt
	 *            the replyAt to set
	 */
	public void setReplyAt(String replyAt) {
		this.replyAt = replyAt;
	}

	/**
	 * replyLc attribute를 리턴한다.
	 * 
	 * @return the replyLc
	 */
	public String getReplyLc() {
		return replyLc;
	}

	/**
	 * replyLc attribute 값을 설정한다.
	 * 
	 * @param replyLc
	 *            the replyLc to set
	 */
	public void setReplyLc(String replyLc) {
		this.replyLc = replyLc;
	}

	/**
	 * sortOrdr attribute를 리턴한다.
	 * 
	 * @return the sortOrdr
	 */
	public long getSortOrdr() {
		return sortOrdr;
	}

	/**
	 * sortOrdr attribute 값을 설정한다.
	 * 
	 * @param sortOrdr
	 *            the sortOrdr to set
	 */
	public void setSortOrdr(long sortOrdr) {
		this.sortOrdr = sortOrdr;
	}

	/**
	 * useAt attribute를 리턴한다.
	 * 
	 * @return the useAt
	 */
	public String getUseAt() {
		return useAt;
	}

	/**
	 * useAt attribute 값을 설정한다.
	 * 
	 * @param useAt
	 *            the useAt to set
	 */
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	/**
	 * ntceEnddeView attribute를 리턴한다.
	 * 
	 * @return the ntceEnddeView
	 */
	public String getNtceEnddeView() {
		return ntceEnddeView;
	}

	/**
	 * ntceEnddeView attribute 값을 설정한다.
	 * 
	 * @param ntceEnddeView
	 *            the ntceEnddeView to set
	 */
	public void setNtceEnddeView(String ntceEnddeView) {
		this.ntceEnddeView = ntceEnddeView;
	}

	/**
	 * ntceBgndeView attribute를 리턴한다.
	 * 
	 * @return the ntceBgndeView
	 */
	public String getNtceBgndeView() {
		return ntceBgndeView;
	}

	/**
	 * ntceBgndeView attribute 값을 설정한다.
	 * 
	 * @param ntceBgndeView
	 *            the ntceBgndeView to set
	 */
	public void setNtceBgndeView(String ntceBgndeView) {
		this.ntceBgndeView = ntceBgndeView;
	}

	public long getCmtAnswerCnt() {
		return cmtAnswerCnt;
	}

	public void setCmtAnswerCnt(long cmtAnswerCnt) {
		this.cmtAnswerCnt = cmtAnswerCnt;
	}

	// 거퍼파일 등록 게시판용 Start

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRev() {
		return rev;
	}

	public void setRev(String rev) {
		this.rev = rev;
	}

	public String getName_01() {
		return name_01;
	}

	public void setName_01(String name_01) {
		this.name_01 = name_01;
	}

	public String getName_02() {
		return name_02;
	}

	public void setName_02(String name_02) {
		this.name_02 = name_02;
	}

	public String getSpec_01() {
		return spec_01;
	}

	public void setSpec_01(String spec_01) {
		this.spec_01 = spec_01;
	}

	public String getSpec_02() {
		return spec_02;
	}

	public void setSpec_02(String spec_02) {
		this.spec_02 = spec_02;
	}

	public String getSpec_03() {
		return spec_03;
	}

	public void setSpec_03(String spec_03) {
		this.spec_03 = spec_03;
	}

	public String getSpec_04() {
		return spec_04;
	}

	public void setSpec_04(String spec_04) {
		this.spec_04 = spec_04;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	// 거버파일 등록 게시판용 End

	public String getChangedate() {
		return changedate;
	}

	public void setChangedate(String changedate) {
		this.changedate = changedate;
	}

	public String getNextdate() {
		return nextdate;
	}

	public void setNextdate(String nextdate) {
		this.nextdate = nextdate;
	}

	public String getChangedateView() {
		return changedateView;
	}

	public void setChangedateView(String changedateView) {
		this.changedateView = changedateView;
	}

	public String getNextdateView() {
		return nextdateView;
	}

	public void setNextdateView(String nextdateView) {
		this.nextdateView = nextdateView;
	}

	public String getOrgnztId() {
		return orgnztId;
	}

	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}
	
	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getDivisionCode() {
		return divisionCode;
	}

	public void setDivisionCode(String divisionCode) {
		this.divisionCode = divisionCode;
	}

	public String getDivisionNm() {
		return divisionNm;
	}

	public void setDivisionNm(String divisionNm) {
		this.divisionNm = divisionNm;
	}
	
	public String getModelNm() {
		return modelNm;
	}

	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}

	public String getOffset() {
		return offset;
	}

	public void setOffset(String offset) {
		this.offset = offset;
	}

	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}