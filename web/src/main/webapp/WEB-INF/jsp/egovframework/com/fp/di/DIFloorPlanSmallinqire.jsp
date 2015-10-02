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
<title><c:out value="${brdMstrVO.bbsNm}"/> 상세보기</title>
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
<%-- <validator:javascript formName="consumableInventoryVO" staticJavascript="false" xhtml="true" cdata="false"/> --%>

<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 초기화
 ******************************************************** */
 
 function fn_list_form() {
	document.board.action = "<c:url value='/com/fp${prefix}/selectFloorPlanList.do'/>";
	document.board.submit();
	
}

function fn_egov_moveUpdt_notice(){
	document.board.action = "<c:url value='/com/fp${prefix}/forUpdateFloorPlanArticl.do'/>";
	document.board.submit();
}

function fn_egov_inqire_notice(i, nttId, bbsId) {
	document.subForm.nttId.value = nttId;
	document.subForm.bbsId.value = bbsId;
	document.subForm.action = "<c:url value='/com/fp${prefix}/selectFloorPlanSmallArticle.do'/>";
	document.subForm.submit();
}

function fn_egov_select_noticeList(pageNo) {
	/* if(document.frm.searchWrd.value.trim() == ''){
		alert("검색어를 입력해 주세요.");
		document.frm.searchWrd.value = "";
		document.frm.searchWrd.focus();
		return false;
	} */
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/com/fp${prefix}/selectFloorPlanSmallArticle.do'/>";
	document.frm.submit();
}
//-->

</script>

</head>
<body>

<!-- 메인탑 컨텐츠 시작 -->
<div id="center_body">
<!-- 		<div class="intro_img">
			
			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			
		</div> -->
	<div class="intro_title">

		<div class="intro_title_right">
			<div class="intro_title_right_h_img">
				<img src="<c:url value='/images/egovframework/adt/img_home.gif' />" width="11" height="11" alt="" />
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
						<c:when test="${boardVO.division == 'COM01'}">
							<font color="blue" size="3">양산</font>
						</c:when>
						<c:when test="${boardVO.division == 'COM02'}">
							<font color="blue" size="3">개발</font>
						</c:when>
					</c:choose>
					도면 상세정보
				</li>
			</ul>
		</div>
		
		<!-- 게시판 시작 -->
		<form:form commandName="board" name="frm" method="post" >
			<form:hidden path="bbsId"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
			<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
			<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
			<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
			<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />
			<input type="hidden" name="division" value="<c:out value='${result.division}'/>" />
			<input type="submit" id="invisible" class="invisible" />
	
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
				<th width="15%" height="23" class="required_text" nowrap >모델명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="35%" align="left" colspan="2">
					<form:input path="model" size="40" value="${result.model}" readonly="true"/>
					<div><form:errors path="model" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >Offset<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="35%" align="left" colspan="3">
					<c:choose>
						<c:when test="${result.offset == 'Y' }">
						<form:input path="offset" value="적용" readonly="true"/>
						</c:when>
						<c:otherwise>
						<form:input path="offset" value="미적용" readonly="true"/>
						</c:otherwise>
					</c:choose>
					<div><form:errors path="offset" cssClass="error"/></div>
				</td>
			</tr>
			
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >상판명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="35%" align="left" colspan="2">
					<form:input path="nttSj" size="40" value="${result.name_01}" readonly="true"/>
					<div><form:errors path="nttSj" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >하판명<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="35%" align="left" colspan="3">
					<form:input path="nttSj" size="40" value="${result.name_02}" readonly="true"/>
					<div><form:errors path="nttSj" cssClass="error"/></div>
				</td>
			</tr>
			
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >구분<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<%-- <form:select path="division" style="background-color: white;">
						<form:option value="" selected="selected">선택</form:option>
						<form:option value="com01">양산</form:option>
						<form:option value="com02">개발</form:option>
					</form:select> --%>
					<form:input path="divisionNm" size="10" value="${result.divisionNm}" readonly="true" />
					<div><form:errors path="divisionNm" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >Revision<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="rev" size="10" value="${result.rev}" readonly="true"/>
					<div><form:errors path="rev" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >제품 사이즈<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="size" size="10" value="${result.size}" readonly="true"/>
					<div><form:errors path="size" cssClass="error"/></div>
				</td>
			</tr>
			<tr>
				<th width="15%" height="23" class="required_text" nowrap >광량<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_01" size="10" value="${result.spec_01}" readonly="true"/>
					<div><form:errors path="spec_01" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >파장<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_02" size="10" value="${result.spec_02}" readonly="true"/>
					<div><form:errors path="spec_02" cssClass="error"/></div>
				</td>
				<th width="13%" height="23" class="required_text" nowrap >옵셋<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_03" size="10" value="${result.spec_03}" readonly="true"/>
					<div><form:errors path="spec_03" cssClass="error"/></div>
				</td>
			</tr>

			<tr>
				<th width="15%" height="23" class="required_text" nowrap >수정요청자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="note" size="10" value="${result.note}" readonly="true"/>
					<div><form:errors path="note" cssClass="error"/></div>
				</td>
				<th width="15%" height="23" class="required_text" nowrap >등록호기<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="number" size="20" value="${result.number}" readonly="true"/>
					<div><form:errors path="number" cssClass="error"/></div>
				</td>
				<th width="13%" height="23" class="required_text" nowrap >넘버링<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
				<td width="18%" align="left">
					<form:input path="spec_04" size="10" value="${result.spec_04}" readonly="true"/>
					<%-- <form:input path="spec_04" size="10" style="background-color: white;" value="${result.spec_04}" readonly="true"/> --%>
					<div><form:errors path="spec_04" cssClass="error"/></div>
				</td>
			</tr>
			<c:if test="${result.nttCn != '' }">
			<tr>
				<th width="15%" height="23" class="required_text" align="left" nowrap>추가 입력 내용</th>
				<td width="85%" align="left" colspan="6">
					 <textarea id="nttCn" name="nttCn" class="textarea" cols="75" rows="3" style="width:550px;" readonly="readonly;"><c:out value="${result.nttCn }" escapeXml="false" />
					</textarea>
					<div><form:errors path="nttCn" cssClass="error"/></div>
				</td>
			</tr>
			</c:if>
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
							<input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_moveUpdt_notice(document.forms[0]);return false;">
						</span>
					</td>
				</tr>
			</table>
		</center>
	
 		<!-- 도면관리 리스트 -->
		<div class="egovframe_tablestyle">
			<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0" border="0">
				<caption>목록</caption>
				<colgroup>
				<col width="40" />
				<col width="120" />
				<col width="" />
				<col width="80" />
				<col width="80" />
				<col width="80" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">모델명</th>
						<th scope="col">제 목</th>
						<th scope="col">변경요청자</th>
						<th scope="col">등록자</th>
						<th scope="col">최종변경일</th>
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
						<c:out value="${result.model }" />
					</td>
					<td>
						<div style="width:360px; text-overflow:ellipsis; overflow:hidden;">
							<span class="align_left_text">
						<c:choose>
			                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
			                    <c:out value="${result.nttSj}" />(<c:out value="${result.cmtAnswerCnt }" />)
			                </c:when>
			                <c:otherwise>
                               <a class="board" href="<c:url value='/' />com/fp/selectFloorPlanSmallArticle.do?nttId=<c:out value="${result.nttId}"/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;model=<c:out value='${result.model}'/>&amp;division=<c:out value='${result.division}'/>" onclick="fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value='${result.bbsId}'/>','<c:out value='${result.model}'/>,'<c:out value='${result.division}'/>'); return false;"><c:out value="${result.nttSj}"/></a>
			                </c:otherwise>
			            </c:choose>
							</span>
						</div>
					</td>
					<td>
						<c:out value="${result.note }" />
					</td>
					<td>
						<c:out value="${result.frstRegisterNm}"/>
					</td>
					<td>
						<c:out value="${result.frstRegisterPnttm}"/>
					</td>
				</tr>
				</c:forEach>
				
				<!-- //loop 끝 -->
				</tbody>
			</table>
		</div>
		
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
		
		</form:form>
	</div>
</DIV>
</body>
</html>