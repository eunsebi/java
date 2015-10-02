<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소모품 재고현황</title>

<!-- header_css -->
<link href="/css/egovframework/adt/index_layout.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/header.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/leftmenu.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/quickmenu.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/footer.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/headerAdmin.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/adt/adminLeftmenu.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/adt/board_layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/guide/egovcmm_layout.css" rel="stylesheet" type="text/css" />

<link href="/css/egovframework/com/cmm/com.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/button.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/mpm.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cop/tpl/egovbbsTemplate.css" rel="stylesheet" type="text/css" />

<script type="text/javaScript" language="javascript">

var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
var getContextPath = "${pageContext.request.contextPath}";
var path = "http://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.serverPort}";

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_MaterialConsumption(){

	// 첫 입력란에 포커스..
	document.MaterialConsumptionForm.searchKeyword.focus();
	
}

/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_select_linkPage(pageNo){
	
	document.MaterialConsumptionForm.pageIndex.value = pageNo;
	document.MaterialConsumptionForm.action = "/uss/olh/wor/WordDicaryListInqire.do";
   	document.MaterialConsumptionForm.submit();
   	
}

/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_MaterialConsumption(){

	document.MaterialConsumptionForm.pageIndex.value = 1;
	document.MaterialConsumptionForm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_MaterialConsumption(){

	document.MaterialConsumptionForm.action = "/com/mat/MaterialConsumptionRegister.do";
	document.MaterialConsumptionForm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_MaterialConsumption(){

	document.MaterialConsumptionForm.action = "/uss/olh/wor/updateWordDicaryView.do";
	document.MaterialConsumptionForm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_MaterialConsumption(number,codeId) {		

	// 용어사전 키값(wordId) 셋팅.
	
	document.MaterialConsumptionForm.number.value = number;
	document.MaterialConsumptionForm.codeId.value = codeId;	
  	document.MaterialConsumptionForm.action = "/com/mat/MaterialConsumptionDetailInqire.do";
  	document.MaterialConsumptionForm.submit();	
	   	   		
}

/* ********************************************************
 * 설비별 List 처리 함수
 ******************************************************** */
function fn_egov_selectList_MaterialConsumption(codeId) {		

	// 용어사전 키값(wordId) 셋팅.
	
	document.MaterialConsumptionForm.codeId.value = codeId;	
  	document.MaterialConsumptionForm.action = "/com/mat/MaterialConsumptionMachineList.do";
  	document.MaterialConsumptionForm.submit();	
	   	   		
}

 
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_EventCmpgn(mtgId){
	var vFrom = document.listForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.mtgId.value = mtgId;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
		vFrom.submit();
	}else{
		vFrom.cmd.value = '';
	}
}

/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_EventCmpgn(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
	vFrom.submit();

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

<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<DIV id="content" style="width:660px">
			<%-- <div class="intro_title">
				<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="" /></div> HOME &gt; <span class="intro_title_right_text"><c:out value="${brdMstrVO.bbsNm}"/></span></div>
			</div> --%>
			<table border="0" cellspacing="0" cellpadding="0" summary="유포지 설비별 현황 입니다."      >
				<tr>
				  <td height="20px" width="92px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu0"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM100' />" target="SchdulView" onClick="fnTabMenuSelect(0);"><b>전열로</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"></td>
				  <td height="20px" width="97px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu1"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM111' />" target="SchdulView" onClick="fnTabMenuSelect(1);"><b>DFR라미네이터</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF" ></td>
				  <td height="20px" width="96px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu2"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM121' />" target="SchdulView" onClick="fnTabMenuSelect(2);"><b>평행광노광기</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
				  <td height="20px" width="92px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu3"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM190' />" target="SchdulView" onClick="fnTabMenuSelect(4);"><b>MIR건조로</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
				  <td height="20px" width="92px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu4"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM140' />" target="SchdulView" onClick="fnTabMenuSelect(5);"><b>실버인쇄기</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
				  <td height="20px" width="92px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu5"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM150' />" target="SchdulView" onClick="fnTabMenuSelect(6);"><b>DI노광기</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
				  <td height="20px" width="92px" style="cursor:hand;cursor:pointer;" bgcolor="#DDDDDD" align="center" id="tabMenu6"><a href="<c:url value='/com/mat/MaterialCreanRollerConsumption.do?codeId=COM170' />" target="SchdulView" onClick="fnTabMenuSelect(7);"><b>TR인쇄기</b></a></td>
				  <td height="20px" width="1x" bgcolor="#FFFFFF"> </td>
				</tr>
			</table>
			<iframe id="SchdulView" name="SchdulView" src="/com/mat/MaterialCreanRollerConsumption.do?codeId=COM100" width="100%" height="500" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" title="유포지 현황"></iframe>
		</DIV>
	</div>
	
</body>
</html>