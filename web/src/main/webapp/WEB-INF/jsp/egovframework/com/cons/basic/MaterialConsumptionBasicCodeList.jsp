<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : MaterialConsumptionBasicCodeList.jsp
  * @Description : Code별 상세 조회 화면
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

<title>Code별 사용현황</title>

<script language="javascript1.2" type="text/javaScript">
<!--

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
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.frm.pageIndex.value = pageNo;
	document.frm.action = "<c:url value='/com/mat/MaterialConsumption.do'/>";
   	document.frm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() {
	document.frm.pageIndex.value = 1;
	document.frm.action = "<c:url value='/com/mat/MaterialConsumption.do'/>";
	document.frm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
   	document.frm.action = "<c:url value='/com/mat/MaterialConsumptionRegister.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * Code별 조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(code) {
	document.frm.code.value = code;
   	document.frm.action = "<c:url value='/com/mat/MaterialConsumptionDetailInqire.do'/>";
   	document.frm.submit();
}
/* ********************************************************
 * Code별 조회처리 함수
 ******************************************************** */
function selectProgramListDetail(code,number) {
	document.frm.code.value = code;
	document.frm.number.value= number;
   	document.frm.action = "<c:url value='/com/mat/MaterialConsumablesDetail.do'/>";
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
	document.frm.action = "/com/mat/MaterialConsumption.do";
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
<body onload="fn_FocusStart()">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<div class="intro_title">

			<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="" /></div> HOME &gt; <span class="intro_title_right_text"><c:out value="${machineNm}"/></span></div>

		</div>

	<!-- ********** 여기서 부터 본문 내용 *************** -->
		<div style="float: left; width: 653px;">
			<form name="frm" action ="<c:url value='/com/mat/MaterialList.do' />" method="post">
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input name="codeId" type="hidden" value="<c:out value='${searchVO.codeId}' />">
				<input type="submit" value="실행" onclick="linkPage('1'); return false;" id="invisible" class="invisible" />
				
				<!-- 타이틀 -->
				<div class="board_title01">
				<h2 class="hidden"><c:out value="${machineNm}"/> 다운로드는 로그인 후 받을 수 있습니다.</h2>
					<ul style="padding-top: 5px;">
						<li class="black_title_text" style="float: left;"><c:out value="${machineNm}"/></li>
<!--							
								<li style="float: left;">&nbsp;&nbsp;&nbsp; 다운로드는 로그인 후 받을 수 있습니다. &nbsp;&nbsp;</li>
								<li style="float: left;"><a href="javascript:goTargetPage('/uat/uia/egovLoginUsr.do')"><img src="/images/egovframework/adt/btn_movelogin.gif" width="113" height="20" alt="로그인 으로 이동" /></a></li>
-->
					</ul>
				</div>
				
				<!-- 검색페이지 -->
				<div class="search_box01">
					<ul style="padding-top: 20px;">
						<li style="float: left;margin-left: 20px;padding-top: 2px;"><img src="/images/egovframework/adt/img_search.gif" alt="Search" width="41" height="15" /></li>
						<li style="float: left;margin-left: 5px;">
							<label for="searchCnd">검색종류</label>
							<select name="searchCnd" id="searchCnd">
								<option selected="selected" value=''>--선택하세요--</option>
								<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >종류</option>
								<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >입고일</option>
							</select>
						</li>
						<li style="float: left;">&nbsp;&nbsp;<label for="searchWrdPtl" style="visibility:hidden;width:0px;height:0px;font-size:0px;">검색어</label>
							<input name="searchWrdPtl" type="text" class="ser_box11" size="40" id="F1" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="30" onkeypress="press(event);" title="검색어 입력"/>
							<!-- <input name="searchWrdPtl" id="F1" class="search_field" onkeydown="return CheckEnt();" onfocus="OutputBackImg(this);" onblur="InputBackImg(this);" /> -->
							<input type="hidden" name="searchWrd" value=""/>
						</li>
						
						<li style="float: left;margin-left: 5px;width: 51px;">
							<input type="image" value="<spring:message code="button.inquire" />" onclick="searchFrmList('1'); return false;" src="<c:url value='/'/>images/egovframework/adt/btn_search_black.gif" alt="search"  />
							<%-- <a href="#noscript" onclick="fn_egov_select_noticeList('1'); return false;">
							<img src="<c:url value='/'/>images/egovframework/adt/btn_search_black.gif" alt="search" /></a> --%>
						</li>

					</ul>
				</div>
				
				<div class="egovframe_tablestyle">
					<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0">
						<caption>소모품 현황</caption>
						<colgroup>
							<col width="30" />
							<col width="250" />
							<col width="" />
							<col width="" />
							<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">설비명</th>
								<th scope="col">교체일</th>
								<th scope="col">차기교체일</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						
						<tbody>
				
						<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
						<c:if test="${fn:length(resultList) == 0}">
						
							<tr>
								<td class="lt_text3" colspan="5">
									<spring:message code="common.nodata.msg" />
								</td>
							</tr>
						</c:if>
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td>
									<strong>
										<c:out value="${result.sortOrdr }" />
										<%-- <c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/> --%>
									</strong>
								</td>
								<td style="cursor:hand;" nowrap>
									<div style="width:360px; text-overflow:ellipsis; overflow:hidden;">
										<span class="align_left_text">
											<strong>
												<%-- <a href="<c:url value='/com/mat/Consumption/MaterialConsumablesDetail.do'/>?code=<c:out value="${result.code}"/>&amp;number=<c:out value='${result.number }' />"  onclick="selectProgramListDetail('<c:out value="${result.code}"/>,<c:out value="${result.codeNm}"/>'); return false;"> --%>
												<a class="board" href="/com/mat/MaterialConsumptionDetailInqire.do?codeId=<c:out value='${result.codeId }' />&amp;number=<c:out value='${result.number }' />">
												<c:if test="${fn:length(result.codeNm)> 22}">
													<c:out value="${fn:substring(result.codeNm,0, 22)}"/>...
												</c:if>
												<c:if test="${fn:length(result.codeNm)<= 22}">
													<c:out value="${result.codeNm}"/>
												</c:if>
										        </a>
											</strong>
										</span>
									</div>
								</td>
								
								<td nowrap>
									<c:out value="${result.dateBgnde}"/>
								</td>
								
								<td nowrap>
									<c:out value="${result.dateEndde}"/>
								</td>
								
								<td nowrap>
								<c:if test="${fn:length(result.remark)> 25}">
									<c:out value="${fn:substring(result.remark,0, 25)}"/>...
								</c:if>
								<c:if test="${fn:length(result.remark)<= 25}">
									<c:out value="${result.remark}"/>
								</c:if>
								</td>
							</tr>
						</c:forEach>
						</tbody>
				
						<!--tfoot>
						<tr class="">
							<td colspan=6 align="center"></td>
						</tr>
						</tfoot -->
					</table>
				</div>
					
			<!-- Paging Start -->
				<div align="center">
					<span class="right_board_list">
						<div id="paging_div">
							<ul class="paging_align">
		                       <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />  
		                   </ul>
						</div>
					</span>
				</div>
			<!-- Paging End -->

			<!-- Button Start -->
				<div align="right">
	
					<ul style="padding-top: 100px;">
						<li style="float: right;padding-right:10px;padding-top: 20px;">
							<a href="/com/mat/MaterialConsumption.do?codeId=<c:out value='${consumablesVO.codeId}' />"><img src="/images/egovframework/adt/btn_list.gif" border="0" /></a>
						</li>
					</ul>
				</div>
			<!-- Button End -->
			
				<!-- <input type="hidden" name="cmd">
				<input type="hidden" name="tmp_progrmNm"> -->
			</form>
<!-- ********** 여기까지 내용 *************** -->
		
		</DIV>
	</div>
	
</body>
</html>

