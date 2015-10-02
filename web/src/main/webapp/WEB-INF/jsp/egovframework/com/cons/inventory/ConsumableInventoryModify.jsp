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
<title>소모품 입고 등록</title>
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
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_init_ConsumableManage() {
	var code = "<c:out value="${consumableInventoryVO.codeId}" />";
	var bbsId = "<c:out value="${consumableInventoryVO.bbsId}" />";
	var t1 = "ORGNZT_0000000000011";
	var t2 = "ORGNZT_0000000000000";
	
	if (bbsId == "CONS_001") {
		document.getElementById("schdulDeptId").value = t1;
	} else if (bbsId == "CONS_002") {
		document.getElementById("schdulDeptId").value = t2;
	}
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_list_ConsumableManage(){
	location.href = "<c:url value='/com/cons/consumableInventoryList.do' />?bbsId=<c:url value='${consumableInventoryVO.bbsId}' />";
}

/* ********************************************************
 * 수정처리
 ******************************************************** */
function fn_egov_modify_ConsumableManage(){
	var vFrom = document.consumableInventoryVO;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/com/cons/consumableInventoryModifyActor.do' />";
	vFrom.submit();

}
/* ********************************************************
 * 공장간 이동처리
 ******************************************************** */
function fn_egov_move_ConsumableManage() {
	var vFrom = document.consumableInventoryVO;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/com/cons/consumableInventoryMoveActor.do' />";
	vFrom.submit();
}


/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_ConsumableManage(){
	var vFrom = document.consumableInventoryVO;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/com/cons/consumableInventoryModifyActor.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
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

</script>

</head>
<body onLoad="fn_init_ConsumableManage()">

<!-- 메인탑 컨텐츠 시작 -->
<div id="center_body">
	<!-- <div class="intro_img">
			
			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			
	</div> -->
	<div class="intro_title">

		<div class="intro_title_right">
			<div class="intro_title_right_h_img">
				<img src="<c:url value='/' />images/egovframework/adt/img_home.gif" width="11" height="11" alt="" />
			</div>
			HOME &gt; <span class="intro_title_right_text"> 소모품 재고 수정</span>
		</div>

	</div>
	
	<!-- 게시판 시작 -->
	<div style="float: left; width: 804px;">
			
		<!--  상단 타이틀  영역 -->
		<div class="board_title01">
			<ul style="padding-top: 5px;">
				<c:if test="${consumableInventoryVO.bbsId == 'CONS_001' }">
				<li class="black_title_text" style="float: left;"><font color="blue">T1</font> 소모품 재고 <font color="red" size="5">수정</font></li>
				</c:if>
				<c:if test="${consumableInventoryVO.bbsId == 'CONS_002' }">
				<li class="black_title_text" style="float: left;"><font color="blue">T2</font> 소모품 재고 <font color="red" size="5">수정</font></li>
				</c:if>
			</ul>
		</div>
	
	
		<!-- 상단타이틀 -->
		<form:form commandName="consumableInventoryVO" name="consumableInventoryVO" method="post">
			<form:hidden path="codeId"/>
			<form:hidden path="bbsId"/>
			<form:hidden path="nttNo"/>
			<form:hidden path="codeId"/>
			<input type="hidden" name="consumableImsi" id="consumableImsi" value="${result.codeId }"/>
			<form:hidden path="schdulDeptId"/>
			<input name="cmd" type="hidden" value="<c:out value=''/>"/>
		
		<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<!--  등록  폼 영역  -->
	
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
			<%-- <tr>
			    <th width="20%" height="23" class="required_text" nowrap >부서<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
			    <td width="80%" colspan="3">
					<table width="100%" cellspacing="0" cellpadding="0" border="0">
						<tr>
							<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
								<form:input path="schdulDeptName" size="73" cssClass="txaIpt" readonly="true" maxlength="1000" />
							</td>
							<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
								<a href="#" onClick="fn_egov_schdulDept_DeptSchdulManage()">
									<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="부서" title="부서">
								</a>
							</td>
						</tr>
					</table>
				<form:hidden path="schdulDeptId" />
				<div><form:errors path="schdulDeptName" cssClass="error"/></div>
				</td>
	 		</tr> --%>
		
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >소모품명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="consumable" value="${result.codeNm }" readonly="true"/>
					<div><form:errors path="consumable" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >입고수량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="inventory" value="${result.inventory }" style="background-color: white;"/>
					<div><form:errors path="useCn" cssClass="error"/></div>
				</td>
		
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >수령인<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" align="left">
					<form:input path="receiveName" value="${result.receiveName }" style="background-color: white;"/>
					<div><form:errors path="receiveName" cssClass="error"/></div>
				</td>
				<th width="20%" height="23" class="required_text" nowrap >입고일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="30%" colspan="3" align="left">
					<form:input path="ntceBgndeView" size="10" readonly="true" maxlength="10" value="<%=thisDay %>"/>
	    				<a href="#" onClick="javascript:fn_egov_NormalCalendar(document.forms[0], document.forms[0].ntceBgndeView);">
	    					<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"  align="middle" style="border:0px" alt="달력창팝업버튼이미지">
	    				</a>
	    			<div><form:errors path="ntceBgndeView" cssClass="error"/></div>
				</td>
			</tr>
			<tr>
				<th width="20%" height="23" class="required_text" nowrap >비고&nbsp;</th>
				<td width="30%" colspan="3" align="left">
					<form:input path="note" size="35" value="${result.note }" style="background-color: white;"/>
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
					<td height="20">&nbsp;</td>
				</tr>
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
							<input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_list_ConsumableManage();return false;">
						</span>
					</td>
					<%-- <td>&nbsp;</td>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" />" onclick="javascript:fn_egov_delete_ConsumableManage();return false;">
						</span>
					</td> --%>
					<td>&nbsp;</td>
					<c:if test="${loginVO.id == '290099'}">
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_modify_ConsumableManage();return false;">
						</span>
					</td>
					</c:if>
					<td>&nbsp;</td>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.move" />" title="<spring:message code="button.move" />" onclick="javascript:fn_egov_move_ConsumableManage();return false;">
						</span>
					</td>
				</tr>
			</table>
		</center>
	
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		</form:form>
	</div>
</div>
</body>
</html>