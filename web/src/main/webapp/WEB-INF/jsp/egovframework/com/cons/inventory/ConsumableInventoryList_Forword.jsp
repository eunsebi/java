<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/bbs/"/>
<%
 /**
  * @Class Name : EgovNoticeList.jsp
  * @Description : 게시물 목록화면
  * @Modification Information
  * @
  * @  수정일      수정자            수정내용
  * @ -------        --------    ---------------------------
  * @ 2009.03.19   이삼섭          최초 생성
  * @ 2011.11.11   이기하          익명게시판 검색시 작성자 제거
  *
  *  @author 공통서비스 개발팀 이삼섭
  *  @since 2009.03.19
  *  @version 1.0
  *  @see
  *
  */
%>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title> 게시물 목록 - <c:out value="${brdMstrVO.bbsNm}"/> </title>
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

<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />" ></script>
<c:choose>
<c:when test="${preview == 'true'}">
<script type="text/javascript">
<!--
	function press(event) {
	}

	function fn_egov_addNotice() {
	}

	function fn_egov_select_noticeList(pageNo) {
	}

	function fn_egov_inqire_notice(nttId, bbsId) {
	}
//-->
</script>
</c:when>
<c:otherwise>
<script type="text/javascript">
<!--
	function press(event) {
		if (event.keyCode==13) {
			fn_egov_select_noticeList('1');
		}
	}

	/* function fn_egov_addNotice() {
		document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
		document.frm.submit();
	} */

	function fn_egov_select_noticeList(pageNo) {
		/* if(document.frm.searchWrd.value.trim() == ''){
			alert("검색어를 입력해 주세요.");
			document.frm.searchWrd.value = "";
			document.frm.searchWrd.focus();
			return false;
		} */
		document.frm.pageIndex.value = pageNo;
		document.frm.action = "<c:url value='/com/cons/consumableInventoryList.do'/>";
		document.frm.submit();
	}

	/* function fn_egov_inqire_notice(i, nttId, bbsId) {
		document.subForm.nttId.value = nttId;
		document.subForm.bbsId.value = bbsId;
		document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
		document.subForm.submit();
	} */
//-->
</script>
</c:otherwise>
</c:choose>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
var getContextPath = "${pageContext.request.contextPath}";
var path = "http://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.serverPort}";
</script>
<script language="javascript1.2" src="<c:url value='/js/egovframework/com/sym/mnu/mpm/EgovMainMenu.js' />" ></script>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

</head>

<body>

<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
<!-- 		<div class="intro_img">
			
			<h1><img src="/images/egovframework/adt/egov_search_data_title_temp.gif" width="653" height="152" alt="T2 Maint Communication"/></h1>
			
		</div> -->
		<div class="intro_title">

			<div class="intro_title_right"><div class="intro_title_right_h_img"><img src="<c:url value='/' />images/egovframework/adt/img_home.gif" width="11" height="11" alt="" /></div> HOME &gt; <span class="intro_title_right_text"><c:out value="${brdMstrVO.bbsNm}"/></span></div>

		</div>
		
		<!-- 게시판 시작 -->
		<div style="float: left; width: 804px;">
			<form name="frm" action ="<c:url value='/com/cons/consumableCleanPaperUseList.do'/>" method="post">
				<input type="hidden" name="nttId"  value="0" />
				<input type="hidden" name="bbsId" value="${consumableInventoryVO.bbsId }" />
				
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
           		<input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />

				<div class="board_title01">
					<ul style="padding-top: 5px;">
						<li class="black_title_text" style="float: left;">소모품 재고 현황</li>
<!--							
								<li style="float: left;">&nbsp;&nbsp;&nbsp; 다운로드는 로그인 후 받을 수 있습니다. &nbsp;&nbsp;</li>
								<li style="float: left;"><a href="javascript:goTargetPage('/uat/uia/egovLoginUsr.do')"><img src="/images/egovframework/adt/btn_movelogin.gif" width="113" height="20" alt="로그인 으로 이동" /></a></li>
-->
						<li style="float: right;padding-right:10px">
							<a href="<c:url value='/com/cons/consumableInventoryRegister.do'/>?bbsId=<c:out value="${consumableInventoryVO.bbsId}"/>"><img src="<c:url value='/' />images/egovframework/adt/btn_regist.gif" border="0" /></a>
						</li>
						
					</ul>
				</div>
         
				<div class="search_box01">
					<ul style="padding-top: 20px;">
						<li style="float: left;margin-left: 20px;padding-top: 2px;"><img src="<c:url value='/' />images/egovframework/adt/img_search.gif" alt="Search" width="41" height="15" /></li>
						<li style="float: left;margin-left: 5px;">
							<label for="searchCnd">검색종류</label>
							<select name="searchCnd" id="searchCnd" style="background-color: white;">
								<option selected="selected" value=''>--선택하세요--</option>
								<option value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
								<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
								<c:if test="${anonymous != 'true'}">
								<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
								</c:if>
							</select>
						</li>
						<li style="float: left;">&nbsp;&nbsp;<label for="searchWrd">검색어</label>
							<input name="searchWrd" type="text" style="background-color: white;" size="40" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="30" onkeypress="press(event);" title="검색어 입력" />
						</li>
						<!-- <li style="float: left;margin-left: 5px;width: 51px;"><a href="javascript:fn_egov_select_noticeList('1')" class="button_01"><img src="/images/egovframework/adt/btn_search_black.gif" alt="검색" /></a></li> -->
						<c:if test="${brdMstrVO.authFlag == 'Y'}">
						<li style="float: left;margin-left: 5px;width: 51px;">
							<a href="#noscript" onclick="fn_egov_select_noticeList('1'); return false;">
							<img src="<c:url value='/'/>images/egovframework/adt/btn_search_black.gif" alt="search" /></a>
						</li>
						</c:if>
					</ul>
				</div>

				<!-- 20100916 designer add start -->
				<div class="egovframe_tablestyle">
					<table summary="자료실 목록의 다양한 기능을 다운 받아 이용할 수 있습니다."  cellpadding="" cellspacing="0" border="0">
						<caption>목록</caption>
						<colgroup>
						<col width="38" />
						<col width="400" />
						<col width="" />
						<col width="" />
						<col width="" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">소모품명</th>
								<th scope="col">남은수량</th>
								<th scope="col">수령인</th>
								<th scope="col">최종입고일</th>
							</tr>
						</thead>
						<tbody>
							
						<!-- loop 시작 -->
						<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr>
							<td>
								<strong><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></strong>
							</td>
							<td>
								<div style="width:360px; text-overflow:ellipsis; overflow:hidden;">
									<span class="align_left_text">
									<c:out value="${result.codeNm }" />
									</span>
								</div>
							</td>
							<td>
								<c:out value="${result.inventory }" />
							</td>
							<td>
								<c:out value="${result.receiveName }" />
							</td>
							<td>
								<c:out value="${result.ntceBgnde }" />
							</td>
						</tr>
						</c:forEach>
						
						<!-- //loop 끝 -->
						</tbody>
					</table>
				</div>
				
				<!-- 20100916 designer add end -->
				<br />
				<div align="center">
					<span class="right_board_list">
						<div id="paging_div">
							<ul class="paging_align">
		                       <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />  
		                   </ul>
		               </div>
					</span>
					<br/><br/>
				</div>
			</form>
		</div>
	<!-- 게시판 끝 -->
	</div>
</body>
</html>