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
<title><c:out value="${brdMstrVO.bbsNm}"/> 리스트</title>
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
function fn_egov_inqire_notice(nttId, bbsId, model) {
	document.subForm.nttId.value = nttId;
	document.subForm.bbsId.value = bbsId;
	document.subForm.model.value = model;
	document.subForm.division.value = division;
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
	document.frm.action = "<c:url value='/com/fp${prefix}/selectFloorPlanList.do'/>";
	document.frm.submit();
}
//-->
</script>

</head>
<body>

<!-- 메인탑 컨텐츠 시작 -->
<div id="center_body">
	<!-- 이미지 -->
<!-- 	<div class="intro_img">
			
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
	
	<!-- 게시판 시작 -->
	<div style="float: left; width: 804px;">
		
		<form:form commandName="floorPlanVO" action="${pageContext.request.contextPath}/com/fp/addFloorPlanArticleActor.do" name="frm" method="post">
		<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
		<input type="hidden" name="nttId"  value="0" />
		<input type="hidden" name="division"  value="<c:out value='${boardVO.division}'/>" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
		<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
		<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
   		<input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />
			
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
					도면 리스트
				</li>
			<%-- <c:if test="${brdMstrVO.authFlag == 'Y'}"> --%>
				<li style="float: right;padding-right:10px">
					<a href="<c:url value='/com/fp${prefix}/addFloorPlanArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>&division=<c:out value='${boardVO.division }' />"><img src="<c:url value='/images/egovframework/adt/btn_regist.gif' />" border="0" /></a>
				</li>
			<%-- </c:if> --%>
			</ul>
		</div>
		
		<c:import url="/EgovPageLink.do?link=egovframework/com/fp/di/FloorPlan_Head" />
		
 		<!-- 크린페이퍼(유포지) -->
		<div class="egovframe_tablestyle">
			<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0" border="0">
				<caption>목록</caption>
				<colgroup>
				<col width="40" />
				<col width="80" />
				<col width="120" />
				<col width="" />
				<col width="80" />
				<col width="80" />
				<col width="80" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">구분</th>
						<th scope="col">모델명</th>
						<th scope="col">제 목</th>
						<th scope="col">등록요청자</th>
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
							<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/>
						</strong>
					</td>
					<td>
						<c:out value="${result.divisionNm }" />
					</td>
					<td>
						<c:out value="${result.model }" />
					</td>
					<td>
						<div style="width:360px; text-overflow:ellipsis; overflow:hidden;">
							<span class="align_left_text">
						<c:choose>
			                <c:when test="${result.isExpired=='Y' || result.useAt == 'N'}">
			                    <c:if test="${fn:length(result.nttSj)> 30}">
									<c:out value="${fn:substring(result.nttSj,0, 30)}" />...
								</c:if>
								<c:if test="${fn:length(result.nttSj)<= 30}">
									<c:out value="${result.nttSj}" />
								</c:if>
			                </c:when>
			                <c:otherwise>
			                        <!-- <span class="link"><input type="submit" style="width:320px;border:solid 0px black;text-align:left;" value="<c:out value="${result.nttSj}"/>"></span> -->
                               <a class="board" href="<c:url value='/' />com/fp/selectFloorPlanSmallArticle.do?nttId=<c:out value="${result.nttId}"/>&amp;bbsId=<c:out value='${result.bbsId}'/>&amp;model=<c:out value='${result.model}'/>&amp;division=<c:out value='${result.division}'/>" onclick="fn_egov_inqire_notice('<c:out value="${result.nttId}"/>','<c:out value='${result.bbsId}'/>','<c:out value='${result.model}'/>,'<c:out value='${result.division}'/>'); return false;">
                               <c:if test="${fn:length(result.nttSj)> 30}">
									<c:out value="${fn:substring(result.nttSj,0, 30)}" />...
								</c:if>
								<c:if test="${fn:length(result.nttSj)<= 30}">
									<c:out value="${result.nttSj}" />
								</c:if>
                               </a>
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
				<c:if test="${fn:length(resultList) == 0}">
				<tr>
					<td class="listCenter" colspan="8" ><spring:message code="common.nodata.msg" /></td>
				</tr>
				</c:if>
					
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
		
			<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		</form:form>
	</div>
</DIV>
</body>
</html>