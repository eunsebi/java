<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovDeptSchdulManageRegist.jsp
  Description : 부서일정관리 등록 페이지
  Modification Information

      수정일        수정자           수정내용
    -------    	   --------    ---------------------------
     2008.03.09    	장동한          최초 생성
     2011.09.07		이기하			날짜관련 오류검사 추가

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/sdm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/sdm/"/>
<html lang="ko">
<head>
<title>근무내역 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


<meta http-equiv="content-type" content="text/html; charset=utf-8" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css"> 
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<%-- <validator:javascript formName="deptSchdulManageVO" staticJavascript="false" xhtml="true" cdata="false"/> --%>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_DeptSchdulManage(){

	   /* var maxFileNum = document.getElementById('posblAtchFileNumber').value;

	   if(maxFileNum==null || maxFileNum==""){
	     	maxFileNum = 3;
	    }

	   var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );

	   multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) ); */


	   //document.getElementsByName('reptitSeCode')[0].checked = true;

		if("${salaryManageVO.salaryBgnde}".length > 0){
			var salaryBgnde = "${salaryManageVO.salaryBgnde}";
			document.getElementById("salaryBgndeYYYMMDD").value = salaryBgnde.substring(0,4) + "-" + salaryBgnde.substring(4,6) + "-" + salaryBgnde.substring(6,8);
		}

	    if("${salaryManageVO.salaryEndde}".length > 0){
		   var salaryEndde = "${salaryManageVO.salaryEndde}";
		   document.getElementById("salaryEnddeYYYMMDD").value = salaryEndde.substring(0,4) + "-" + salaryEndde.substring(4,6) + "-" + salaryEndde.substring(6,8);
	   }
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_DeptSchdulManage(){
	location.href = "<c:url value='/sal/SalaryManageList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_DeptSchdulManage(form){
	//form.submit();return;
	/* if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateDeptSchdulManageVO(form)){
			return;
		}else{ */
			var salaryBgndeYYYMMDD = document.getElementById('salaryBgndeYYYMMDD').value;
			var salaryEnddeYYYMMDD = document.getElementById('salaryEnddeYYYMMDD').value;
			form.salaryBgnde.value = salaryBgndeYYYMMDD.replaceAll('-','') + document.getElementById('schdulBgndeHH').value +  document.getElementById('schdulBgndeMM').value;
			form.salaryEndde.value = salaryEnddeYYYMMDD.replaceAll('-','') + document.getElementById('schdulEnddeHH').value +  document.getElementById('schdulEnddeMM').value;
			/* form.salaryBgnde.value = salaryBgndeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulBgndeHH') +  fn_egov_SelectBoxValue('schdulBgndeMM');
			form.salaryEndde.value = salaryEnddeYYYMMDD.replaceAll('-','') + fn_egov_SelectBoxValue('schdulEnddeHH') +  fn_egov_SelectBoxValue('schdulEnddeMM'); */
			/* form.salaryBgnde.value = salaryBgndeYYYMMDD.replaceAll('-','');
			form.salaryEndde.value = salaryEnddeYYYMMDD.replaceAll('-',''); */

			var se = document.getElementById('salarySe').value;
			var pro = document.getElementById('salaryPro').value;
			
			if(se == "4" || se == "2") {
				if (pro == "1") {
					form.salaryHolidayTime.value = '8';
				} else {
					form.salaryHolidayTime.value = '7';
				}
				//alert(form.salaryHolidayTime.value);
			}
			
			if(form.salaryBgnde.value > form.salaryEndde.value) {
		        alert("종료일자는 시작일자보다  이후날짜로 선택하세요.");
		        return;
		    } else {
		    	form.submit();
		    }
		//}
	//}
}

/* ********************************************************
* 주관 부서 팝업창열기
******************************************************** */
function fn_egov_schdulDept_DeptSchdulManage(){

	var arrParam = new Array(1);
	arrParam[0] = self;
	arrParam[1] = "typeSalarySchdule";

	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />", arrParam ,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}

/* ********************************************************
* 아이디  팝업창열기
******************************************************** */
function fn_egov_schdulCharger_DeptSchdulManagee(){
	var arrParam = new Array(1);
	arrParam[0] = window;
	arrParam[1] = "typeSalarySchdule";

 	window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisEmpLyrPopup.do' />", arrParam,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
}

/* ********************************************************
* RADIO BOX VALUE FUNCTION
******************************************************** */
function fn_egov_RadioBoxValue(sbName)
{
	var FLength = document.getElementsByName(sbName).length;
	var FValue = "";
	for(var i=0; i < FLength; i++)
	{
		if(document.getElementsByName(sbName)[i].checked == true){
			FValue = document.getElementsByName(sbName)[i].value;
		}
	}
	return FValue;
}
/* ********************************************************
* SELECT BOX VALUE FUNCTION
******************************************************** */
function fn_egov_SelectBoxValue(sbName)
{
	var FValue = "";
	for(var i=0; i < document.getElementById(sbName).length; i++)
	{
		if(document.getElementById(sbName).options[i].selected == true){

			FValue=document.getElementById(sbName).options[i].value;
		}
	}

	return  FValue;
}
/* ********************************************************
* PROTOTYPE JS FUNCTION
******************************************************** */
String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}

String.prototype.replaceAll = function(src, repl){
	 var str = this;
	 if(src == repl){return str;}
	 while(str.indexOf(src) != -1) {
	 	str = str.replace(src, repl);
	 }
	 return str;
}

function salaryPro_chk() {
	var sh = document.getElementById("salaryPro");
	var tt = document.getElementById("salaryProTime");
	var ot = sh.options[sh.selectedIndex].value;
	if (ot == 1) ot = 2.5;
		else ot = 0;
	tt.value = ot;
}

function Salary_Chck() {
	var code = document.getElementById("salarySe").value;
	if (code == "5" || code == "6") {
		document.getElementById("salaryProTime").value = "";
	} else {
		document.getElementById("salaryProTime").value = "2.5";
	}
	
}

</script>

</head>

<body onLoad="fn_egov_init_DeptSchdulManage()">

<DIV id="content" style="width:712px">
<!-- 상단타이틀 -->
<form:form commandName="salaryManageVO" action="${pageContext.request.contextPath}/sal/SalaryManageRegistActor.do" name="salaryManageVO" method="post" enctype="multipart/form-data">
<!--  상단 타이틀  영역 -->
<table width="100%" cellpadding="8" class="table-search" border="0">
 <tr>
  <td width="100%"class="title_left">
   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;Maint 년차 일정관리 등록</td>
 </tr>
</table>
<!--  줄간격조정  -->
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
	<td height="3px"></td>
</tr>
</table>
<!--  등록  폼 영역  -->

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register">
	<tr>
		<th width="20%" height="23" class="required_text" nowrap >근무구분<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="80%" colspan="3">
			<form:select path="salarySe" onchange="Salary_Chck()">
				<form:options items="${salarySe}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
			
			<%-- <select id="facility" name="facility" onchange="Salary_Chck()" style="background-color: white;">
				<option value="" selected="selected">선택</option>
			   	<c:forEach items="${salarySe}" var="resultInfo" varStatus="status">
				<option value="${resultInfo.code}">${resultInfo.codeNm}</option>
				</c:forEach>
			</select> --%>
			<%-- <form:select path="salarySe">
				<form:options items="${salarySe}" itemValue="code" itemLabel="codeNm"/>
			</form:select> --%>
			<div><form:errors path="salarySe" cssClass="error"/></div>
		</td>
	</tr>

	<tr>
		<th width="20%" height="23" class="required_text" nowrap >연장<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="30%" >
			<form:select path="salaryPro" onchange="salaryPro_chk()">
				<form:options items="${salaryPro}" itemValue="code" itemLabel="codeNm"/>
			</form:select>
			<div><form:errors path="salaryPro" cssClass="error"/></div>
		</td>
		<th width="20%" height="23" class="required_text" nowrap >연장시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="30%">
			<form:input path="salaryProTime" size="10" maxlength="10"/>
			
			<div><form:errors path="salaryProTime" cssClass="error"/></div>
		</td>

	</tr>
	<tr>
		<th width="20%" height="23" class="required_text" nowrap >지각/조퇴 시간<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="80%" colspan="3">
			<form:input path="salaryLateTime" size="10" maxlength="10" value="0"/>
			
			<div><form:errors path="salaryLateTime" cssClass="error"/></div>
		</td>
	</tr>
	<tr>
		<th width="20%" height="23" class="required_text" nowrap >근무날짜<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
		<td width="80%" colspan="3">
			<form:input path="salaryBgndeYYYMMDD" size="10" readonly="true" maxlength="10" />
			<form:hidden path="salaryEnddeYYYMMDD" size="10" readonly="true" maxlength="10" />
			<form:hidden path="schdulBgndeHH" size="10" maxlength="10" value="00"/>
			<form:hidden path="schdulBgndeMM" size="10" maxlength="10" value="00"/>
			<form:hidden path="schdulEnddeHH" size="10" maxlength="10" value="00"/>
			<form:hidden path="schdulEnddeMM" size="10" maxlength="10" value="00"/>
		</td>
	</tr>
	<tr>
    <th width="20%" height="23" class="required_text" nowrap >작성자 ID<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif'/>" width="15" height="15" alt="필수입력표시"></th>
    <td width="80%" colspan="3">
		<%-- <table cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td width="100px" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;">
					<form:input path="salaryChargerName" size="73" cssClass="txaIpt" readonly="true" maxlength="10" value="${loginVO.id }"/>
					<form:input path="salaryUserName" size="73" cssClass="txaIpt" readonly="true" maxlength="10" value="${loginVO.name }"/>
				</td>
				<td style="padding:0px 0px 0px 2px;margin:0px 0px 0px 0px;">
					<a href="#" onClick="fn_egov_schdulCharger_DeptSchdulManagee()">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="담당자" title="담당자">
					</a>
				</td>
			</tr>
		</table>
		<div><form:errors path="salaryChargerName" cssClass="error"/></div> --%>
       <form:input path="salaryChargerName" value="${loginVO.name }" readonly="true"/>
       <form:hidden path="salaryChargerId" value="${loginVO.uniqId }" />

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
   <td><span class="button"><input type="submit" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_list_DeptSchdulManage();return false;"></span></td>
   <td>&nbsp;</td>
   <td><span class="button"><input type="submit" value="<spring:message code="button.save" />" title="<spring:message code="button.save" />" onclick="javascript:fn_egov_save_DeptSchdulManage(document.forms[0]);return false;"></span></td>
</tr>
</table>
</center>

<input name="cmd" id="cmd" type="hidden" value="<c:out value='save'/>"/>
<input type="hidden" name="cal_url" id="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
<input type="hidden" name="salaryBgnde" id="salaryBgnde" value="" />
<input type="hidden" name="salaryEndde" id="salaryEndde" value="" />
<input type="hidden" name="salaryHolidayTime" id="salaryHolidayTime" value="" />
</form:form>
</DIV>

</body>
</html>
