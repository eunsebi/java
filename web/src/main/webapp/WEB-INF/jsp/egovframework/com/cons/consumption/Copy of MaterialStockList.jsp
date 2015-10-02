<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />" ></script>

<script type="text/javaScript" language="javascript">

var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
var getContextPath = "${pageContext.request.contextPath}";
var path = "http://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.serverPort}";

/*********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_MaterialConsumption(){

	// 첫 입력란에 포커스..
	document.frm.searchKeyword.focus();
	
}


/*********************************************************
 * 조회 처리 함수
 ******************************************************** */
function fn_egov_search_MaterialConsumption(){

	document.frm.pageIndex.value = 1;
	document.frm.submit();
	
}

/*********************************************************
 * 등록 처리 함수
 ******************************************************** */
function fn_egov_regist_MaterialConsumption(){

	document.frm.action = "/com/mat/MaterialConsumptionRegister.do";
	document.frm.submit();	
	
}

/*********************************************************
 * 수정 처리 함수
 ******************************************************** */
function fn_egov_updt_MaterialConsumption(){

	document.frm.action = "/uss/olh/wor/updateWordDicaryView.do";
	document.frm.submit();	

}
/* ********************************************************
 * 상세회면 처리 함수
 ******************************************************** */
function fn_egov_inquire_MaterialConsumption(number,codeId) {		

	// 용어사전 키값(wordId) 셋팅.
	
	document.frm.number.value = number;
	document.frm.codeId.value = codeId;	
  	document.frm.action = "/com/mat/MaterialConsumptionDetailInqire.do";
  	document.frm.submit();	
	   	   		
}

/* ********************************************************
 * 설비별 List 처리 함수
 ******************************************************** */
function fn_egov_selectList_MaterialConsumption(codeId) {		

	// 용어사전 키값(wordId) 셋팅.
	
	document.frm.codeId.value = codeId;	
  	document.frm.action = "/com/mat/MaterialConsumptionMachineList.do";
  	document.frm.submit();	
	   	   		
}

 
/* ********************************************************
 * 검색 함수
 ******************************************************** */
function fn_egov_search_EventCmpgn(){
	var vFrom = document.listForm;

	vFrom.action = "<c:url value='/uss/ion/ecc/EgovEventCmpgnList.do' />";
	vFrom.submit();

}

function press(event) {
	if (event.keyCode==13) {
		fn_egov_select_noticeList('1');
	}
}

function fn_egov_select_noticeList(pageNo) {
	document.frm.pageIndex.value = pageNo;
	document.frm.codeId.value="COM300";
	document.frm.action = "<c:url value='/com/mat${prefix}/MaterialList.do'/>";
	document.frm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.frm.pageIndex.value = pageNo;
	document.frm.codeId.value = "COM300";
	document.frm.action = "/com/mat/MaterialList.do";
   	document.frm.submit();
}
</script>

</head>
<body>
<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<DIV id="content" style="width:660px">
		<div class="board_title01"><span class="black_title_text">소모품 재고 현황</span></div>
		
			<form name="frm" action="<c:url value='/com/mat/MaterialList.do'/>" method="post">

				<input name="number" type="hidden" value="" />
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input name="codeId" type="hidden" value="<c:out value='${searchVO.codeId}'/>">
				<!-- <input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" /> -->
				
	<%-- 			<div class="intro_title">
					<div class="intro_title_right">
						<div class="intro_title_right_h_img">
							<img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="" />
						</div>
						HOME &gt; <span class="intro_title_right_text"><c:out value="${brdMstrVO.bbsNm}"/></span>
					</div>
				</div> --%>
	
<%-- 				<div class="board_title01">
					<ul style="padding-top: 5px;">
						<li class="black_title_text" style="float: left;"><c:out value="${brdMstrVO.bbsNm}"/></li>
					</ul>
				</div> --%>
				
				<div class="egovframe_tablestyle">
					<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0">
						<caption>소모품 현황</caption>
						<colgroup>
						<%-- <col width="30" /> --%>
						<col width="250" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr>
								<!-- <th scope="col">번호</th> -->
								<th scope="col">종류</th>
								<th scope="col">재고</th>
								<th scope="col">마지막 입고일</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							
						<!-- loop 시작 -->
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<%-- <td>
									<strong><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></strong>
								</td> --%>
								<td>
									<div style="width:360px; text-overflow:ellipsis; overflow:hidden;">
										<span class="align_left_text">
											<strong>
												<a class="board" href="/com/mat/Consumption/selectMaterialConsumablesCode.do?codeId=<c:out value='${result.codeId }' />&amp;code=<c:out value='${result.code}'/>"><c:out value="${result.codeNm}"/></a>
											</strong>
										</span>
									</div>
								</td>
								<td>
									<c:out value="${result.qty}"/>
								</td>
								<td>
									<c:out value="${result.date}"/>
								</td>
								<td>
									<c:out value="${result.remark}"/>
								</td>
							</tr>
						</c:forEach>
						<!-- Loop 끝 -->
	
						</tbody>
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
	
				<div align="right">
	
					<ul style="padding-top: 100px;">
						<li style="float: right;padding-right:10px;padding-top: 20px;">
							<a href="/com/mat/MaterialConsumablesRegister.do?codeId=COM300"><img src="/images/egovframework/adt/btn_regist.gif" border="0" /></a>
						</li>
					</ul>
				</div>
				<!-- Button End -->
				
			</form>		
		</DIV>
	</div>
	
</body>
</html>