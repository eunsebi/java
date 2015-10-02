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
<title><c:out value="${brdMstrVO.bbsNm}"/> 수정</title>
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
<script type="text/javascript" src="<c:url value='/js/egovframework/com/fp/FloorPlan.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="FloorPlanVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript">
<!--
function fn_init_FloorPlan() {
	var spc = "<c:out value='${result.spec}' />";
	document.board.spec.value = spc;
}
 function fn_egov_validateForm(obj){
		return true;
}
	
 function fn_list_form() {
	document.board.action = "<c:url value='/com/fp${prefix}/selectFloorPlanList.do'/>";
	document.board.submit();
	
}

function fn_egov_moveUpdt_notice(){
	
	//document.board.onsubmit();

	var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
	var ntceEndde = eval(document.getElementById("ntceEndde").value);

	if(ntceBgnde > ntceEndde){
		alert("게시기간 종료일이 시작일보다 빠릅니다.");
		return;
	}

	if (!validateFloorPlanVO(document.board)){
		return;
	}

	if (confirm('<spring:message code="common.update.msg" />')) {
		document.board.action = "<c:url value='/com/fp${prefix}/updateBoardArticle.do'/>";
		document.board.submit();
	}
}

function fn_egov_delete_notice(){
	document.board.action = "<c:url value='/com/fp${prefix}/deleteBoardArticle.do'/>";
	document.board.submit();
}
//-->

</script>

</head>
<body onload="fn_init_FloorPlan()">

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
			HOME &gt; 도면관리 &gt; <span class="intro_title_right_text"><c:out value="${brdMstrVO.bbsNm}"/></span>
		</div>

	</div>
	
	<div style="float: left; width: 804px;">

	<!--  줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="3px"></td>
			</tr>
		</table>
	
		<!--  상단 타이틀  영역 -->
		<div class="board_title01">
			<ul style="padding-top: 5px;">
				<li class="black_title_text" style="float: left;">
					<font color="red" size="5"><c:out value="${brdMstrVO.bbsNm}"/></font>
					<c:choose>
						<c:when test="${result.division == 'COM01'}">
							<font color="blue" size="3">양산</font>
						</c:when>
						<c:when test="${result.division == 'COM02'}">
							<font color="blue" size="3">개발</font>
						</c:when>
					</c:choose>
					도면 상세정보 수정
				</li>
			</ul>
		</div>
		
		<!-- 게시판 시작 -->
		<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
			<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
			<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
			<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
			<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
			<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
			<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
			<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
			<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
			<input type="hidden" name="returnUrl" value="<c:url value='/com/fp/forUpdateFloorPlanArticl.do.do'/>"/>

			<c:forEach var="result" items="${spec}" varStatus="status">
			<input type="hidden" id="<c:out value='${result.code }' />" name="<c:out value='${result.code }' />" value="<c:out value='${result.codeDc }' />"/>
			</c:forEach>
			
			<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />

			<c:if test="${anonymous != 'true'}">
			<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
			<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
			</c:if>
			
			<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
			   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
			   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
			</c:if>
	
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
			    	<select id="schdulDeptName" name="schdulDeptName" onchange="deptNameCheck()">
			    		<option value="" selected="selected">선택</option>
				    	<c:forEach items="${schdulDeptName}" var="resultInfo" varStatus="status">
			    		<option value="${resultInfo.orgnztId}">${resultInfo.orgnztNm}</option>
						</c:forEach>
					</select>
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
				<td colspan="6">
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<%-- <th width="15%" height="23" class="required_text" nowrap >제목<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="35%" align="left">
							<form:input path="nttSj" size="40" style="background-color: white;" value="${result.nttSj}"/>
							<div><form:errors path="nttSj" cssClass="error"/></div>
						</td> --%>
						<th width="15%" height="23" class="required_text" nowrap >모델명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="85%" align="left" colspan="5">
							<form:input path="model" size="20" value="${result.model}" style="background-color: white;"/>
							<div><form:errors path="model" cssClass="error"/></div>
						</td>
					</table>
				</td>
				
			</tr>
			
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >구분<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<%-- <form:select path="kind" style="background-color: white;">
						<form:option value="" selected="selected">선택</form:option>
						<form:option value="com01">양산</form:option>
						<form:option value="com02">개발</form:option>
					</form:select> --%>
					<%-- <form:input path="division" size="10" style="background-color: white;" value="${result.divisionNm}" readonly="true" />
					<div><form:errors path="division" cssClass="error"/></div> --%>
					<form:select path="division" style="background-color: white;">
						<form:option value="" selected="selected">선택</form:option>
						<form:options items="${process}" itemValue="code" itemLabel="codeNm"/>
					</form:select>
					<div><form:errors path="division" cssClass="error"/></div>
					
				</td>
				<th width="15%" height="23" class="required_text" nowrap >Revision<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="rev" size="10" style="background-color: white;" value="${result.rev}"/>
					<div><form:errors path="rev" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >제품 사이즈<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="size" size="10" style="background-color: white;" value="${result.size}"/>
					<div><form:errors path="size" cssClass="error"/></div>
				</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<th width="15%" height="23" class="required_text" nowrap >등록명 상판<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="35%" align="left">
							<form:input path="name_01" size="35" value="${result.name_01}" style="background-color: white;"/>
							<div><form:errors path="name_01" cssClass="error"/></div>
						</td>
						<th width="15%" height="23" class="required_text" nowrap >등록명 하판&nbsp;&nbsp;</th>
						<td width="35%" align="left" colspan="3">
							<form:input path="name_02" size="35" value="${result.name_02}" style="background-color: white;"/>
							<div><form:errors path="name_02" cssClass="error"/></div>
						</td>
					</table>
				</td>
			</tr>
			
			<%-- <tr>
				<th width="15%" height="23" class="required_text" nowrap >조건<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="85%" align="left" colspan="5">
					<form:select path="spec" style="background-color: white;" onchange="specChange()">
						<form:option value="" selected="selected">선택</form:option>
						<form:options items="${spec}" itemValue="code" itemLabel="codeNm"/>
					</form:select>
						<div><form:errors path="spec" cssClass="error"/></div>
				</td>
			<tr> --%>
			
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >광량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_01" size="10" style="background-color: white;" value="${result.spec_01}"/>
					<div><form:errors path="spec_01" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >파장<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_02" size="10" style="background-color: white;" value="${result.spec_02}"/>
					<div><form:errors path="spec_02" cssClass="error"/></div>
				</td>
				<th width="13%" height="23" class="required_text" nowrap >옵셋<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_03" size="10" style="background-color: white;" value="${result.spec_03}"/>
					<div><form:errors path="spec_03" cssClass="error"/></div>
				</td>
			</tr>
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >수정요청자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="note" size="10" style="background-color: white;" value="${result.note}"/>
					<div><form:errors path="note" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >Offset<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<c:choose>
						<c:when test="${result.offset == 'Y' }">
						<form:radiobutton path="offset" value="Y" checked="true" style="background-color: white;" />적용 &nbsp;
						<form:radiobutton path="offset" value="N" style="background-color: white;" />미적용 
						</c:when>
						<c:otherwise>
						<form:radiobutton path="offset" value="Y" style="background-color: white;" />적용 &nbsp;
						<form:radiobutton path="offset" value="N" checked="true" style="background-color: white;" />미적용
						</c:otherwise>
					</c:choose>
					<div><form:errors path="offset" cssClass="error"/></div>
				</td>
				<th width="13%" height="23" class="required_text" nowrap >넘버링<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_04" size="10" style="background-color: white;" value="${result.spec_04}"/>
					<div><form:errors path="spec_04" cssClass="error"/></div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<table width="100%" border="0" cellpadding="0" cellspacing="1">
						<th width="15%" height="23" class="required_text" nowrap >등록 호기<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="35%" align="left">
							<form:input path="number" size="20" value="${result.number}" style="background-color: white;"/>
							<div><form:errors path="number" cssClass="error"/></div>
						</td>
						<th width="15%" height="23" class="required_text" nowrap >거버위치<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
						<td width="35%" align="left" colspan="3">
							<form:input path="location" size="20" value="${result.location}" style="background-color: white;"/>
							<div><form:errors path="location" cssClass="error"/></div>
						</td>
					</table>
				</td>
			</tr>
			<tr>
				<th width="15%" height="23" class="required_text" align="left" nowrap>추가 입력 내용</th>
				<td width="85%" align="left" colspan="6">
					<textarea id="nttCn" name="nttCn" class="textarea" cols="75" rows="5" style="width:550px;"><c:out value="${result.nttCn }" escapeXml="false" /></textarea>
					<div><form:errors path="nttCn" cssClass="error"/></div>
				</td>
			</tr>
		
		</table>
		
	<!-- 줄간격조정  -->
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td height="10px"></td>
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
					   		<input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_list_form();return false;">
					   	</span>
					</td>
					<td>&nbsp;</td>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_moveUpdt_notice();return false;">
						</span>
					</td>
					<td>&nbsp;</td>
					<td>
						<span class="button">
							<input type="submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" />" onclick="javascript:fn_egov_delete_notice();return false;">
						</span>
					</td>
				</tr>
			</table>
		</center>
	
		</form:form>
	</div>
</DIV>
</body>
</html>