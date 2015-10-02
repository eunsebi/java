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
<title>소모품 상세보기</title>

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

<script type="text/javascript" src="/js/egovframework/cop/bbs/EgovBBSMng.js" ></script>
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
 * 설비별 목록회면 처리 함수
 ******************************************************** */
function fn_egov_select_noticeList(pageNo,codeId,code){
	document.MaterialConsumptionForm.pageIndex.value = pageNo;
	document.MaterialConsumptionForm.codeId.value = codeId;
	document.MaterialConsumptionForm.code.value = code;
	document.MaterialConsumptionForm.action = "/com/mat/Consumption/selectMaterialConsumablesCode.do";
	document.MaterialConsumptionForm.submit();
}
 
/* ********************************************************
 * 삭제 처리 함수
 ******************************************************** */
function fn_egov_delete_notice(cmd,number){
	var vFrom = document.MaterialConsumptionForm;
	if(confirm("삭제 하시겠습니까?")){
		vFrom.number.value = number;
		vFrom.cmd.value = 'del';
		vFrom.action = "<c:url value='/com/mat/Consumption/selectMaterialDeleteConsumables.do' />";
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
</script>

</head>
<body>
<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
<!-- 		<div class="intro_img">

			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			 
		</div> -->
		<div class="intro_title">
   			<div class="intro_title_right">
   				<div class="intro_title_right_h_img">
   					<img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="" />
   				</div>
   				HOME &gt; <span class="intro_title_right_text"><c:out value='${machineNm }' /></span>
   			</div>
		</div>


		<!-- 게시판 시작 -->
		<div style="float: left; width: 653px;">
			<form name="MaterialConsumptionForm" method="post" action="<c:url value='/com/mat${prefix}/MaterialConsumptionMachineList.do'/>">
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
				<input type="hidden" name="number" value="<c:out value='${result.number}'/>" />
				<input type="hidden" name="codeId" value="<c:out value='${result.codeId}'/>" />
				<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
				<input type="hidden" name="code" value="" />
				<input type="hidden" name="cmd" value="" />
				<input type="submit" id="invisible" class="invisible" />
			
				<div class="board_title01">
					<ul>
						<li class="black_title_text" style="float: left;"><span class="black_title_text"><c:out value='${result.codeNm }' /> - 글조회</span></li>
				<!--		
							<li style="float: left;">&nbsp;&nbsp;&nbsp; 다운로드는 로그인 후 받을 수 있습니다. &nbsp;&nbsp;</li>
							<li style="float: left;"><a href="javascript:goTargetPage('/uat/uia/egovLoginUsr.do')"><img src="/images/egovframework/adt/btn_movelogin.gif" width="113" height="20" alt="로그인으로 이동" /></a></li>
				-->		
					</ul>
				</div>
			
				<!-- 2010915 table_detailview add -->
				<div class="egovframe_table_detail" >
					<table summary="faq list" cellpadding="" cellspacing="0">
						<caption>실행환경/글조회</caption>
						<tr>
							<th scope="row">제목</th>
							<td colspan="5"><span class="title"><c:out value="${result.sCodeNm}" /></span></td>
						</tr>
						<tr>
							<th scope="col">작성자</th>
							<td>
								<c:out value="${result.frstRegisterNm}" />
							</td>
							<th scope="col">작성일</th>
							<td><span class="date_etc_color"><c:out value="${result.firstRegisterPnttm}" /></span></td>
						</tr>
						<tr>
							<th scope="col">교체일</th>
							<td><span class="title"><c:out value="${result.date}" /></span></td>
							<th scope="col">입고수량</th>
							<td><c:out value="${result.inQty}" /></td>
						</tr>

						<tr>
							<th scope="col">교체설비명</th>
							<td><span class="title"><c:out value="${result.codeNm}" /></span></td>
							<th scope="col">교체수량</th>
							<td><c:out value="${result.changeQty}" /></td>
						</tr>
						<tr>
							<th scope="row">비고</th>
							<td colspan="5" height="100"><span class="date_etc_color"><c:out value="${result.remark}" /></span></td>
						</tr>
					</table>
				</div>
			                          
				<div class="btn_area">
					<div class="ser_btn">
				
					<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="buttons" style="padding-top:10px;padding-bottom:10px;">
						<!-- 목록/저장버튼  -->
							<table border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
								<c:if test="${result.firstRegisterId == sessionUniqId}">     
									<td>
										<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a>
									</td>
									<td width="10"></td>
									<td>
										<a href="#LINK" onclick="javascript:fn_egov_delete_notice('del','<c:out value='${result.number}'/>'); return false;">삭제</a> 
									</td>
								</c:if>    
									<td width="10"></td>
									<td>
										<a href="#LINK" onclick="javascript:fn_egov_select_noticeList('<c:out value='${searchVO.pageIndex}'/>','<c:out value="${result.codeId}" />','<c:out value="${result.code}" />'); return false;">목록</a> 
									</td>
		
								</tr>
							</table>
						</div>  
					<!-- 버튼 끝 -->
					
					<!-- <a href="javascript:fn_egov_select_noticeList('1')" class="button_01"><img src="/images/egovframework/adt/board/btn_list.gif" width="69" height="34" alt="목록"/></a> -->
				  
					</div>
				</div>
				
			</form>
		</div>
		<!-- 게시판 끝 -->
	</div>
	
</body>
</html>