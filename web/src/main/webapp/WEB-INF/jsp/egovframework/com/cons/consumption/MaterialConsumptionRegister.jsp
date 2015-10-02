<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 /**
  * @Class Name : MaterialConsumptionRegister.jsp
  * @Description : 소모품 재고 현황 관리 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2013.12.19    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2013.12.19
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

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


<title>소모품 재고 현황 관리 등록 화면</title>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
<script language="javascript1.2" type="text/javaScript">
<!--

function fn_egov_regist_MaterialList(){
	 history.back(-2);
}

function press(event) {
	if (event.keyCode==13) {
		linkPage('1');
	}
}

/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.frm.checkField;
    if(document.frm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteProgrmManageList() {
    var checkField = document.frm.checkField;
    var ProgrmFileNm = document.frm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
            	checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }

    document.frm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.frm.action = "<c:url value='/sym/prm/EgovProgrmManageListDelete.do'/>";
    document.frm.submit();
}

/* ********************************************************
 * Code ID 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/com/mat/MaterialList.do'/>";
   	document.frm.submit();
}

/* ********************************************************
 * Code ID 페이징 처리 함수
 ******************************************************** */
function codeLinkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/com/mat/Consumption/selectMaterialConsumablesCode.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/com/mat/MaterialList.do'/>";
   	document.frm.submit();
}


/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() {
	document.frm.pageIndex.value = 1;
	document.frm.action = "<c:url value='/com/mat/MaterialList.do'/>";
	document.frm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
   	document.frm.action = "<c:url value='/com/mat/MaterialConsumablesRegister.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * 입력 실행 호출 함수
 ******************************************************** */
function insertArticleProgramListManage() {

	//document.frm.onsubmit();
	
	if(document.frm.code.value == "") {
		alert("소모품명 선택하세요!!!");
		document.frm.code.focus();
		return false;
	}
	
	if(document.frm.date.value == "") {
		alert("입고일을 선택하세요!!!");
		document.frm.date.focus();
		return false;
	}
	
	if(document.frm.qty.value == "") {
		alert("입고수량을 선택하세요!!!");
		document.frm.qty.focus();
		return false;
	}
	
	document.frm.action = "/com/mat/MaterialConsumablesInsertArticle.do";
	document.frm.submit();
}

/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(code) {
	document.frm.code.value = code;
   	document.frm.action = "<c:url value='/com/mat/MaterialConsumptionDetailInqire.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
function fn_FocusStart(){
	var objFocus = document.getElementById('F1');
	objFocus.focus();
}
	
/* ********************************************************
 * 통합검색
 ******************************************************** */	
function searchFrmList(pageNo){
	if(document.frm.searchWrdPtl.value.trim() == ''){
		alert("검색어를 입력해 주세요.");
		document.frm.searchWrdPtl.value = "";
		document.frm.searchWrdPtl.focus();
		return false;
	}
	//document.rightfrm.pageIndex.value = pageNo;
	document.frm.action = "/com/mat/MaterialList.do";
	document.frm.searchWrd.value = document.frm.searchWrdPtl.value;
	document.frm.submit();
}

/* ********************************************************
 * 통합검색 엔터
 ******************************************************** */	
function CheckEnt() {
	if (event.keyCode == 13) {
		if(document.frm.searchWrdPtl.value.trim() == ''){
			alert("검색어를 입력해 주세요.");
			document.frm.searchWrdPtl.value = "";
			return false;
		}
		linkPage('1');
	}
}

/* <c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if> */
-->
</script>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<body>
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<div class="intro_title">

			<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="" /></div> HOME &gt; <span class="intro_title_right_text">소모품 재고 현황 관리 등록<c:out value="${brdMstrVO.bbsNm}"/></span></div>

		</div>

	<!-- ********** 여기서 부터 본문 내용 *************** -->
		<div style="float: left; width: 653px;">
			<form:form commandName="consumablesVO" name="frm" method="post" action="">
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
				<input name="codeId" type="hidden" value="COM300">
				<input type="submit" value="실행" onclick="linkPage('1'); return false;" id="invisible" class="invisible" />
				
				<!-- 타이틀 -->
				<div class="board_title01">
				<h2 class="hidden"><c:out value="${machineNm}"/> 다운로드는 로그인 후 받을 수 있습니다.</h2>
					<ul style="padding-top: 5px;">
						<li class="black_title_text" style="float: left;"><c:out value="${machineNm}"/> 등록</li>
					</ul>
				</div>
				
				<div class="list_ar">
			
					<ul class="table_list02">
						<li>
							<span  style="width: 100px; text-align: center; float: left;">
								소모품 종류
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li style="width: 150px; text-align: left; float:left;">
							<label for="qestnSj" style="display: none;">소모품명</label>
								<form:select path="code" id="code" title="소모품명">
									<form:option value="" label="--선택하세요--"/>
									<form:options items="${cmm_result}" itemValue="code" itemLabel="codeNm"/>
								</form:select>
						</li>
					</ul>
					
					<!-- 교체일 -->
					<ul class="table_list02">
						<li>
							<span  style="width: 100px; text-align: center; float: left;">
								입고일
					    		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
					    	</span>
					    </li>
						<li style="width: 100px; text-align: left; float:left;">
							<label for="qestnSj" style="display: none;">입고일</label>
							<input id="date" name="date" type="hidden" >
							<input name="dateBeginView" type="text" size="10" value=""  readOnly onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.date, document.board.dateBeginView);" title="입고일입력">
							<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.frm, document.frm.date, document.frm.dateBeginView);" width="15" height="15" alt="달력창팝업버튼이미지">
							<br/>
						</li>
					</ul>
	
					<ul class="table_list02">
						<li>
							<span  style="width: 100px; text-align: center; float: left;">
								입고수량
							</span>
						</li>
						<li style="width: 100px; text-align: left; float:left;">
							<input type="text" name="qty" value="">
						</li>
					</ul>
									
					<ul class="table_list02">
						<li>
							<span  style="width: 100px; text-align: center; float: left;">
								비 고
							</span>
						</li>
						<li style="width: 100px; text-align: left; float:left;">
							<input type="text" name="remark" value="">
						</li>
					</ul>
					
					<div class="btn_area">
						<div class="ser_btn"><input type="image" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_regist_MaterialList();return false;" class="button_01" src="/images/egovframework/adt/btn_list.gif" width="65" height="28" alt="목록"></div>
						<div class="ser_btn"><input type="image" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:insertArticleProgramListManage();return false;" class="button_01" src="/images/egovframework/adt/btn_regist.gif" width="65" height="28" alt="등록"></div>
					</div>
				</div>

			</form:form>
<!-- ********** 여기까지 내용 *************** -->
		
		</DIV>
	</div>
	
</body>
</html>

