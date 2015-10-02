<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ page import="java.util.*, java.text.*"  %>
<%
 /**
  * @Class Name : EgovNoticeRegist.jsp
  * @Description : 게시물  생성 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.24   이삼섭          최초 생성
  *   2011.09.15   서준식          유효기간 시작일이 종료일보다 빠른지 체크하는 로직 추가
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.24
  *  @version 1.0
  *  @see
  *
  */
%>
<%

//오늘 날짜 데이터
String thisDay = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(new java.util.Date());
//System.out.println("thisDay : " + thisDay);
//하루 증가된 날짜 계산을 위해서 
String thisDayMore = thisDay.replaceAll("-","");
int thisDayMoreInt = Integer.parseInt(thisDayMore);
thisDayMoreInt = thisDayMoreInt+14;
thisDayMore = String.valueOf(thisDayMoreInt);

//System.out.println("thisDayMoreInt : " + thisDayMoreInt);
//System.out.println("ThisDayMore1 : " + thisDayMore);

SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd"); 
Date date = sdfmt.parse(thisDayMore);

thisDayMore = new java.text.SimpleDateFormat ("yyyyMMdd").format(date);

//System.out.println("ThisDayMore2 : " + thisDayMore);

%>
<html lang="ko">
<head>
<title> 게시물 등록 - <c:out value="${brdMstrVO.bbsNm}"/> </title>
<!-- header_css -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="KO" />

<link href="<c:url value='/css/egovframework/adt/index_layout.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/header.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/leftmenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/quickmenu.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/footer.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/headerAdmin.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/adt/adminLeftmenu.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/adt/board_layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/guide/egovcmm_layout.css' />" rel="stylesheet" type="text/css" />

<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css" />
<%-- <link href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" rel="stylesheet" type="text/css" /> --%>
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css" />


<script type="text/javascript">
_editor_area = "nttCn";
_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>";
</script>

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<%-- <script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea/EgovWebEditor.js'/>" ></script> --%>
<script type="text/javascript" src="<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/htmlarea.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous"/>
</c:if>
<script type="text/javascript">
	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
		//document.mtboard.onsubmit();

		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);


		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}

		if (!validateBoard(document.board)){
			return;
		}

		if (confirm('<spring:message code="common.regist.msg" />')) {
			//document.board.onsubmit();
			document.board.action = "<c:url value='/com/mtb${prefix}/insertMTBoardArticle.do'/>";
			document.board.submit();
		}
	}

	function fn_egov_select_noticeList() {
		document.board.action = "<c:url value='/com/mtb${prefix}/selectMTBoardList.do'/>";
		document.board.submit();
	}
	function makeFileAttachment(){
	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		 var maxFileNum = document.board.posblAtchFileNumber.value;
	     if(maxFileNum==null || maxFileNum==""){
	    	 maxFileNum = 3;
	     }
		 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
		 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	</c:if>	
	}

	/* ********************************************************
	* 체크 박스 선택 함수
	******************************************************** */
	function fn_egov_checkAll_number(){

		var FLength = document.getElementsByName("number").length;
		var checkAllValue = document.getElementById('checkAll').checked;

		//undefined
		if( FLength == 1){
			document.board.number.checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("number")[i].checked = checkAllValue;
				}
		}

	}
	
	function fn_egov_checkAll_name_1(){

		var FLength = document.getElementsByName("name_01").length;
		var checkAllValue = document.getElementById('checkName1All').checked;

		//undefined
		if( FLength == 1){
			document.board.name_01.checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("name_01")[i].checked = checkAllValue;
				}
		}

	}
	
	function fn_egov_checkAll_name_2(){

		var FLength = document.getElementsByName("name_02").length;
		var checkAllValue = document.getElementById('checkName2All').checked;

		//undefined
		if( FLength == 1){
			document.board.name_02.checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("name_02")[i].checked = checkAllValue;
				}
		}

	}
	
	function fn_egov_checkAll_spec_1(){

		var FLength = document.getElementsByName("spec_01").length;
		var checkAllValue = document.getElementById('checkSpec1All').checked;

		//undefined
		if( FLength == 1){
			document.board.spec_01.checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("spec_01")[i].checked = checkAllValue;
				}
		}

	}
	
	function fn_egov_checkAll_spec_2(){

		var FLength = document.getElementsByName("spec_02").length;
		var checkAllValue = document.getElementById('checkSpec2All').checked;

		//undefined
		if( FLength == 1){
			document.board.spec_02.checked = checkAllValue;
		}{
				for(var i=0; i < FLength; i++)
				{
					document.getElementsByName("spec_02")[i].checked = checkAllValue;
				}
		}

	}
	
	/* ********************************************************
	* 주관 부서 팝업창열기
	******************************************************** */
	function fn_egov_schdulDept_DeptSchdulManage(){

		var arrParam = new Array(1);
		arrParam[0] = self;
		arrParam[1] = "typeDeptSchdule";

		window.showModalDialog("<c:url value='/uss/olp/mgt/EgovMeetingManageLisAuthorGroupPopup.do' />", arrParam ,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
	}
	
	function onClick() {
		var sh = document.getElementById("kind");
		var ot = sh.options[sh.selectedIndex].value;
		var name_01 = document.getElementsByName("name_01");	//메인탱크
		var name_02 = document.getElementsByName("name_02");	//존
		var spec_01 = document.getElementsByName("spec_01");	//하우징
		var spec_02 = document.getElementsByName("spec_02");	//수세
		var spec_03 = document.getElementsByName("spec_03");	//액절
		var size = document.getElementsByName("size");			//노즐
		
		if (ot == 1){
			name_01[0].checked=true;
			name_01[1].checked=true;
			name_01[2].checked=true;
			name_02[0].checked=true;
			name_02[1].checked=true;
			name_02[2].checked=true;
			spec_01[0].checked=true;
			spec_01[1].checked=true;
			spec_01[2].checked=true;
			spec_02[0].checked=true;
			spec_02[1].checked=true;
			spec_02[2].checked=true;
			spec_03[0].checked=true;
			size[0].checked=true;
		} else if (ot == 2){
			name_01[0].checked=true;
			name_01[1].checked=false;
			name_01[2].checked=false;
			name_02[0].checked=true;
			name_02[1].checked=false;
			name_02[2].checked=false;
			spec_01[0].checked=true;
			spec_01[1].checked=false;
			spec_01[2].checked=false;
			spec_02[0].checked=true;
			spec_02[1].checked=false;
			spec_02[2].checked=false;
			spec_03[0].checked=true;
			size[0].checked=true;
		} else {
			name_01[0].checked=false;
			name_01[1].checked=false;
			name_01[2].checked=false;
			name_02[0].checked=false;
			name_02[1].checked=false;
			name_02[2].checked=false;
			spec_01[0].checked=false;
			spec_01[1].checked=false;
			spec_01[2].checked=false;
			spec_02[0].checked=false;
			spec_02[1].checked=false;
			spec_02[2].checked=false;
			spec_03[0].checked=false;
			size[0].checked=false;
		}
		
		if (ot == 1) {
			kind = "DES";
		} else if (ot == 2) {
			kind = "현상";
		}
	}

	
</script>
<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>
<!-- body onload="javascript:editor_generate('nttCn');"-->
<!-- <body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus(); makeFileAttachment();"> -->
<body>

<!-- 메인탑 컨텐츠 시작 -->

	<div id="center_body">
		<!-- 게시판 시작 -->

		<div style="float: left; width: 800px;">
		
			<form:form commandName="board" name="mtboard" method="post" enctype="multipart/form-data" >
			
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				<input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
				<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
				<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
				<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
				<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
				<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
				<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
				<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
				
				<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
				<input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />
				
				<c:if test="${anonymous != 'true'}">
				<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
				<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
				</c:if>
				
				<c:if test="${bdMstr.bbsAttrbCode != 'MTBBSA03'}">
				   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
				   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
				</c:if>
				
				<div class="board_title01">
					<span class="black_title_text"><c:out value='${bdMstr.bbsNm}'/> 내용등록</span>
				</div>
				
				<div class="list_ar">
	<c:choose>
		<c:when test="${bdMstr.bbsAttrbCode == 'MTBBSA01'}">
					<!-- DI 노광 거버 등록 -->
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">종류
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input type="hidden" name="nttSj" value="DI 거버등록" />
		    					<input name="kind" type="checkbox" value="양산" title="양산"/>양산&nbsp;&nbsp;&nbsp;
		    					<input name="kind" type="checkbox" value="개발" title="개발"/>개발
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">부서
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input id="schdulDeptName" path="schdulDeptName" name="schdulDeptName" size="20" type="text" title="부서" />
					    			<a href="#" onClick="fn_egov_schdulDept_DeptSchdulManage()">
										<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="부서" title="부서">
									</a>
								<input type="hidden" id = "schdulDeptId" path="schdulDeptId" name="schdulDeptId" />
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">모델명
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input name="model" type="text" size="20" title="모델명"/>
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">Revision
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input name="rev" type="text" size="20" title="Revision">
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">등록명
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								상판 <input name="name_01" type="text" size="16" title="상판등록명"/>
		    					하판 <input name="name_02" type="text" size="16" title="하판등록명"/>
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">조건
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
				    			광량 <input name="spec_01" type="text" size="5" title="광량"/>mJ&nbsp;
		    					파장 <input name="spec_02" type="text" size="5" title="파장"/>%&nbsp;
		    					offset <input name="spec_03" type="text" size="5" title="offset"/>
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">사이즈
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input name="size" type="text" size="10" title="사이즈"/>
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">파일위치
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
				    			<input name="location" type="text" size="30" title="위치"/>
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">등록호기
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_700">
							<span class="mt_name_left_700">
								<input name="number" type="checkbox" id="checkAll" value="0" onClick="fn_egov_checkAll_number();" title="전체호기"/>전체호기&nbsp;&nbsp;
				    			<c:forEach begin="1" end="8" step="1" var="result">
									<input name="number" type="checkbox" value="${result }" title="${result }호기"/>${result }호기 &nbsp;&nbsp;
								</c:forEach>
								<br/><form:errors path="number" />
							</span>
						</li>
					</ul>
		</c:when>
		
		<c:when test="${bdMstr.bbsAttrbCode == 'MTBBSA02'}">
			<!-- PM 현황 등록  -->
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">공정
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<select id="kind" name="kind" path="kind" onchange="onClick();">
									<option value="0">선택</option>
									<option value="1">DES</option>
									<option value="2">현상</option>
								</select>
				    			<form:errors path="kind" />
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">PM진행조
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input type="hidden" name="nttSj" value="PM 진행" />
								<input name="location" type="checkbox" value="주간" title="주간" />주간&nbsp;&nbsp;&nbsp;
			    				<input name="location" type="checkbox" value="야간" title="야간" />야간&nbsp;&nbsp;&nbsp;
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">부서
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input id="schdulDeptName" path="schdulDeptName" name="schdulDeptName" type="text" title="부서" />
				    			<a href="#" onClick="fn_egov_schdulDept_DeptSchdulManage()">
									<img src="<c:url value='/images/egovframework/com/cmm/icon/search2.gif' />" align="middle" style="border:0px" alt="부서" title="부서">
								</a>
								<input type="hidden" id = "schdulDeptId" path="schdulDeptId" name="schdulDeptId" />
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">PM일
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input id="changedate" type="hidden" name="changedate" />
				      			<input name="changedateView" type="text" size="10" value="<%=thisDay %>" readOnly onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" title="게시시작일자입력">
								<img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.changedate, document.board.changedateView);" width="15" height="15" alt="달력창팝업버튼이미지">
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">PM호기
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<c:forEach begin="1" end="4" step="1" var="result">
									<input name="number" type="checkbox" value="${result }" title="${result }호기"/>${result }호기&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<form:errors path="number" />
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">&nbsp;</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">&nbsp;</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">메인탱크
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
				    			<input name="name_01" type="checkbox" value="1" title="현상"/>현상&nbsp;&nbsp;&nbsp;
				    			<input name="name_01" type="checkbox" value="2" title="에칭"/>에칭&nbsp;&nbsp;&nbsp;
				    			<input name="name_01" type="checkbox" value="3" title="박리"/>박리&nbsp;&nbsp;&nbsp;
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">Zone 내부
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
				    			<input name="name_02" type="checkbox" value="1" title="현상"/>현상&nbsp;&nbsp;&nbsp;
				    			<input name="name_02" type="checkbox" value="2" title="에칭"/>에칭&nbsp;&nbsp;&nbsp;
				    			<input name="name_02" type="checkbox" value="3" title="박리"/>박리&nbsp;&nbsp;&nbsp;
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">하우징 필터
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input name="spec_01" type="checkbox" value="1" title="현상"/>현상&nbsp;&nbsp;&nbsp;
				    			<input name="spec_01" type="checkbox" value="2" title="에칭"/>에칭&nbsp;&nbsp;&nbsp;
				    			<input name="spec_01" type="checkbox" value="3" title="박리"/>박리&nbsp;&nbsp;&nbsp;
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">수세 필터
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
				    			<input name="spec_02" type="checkbox" value="1" title="현상"/>현상&nbsp;&nbsp;&nbsp;
				    			<input name="spec_02" type="checkbox" value="2" title="에칭"/>에칭&nbsp;&nbsp;&nbsp;
				    			<input name="spec_02" type="checkbox" value="3" title="박리"/>박리&nbsp;&nbsp;&nbsp;
							</span>
						</li>
					</ul>
					<ul>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">액절롤러
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<input name="spec_03" type="checkbox" value="0" title="세척"/>세척&nbsp;&nbsp;&nbsp;
			    				<input name="spec_03" type="checkbox" value="1" title="교체"/>교체&nbsp;&nbsp;&nbsp;
							</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">노즐
								<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
			    				<input name="size" type="checkbox" value="0" title="세척"/>세척&nbsp;&nbsp;&nbsp;
			    				<input name="size" type="checkbox" value="1" title="교체"/>교체&nbsp;&nbsp;&nbsp;
							</span>
						</li>
					</ul>
		</c:when>
	</c:choose>								

	<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
		<!-- 첨부 파일 사용 유/무 -->
					<ul>
						<%-- <li class="b_name_55"><span class="b_name01"><spring:message code="cop.atchFile" /></span></li> --%>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">첨부파일&nbsp;</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">
								<label for="egovComFileUploader" style="display: none;">첨부파일</label>
					    		<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력"/>
					    	</span>
						</li>
						<li class="table_list_left_100">
							<span class="mt_name_right_100">&nbsp;</span>
						</li>
						<li class="table_list_left_300">
							<span class="mt_name_left_300">&nbsp;</span>
						</li>
					</ul>
	</c:if>
						
				</div>
				<div id="egovComFileList"></div>
				<div class="content_01">
					<div><img src="<c:url value='/' />images/egovframework/adt/bu11.gif" alt="내용이미지" width="620" height="28"></div>
					<div class="gray_bg09">
						<ul>
							<li style="background-color: #ffffff;width: 101%;margin-left: 13px;">
								<label for="qestnCn" style="display: none;">
									<spring:message code="cop.nttCn" />
				    				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
								</label>
			      				<textarea id="nttCn" name="nttCn" cols="75" rows="7" style="width:600px;" title="내용입력" ></textarea>
								<form:errors path="nttCn" />
							</li>
						</ul>
					</div>
					<div>
					<img src="/images/egovframework/adt/gu_bot.gif" alt="내용바닥이미지" width="620" height="12"></div>
				</div>
				
				<!--  -->
<c:choose>
			  	<c:when test="${bdMstr.bbsAttrbCode == 'MTBBSA03'}">
				  <tr>
				    <th height="23" class="emphasisRight"><spring:message code="cop.noticeTerm" />
				    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
				    <td colspan="3">
				      <input id="ntceBgnde" name="ntceBgnde" type="hidden" >
				      <input name="ntceBgndeView" type="text" size="10" value="" readOnly onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" title="게시시작일자입력">
				      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" width="15" height="15" alt="달력창팝업버튼이미지">
				      ~
				      <input id="ntceEndde" name="ntceEndde" type="hidden"  />
				      <input name="ntceEnddeView" type="text" size="10" value="" readOnly onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);" title="게시종료일자입력">
				      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />" onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);" width="15" height="15" alt="달력창팝업버튼이미지">
					    <br/><form:errors path="ntceBgnde" />
					    <br/><form:errors path="ntceEndde" />
				    </td>
				  </tr>
			  	</c:when>
			  	<c:when test="${anonymous == 'true'}">
				  <tr>
				    <th height="23" class="emphasisRight"><spring:message code="cop.ntcrNm" />
				    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
				    <td colspan="3">
				      <input name="ntcrNm" type="text" size="20" value="" maxlength="10" title="작성자이름입력">
				    </td>
				  </tr>
				  <tr>
				    <th height="23" class="emphasisRight"><spring:message code="cop.password" />
				    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
				    <td colspan="3">
				      <input name="password" type="password" size="20" value="" maxlength="20" title="비밀번호입력">
				    </td>
				  </tr>
			  	</c:when>
			  </c:choose>
				<!--  -->
				
				<div class="btn_area">
			<c:if test="${bdMstr.authFlag == 'Y'}">	
					<div class="ser_btn"><input type="image" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:fn_egov_regist_notice();return false;" class="button_01" src="<c:url value='/' />images/egovframework/adt/btn_regist.gif" width="65" height="28" alt="등록">	</div>
			</c:if>
		    		<div class="ser_btn"><input type="image" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_noticeList();return false;" class="button_01" src="<c:url value='/' />images/egovframework/adt/btn_list.gif" width="65" height="28" alt="목록"></div>
				</div>

			</form:form>
		</div>
		<!-- 게시판 끝 -->
	</div>
</body>
</html>
