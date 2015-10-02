<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovDeptSchdulManageDetail.jsp
  Description : 부서일정관리 상세보기
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
String sLinkType = request.getParameter("linkType") == null ? "" : (String)request.getParameter("linkType");
%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/sdm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/sdm/"/>
<c:set var="sLinkType" value="<%=sLinkType %>"/>
<html lang="ko">
<head>
<title>부서일정관리</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css"> 
<script type="text/javaScript" language="javascript">


/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DeptSchdulManage(){

}


/* ********************************************************
 * 일지관리 이동
 ******************************************************** */
function fn_egov_diary_DeptSchdulManage(){
	var vFrom = document.SalaryManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/cop/smt/dsm/EgovDiaryManageList.do' />";;
	vFrom.submit();
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_DeptSchdulManage(){
	<%-- 부서일정목록 이동 --%>
	<c:if test="${sLinkType eq ''}">
		location.href = "<c:url value='/sal/SalaryManageList.do' />";
	</c:if>

	<%-- 전체일정목록 이동 --%>
	<c:if test="${sLinkType eq 'asm'}">
		location.href = "<c:url value='/cop/smt/asm/EgovAllSchdulManageList.do' />";
	</c:if>
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_modify_DeptSchdulManage(){
	var vFrom = document.SalaryManageForm;
	vFrom.cmd.value = '';
	vFrom.action = "<c:url value='/sal/SalaryManageModify.do' />";;
	vFrom.submit();

}
/* ********************************************************
 * 삭제처리
 ******************************************************** */
function fn_egov_delete_DeptSchdulManage(){
	var vFrom = document.SalaryManageForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/sal/SalaryManageDetail.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}
</script>
</head>
<body onLoad="fn_egov_init_DeptSchdulManage();">
<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form name="SalaryManageForm" id="SalaryManageForm" action="<c:url value=''/>" method="post">
<!-- ----------------- 상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;부서일정관리 상세보기</td>
 </tr>
</table>
<!-- 줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!-- 등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
  <tr>
    <th width="20%" height="23" class="required_text" nowrap >근무형태<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" colspan="3">
    <c:forEach items="${salarySe}" var="schdulSeInfo" varStatus="status">
    <c:if test="${schdulSeInfo.code eq resultList[0].schdulSe}">
     <c:out value="${fn:replace(schdulSeInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
    </c:if>
    </c:forEach>
    </td>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >잔업유무<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="30%" >
      <c:forEach items="${salaryPro}" var="salaryProInfo" varStatus="status">
		<c:if test="${salaryProInfo.code eq resultList[0].schdulPro }">
      		<c:out value="${fn:replace(salaryProInfo.codeNm , crlf , '<br/>')}" escapeXml="false" />
		</c:if>
      </c:forEach>
    </td>
    <th width="20%" height="23" class="required_text" nowrap >연장시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="30%">
			<c:out value="${fn:replace(resultList[0].schdulProtime , crlf , '<br/>') }" escapeXml="false" /> Hour
		</td>
  </tr>
  <tr>
    <th height="23" class="required_text" >지각/조퇴 시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td colspan="3">
    	<c:out value="${fn:replace(resultList[0].schdulLatetime , crlf , '<br/>')}" escapeXml="false" /> Hour
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >근무일<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" colspan="3" >
    ${fn:substring(resultList[0].schdulBgnde, 0, 4)}-${fn:substring(resultList[0].schdulBgnde, 4, 6)}-${fn:substring(resultList[0].schdulBgnde, 6, 8)}
    <%--  ~
    ${fn:substring(resultList[0].schdulEndde, 0, 4)}-${fn:substring(resultList[0].schdulEndde, 4, 6)}-${fn:substring(resultList[0].schdulEndde, 6, 8)} --%>
    </td>
  </tr>

  <tr>
    <th width="20%" height="23" class="required_text" nowrap >작성자<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" colspan="3">
    <c:out value="${fn:replace(resultList[0].schdulChargerName , crlf , '<br/>')}" escapeXml="false" />
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
<!--  목록/저장버튼  -->
<table border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<!--
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_list_DeptSchdulManage();"><spring:message code="button.list" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_delete_DeptSchdulManage();"><spring:message code="button.delete" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_diary_DeptSchdulManage();">일지관리</a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td>&nbsp;</td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
  <td background="<c:url value='/images/egovframework/com/cmm/btn/bu2_bg.gif'/>" class="text_left" nowrap><a href="JavaScript:fn_egov_modify_DeptSchdulManage();"><spring:message code="button.update" /></a>
  </td>
  <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
-->  
  <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_list_DeptSchdulManage();return false;"></span></td>
  <td>&nbsp;</td>
  <td><span class="button"><input type="submit" value="<spring:message code="button.delete" />" title="<spring:message code="button.delete" />" onclick="javascript:fn_egov_delete_DeptSchdulManage();return false;"></span></td>
  <td>&nbsp;</td>
  <!-- <td><span class="button"><input type="submit" value="일지관리" title="일지관리" onclick="javascript:fn_egov_diary_DeptSchdulManage();return false;"></span></td>
  <td>&nbsp;</td> -->
  <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" title="<spring:message code="button.update" />" onclick="javascript:fn_egov_modify_DeptSchdulManage();return false;"></span></td>
</tr>
</table>
</center>
<input name="salaryId" type="hidden" value="${resultList[0].schdulId}">
<input name="linkType" type="hidden" value="${sLinkType}">
<input name="cmd" type="hidden" value="<c:out value=''/>"/>
</form>
</DIV>

</body>
</html>
