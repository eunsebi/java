<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
  Class Name : EgovDeptSchdulManageList.jsp
  Description : 부서일정관리 월별/주간별/일별 조회
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/smt/sdm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/cop/smt/sdm/"/>


<html lang="ko">
<head>
<title>필터 종류별 등록</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css'/>">
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fnTabMenuSelect(objArr){


	document.getElementById("tabMenu0").bgColor = '#DDDDDD';
	document.getElementById("tabMenu1").bgColor = '#DDDDDD';
	/* document.getElementById("tabMenu2").bgColor = '#DDDDDD';
	document.getElementById("tabMenu3").bgColor = '#DDDDDD';
	document.getElementById("tabMenu4").bgColor = '#DDDDDD';
	document.getElementById("tabMenu5").bgColor = '#DDDDDD';
	document.getElementById("tabMenu6").bgColor = '#DDDDDD'; */

	if(objArr == 0){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM130&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu0").bgColor = '#BBBBBB';
	}else if(objArr == 1){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM160&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu1").bgColor = '#BBBBBB';
	/* }else if(objArr == 2){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM120&consumable=CON30&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu2").bgColor = '#BBBBBB';
	}else if(objArr == 3){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM130&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu3").bgColor = '#BBBBBB';
	}else if(objArr == 4){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM140&consumable=CON60&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu4").bgColor = '#BBBBBB';
	}else if(objArr == 5){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM150&consumable=CON70&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu5").bgColor = '#BBBBBB';
	}else if(objArr == 6){
		document.getElementById("SchdulView").src="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM160&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />";
		document.getElementById("tabMenu6").bgColor = '#BBBBBB'; */
	}
	
	//do_resize();
}

/* ********************************************************
* 등록 처리 함수
******************************************************** */
function fnInit(){
	fnTabMenuSelect(0);
	do_resize();	// 추가...
}


/* ********************************************************
* IFRAME AUTO HEIGHT
******************************************************** */
function do_resize() {
 //resizeFrame("iframe_main",1);
	resizeFrame("SchdulView",1);
}

function resizeFrame(ifr_id,re){
//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
 var ifr= document.getElementById(ifr_id) ;
 var innerBody = ifr.contentWindow.document.body;
 var innerHeight = innerBody.scrollHeight + (innerBody.offsetHeight - innerBody.clientHeight);
 //var innerWidth = document.body.scrollWidth + (document.body.offsetWidth - document.body.clientWidth);

 if (ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
 {
   ifr.style.height = innerHeight;
  //ifr.style.width = innerWidth;
  //ifr.attributes['height'] = innerHeight;
  //ifr.setAttribute("height",innerHeight);
 }

 if(!re) {
  try{
   	innerBody.attachEvent('onclick',parent.do_resize);
   	innerBody.attachEvent('onkeyup',parent.do_resize);
   //글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
  } catch(e) {
   innerBody.addEventListener("click", parent.do_resize, false);
   innerBody.addEventListener("keyup", parent.do_resize, false);
   //글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
  }
 }
}

</script>
</head>
<body onLoad="fnInit()">
<DIV id="content" style="width:800px">
	<table width="100%" cellpadding="1" class="table-search" border="0">
		<tr>
			<td class="title_left">
				<h1>
					<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">
					<c:if test="${consumableInventoryVO.bbsId == 'CONS_001' }">
					&nbsp;T1 설비별 필터 등록 화면
					</c:if>
					<c:if test="${consumableInventoryVO.bbsId == 'CONS_002' }">
					&nbsp;T2 설비별 필터 등록 화면
					</c:if>
				</h1>
			</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
	</table>

	<table border="0" cellspacing="0" cellpadding="0" summary="월별일정보기,주간별일정보기,일별일정보기 입니다."      >
		<tr>
			<td height="20px" width="100px" bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu0">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM130&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(0);"><b>D.E.S</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"></td>
			<td height="20px" width="100px"  bgcolor="#DDDDDD" style="cursor:hand;cursor:pointer;" align="center" id="tabMenu1">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM160&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(1);"><b>실버현상기</b></a>
			</td>
			<%-- <td height="20px" width="1x" bgcolor="#FFFFFF" ></td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu2">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM120&consumable=CON30&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(2);"><b>평행광노광기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu3">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM140&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(3);"><b>포토실버인쇄기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu4">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM190&consumable=CON60&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(4);"><b>MIR건조로</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu5">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM150&consumable=CON70&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(5);"><b>DI노광기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
			<td height="20px" width="100px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu6">
				<a href="<c:url value='/com/cons/consumableFilterUseRegister.do' />?codeId=COM170&consumable=CON50&bbsId=<c:out value="${consumableInventoryVO.bbsId }" />" target="SchdulView" onClick="fnTabMenuSelect(6);"><b>포토TR인쇄기</b></a>
			</td>
			<td height="20px" width="1x" bgcolor="#FFFFFF"> </td> --%>
		</tr>
	</table>

	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td height="3" bgcolor="DDDDDD"></td>
		</tr>
	</table>

	<iframe id="SchdulView" name="SchdulView" src="" width="100%" height="520" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" title="부서일정">
	</iframe>
 	<form name="consumableInventoryVO" id="consumableInventoryVO" action="?" method="post">
		<input type="hidden" name="bbsId" id="bbsId" value='<c:out value="${consumableInventoryVO.bbsId }" />' />
		<input type="hidden" name="codeId" id="codeId" value="" />
		<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	</form>

</DIV>
</body>
</html>

