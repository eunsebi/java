<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
<html lang="ko">
<head>
<title> 게시물 등록 - <c:out value="${brdMstrVO.bbsNm}"/> </title>
<!-- header_css -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="KO" />

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
<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
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
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function fn_egov_validateForm(obj) {
		return true;
	}

	function fn_egov_regist_notice() {
		document.board.onsubmit();


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
<body onLoad="HTMLArea.init(); HTMLArea.onload = initEditor; document.board.nttSj.focus(); makeFileAttachment();">

<!-- 메인탑 컨텐츠 시작 -->

	<div id="center_body">
<!-- 			<div class="intro_img">
				<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			</div> -->
		<div class="intro_title">
   			<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="/images/egovframework/adt/img_home.gif" width="11" height="11" alt="HOME이미지"></div> HOME &gt; <span class="intro_title_right_text"><c:out value='${bdMstr.bbsNm}'/></span></div>
  			</div>
  			<!-- <div class="intro_title_img">
  				<h3><img src="/images/egovframework/adt/img_h3_title05.gif" width="90" height="17" alt="개발자지원"/></h3>
  				<br/>
  			</div> -->
		<!-- 게시판 시작 -->

		<div style="float: left; width: 653px;">
		
		<form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
		
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
		
		<c:if test="${bdMstr.bbsAttrbCode != 'MTBBSA02'}">
		   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
		   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
		</c:if>
		
		<div class="board_title01"><span class="black_title_text"><c:out value='${bdMstr.bbsNm}'/> 내용등록</span></div>
		<div class="list_ar">
			<ul class="table_list02">
				<li class="b_name_55">
					<span class="b_name01">
						<spring:message code="cop.nttSj" />
			    		<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
			    	</span>
			    </li>
				<li class="b_name_100">
					<label for="qestnSj" style="display: none;">제목</label>
					<input name="nttSj" type="text" size="60" value=""  maxlength="60" title="제목입력" />
					<br/><form:errors path="nttSj" />
				</li>
			</ul>
		
			<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
			<ul class="table_list03">
				<li class="b_name_55"><span class="b_name01"><spring:message code="cop.atchFile" /></span></li>
				<li class="b_name_100">
					<label for="egovComFileUploader" style="display: none;">첨부화일</label>
		    		<input name="file_1" id="egovComFileUploader" type="file" title="첨부파일입력"/>
				</li>
			</ul>
			</c:if>
		  	  
			<div id="egovComFileList"></div>
			<div class="content_01">
				<div><img src="/images/egovframework/adt/bu11.gif" alt="내용이미지" width="620" height="28"></div>
				<div class="gray_bg09">
					<ul>
						<li style="background-color: #ffffff;width: 101%;margin-left: 13px;">
							<label for="qestnCn" style="display: none;">
								<spring:message code="cop.nttCn" />
			    				<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시">
							</label>
		      				<textarea id="nttCn" name="nttCn" cols="75" rows="17" style="width:600px;" title="내용입력" ></textarea>
							<form:errors path="nttCn" />
						</li>
					</ul>
				</div>
				<div><img src="/images/egovframework/adt/gu_bot.gif" alt="내용바닥이미지" width="620" height="12"></div>
			</div>
		
			  <c:choose>
			  	<c:when test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
				  <tr>
				    <th height="23" class="emphasisRight"><spring:message code="cop.noticeTerm" />
				    <img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
				    <td colspan="3">
				      <input id="ntceBgnde" name="ntceBgnde" type="hidden" >
				      <input name="ntceBgndeView" type="text" size="10" value=""  readOnly
				      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);" title="게시시작일자입력">
				      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"
				      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView);"
					    width="15" height="15" alt="달력창팝업버튼이미지">
				      ~
				      <input id="ntceEndde" name="ntceEndde" type="hidden"  />
				      <input name="ntceEnddeView" type="text" size="10" value=""  readOnly
				      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);" title="게시종료일자입력">
				      <img src="<c:url value='/images/egovframework/com/cmm/icon/bu_icon_carlendar.gif' />"
				      	onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView);"
					    width="15" height="15" alt="달력창팝업버튼이미지">
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
			  	<c:otherwise>
		
			  	</c:otherwise>
			  </c:choose>	
		
			<div class="btn_area">
		    	<div class="ser_btn"><input type="image" value="<spring:message code="button.list" />" title="<spring:message code="button.list" />" onclick="javascript:fn_egov_select_noticeList();return false;" class="button_01" src="/images/egovframework/adt/btn_list.gif" width="65" height="28" alt="목록"></div>
				<c:if test="${bdMstr.authFlag == 'Y'}">	
				<div class="ser_btn"><input type="image" value="<spring:message code="button.create" />" title="<spring:message code="button.create" />" onclick="javascript:fn_egov_regist_notice();return false;" class="button_01" src="/images/egovframework/adt/btn_regist.gif" width="65" height="28" alt="등록"></div>
				</c:if>
			</div>
		</div>
		</form:form>
		</div>
		<!-- 게시판 끝 -->
	</div>
</body>
</html>
