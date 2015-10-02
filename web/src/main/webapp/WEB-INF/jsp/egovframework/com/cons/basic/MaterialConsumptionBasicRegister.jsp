<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소모품 교체 등록</title>

<link href="/css/egovframework/adt/index_layout.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/header.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/leftmenu.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/quickmenu.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/footer.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/headerAdmin.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/adminLeftmenu.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/board_layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/guide/egovcmm_layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/com/cmm/com.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/button.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/mpm.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cop/tpl/egovbbsTemplate.css" rel="stylesheet" type="text/css" />

<%-- <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="consumablesVO" staticJavascript="false" xhtml="true" cdata="false"/> --%>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>

<script type="text/javascript">
function fn_egov_select_MaterialConsumptionList() {
	document.frm.action = "<c:url value='/com/mat/MaterialConsumption.do'/>";
	document.frm.submit();
}



function fn_egov_regist_MaterialConsumption() {
	var check = document.frm;
	
	if(check.mcode.value == "") {
		alert("설비명을 선택하세요!!!");
		check.mcode.focus();
		return false;
	}
	
	if(check.code.value == "") {
		alert("사용 자재를 선택하세요!!!");
		check.consumableCode.focus();
		return false;
	}
	
	if(check.dateBgnde.value == "") {
		alert("교체일을 입력하세요!!!");
		check.dateBgnde.focus();
		return false;
	}
	
	if(check.qty.value == "") {
		alert("수량을 입력하세요!!!");
		check.qty.focus();
		return false;
	}

	document.frm.action = "<c:url value='/com/mat/MaterialConsumptionInsertArticle.do'/>";
    document.frm.submit();

	
/*     if(validateConsumablesVO(document.frm)){
		document.frm.action = "<c:url value='/com/mat/MaterialConsumptionInsertArticle.do'/>";
        document.frm.submit();
    } */
}
</script>

</head>
<body>

	<div id="center_body">
		<!-- 게시판 시작 -->

		<div style="float: left; width: 660px;">
		
		
		<form:form commandName="searchVO" name="frm" action="" method="post"> 
		
			<input name="codeId" type="hidden" value="<c:out value='${searchVO.codeId}'/>">
			<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
			
			<div class="board_title01"><span class="black_title_text"><c:out value="${machineNm }" /> 교체일 등록</span></div>
			<div class="list_ar">
			
				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							설비명
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</span>
					</li>
					<li style="width: 150px; text-align: left; float:left;">
						<label for="qestnSj" style="display: none;">설비명</label>
							<form:select path="mcode" id="mcode" title="설비명">
								<form:option value="" label="--선택하세요--"/>
								<form:options items="${machine_result}" itemValue="code" itemLabel="codeNm"/>
							</form:select>
					</li>
				</ul>

				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							사용자재
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</span>
					</li>
					<li style="width: 150px; text-align: left; float:left;">
						<label for="qestnSj" style="display: none;">사용자재</label>
							<form:select path="code" id="code" title="소모품명">
								<form:option value="" label="--선택하세요--"/>
								<form:options items="${consumableCode_result}" itemValue="code" itemLabel="codeNm"/>
							</form:select>
					</li>
				</ul>				
				<!-- 교체일 -->
				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							교체일
				    		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
				    	</span>
				    </li>
					<li style="width: 100px; text-align: left; float:left;">
						<label for="qestnSj" style="display: none;">교체일</label>
						<input id="dateBgnde" name="dateBgnde" type="hidden" >
						<input name="dateBeginView" type="text" size="10" value=""  readOnly onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.dateBgnde, document.board.dateBeginView);" title="게시시작일자입력">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.dateBgnde, document.frm.dateBeginView);" width="15" height="15" alt="달력창팝업버튼이미지">
						<br/>
					</li>
				</ul>
				
				<!-- 차기 교체일 -->
				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							차기 교체일
						</span>
					</li>
					<li style="width: 100px; text-align: left; float:left;">
						<label for="qestnSj" style="display: none;">차기 교체일</label>
						<input id="dateEndde" name="dateEndde" type="hidden" >
						<input name="dateEnddeView" type="text" size="10" value=""  readOnly onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.dateEndde, document.board.dateEnddeView);" title="게시시작일자입력">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.dateEndde, document.frm.dateEnddeView);"	width="15" height="15" alt="달력창팝업버튼이미지">
						<br/>
					</li>
				</ul>
				
				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							사용수량
							<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
						</span>
					</li>
					<li style="width: 100px; text-align: left; float:left;">
						<input type="text" name="qty" value="1">
					</li>
				</ul>
				
				<ul class="table_list02">
					<li>
						<span  style="width: 100px; text-align: center; float: left;">
							비 고
						</span>
					</li>
					<li style="width: 100px; text-align: left; float:left;">
						<input type="text" name="remark">
						<!-- <textarea rows="5" cols="75" name="remark"></textarea> -->
					</li>
				</ul>
				
				<div class="btn_area">
			    	<div class="ser_btn"><input type="image" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_MaterialConsumptionList();return false;" class="button_01" src="/images/egovframework/adt/btn_list.gif" width="65" height="28" alt="목록"></div>
					<div class="ser_btn"><input type="image" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:fn_egov_regist_MaterialConsumption();return false;" class="button_01" src="/images/egovframework/adt/btn_regist.gif" width="65" height="28" alt="등록"></div>
				</div>
			</div>
		</form:form>
		</div>
		<!-- 게시판 끝 -->
	</div>
	
</body>
</html>