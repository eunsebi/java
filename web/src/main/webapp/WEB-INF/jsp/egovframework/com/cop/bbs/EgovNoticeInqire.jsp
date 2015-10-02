<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovNoticeInqire.jsp
  * @Description : 게시물 조회 화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.23   이삼섭          최초 생성
  * @ 2009.06.26   한성곤          2단계 기능 추가 (댓글관리, 만족도조사)
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title> 게시물 조회 - T2 커뮤니케이 사이트(업무사용자)   </title>
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
<link href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/js/egovframework/cop/bbs/EgovBBSMng.js" ></script>
<script type="text/javascript">

	function fn_egov_select_noticeList(pageNo){
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/' />cop/bbs/selectBoardList.do";

		
		
		

		document.frm.submit();
	}
	function fn_egov_delete_notice(){
		document.frm.action = "<c:url value='/' />cop/bbs/adm/deleteBoardArticle.do";
		document.frm.submit();
	}
	function fn_egov_moveUpdt_notice(){
		document.frm.action = "<c:url value='/' />cop/bbs/adm/forUpdateBoardArticle.do";
		document.frm.submit();
	}
	function fn_egov_addReply(){
		document.frm.action = "<c:url value='/' />cop/bbs/adm/addReplyBoardArticle.do";
		document.frm.submit();
	}
</script>



<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
	function onloading() {
		if ("<c:out value='${msg}'/>" != "") {
			alert("<c:out value='${msg}'/>");
		}
	}

	function fn_egov_select_noticeList(pageNo) {
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
		document.frm.submit();
	}

	function fn_egov_delete_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		if (confirm('<spring:message code="common.delete.msg" />')) {
			document.frm.action = "<c:url value='/cop/bbs${prefix}/deleteBoardArticle.do'/>";
			document.frm.submit();
		}
	}

	function fn_egov_moveUpdt_notice() {
		if ("<c:out value='${anonymous}'/>" == "true" && document.frm.password.value == '') {
			alert('등록시 사용한 패스워드를 입력해 주세요.');
			document.frm.password.focus();
			return;
		}

		document.frm.action = "<c:url value='/cop/bbs${prefix}/forUpdateBoardArticle.do'/>";
		document.frm.submit();
	}

	function fn_egov_addReply() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addReplyBoardArticle.do'/>";
		document.frm.submit();
	}
</script>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<c:if test="${useComment == 'true'}">
<c:import url="/cop/cmt/selectCommentList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useSatisfaction == 'true'}">
<c:import url="/cop/stf/selectSatisfactionList.do" charEncoding="utf-8">
	<c:param name="type" value="head" />
</c:import>
</c:if>
<c:if test="${useScrap == 'true'}">
<script type="text/javascript">
	function fn_egov_addScrap() {
		document.frm.action = "<c:url value='/cop/scp/addScrap.do'/>";
		document.frm.submit();
	}
</script>
</c:if>
<!-- 2009.06.29 : 2단계 기능 추가  -->
<title><c:out value='${result.bbsNm}'/> - 글조회</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>


</head>
<body onload="onloading();" bgcolor="white">

<!-- 메인탑 컨텐츠 시작 -->

		<script type="text/javascript">
		//////left메뉴 버튼 정지//////////
		<!--
		var objImg;
		var objSubImg;
		
		
		for(i=1; i<=6; i++){
			try{objImg = document.getElementById("leftMenu_btn"+'4'+"_"+i);}catch(err){objImg=null;}
			try{objSubImg = document.getElementById("leftMenu_sub"+'4'+"_"+'1'+"_"+i);}catch(err){objSubImg=null;}
		
			if(i == '1'){
				if(objImg){objImg.src = objImg.src.replace(i+"off", i+"on");}
			}
		
			if(i == ''){
				if(objSubImg){objSubImg.src = objSubImg.src.replace('1'+"_0"+i+"off", '1'+"_0"+i+"on");}
			}
		}
		//-->
		</script>

	<div id="center_body">
<!-- 		<div class="intro_img">

			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			 
		</div> -->
		<div class="intro_title">
   			<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="<c:url value='/' />images/egovframework/adt/img_home.gif" width="11" height="11" alt="" /></div> HOME &gt; <span class="intro_title_right_text">${brdMstrVO.bbsNm}</span></div>
		</div>


		<!-- 게시판 시작 -->
		<div style="float: left; width: 653px;">
			<form name="frm" method="post" action="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>">
				<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>" />
				<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
				<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
				<input type="hidden" name="parnts" value="<c:out value='${result.parnts}'/>" />
				<input type="hidden" name="sortOrdr" value="<c:out value='${result.sortOrdr}'/>" />
				<input type="hidden" name="replyLc" value="<c:out value='${result.replyLc}'/>" />
				<input type="hidden" name="nttSj" value="<c:out value='${result.nttSj}'/>" />
				<input type="submit" id="invisible" class="invisible" />
			
				<div class="board_title01">
					<ul>
						<li class="black_title_text" style="float: left;">
							<span class="black_title_text">${brdMstrVO.bbsNm} - 글조회</span>
							<c:if test="${result.bbsId == 'BBSMSTR_000000000002' || result.bbsId == 'BBSMSTR_000000000012' }">
								<font color="blue">소모품(필터 등 기타) 재고 사용한것은 등록 하고 있는거죠???</font>
							</c:if>
						</li>
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
							<td colspan="5"><span class="title"><c:out value="${result.nttSj}" /></span></td>
						</tr>
						<tr>
							<th scope="col">작성자</th>
							<td>
						<c:choose>
							<%-- <c:out value="${result.frstRegisterNm}" /> --%>
							<c:when test="${anonymous == 'true'}">
							 ******
							</c:when>
							<c:when test="${result.ntcrNm == ''}">
								<c:out value="${result.frstRegisterNm}" />
							</c:when>
							<c:otherwise>
								<c:out value="${result.ntcrNm}" />
							</c:otherwise>
						</c:choose>    
							</td>
							<th scope="col">작성일</th>
							<td><span class="date_etc_color"><c:out value="${result.frstRegisterPnttm}" /></span></td>
							<th scope="col">조회</th>
							<td><span class="date_etc_color"><c:out value="${result.inqireCo}" /></span></td>
						</tr>
						
				<c:if test="${not empty result.atchFileId}">
					<c:if test="${result.bbsAttrbCode == 'BBSA02'}">
						<tr> 
							<th scope="row">첨부이미지</th>
							<td colspan="5">
								<div>
									<c:import url="/cmm/fms/selectImageFileInfs.do" charEncoding="utf-8">
										<c:param name="atchFileId" value="${result.atchFileId}" />
									</c:import>
								</div>
							</td>
						</tr>
					</c:if>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="5">
								<div>
									<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${result.atchFileId}" />
									</c:import>
								</div>
							</td>
						</tr>
				</c:if>
						
						<tr>
							<td colspan="6">
								<div class="attach_content" style="padding-left:4px;color:#000000;">
						 			<c:out value="${result.nttCn}" escapeXml="false" />
								</div>
							</td>
						</tr>
						
					<c:if test="${anonymous == 'true'}">
						<tr> 
							<th height="23"><label for="password"><spring:message code="cop.password" /></label></th>
							<td colspan="5">
								<input name="password" title="암호" type="password" size="20" value="" maxlength="20" />
							</td>
						</tr>
					</c:if>
					</table>
				</div>
			                          
				<div class="btn_area">
					<div class="ser_btn">
				
					<!-- 버튼 시작(상세지정 style로 div에 지정) -->
						<div class="buttons" style="padding-top:10px;padding-bottom:10px;">
						<!-- 목록/저장버튼  -->
							<table border="0" cellspacing="0" cellpadding="0" align="center">
								<tr>
								<c:choose>
									<c:when test="${result.bbsId == 'BBSMSTR_000000000002' || result.bbsId == 'BBSMSTR_000000000012' }">
								<!-- Inform 게시판 같은 그룹 수정/삭제 -->
									<c:if test="${boardFrstRegisterGroupId == loginUserGroupId}">
									<td>
										<span class="button">
											<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a> 
										</span>
									</td>
									<td width="10"></td>
									<td>
										<span class="button">
											<a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">삭제</a>
										</span> 
									</td>
									</c:if>
								<!-- -->
									</c:when>

									<c:when test="${result.bbsId != 'BBSMSTR_000000000002' || result.bbsId != 'BBSMSTR_000000000012' }">
								<!-- 작성자 수정/삭제 -->
											<c:if test="${result.frstRegisterId == sessionUniqId}">
												<td>
													<span class="button">
														<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a>
													</span> 
												</td>
												<td width="10"></td>
												<td>
													<span class="button">
														<a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">삭제</a>
													</span> 
												</td>
											</c:if>
									
								<!-- -->
										<!-- 관리자 수정/삭제-->
										<%-- 권한 : <c:out value="${userAuthorities }" /> --%>
	 										<c:if test="${userAuthorities == '[IS_AUTHENTICATED_ANONYMOUSLY, IS_AUTHENTICATED_FULLY, IS_AUTHENTICATED_REMEMBERED, ROLE_ADMIN, ROLE_ANONYMOUS, ROLE_RESTRICTED, ROLE_USER]'}">
												<td>
													<span class="button">
														<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">관리자수정</a>
													</span> 
												</td>
												<td width="10"></td>
												<td>
													<span class="button">
														<a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">관리자삭제</a>
													</span> 
												</td>
											</c:if>
									</c:when>
									
								</c:choose>

								<c:if test="${result.replyPosblAt == 'Y'}">     
									<td width="10"></td>
									<td>
										<span class="button">
											<a href="#LINK" onclick="javascript:fn_egov_addReply(); return false;">답글작성</a>
										</span> 
									</td>
								</c:if>
									<td width="10"></td>
									<td>
										<span class="button">
											<a href="#LINK" onclick="javascript:fn_egov_select_noticeList('1'); return false;">목록</a>
										</span> 
									</td>
		
						<!-- 2009.06.29 : 2단계 기능 추가  -->
								<c:if test="${useScrap == 'true'}">
									<td width="10"></td>
									<td>
										<span class="button">
											<a href="#LINK" onclick="javascript:fn_egov_addScrap(); return false;">스크랩</a>
										</span> 
									</td>
								</c:if>
						<!-- 2009.06.29 : 2단계 기능 추가  -->
								</tr>
							</table>
						</div>  
					<!-- 버튼 끝 -->
					
					<!-- <a href="javascript:fn_egov_select_noticeList('1')" class="button_01"><img src="/images/egovframework/adt/board/btn_list.gif" width="69" height="34" alt="목록"/></a> -->
				  
					</div>
				</div>
				
				<!-- 추가 기능 -->
				<div align="center">
					<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
							<td width="100%">
					
						<!-- 2009.06.29 : 2단계 기능 추가  -->
							<c:if test="${useComment == 'true'}">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
				
								<c:import url="/cop/cmt${prefix}/selectCommentList.do" charEncoding="utf-8">
									<c:param name="type" value="body" />
								</c:import>
							</c:if>
				
							<c:if test="${useSatisfaction == 'true'}">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="10"></td>
									</tr>
								</table>
				
								<c:import url="/cop/stf${prefix}/selectSatisfactionList.do" charEncoding="utf-8">
									<c:param name="type" value="body" />
								</c:import>
							</c:if>
						<!-- 2009.06.29 : 2단계 기능 추가  -->
				
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<!-- 게시판 끝 -->
	</div>
</body>
</html>
