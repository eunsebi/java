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
<title>크린롤러 등록</title>
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cons/CleanRoller.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cons/ConsumableInventory.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="consumableInventoryVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_init_ConsumableManage() {
	//var code = document.getElementById("codeId").value;
	//var bbsId = document.getElementById("bbsId").value;
	var code = "<c:out value="${consumableInventoryVO.codeId}" />";
	var bbsId = "<c:out value="${consumableInventoryVO.bbsId}" />";
	var t1 = "ORGNZT_0000000000011";
	var t2 = "ORGNZT_0000000000000";
	
	codeNumbering();
	
	//소모품 코드 변경 금지
	//document.consumableInventoryVO.consumable.disabled=true;
	document.consumableInventoryVO.consumable_2.disabled=true;
	document.consumableInventoryVO.consumable.value = "";
	document.consumableInventoryVO.ntceBgndeView.value = "";
	document.consumableInventoryVO.pm.checked = false;

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
		document.consumableInventoryVO.consumable.value="";
		document.consumableInventoryVO.consumable_1.value="";
		document.consumableInventoryVO.consumable_2.value="";
		document.consumableInventoryVO.consumable_3.value="";
		document.consumableInventoryVO.consumable_4.value="";
		document.consumableInventoryVO.consumable_5.value="";
		document.consumableInventoryVO.useCn.value="";
		document.consumableInventoryVO.useCn_1.value="";
		document.consumableInventoryVO.useCn_2.value="";
		document.consumableInventoryVO.useCn_3.value="";
		document.consumableInventoryVO.useCn_4.value="";
		document.consumableInventoryVO.useCn_5.value="";
		document.forms.consumableInventoryVO.pm[0].checked = false;
		document.forms.consumableInventoryVO.pm[1].checked = false;
	} else if (code == "COM160") {
		document.consumableInventoryVO.consumable.disabled=true;
		document.consumableInventoryVO.consumable_1.disabled=true;
		document.consumableInventoryVO.consumable_2.disabled=true;
		document.consumableInventoryVO.consumable.value="";
		document.consumableInventoryVO.consumable_1.value="";
		document.consumableInventoryVO.consumable_2.value="";
		document.consumableInventoryVO.useCn.value="";
		document.consumableInventoryVO.useCn_1.value="";
		document.consumableInventoryVO.useCn_2.value="";
		document.forms.consumableInventoryVO.pm[0].checked = false;
		document.forms.consumableInventoryVO.pm[1].checked = false;
	}
	
}

function checkall(formname,checkname,thestate){
	 var el_collection=eval("document.forms."+formname+"."+checkname)
	 for (c=0;c<el_collection.length;c++)
	 el_collection[c].checked=thestate
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
	
	//con10 = document.getElementById('CON10').value;
	//temp = document.getElementById('CON10').value;
	//alert(document.getElementById('CON10'));
	
	//codeNumbering();
	
	//cleanRoller_Calculator();
	//if(confirm("<spring:message code="common.save.msg" />")){
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateConsumableInventoryVO(form)){
			return;
		}else{
			
			if (document.getElementById("codeId").value == "COM130") {
				var imsi = document.getElementById("consumable").value; 
				var imsi_1 = document.getElementById("consumable_1").value;
				var imsi_2 = document.getElementById("consumable_2").value;
				var imsi_3 = document.getElementById("consumable_3").value;
				var imsi_4 = document.getElementById("consumable_4").value;
				var imsi_5 = document.getElementById("consumable_5").value;
				
				document.getElementById("consumableImsi").value = imsi;
				document.getElementById("consumableImsi_1").value = imsi_1;
				document.getElementById("consumableImsi_2").value = imsi_2;
				document.getElementById("consumableImsi_3").value = imsi_3;
				document.getElementById("consumableImsi_4").value = imsi_4;
				document.getElementById("consumableImsi_5").value = imsi_5;
				
				if (imsi <= 0 || imsi_1 <= 0 || imsi_2 <= 0 || imsi_3 <= 0 || imsi_4 <= 0 || imsi_5 <= 0) {
					alert("재고수량 확인 바랍니다");
					document.consumableInventoryVO.bbsId = "<c:out value='${consumableInventoryVO.bbsId}' />";
					document.consumableInventoryVO.action = "<c:url value='/com/cons/consumableInventoryList.do'/>";
					//document.consumableInventoryVO.action = "/com/cons/use/ConsumableUseRegisterError.do";
					document.consumableInventoryVO.submit();
				}
				
			} else if (document.getElementById("codeId").value == "COM160") {
				var imsi = document.getElementById("consumable").value; 
				var imsi_1 = document.getElementById("consumable_1").value;
				var imsi_2 = document.getElementById("consumable_2").value;
				
				document.getElementById("consumableImsi").value = imsi;
				document.getElementById("consumableImsi_1").value = imsi_1;
				document.getElementById("consumableImsi_2").value = imsi_2;
				
				if (imsi <= 0 || imsi_1 <= 0 || imsi_2 <= 0) {
					alert("재고수량 확인 바랍니다");
					document.consumableInventoryVO.bbsId = "<c:out value='${consumableInventoryVO.bbsId}' />";
					document.consumableInventoryVO.action = "<c:url value='/com/cons/consumableInventoryList.do'/>";
					//document.consumableInventoryVO.action = "/com/cons/use/ConsumableUseRegisterError.do";
					document.consumableInventoryVO.submit();
				}
				
			}

			form.submit();
		}
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

function fn_egov_inqire_notice(nttNo, bbsId) {
	
	var subForm = document.consumableInventoryVO;
	document.subForm.nttId.value = nttNo;
	document.subForm.bbsId.value = bbsId;
	document.subForm.codeId.value = codeId;
	document.subForm.mode.value = mode;
	document.subForm.action = "<c:url value='/com/cons/consumableFilterUseModify.do'/>";
	document.subForm.submit();
}

/* ********************************************************
 * 페이징 목록 으로 가기
 ******************************************************** */
function fn_egov_select_noticeList(pageNo) {
	/* if(document.frm.searchWrd.value.trim() == ''){
		alert("검색어를 입력해 주세요.");
		document.frm.searchWrd.value = "";
		document.frm.searchWrd.focus();
		return false;
	} */
	document.consumableInventoryVO.pageIndex.value = pageNo;
	document.consumableInventoryVO.action = "<c:url value='/com/cons/consumableFilterUseRegister.do'/>";
	document.consumableInventoryVO.submit();
	
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
					<font color="blue">T1</font>
					<font color="red" size="5"><c:out value="${cmmnCode.codeIdNm }" /></font>
					<font color="blue" size="3">필터</font> 사용 등록
				</li>
				</c:if>
				<c:if test="${consumableInventoryVO.bbsId == 'CONS_002' }">
				<li class="black_title_text" style="float: left;">
					<font color="blue">T2</font>
					<font color="red" size="5"><c:out value="${cmmnCode.codeIdNm }" /></font>
					<font color="blue" size="3">필터</font> 사용 등록
				</li>
				</c:if>
			</ul>
		</div>

		<!-- 상단타이틀 -->
		<form:form commandName="consumableInventoryVO" action="${pageContext.request.contextPath}/com/cons/consumableFilterUseRegisterActor.do" name="consumableInventoryVO" method="post">
			<form:hidden path="codeId"/>
			<form:hidden path="bbsId"/>
			<form:hidden path="schdulDeptId"/>
			<form:hidden path="consumableImsi"/>
			<form:hidden path="consumableImsi_1"/>
			<form:hidden path="consumableImsi_2"/>
			<form:hidden path="consumableImsi_3"/>
			<form:hidden path="consumableImsi_4"/>
			<form:hidden path="consumableImsi_5"/>
			<form:hidden path="mode" value="FILTER"/>
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
           	<input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />
			
			<c:forEach var="result" items="${invenResultList}" varStatus="status">
				<input type="hidden" id="<c:out value='${result.codeId }' />" name="<c:out value='${result.codeId }' />" value="<c:out value='${result.inventory }' />"/>
			</c:forEach>
	
		<c:import url="/EgovPageLink.do?link=egovframework/com/cons/use/Filter/Filter_Head" />
	
		<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<!--  등록  폼 영역  -->
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >설비명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="80%" colspan="3" align="left">
					<select id="facility" name="facility" onchange="filter_consumableCheck()" style="background-color: white;">
			    		<option value="" selected="selected">선택</option>
					    	<c:forEach items="${facility}" var="resultInfo" varStatus="status">
				    		<option value="${resultInfo.code}">${resultInfo.codeNm}</option>
							</c:forEach>
					</select>
					<%-- <form:select path="facility" onchange="consumableCheck()">
						<form:options items="${facility}" itemValue="code" itemLabel="codeNm"/>
					</form:select> --%>
					<div><form:errors path="facility" cssClass="error"/></div>
				</td>
			</tr>
	
			<c:choose>
				<c:when test="${consumableInventoryVO.codeId == 'COM130' }">
	 		<!-- D.E.S -->
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >현상 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left" >
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
	
					<div><form:errors path="consumableImsi" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn" onchange="filter_Calculator(0)" style="background-color: white;"/>
					<div><form:errors path="useCn" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >현상 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left" >
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_1" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_1" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_1" onchange="filter_Calculator(1)" style="background-color: white;"/>
					<div><form:errors path="useCn_1" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >에칭 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left" >
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_2" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_2" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_2" onchange="filter_Calculator(2)" style="background-color: white;"/>
					<div><form:errors path="useCn_2" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >에칭 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left" >
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_3" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_3" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_3" onchange="filter_Calculator(3)" style="background-color: white;" />
					<div><form:errors path="useCn_3" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >박리 하우징<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left" >
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_4" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_4" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_4" onchange="filter_Calculator(4)" style="background-color: white;" />
					<div><form:errors path="useCn_4" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >박리 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_5" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_5" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_5" onchange="filter_Calculator(5)" style="background-color:white;" />
					<div><form:errors path="useCn_5" cssClass="error"/></div>
				</td>
		
			</tr>
				</c:when>
				
				<c:otherwise>
				<!-- 실버현상기 -->
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >현상 하우징 1번탱크<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	            		<%-- <form:option value="CON101" label="필터(500x10)" />
	            		<form:option value="CON104" label="필터(500x1)" /> --%>
	        		</form:select>
	
					<div><form:errors path="consumableImsi" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn" onchange="filter_Calculator(0)" style="background-color: white;" />
					<div><form:errors path="useCn" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >현상 하우징 2번탱크<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_1" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	            		<%-- <form:option value="CON101" label="필터(500x10)" />
	            		<form:option value="CON104" label="필터(500x1)" /> --%>
	        		</form:select>
	
					<div><form:errors path="consumableImsi_1" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_1" onchange="filter_Calculator(1)" style="background-color: white;" />
					<div><form:errors path="useCn_1" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >현상 수세<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<%-- <form:input path="consumable" value="${consumable }"/> --%>
					<form:select path="consumable_2" style="background-color: white; width:200px;">
						<form:option value="" label="선택"/>
	            		<form:options items="${consumable}" itemValue="code" itemLabel="codeNm"/>
	        		</form:select>
					<div><form:errors path="consumableImsi_2" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >사용수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="useCn_2" onchange="filter_Calculator(2)" style="background-color: white;" />
					<div><form:errors path="useCn_2" cssClass="error"/></div>
				</td>
		
			</tr>
				</c:otherwise>
			</c:choose>
			
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >교체일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="ntceBgndeView" size="10" readonly="true" maxlength="10" />
					<%-- <form:input path="ntceBgndeView" size="10" readonly="true" maxlength="10" value="<%=thisDay %>"/> --%>
	    				<a href="#" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].ntceBgndeView);">
	    					<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
	    				</a>
	    			<div><form:errors path="ntceBgndeView" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >PM 유/무<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:radiobutton path="pm" value="Y" style="background-color: white;" />PM진행
					<form:radiobutton path="pm" value="N" style="background-color: white;" />필터교체
					
					<div><form:errors path="pm" cssClass="error"/></div>
				</td>
			</tr>
		</table>
		
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
					<%-- <td>
					   	<span class="button">
					   		<input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_list_ConsumableManage();return false;">
					   	</span>
					</td>
					<td>&nbsp;</td> --%>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="javascript:fn_save_ConsumableManage(document.forms[0]);return false;">
						</span>
					</td>
				</tr>
			</table>
		</center>
	
	 	<c:if test="${consumableInventoryVO.codeId == 'COM130' }">
	 	<!-- DES List -->
		<div class="egovframe_tablestyle">
			<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0" border="0">
				<caption>목록</caption>
				<colgroup>
				<col width="40" />
				<col width="" />	<!-- 설비명 -->
				<col width="" />	<!-- D하우징 -->
				<col width="" />	<!-- D수세 -->
				<col width="" />	<!-- E하우징 -->
				<col width="" />	<!-- E수세 -->
				<col width="" />	<!-- S하우징 -->
				<col width="" />	<!-- S수세 -->
				<col width="30" />	<!-- PM -->
				<col width="" />	<!-- 교체일 -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">설비명</th>
						<th scope="col">D하우징</th>
						<th scope="col">D수세</th>
						<th scope="col">E하우징</th>
						<th scope="col">E수세</th>
						<th scope="col">S하우징</th>
						<th scope="col">S수세</th>
						<th scope="col">PM</th>
						<th scope="col">교체일</th>
					</tr>
				</thead>
				<tbody>
					
				<!-- loop 시작 -->
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>
						<strong>
							<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * paginationInfo.pageSize + status.count)}"/>
						</strong>
					</td>
					<td>
						<strong>
							<a class="board" href="<c:url value='/com/cons/use/consumableFilterUseModify.do' />?nttNo=<c:out value="${result.nttNo}"/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;codeId=<c:out value='${result.codeId}'/>" onclick="fn_egov_inqire_notice('<c:out value="${result.nttNo}"/>','<c:out value='${result.bbsId}'/>','<c:out value='${result.codeId}'/>'); return false;"><c:out value="${result.facilityNm }" /></a>
							<%-- <c:out value="${result.facilityNm }" /> --%>
						</strong>
					</td>
					<td>
		                <c:choose>
							<c:when test="${result.useCn != '' }">
								<c:out value="${fn:substring(result.codeNm,3,9) }" /> (<c:out value="${result.useCn }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_1 != '' }">
								<c:out value="${fn:substring(result.codeNm_1,3,9) }" /> (<c:out value="${result.useCn_1 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_2 != '' }">
								<c:out value="${fn:substring(result.codeNm_2,3,9) }" /> (<c:out value="${result.useCn_2 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_3 != '' }">
								<c:out value="${fn:substring(result.codeNm_3,3,9) }" /> (<c:out value="${result.useCn_3 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_4 != '' }">
								<c:out value="${fn:substring(result.codeNm_4,3,9) }" /> (<c:out value="${result.useCn_4 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_5 != '' }">
								<c:out value="${fn:substring(result.codeNm_5,3,9) }" /> (<c:out value="${result.useCn_5 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.pm == 'Y' }">
								PM	
							</c:when>
							<c:otherwise>
								필터
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:out value="${result.ntceBgnde }" />
					</td>
				</tr>
				</c:forEach>

				<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td class="listCenter" colspan="5" ><spring:message code="common.nodata.msg" /></td>
				</tr>
				</c:if>
				
				<!-- //loop 끝 -->
				</tbody>
			</table>
		</div>
		</c:if>
		
		<c:if test="${consumableInventoryVO.codeId == 'COM160' }">
	 	<!-- 실버현상기 List -->
		<div class="egovframe_tablestyle">
			<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0" border="0">
				<caption>목록</caption>
				<colgroup>
				<col width="40" />
				<col width="" />	<!-- 설비명 -->
				<col width="" />	<!-- D하우징 1번-->
				<col width="" />	<!-- D하우징 2번-->
				<col width="" />	<!-- D수세 -->
				<col width="30" />	<!-- PM -->
				<col width="" />	<!-- 교체일 -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">설비명</th>
						<th scope="col">D하우징 1번</th>
						<th scope="col">D하우징 2번</th>
						<th scope="col">D수세</th>
						<th scope="col">PM</th>
						<th scope="col">교체일</th>
					</tr>
				</thead>
				<tbody>
					
				<!-- loop 시작 -->
				<c:forEach var="result" items="${resultList}" varStatus="status">
				<tr>
					<td>
						<strong>
							<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * paginationInfo.pageSize + status.count)}"/>
						</strong>
					</td>
					<td>
						<strong>
							<a class="board" href="<c:url value='/com/cons/use/consumableFilterUseModify.do' />?nttNo=<c:out value="${result.nttNo}"/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;codeId=<c:out value='${result.codeId}'/>" onclick="fn_egov_inqire_notice('<c:out value="${result.nttNo}"/>','<c:out value='${result.bbsId}'/>','<c:out value='${result.codeId}'/>'); return false;"><c:out value="${result.facilityNm }" /></a>
							<%-- <c:out value="${result.facilityNm }" /> --%>
						</strong>
					</td>
					<td>
		                <c:choose>
							<c:when test="${result.useCn != '' }">
								<c:out value="${fn:substring(result.codeNm,3,9) }" /> (<c:out value="${result.useCn }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_1 != '' }">
								<c:out value="${fn:substring(result.codeNm_1,3,9) }" /> (<c:out value="${result.useCn_1 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.useCn_2 != '' }">
								<c:out value="${fn:substring(result.codeNm_2,3,9) }" /> (<c:out value="${result.useCn_2 }" />)
							</c:when>
							<c:otherwise>
							<center>-</center>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${result.pm == 'Y' }">
								PM	
							</c:when>
							<c:otherwise>
								필터
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:out value="${result.ntceBgnde }" />
					</td>
				</tr>
				</c:forEach>

				<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td class="listCenter" colspan="5" ><spring:message code="common.nodata.msg" /></td>
				</tr>
				</c:if>
				
				<!-- //loop 끝 -->
				</tbody>
			</table>
		</div>
		</c:if>
		
				<!-- 20100916 designer add end -->
				<br />
				<div align="center">
					<span class="right_board_list">
						<div id="paging_div">
							<ul class="paging_align">
		                       <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />  
		                   </ul>
		               </div>
					</span>
					<br/><br/>
				</div>
		
			<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		</form:form>
	</div>
</DIV>
</body>
</html>
