<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ page import="java.util.*, java.text.*"  %>

<%
//오늘 날짜 데이터
String thisDay = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(new java.util.Date());
%>
<html>
<head>
<title>크린페이퍼(유포지) 등록</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" >

<link href="<c:url value='/css/egovframework/adt/index_layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/header.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/leftmenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/quickmenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/footer.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/headerAdmin.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/adminLeftmenu.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/board_layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/guide/egovcmm_layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cons/ConsumableInventory.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="consumableInventoryVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
 var code = "<c:out value="${consumableInventoryVO.codeId}" />";
 var bbsId = "<c:out value="${consumableInventoryVO.bbsId}" />";
 var t1 = "ORGNZT_0000000000011";
 var t2 = "ORGNZT_0000000000000";
 
function fn_init_ConsumableManage() {
	//var code = document.getElementById("codeId").value;
	//var bbsId = document.getElementById("bbsId").value;

	codeNumbering();
	
	if (bbsId == "CONS_001") {
		document.getElementById("schdulDeptId").value = t1;
	} else if (bbsId == "CONS_002") {
		document.getElementById("schdulDeptId").value = t2;
	}
	
	if (code == "COM130") {
		//소모품 코드 변경 금지
		document.consumableInventoryVO.consumable.disabled=true;
		document.consumableInventoryVO.consumable_1.disabled=true;
		document.consumableInventoryVO.consumable_2.disabled=true;
		document.consumableInventoryVO.consumable_3.disabled=true;
		document.consumableInventoryVO.consumable_4.disabled=true;
		document.consumableInventoryVO.consumable_5.disabled=true;
	} else if (code == "COM160") {
		document.consumableInventoryVO.consumable.disabled=true;
		document.consumableInventoryVO.consumable_1.disabled=true;
		document.consumableInventoryVO.consumable_2.disabled=true;
	}
}



/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_list_ConsumableManage(){
	location.href = "<c:url value='/' />";
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_save_ConsumableManage(form) {
	var from = document.consumableInventoryVO;
	//codeNumbering();
	
	//cleanRoller_Calculator();
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateConsumableInventoryVO(form)){
			return;
		}
		//from.consumable.value = "<c:out value='${result.consumable}' />";
		
		from.cmd.value = 'modify';
		if (code == "COM130") {
			document.getElementById("consumableImsi").value = document.getElementById("consumable").value;
			document.getElementById("consumableImsi_1").value = document.getElementById("consumable_1").value;
			document.getElementById("consumableImsi_2").value = document.getElementById("consumable_2").value;
			document.getElementById("consumableImsi_3").value = document.getElementById("consumable_3").value;
			document.getElementById("consumableImsi_4").value = document.getElementById("consumable_4").value;
			document.getElementById("consumableImsi_5").value = document.getElementById("consumable_5").value;
		} else if (code == "COM160") {
			document.getElementById("consumableImsi").value = document.getElementById("consumable").value;
			document.getElementById("consumableImsi_1").value = document.getElementById("consumable_1").value;
			document.getElementById("consumableImsi_2").value = document.getElementById("consumable_2").value;
		}
		document.consumableInventoryVO.action = "<c:url value='/com/cons/use/consumableFilterUseModifyActor.do' />";
		document.consumableInventoryVO.submit();
	}
	
}


/* ********************************************************
* 주관 부서 팝업창열기
******************************************************** */
function fn_egov_schdulDept_DeptSchdulManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeDeptSchdule";

	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />", arrParam ,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}

function fn_egov_inqire_notice(i, nttNo, bbsId) {
	document.subForm.nttId.value = nttNo;
	document.subForm.bbsId.value = bbsId;
	document.subForm.action = "<c:url value='/com/cons/consumableFilterUseModify.do'/>";
	document.subForm.submit();
}

/* ********************************************************
* 설비별 소모품 사용현황 리스트
******************************************************** */
function fn_egov_select_noticeList() {
	
	var vFrom = document.consumableInventoryVO;
	vFrom.cmd.value = 'list';
	/* vFrom.codeId.value = document.getElementById("codeId").value;
	vFrom.mode.value = document.getElementById("mode").value;
	vFrom.bbsId.value = document.getElementById("bbsId").value; */
	vFrom.action = "<c:url value='/com/cons/consumableFilterUseRegister.do' />";
	vFrom.submit();
}

//-->

</script>

</head>
<body onLoad="fn_init_ConsumableManage()">

<!-- 메인탑 컨텐츠 시작 -->
<div id="center_body">
<!-- 		<div class="intro_img">
			
			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			
		</div> -->
	<div class="intro_title">

		<div class="intro_title_right">
			<div class="intro_title_right_h_img">
				<img src="<c:url value='/' />images/egovframework/adt/img_home.gif" width="11" height="11" alt="" />
			</div>
			HOME &gt; 소모품 사용 등록 &gt; <span class="intro_title_right_text"><c:out value="${cmmnCode.codeIdNm}"/></span>
		</div>

	</div>
	
	<!-- 게시판 시작 -->
	<div style="float: left; width: 804px;">
			
		<!--  상단 타이틀  영역 -->
		<div class="board_title01">
			<ul style="padding-top: 5px;">
				<c:if test="${consumableInventoryVO.bbsId == 'CONS_001' }">
				<li class="black_title_text" style="float: left;">
					<font color="blue">T1</font> <font color="red" size="5"><c:out value="${cmmnCode.codeIdNm }" /></font> 필터 사용 <font color="red" size="5">수정</font>
				</li>
				</c:if>
				<c:if test="${consumableInventoryVO.bbsId == 'CONS_002' }">
				<li class="black_title_text" style="float: left;">
					<font color="blue">T2</font> <font color="red" size="5"><c:out value="${cmmnCode.codeIdNm }" /></font> 필터 사용 <font color="red" size="5">수정</font>
				</li>
				</c:if>
			</ul>
		</div>

		<!-- 상단타이틀 -->
		<form:form commandName="consumableInventoryVO" name="consumableInventoryVO" method="post">
			<form:hidden path="nttNo"/>
			<form:hidden path="codeId"/>
			<form:hidden path="bbsId"/>
			<form:hidden path="schdulDeptId"/>
			<form:hidden path="consumableImsi" />
			<form:hidden path="consumableImsi_1" />
			<form:hidden path="consumableImsi_2" />
			<form:hidden path="consumableImsi_3" />
			<form:hidden path="consumableImsi_4" />
			<form:hidden path="consumableImsi_5" />
			<input name="cmd" id="cmd" type="hidden" />
			
			
			<c:forEach var="result" items="${invenResultList}" varStatus="status">
				<input type="hidden" id="<c:out value='${result.codeId }' />" name="<c:out value='${result.codeId }' />" value="<c:out value='${result.inventory }' />"/>
			</c:forEach>
	
		<%-- <c:import url="/EgovPageLink.do?link=egovframework/com/cons/use/CleanPaper/CleanPaper_Head" /> --%>
	
		<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<!--  등록  폼 영역  -->
		<c:choose>
			<c:when test="${result.codeId == 'COM130' }">
			
				<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >설비명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<select id="facility" name="facility" onchange="filter_consumableCheck()" style="background-color: white;">
					    		<option value="${result.facility}" selected="selected">${result.facilityNm }</option>
							    	<c:forEach items="${facility}" var="resultInfo" varStatus="status">
						    		<option value="${resultInfo.code}">${resultInfo.codeNm}</option>
									</c:forEach>
							</select>
							<%-- <form:select path="facility" onchange="consumableCheck()">
								<form:options items="${facility}" itemValue="code" itemLabel="codeNm"/>
							</form:select> --%>
							<div><form:errors path="facility" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >PM 유/무<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<c:choose>
								<c:when test="${result.pm == 'Y' }">
								<form:radiobutton path="pm" value="Y" checked="true" style="background-color: white;" />PM진행
								<form:radiobutton path="pm" value="N" style="background-color: white;" />필터교체
								</c:when>
								<c:otherwise>
								<form:radiobutton path="pm" value="Y" style="background-color: white;" />PM진행
								<form:radiobutton path="pm" value="N" checked="true" style="background-color: white;" />필터교체
								</c:otherwise>
							</c:choose>
							<div><form:errors path="pm" cssClass="error"/></div>
						</td>
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >현상 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<form:select path="consumable" style="background-color: white; width:200px;" >
								<option value="${result.consumable }" selected="selected">${result.codeNm }</option>
			            		<%-- <form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/> --%>
			        		</form:select>
			
							<div><form:errors path="consumableImsi" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn" value="${result.useCn }" onchange="filter_Calculator(0)" style="background-color: white;"/>
							<div><form:errors path="useCn" cssClass="error"/></div>
						</td>
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >현상 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_1" style="background-color: white; width:200px;" >
								<option value="${result.consumable_1 }" selected="selected">${result.codeNm }</option>
			            		<%-- <form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/> --%>
			        		</form:select>
							<div><form:errors path="consumableImsi_1" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_1" value="${result.useCn_1 }" onchange="filter_Calculator(1)" style="background-color: white;"/>
							<div><form:errors path="useCn_1" cssClass="error"/></div>
						</td>
				
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >에칭 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_2" style="background-color: white; width:200px;">
								<option value="${result.consumable_2 }" selected="selected">${result.codeNm }</option>
			        		</form:select>
							<div><form:errors path="consumableImsi_2" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_2" value="${result.useCn_2 }" onchange="filter_Calculator(2)" style="background-color: white;"/>
							<div><form:errors path="useCn_2" cssClass="error"/></div>
						</td>
				
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >에칭 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_3" style="background-color: white; width:200px;">
								<option value="${result.consumable_3 }" selected="selected">${result.codeNm }</option>
			        		</form:select>
							<div><form:errors path="consumableImsi_3" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_3" value="${result.useCn_3 }" onchange="filter_Calculator(3)" style="background-color: white;" />
							<div><form:errors path="useCn_3" cssClass="error"/></div>
						</td>
				
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >박리 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_4" style="background-color: white; width:200px;">
								<option value="${result.consumable_4 }" selected="selected">${result.codeNm }</option>
			        		</form:select>
							<div><form:errors path="consumableImsi_4" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_4" value="${result.useCn_4 }" onchange="filter_Calculator(4)" style="background-color: white;" />
							<div><form:errors path="useCn_4" cssClass="error"/></div>
						</td>
				
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >박리 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_5" style="background-color: white; width:200px;">
								<option value="${result.consumable_5 }" selected="selected">${result.codeNm }</option>
			        		</form:select>
							<div><form:errors path="consumableImsi_5" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_5" value="${result.useCn_5 }" onchange="filter_Calculator(5)" style="background-color:white;" />
							<div><form:errors path="useCn_5" cssClass="error"/></div>
						</td>
				
					</tr>
				</table>
			</c:when>
			
			<c:when test="${result.codeId == 'COM160' }">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >설비명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<!-- <select id="facility" name="facility" onchange="consumableCheck()" style="background-color: white;"> -->
							<select id="facility" name="facility" style="background-color: white;">
					    		<option value="${result.facility}" selected="selected">${result.facilityNm }</option>
							    	<c:forEach items="${facility}" var="resultInfo" varStatus="status">
						    		<option value="${resultInfo.code}">${resultInfo.codeNm}</option>
									</c:forEach>
							</select>
							<%-- <form:select path="facility" onchange="consumableCheck()">
								<form:options items="${facility}" itemValue="code" itemLabel="codeNm"/>
							</form:select> --%>
							<div><form:errors path="facility" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >PM 유/무<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<c:choose>
								<c:when test="${result.pm == 'Y' }">
								<form:radiobutton path="pm" value="Y" checked="true" style="background-color: white;" />PM진행
								<form:radiobutton path="pm" value="N" style="background-color: white;" />필터교체
								</c:when>
								<c:otherwise>
								<form:radiobutton path="pm" value="Y" style="background-color: white;" />PM진행
								<form:radiobutton path="pm" value="N" checked="true" style="background-color: white;" />필터교체
								</c:otherwise>
							</c:choose>
							<div><form:errors path="pm" cssClass="error"/></div>
						</td>
					</tr>
				
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >현상 하우징 1번탱크<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<form:select path="consumable" style="background-color: white; width:200px;" >
								<option value="${result.consumable }" selected="selected">${result.codeNm }</option>
			            		<%-- <form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/> --%>
			        		</form:select>
			
							<div><form:errors path="consumableImsi" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn" value="${result.useCn }" onchange="filter_Calculator(0)" style="background-color: white;"/>
							<div><form:errors path="useCn" cssClass="error"/></div>
						</td>
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >현상 하우징 2번탱크<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<form:select path="consumable_1" style="background-color: white; width:200px;" >
								<option value="${result.consumable_1 }" selected="selected">${result.codeNm }</option>
			            		<%-- <form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/> --%>
			        		</form:select>
			
							<div><form:errors path="consumableImsi_1" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_1" value="${result.useCn_1 }" onchange="filter_Calculator(0)" style="background-color: white;"/>
							<div><form:errors path="useCn_1" cssClass="error"/></div>
						</td>
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >현상 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left" >
							<%-- <form:input path="consumable" value="${consumable }"/> --%>
							<form:select path="consumable_2" style="background-color: white; width:200px;" >
								<option value="${result.consumable_2 }" selected="selected">${result.codeNm }</option>
			            		<%-- <form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/> --%>
			        		</form:select>
							<div><form:errors path="consumableImsi_2" cssClass="error"/></div>
						</td>
						<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="30%" align="left">
							<form:input path="useCn_2" value="${result.useCn_2 }" onchange="filter_Calculator(1)" style="background-color: white;"/>
							<div><form:errors path="useCn_2" cssClass="error"/></div>
						</td>
				
					</tr>
					<tr>
						<th width="20%" height="23" class="required_text" nowrap >교체일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="80%" colspan="3" align="left">
							<form:input path="ntceBgndeView" size="10" readonly="true" maxlength="10" value="${fn:substring(result.frstRegisterPnttm,0,10) }"/>
			    				<a href="#" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].ntceBgndeView);">
			    					<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
			    				</a>
			    			<div><form:errors path="ntceBgndeView" cssClass="error"/></div>
						</td>
					</tr>
				</table>
			</c:when>
		</c:choose>
		
	<!-- 줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<center>
			<!-- 목록/저장버튼  -->
			<table border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
				<!-- 
				  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
				  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap><a href="JavaScript:fn_egov_list_DeptSchdulManage();"><spring:message code="button.list" /></a>
				  </td>
				  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
				  <td>&nbsp;</td>
				  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
				  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif' />" class="text_left" nowrap><a href="JavaScript:fn_egov_save_DeptSchdulManage(document.forms[0]);"><spring:message code="button.save" /></a>
				  </td>
				  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
				 -->
					<td>
					   	<span class="button">
					   		<input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_noticeList();return false;">
					   	</span>
					</td>
					<td>&nbsp;</td>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="javascript:fn_save_ConsumableManage(document.forms[0]);return false;">
						</span>
					</td>
				</tr>
			</table>
		</center>
			<input type="hidden" name="mode" value="${result.mode }" />
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		</form:form>
	</div>
</DIV>
</body>
</html>