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
	document.getElementById("tabMenu2").bgColor = '#DDDDDD';
	document.getElementById("tabMenu3").bgColor = '#DDDDDD';
	document.getElementById("tabMenu4").bgColor = '#DDDDDD';
	document.getElementById("tabMenu5").bgColor = '#DDDDDD';
	document.getElementById("tabMenu6").bgColor = '#DDDDDD';
	document.getElementById("tabMenu7").bgColor = '#DDDDDD';

	if(objArr == 0){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM100&consumable=CON10&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu0").bgColor = '#BBBBBB';
	}else if(objArr == 1){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM110&consumable=CON21&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu1").bgColor = '#BBBBBB';
	}else if(objArr == 2){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM120&consumable=CON30&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu2").bgColor = '#BBBBBB';
	}else if(objArr == 3){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM130&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu3").bgColor = '#BBBBBB';
	}else if(objArr == 4){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM140&consumable=CON60&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu4").bgColor = '#BBBBBB';
	}else if(objArr == 5){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM150&consumable=CON70&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu5").bgColor = '#BBBBBB';
	}else if(objArr == 6){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM160&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu6").bgColor = '#BBBBBB';
	}else if(objArr == 7){
		//document.getElementById("SchdulView").src="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM195&consumable=CON95&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu7").bgColor = '#BBBBBB';
	}
	
	//do_resize();
}
</script>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">

	<table border="0" cellspacing="0" cellpadding="0" summary="월별일정보기,주간별일정보기,일별일정보기 입니다."      >
		<tr>
			<td height="20px" width="100px" bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu0">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM100&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(0);"><b>전열로</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"></td>
			<td height="20px" width="100px"  bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu1">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM110&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(1);"><b>DFR라미</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF" ></td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu2">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM120&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(2);"><b>평행광노광기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu3">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM140&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(3);"><b>포토실버인쇄기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu4">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM190&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(4);"><b>MIR건조로</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu5">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM150&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(5);"><b>DI노광기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu6">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM170&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(6);"><b>포토TR인쇄기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu7">
				<a href="<c:url value='/com/cons/cleanRollerUseRegister.do' />?codeId=COM195&mode=ROLLER&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" onClick="fnTabMenuSelect(7);"><b>롤라미</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
		</tr>
	</table>
