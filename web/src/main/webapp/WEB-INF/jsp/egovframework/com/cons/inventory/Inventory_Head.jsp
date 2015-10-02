<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/sdm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/sdm/"/>

<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fnTabMenuSelect(objArr){

	document.getElementById("tabMenu0").bgColor = '#DDDDDD';
	document.getElementById("tabMenu1").bgColor = '#DDDDDD';

	if(objArr == 0){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableCleanPaperUseRegister.do' />?codeId=COM100&consumable=CON10&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu0").bgColor = '#BBBBBB';
	}else if(objArr == 1){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableCleanPaperUseRegister.do' />?codeId=COM110&consumable=CON21&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu1").bgColor = '#BBBBBB';
	}
	
	//do_resize();
}
</script>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">

	<table border="0" cellspacing="0" cellpadding="0" summary="월별일정보기,주간별일정보기,일별일정보기 입니다."      >
		<tr>
			<td height="20px" width="100px" bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu0">
				<a href="<c:url value='/com/cons/consumableInventoryList.do' />?bbsId=<c:out value='${consumableInventoryVO.bbsId }' />&amp;outId=<c:out value='${consumableInventoryVO.bbsId }' />" onClick="fnTabMenuSelect(0);"><b>재고</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"></td>
			<td height="20px" width="100px"  bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu1">
				<a href="<c:url value='/com/cons/cleanRollerInventorylist.do' />?bbsId=<c:out value='${consumableInventoryVO.bbsId }' />&amp;outId=<c:out value='${consumableInventoryVO.bbsId }' />&amp;mode=ROLLER" onClick="fnTabMenuSelect(1);"><b>반출대기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF" ></td>
			
		</tr>
	</table>
