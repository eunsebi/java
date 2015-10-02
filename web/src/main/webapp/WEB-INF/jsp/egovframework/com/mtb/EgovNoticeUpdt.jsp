<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%
	/**
  * @Class Name : EgovNoticeUpdt.jsp
  * @Description : 게시물 수정 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.19   이삼섭          최초 생성
  *   2011.09.15   서준식          유효기간 시작일이 종료일보다 빠른지 체크하는 로직 추가
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.19
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">

<script type="text/javascript">
_editor_area = "nttCn";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<!-- script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea/EgovWebEditor.js'/>" ></script-->
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<validator:javascript formName="board" staticJavascript="false"	xhtml="true" cdata="false" />
<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript">
	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
		document.board.onsubmit();

		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);

		if (ntceBgnde > ntceEndde) {
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		if (!validateBoard(document.board)) {
			return;
		}

		if (confirm('<spring:message code="common.update.msg" />')) {
			document.board.action = "<c:url value='/com/mtb${prefix}/updateMTBoardArticle.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/com/mtb${prefix}/selectMTBoardList.do'/>";
		document.board.submit();
	}

	function fn_egov_check_file(flag) {
		if (flag == "Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
	function makeFileAttachment() {
		<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">

		var existFileNum = document.board.fileListCnt.value;
		var maxFileNum = document.board.posblAtchFileNumber.value;

		if (existFileNum == "undefined" || existFileNum == null) {
			existFileNum = 0;
		}
		if (maxFileNum == "undefined" || maxFileNum == null) {
			maxFileNum = 0;
		}
		var uploadableFileNum = maxFileNum - existFileNum;
		if (uploadableFileNum < 0) {
			uploadableFileNum = 0;
		}
		if (uploadableFileNum != 0) {
			fn_egov_check_file('Y');
			var multi_selector = new MultiSelector(document
					.getElementById('egovComFileList'), uploadableFileNum);
			multi_selector.addElement(document
					.getElementById('egovComFileUploader'));
		} else {
			fn_egov_check_file('N');
		}
		</c:if>
	}
</script>
<style type="text/css">
.noStyle {
	background: ButtonFace;
	BORDER-TOP: 0px;
	BORDER-bottom: 0px;
	BORDER-left: 0px;
	BORDER-right: 0px;
}

.noStyle th {
	background: ButtonFace;
	padding-left: 0px;
	padding-right: 0px
}

.noStyle td {
	background: ButtonFace;
	padding-left: 0px;
	padding-right: 0px
}
</style>
<title><c:out value='${bdMstr.bbsNm}' /> - 게시글 수정</title>

<style type="text/css">
h1 {
	font-size: 12px;
}

caption {
	visibility: hidden;
	font-size: 0;
	height: 0;
	margin: 0;
	padding: 0;
	line-height: 0;
}
</style>

</head>
<!-- body onload="javascript:editor_generate('nttCn');"-->
<body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus(); makeFileAttachment();">

	<form:form commandName="board" name="board" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
		<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>" />
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
		<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
		<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
		<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
		<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

		<input type="hidden" name="cal_url"	value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />

		<c:if test="${anonymous != 'true'}">
			<input type="hidden" name="ntcrNm" value="dummy">
			<!-- validator 처리를 위해 지정 -->
			<input type="hidden" name="password" value="dummy">
			<!-- validator 처리를 위해 지정 -->
		</c:if>

		<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
			<input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
			<input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
		</c:if>

		<div id="border">

			<table width="100%" cellpadding="8" class="table-search" border="0">
				<tr>
					<td width="100%" class="title_left">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
						&nbsp;<c:out value='${bdMstr.bbsNm}' /> - 게시글 수정
					</td>
				</tr>
			</table>
			
			<c:choose>
				<c:when test="${bdMstr.bbsAttrbCode == 'MTBBSA01' }">
					<table width="100%" border="1" cellpadding="0" cellspacing="1" class="generalTable">
						<tr>
							<th width="20%" height="23" class="emphasisRight" nowrap><spring:message code="cop.nttSj" />
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />"width="15" height="15" alt="필수입력표시">
							</th>
							<td width="80%" nowrap colspan="3">
								<input name="nttSj" type="text" size="60" value='<c:out value="${result.nttSj}" />'	maxlength="60" title="제목수정"> <br />
								<form:errors path="nttSj" />
							</td>
						</tr>
						<!-- 거버 게시판 -->
						<tr>
							<th scope="col" height="30">종류</th>
							<td colspan="3">
								양산 <input name="kind" type="checkbox" value="양산" <c:if test="${result.kind == '양산'}">checked="checked"</c:if> title="양산"/>
								개발 <input name="kind" type="checkbox" value="개발" <c:if test="${result.kind == '개발'}">checked="checked"</c:if> title="개발"/>
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">모델명</th>
							<td>
								<input type="text" name="model" value="<c:out value="${result.model}" />" >
							</td>
							<th scope="col">Revision</th>
							<td>
								<input type="text" name="rev" value="<c:out value="${result.rev}" />" >
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">등록명</th>
							<td colspan="5">
								<span class="date_etc_color">상판 : <input type="text" name="name_01" size="30" value="<c:out value="${result.name_01}" />" ></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="date_etc_color">하판 : <input type="text" name="name_02" size="30" value="<c:out value="${result.name_02}" />" ></span>
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">조건</th>
							<td colspan="5">
								광량 : <input type="text" name="spec_01" size="10" value="<c:out value="${result.spec_01 }" />" >mJ&nbsp;&nbsp;&nbsp;&nbsp;
								파장 : <input type="text" name="spec_02" size="10" value="<c:out value="${result.spec_02 }" />" >%&nbsp;&nbsp;&nbsp;&nbsp;
								offset : <input type="text" name="spec_03" size="10" value="<c:out value="${result.spec_03 }" />" >&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">사이즈</th>
							<td colspan="5">
								<span class="date_etc_color"><input type="text" name="size" value="<c:out value="${result.size}" />" ></span>
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">저장위치</th>
							<td colspan="5">
								<span class="date_etc_color"><input type="text" name="location" size="40" value="<c:out value="${result.location}" />" ></span>
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">등록호기</th>
							<td colspan="5">
							<c:forEach begin="1" end="8" step="1" var="j">
								&nbsp;&nbsp;<input name="number" type="checkbox" value="${j }" <c:if test="${j == number[0] || j == number[1] || j == number[2] || j == number[3] || j == number[4] || j == number[5] || j == number[6] || j == number[7]}">checked="checked"</c:if> title="<c:out value="${j }" />호기"/><c:out value="${j }" />호기 
							</c:forEach>
							</td>
						</tr>
		
						
						<!-- 내용 -->
						<tr>
							<th height="23" class="emphasisRight">
								<spring:message	code="cop.nttCn" />
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</th>
							<td colspan="3">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
									<tr>
										<td>
											<textarea id="nttCn" name="nttCn" class="textarea" cols="75" rows="28" style="width: 550px;">
												<c:out value="${result.nttCn}" escapeXml="false" /></textarea>
												<form:errors path="nttCn" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
				</c:when>

				<c:when test="${bdMstr.bbsAttrbCode == 'MTBBSA02' }">
					<table width="100%" border="1" cellpadding="0" cellspacing="1" class="generalTable">
						<tr>
							<th width="20%" height="23" class="emphasisRight" nowrap><spring:message code="cop.nttSj" />
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />"width="15" height="15" alt="필수입력표시">
							</th>
							<td width="80%" nowrap colspan="5">
								<input name="nttSj" type="text" size="60" value='<c:out value="${result.nttSj}" />'	maxlength="60" title="제목수정"> <br />
								<form:errors path="nttSj" />
							</td>
						</tr>
						<!-- 거버 게시판 -->
						<tr>
							<th scope="col" height="30">진행조</th>
							<td colspan="2">
								<input name="location" type="checkbox" value="주간" <c:if test="${result.location == '주간'}">checked="checked"</c:if>/>주간&nbsp;&nbsp;
								<input name="location" type="checkbox" value="야간" <c:if test="${result.location == '야간'}">checked="checked"</c:if>/>야간
							</td>
							<th scope="col" height="30">공정</th>
							<td colspan="2">
								<input name="kind" type="checkbox" value="현상" <c:if test="${result.kind == '현상'}">checked="checked"</c:if> title="현상"/>현상&nbsp;&nbsp;
								<input name="kind" type="checkbox" value="DES" <c:if test="${result.kind == 'DES'}">checked="checked"</c:if> title="DES"/>DES
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">PM호기</th>
							<td colspan="2">
								<c:forEach begin="1" end="4" step="1" var="j">
									<input name="number" type="checkbox" value="${j }" <c:if test="${j == number[0] || j == number[1] || j == number[2] || j == number[3]}">checked="checked"</c:if> title="<c:out value="${j }" />호기"/><c:out value="${j }" />호기 
								</c:forEach>
							</td>
							<th scope="col">PM일</th>
							<td colspan="2">
								<input id="changedate" type="hidden" name="changedate" value="<c:out value="${result.changedate}" />"/>
				      			<input name="changedateView" type="text" size="10" value="<c:out value="${result.changedate}" />" readOnly onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" title="게시시작일자입력">
								<img src="/egovframework-all-in-one/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.changedate, document.board.changedateView);" width="15" height="15" alt="달력창팝업버튼이미지">
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">메인탱크</th>
							<td colspan="2">
								<input type="checkbox" name="name_01" value="1" <c:if test="${name01[0]  == '1' || name01[1] == '1'}"> checked="checked"</c:if> />현상
								<input type="checkbox" name="name_01" value="2" <c:if test="${name01[1]  == '2' || name01[2] == '2'}"> checked="checked"</c:if> />에칭
								<input type="checkbox" name="name_01" value="3" <c:if test="${name01[2]  == '3' || name01[3] == '3'}"> checked="checked"</c:if> />박리
							</td>
							<th scope="col" height="30">Zone 내부</th>
							<td colspan="2">
								<input type="checkbox" name="name_02" value="1" <c:if test="${name02[0]  == '1' || name02[1] == '1'}"> checked="checked"</c:if> />현상
								<input type="checkbox" name="name_02" value="2" <c:if test="${name02[1]  == '2' || name02[2] == '2'}"> checked="checked"</c:if> />에칭
								<input type="checkbox" name="name_02" value="3" <c:if test="${name02[2]  == '3' || name02[3] == '3'}"> checked="checked"</c:if> />박리
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">하우징 필터</th>
							<td colspan="2">
								<input type="checkbox" name="spec_01" value="1" <c:if test="${spec01[0]  == '1' || spec01[1] == '1'}"> checked="checked"</c:if> />현상
								<input type="checkbox" name="spec_01" value="2" <c:if test="${spec01[1]  == '2' || spec01[2] == '2'}"> checked="checked"</c:if> />에칭
								<input type="checkbox" name="spec_01" value="3" <c:if test="${spec01[2]  == '3' || spec01[3] == '3'}"> checked="checked"</c:if> />박리
							</td>
							<th scope="col" height="30">수세필터 필터</th>
							<td colspan="2">
								<input type="checkbox" name="spec_02" value="1" <c:if test="${spec02[0]  == '1' || spec02[1] == '1'}"> checked="checked"</c:if> />현상
								<input type="checkbox" name="spec_02" value="2" <c:if test="${spec02[1]  == '2' || spec02[2] == '2'}"> checked="checked"</c:if> />에칭
								<input type="checkbox" name="spec_02" value="3" <c:if test="${spec02[2]  == '3' || spec02[3] == '3'}"> checked="checked"</c:if> />박리
							</td>
						</tr>
						<tr>
							<th scope="col" height="30">액절롤러</th>
							<td colspan="2">
								<input type="checkbox" name="spec_03" value="0" <c:if test="${result.spec_03  == '0'}"> checked="checked"</c:if> />세척
								<input type="checkbox" name="spec_03" value="1" <c:if test="${result.spec_03  == '1'}"> checked="checked"</c:if> />교체
							</td>
							<th scope="col" height="30">노즐</th>
							<td colspan="2">
								<input type="checkbox" name="size" value="0" <c:if test="${result.size  == '0'}"> checked="checked"</c:if> />세척
								<input type="checkbox" name="size" value="1" <c:if test="${result.size  == '1'}"> checked="checked"</c:if> />교체 
							</td>
						</tr>
						
						<!-- 내용 -->
						<tr>
							<th height="23" class="emphasisRight">
								<spring:message	code="cop.nttCn" />
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</th>
							<td colspan="5">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="noStyle">
									<tr>
										<td>
											<textarea id="nttCn" name="nttCn" class="textarea" cols="75" rows="28" style="width: 550px;">
												<c:out value="${result.nttCn}" escapeXml="false" /></textarea>
												<form:errors path="nttCn" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
				</c:when>			
			</c:choose>

				
				<c:if test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
					<tr>
						<th height="23" class="emphasisRight">
							<spring:message	code="cop.noticeTerm" />
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</th>
						<td colspan="3">
							<input id="ntceBgnde" name="ntceBgnde" type="hidden" value='<c:out value="${result.ntceBgnde}" />'>
							<input name="ntceBgndeView" type="text" size="10" value="${fn:substring(result.ntceBgnde, 0, 4)}-${fn:substring(result.ntceBgnde, 4, 6)}-${fn:substring(result.ntceBgnde, 6, 8)}" readOnly title="게시시작일자수정" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);">
							<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" width="15" height="15" alt="달력창팝업버튼이미지">
							 ~ 
							<input id="ntceEndde" name="ntceEndde" type="hidden" value='<c:out value="${result.ntceEndde}" />'>
							<input name="ntceEnddeView" type="text" size="10" value="${fn:substring(result.ntceEndde, 0, 4)}-${fn:substring(result.ntceEndde, 4, 6)}-${fn:substring(result.ntceEndde, 6, 8)}" readOnly title="게시종료일자수정" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);">
							<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);" width="15" height="15" alt="달력창팝업버튼이미지"> <br />
							<form:errors path="ntceBgndeView" /> <br />
							<form:errors path="ntceEnddeView" />
						</td>
					</tr>
				</c:if>
				<c:if test="${anonymous == 'true'}">
					<tr>
						<th height="23" class="emphasisRight">
							<spring:message code="cop.ntcrNm" />
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</th>
						<td colspan="3">
							<input name="ntcrNm" type="text" size="20" value='<c:out value="${result.ntcrNm}" />' maxlength="10" title="작성자이름">
						</td>

					</tr>
					<tr>
						<th height="23" class="emphasisRight">
							<spring:message code="cop.password" />
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</th>
						<td colspan="3">
							<input name="password" type="password" size="20" value="" maxlength="20" title="비밀번호입력">
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty result.atchFileId}">
					<tr>
						<th height="23"><spring:message code="cop.atchFileList" /></th>
						<td colspan="6">
							<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
								<c:param name="param_atchFileId" value="${result.atchFileId}" />
							</c:import>
						</td>
					</tr>
				</c:if>
				<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
					<c:if test="${result.atchFileId == ''}">
						<input type="hidden" name="fileListCnt" value="0" />
					</c:if>
					<tr>
						<th height="23"><spring:message code="cop.atchFile" /></th>
						<td colspan="3">
							<div id="file_upload_posbl" style="display: none;">
								<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
									<tr>
										<td>
											<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일명 입력" />
										</td>
									</tr>
									<tr>
										<td>
											<div id="egovComFileList"></div>
										</td>
									</tr>
								</table>
							</div>
							<div id="file_upload_imposbl" style="display: none;">
								<table width="100%" cellspacing="0" cellpadding="0" border="0" align="center">
									<tr>
										<td><spring:message code="common.imposbl.fileupload" /></td>
									</tr>
								</table>
							</div>
					</tr>


				</c:if>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="10"></td>
				</tr>
			</table>
			<div align="center">
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<c:if test="${bdMstr.authFlag == 'Y'}">
							<%-- <c:if test="${result.frstRegisterId == searchVO.frstRegisterId}"> --%>
							<!-- 
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
		      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
		      <a href="javascript:fn_egov_regist_notice();"><spring:message code="button.update" /></a>
		      </td>
		      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
		     -->
							<td>
								<span class="button">
									<input type="button" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_regist_notice();return false;">
								</span>
							</td>
							<td width="10"></td>
							<%-- </c:if> --%>
						</c:if>
						<!-- 
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap>
      <a href="javascript:fn_egov_select_noticeList();"><spring:message code="button.list" /></a>
      </td>
      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
      -->

						<td>
							<span class="button">
								<input type="button" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_noticeList();return false;">
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form:form>
</body>
</html>
