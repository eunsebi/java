<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<link href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css" />

<title>Insanely Tadpole Blog(업무사용자)</title>
<script type="text/javascript">
var getContextPath = '<c:out value="${pageContext.request.contextPath}" />';
</script>
<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script language="javascript">
function chk_all(val) {

	var arr_chk = document.getElementsByName("chk");

		if (val == "Y") {

			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =true;
			}
		}
		else if(val == "N") {
			for(i=0;i< arr_chk.length; i++) {
				arr_chk[i].checked =false;
			}
		}
}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%-- <c:import url="./head.jsp" /> --%>
<div >

<!-- Content Start -->
	<div id="sub_wrapper">

		<!-- Header Start -->
		<div id="inc_header">
			<c:import url="/EgovPageLink.do?link=egovframework/com/head" />
		</div>
		<!-- Header End -->

		<!-- Center Start -->
		<div id="inc_body">
			<!-- Center Body Start -->
			<div id="index_left_body">

				<!-- 공지사항 -->
				<div id="index_noImage_notice_left">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">Maint Notice</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;Maint Notice
						</span>
						<span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('400000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T1 Inform 더보기" /></a>
						</span>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
							<ul class="index_inform_listbox">
								<c:forEach var="result" items="${notiList}" varStatus="status">
									<li class="index_inform_li">
										<a href=javascript:fn_egov_inqire_noticePopup("${result.nttId}","${result.bbsId}") class="index_notice_list">&nbsp;
											<c:if test="${fn:length(result.nttSj)> 30}">
												<c:out value="${fn:substring(result.nttSj,0, 30)}" />...
											</c:if>
											<c:if test="${fn:length(result.nttSj)<= 30}">
												<c:out value="${result.nttSj}" />
											</c:if>
										</a>
										<span class="index_notice_date">${result.frstRegisterPnttm}</span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>
				
				<!-- 년차 일정 -->
				<div id="index_noImage_yearly_right">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">T1/T2 공동 Schedule</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;T1/T2 공동 Schedule
						</span>
						<%-- <span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('500000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T1 Inform 더보기" /></a>
						</span> --%>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
								<c:import charEncoding="utf-8" url="/cop/smt/sdm/EgovDeptSchdulManageMainList_common.do"></c:import>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>				

				<!-- T1 일정 -->
				<div id="index_noImage_schedule_left">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">T1 Maint Schedule</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;T1 Maint Schedule
						</span>
						<%-- <span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('4000000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T1 Inform 더보기" /></a>
						</span> --%>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
								<c:import charEncoding="utf-8" url="/cop/smt/sdm/EgovDeptSchdulManageMainList_t1.do"></c:import>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>

				<!-- T2 일정 -->
				<div id="index_noImage_schedule_right">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">T2 Maint Schedule</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;T2 Maint Schedule
						</span>
						<%-- <span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('4000000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T1 Inform 더보기" /></a>
						</span> --%>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
								<c:import charEncoding="utf-8" url="/cop/smt/sdm/EgovDeptSchdulManageMainList_t2.do"></c:import>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>
				
				<!-- T1 Maint Inform -->
				<div id="index_noImage_left">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">T1 Maint Inform</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;T1 Maint Inform
						</span>
						<span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('200000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T1 Inform 더보기" /></a>
						</span>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
							<ul class="index_inform_listbox">
								<c:forEach var="result" items="${T1_informList}" varStatus="status">
									<li class="index_inform_li">
										<a href=javascript:fn_egov_inqire_noticePopup("${result.nttId}","${result.bbsId}") class="index_notice_list">&nbsp;
											<c:if test="${fn:length(result.nttSj)> 30}">
												<c:out value="${fn:substring(result.nttSj,0, 30)}" />...
											</c:if>
											<c:if test="${fn:length(result.nttSj)<= 30}">
												<c:out value="${result.nttSj}" />
											</c:if>
										</a>
										<span class="index_notice_date">${result.frstRegisterPnttm}</span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>
				<!-- T1 Maint Inform End -->

				<!-- T2 Maint Inform Start -->
				<div id="index_noImage_right">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">T2 Maint Inform</h2>
						<span style="margin-top: 10px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;T2 Maint Inform
						</span>
						<span id="index_event_right_btn">
							<a href="javascript:fn_main_headPageMove('300000','dir');"><img	src='<c:url value="/images/egovframework/adt/index_img/btn_more_gray.gif" />' width="38" height="11" alt="T2 Inform 더보기" /></a>
						</span>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
							<ul class="index_inform_listbox">
								<c:forEach var="result" items="${T2_informList}" varStatus="status">
									<li class="index_inform_li">
										<a href=javascript:fn_egov_inqire_noticePopup("${result.nttId}","${result.bbsId}") class="index_notice_list">&nbsp;
											<c:if test="${fn:length(result.nttSj)> 30}">
												<c:out value="${fn:substring(result.nttSj,0, 30)}" />...
											</c:if>
											<c:if test="${fn:length(result.nttSj)<= 30}">
												<c:out value="${result.nttSj}" />
											</c:if>
										</a>
										<span class="index_notice_date">${result.frstRegisterPnttm}</span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div>
				<!-- T2 Maint Inform End -->
				
				<!-- PM -->
				<%-- <div id="index_noImage_right">
					<div id="index_event_right_btn_div">
						<h2 class="hidden">PM 현황</h2>
						<span style="margin-top: 15px; float: left;  font-weight: bold;">
							&nbsp;&nbsp;&nbsp;PM 현황
						</span>
					</div>
					<div id="index_event_contents_div">
						<div id="tab_1" style="display: block;">
							<table border="0" cellpadding="0" cellspacing="0" width="90%">
								<colgroup>
								<col width="" />
								<col width="" />
								<col width="30%" />
								<col width="30%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><span style="font-size: 13px; font-weight: bold;">공정</span></th>
										<th scope="col"><span style="font-size: 13px; font-weight: bold;">호기</span></th>
										<th scope="col"><span style="font-size: 13px; font-weight: bold;">PM일</span></th>
										<th scope="col"><span style="font-size: 13px; font-weight: bold;">차기PM일</span></th>
									</tr>
								</thead>
								<tbody>
								
						<c:forEach var="result" items="${pmresultList}" varStatus="status">
									<tr>
										<td height="20">
											<span class="index_notice_date">${result.kind}</span>
										</td>
										<td>
											<span class="index_notice_date">${result.number} 호기</span>
										</td>
										<td>
											<span class="index_notice_date">${result.changedate}</span>
										</td>
										<td>
											<span class="index_notice_date">${result.nextdate}</span>
										</td>
									</tr>
									<a href=javascript:fn_egov_inqire_noticePopup("${result.nttId}","${result.bbsId}") class="index_notice_list">&nbsp;
										<c:if test="${fn:length(result.nttSj)> 22}">
											<c:out value="${fn:substring(result.nttSj,0, 22)}" />...
										</c:if>
										<c:if test="${fn:length(result.nttSj)<= 22}">
											<c:out value="${result.nttSj}" />
										</c:if>
									</a>
									<span class="index_notice_date">${result.frstRegisterPnttm}</span>
						</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div> --%>
				<!-- PM 현황 끝 -->

				<!-- 재고현황 -->
				<%-- <div id="index_consum">
					<div id="index_qna_right_btn_div">
						<h2 class="hidden">소모품 재고현황</h2>
						<span id="index_qna_right_btn">
							<a href="javascript:fn_main_headPageMove('200000','dir');"><img src='<c:url value="/images/egovframework/adt/index_img/btn_more_tab.gif" />' width="37" height="10" alt="Q&amp;A 더보기" /></a></span>
					</div>
					<div id="index_qna_contents_div">
						<div id="tab_1" style="display: block;">
							<ul class="index_inform_listbox">
								<c:forEach var="result" items="${consumablesList}" varStatus="status">
									<li class="index_inform_li">
										<a href=javascript:fn_egov_inqire_noticePopup("${result.nttId}","${result.bbsId}") class="index_notice_list">&nbsp;${result.nttSj}</a>
			                <span class="index_notice_date">${result.frstRegisterPnttm}</span>
										<c:if test="${fn:length(result.codeNm)> 22}">
											<c:out value="${fn:substring(result.codeNm,0, 22)}" />...
										</c:if>
										<c:if test="${fn:length(result.codeNm)<= 22}">
											<c:out value="${result.codeNm}" />
										</c:if>
										<span class="index_notice_date">${result.qty}</span>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- <script type="text/javascript" src="/js/egovframework/adt/main/EventCmpgn_main.js"></script> -->
					</div>
				</div> --%>
				<!-- 재고 현황 끝 -->
			</div>
			<!-- Center Body End -->

			<!-- Center Right Page Start -->
			<div id="index_right_body">
				<!-- 설문 조사 삭제
			<div id="index_research">
				<div id="index_research_title_img">
				<h2 class="hidden">설문조사</h2>
					<img src="/images/egovframework/adt/index_img/img_vote.gif" width="44" height="13" alt="설문조사" />
				</div>
				<div id="index_research_contents_div">
					<script src="/js/egovframework/adt/main/poll_main.js" type="text/javascript"></script>
				</div>
			</div>
			 -->

				<!-- My Profile Start -->
				<div class="index_right_banner">
					<!-----------// 메세지센터 시작 //-------------->
					<div class="insaWrap">
						<div class="insa">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="space_height5">
								<tr>
									<td>
										<img src='<c:url value="/images/egovframework/common/i_smile.gif" />' align="absmiddle" style="padding-right: 7px"><strong><c:out value="${loginVO.name }" /></strong> <c:out value="${loginVO.ofcpsNm }" />
									</td>
									<td align="right">
										<a id="phone" href="#"><img	src='<c:url value="/images/egovframework/common/btn_phone.gif" />'></a>
										<a id="mobile" href="#"><img src='<c:url value="/images/egovframework/common/btn_mobile.gif" />'></a>
									</td>
								</tr>
							</table>
						</div>

						<div id='phoneLayer'
							style="display: none; z-index: 300; position: absolute; top: 32px;">
							<div class='perInfor_pop'>
								<span></span>
							</div>
							<div>
								<img src='<c:url value="/images/egovframework/common/bg_perInforRight.png" />'>
							</div>
						</div>
						<!-- <iframe id='basic' style="width:100%;height:80px; padding:0px 0 0px 0" src="" frameborder=0 scrolling="no"></iframe> -->
						<c:import url="/profile.do" charEncoding="utf-8" />
					</div>
					<!-----------// 메세지센터 끝 //-------------->
					
				</div>
				<!-- My Profile End -->

				<!-- Weather page Start -->
				<div class="index_right_banner">
					<iframe id="Weather" name="Weather" src="<c:url value='/EgovPageLink.do?link=egovframework/weater/weather' />"	style="WIDTH: 100%; HEIGHT: 250px" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" title="SubMenu"></iframe>
				</div>
				<!-- Weather page End -->

				<!-- Main Page Popup Import Start -->
				<div class="index_right_banner">
					<c:import url="/uss/ion/pwm/listMainPopup.do" charEncoding="utf-8" />
				</div>
				<!-- Main Page Popup Import End -->

				<!-- Right Main Page End -->

				<!-- 			<div class="index_right_banner">
				<a href="javascript:goTargetPage('/uss/edu/EgovEduListUser.do?menu=4&amp;submenu=1')"><img src="/images/egovframework/adt/index_img/bg_bann05.gif" width="192" height="73" alt="교육신청" /></a>
			</div>

			<div class="index_right_banner">
				<a href="javascript:goTargetPage('/beforeIndex.jsp')" ><img src="/images/egovframework/adt/index_img/bg_bann04.gif" width="192" height="73" alt="기술지원" /></a>
			</div>
			<div class="index_right_banner">
				<a href="html/egovframework/mbl/mguide/mguide.html" target="_blank" title="새창" ><img src="/images/egovframework/mbl/banner/bg_bann_Mobile.gif" width="192" height="73" alt="모바일실행환경 가이드는 사용자 경험(UX) 활용 가이드 2.0을 기준으로 하고 있다." /></a>
			</div>

			<div class="index_right_banner">
				<a href="/uss/olh/wor/WordDicaryListInqireUser.do" target="_blank" ><img src="/images/egovframework/adt/index_img/bg_bann01.gif" width="192" height="73" alt="용어사전 서비스:막히고 어려운 용어검색 한방에" /></a>
			</div>
			<div class="index_right_banner">
			<a href="javascript:goTargetBbs('/cop/bbs/selectBoardList.do','BBSMSTR_000000000001')"><img src="/images/egovframework/adt/index_img/bg_bann02.gif" width="192" height="72" alt="다운로드 서비스" /></a>
			<a href="/EgovRunEnvRelease.jsp?menu=2&amp;submenu=1"><img src="/images/egovframework/adt/index_img/bg_bann02.gif" width="192" height="72" alt="다운로드 서비스" /></a
			</div>
			<div class="index_right_banner">
				<a href="javascript:fn_egov_rssMainPop()"><img src="/images/egovframework/adt/index_img/bg_bann03.gif" width="192" height="72" title="새창" alt="RSS 구독하기 : 공지사항 | Q&amp;;A 구독하기" /></a>
			</div> -->
			</div>
			<!-- Center Right Page Start -->

		</div>
		<!-- Center End -->

		<!-- Benner Import Start -->
		<div class="index_center_banner">
			<!-- <iframe id="Banner" name="Banner"
				style="WIDTH: 100%; HEIGHT: 250px" frameborder="0" scrolling="no"
				marginwidth="0" marginheight="0" title="Banner"> -->
			<c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
				<c:param name="atchFileId" value="${banner.bannerImageFile}" />
			</c:import>
			<!-- </iframe> -->
		</div>
		<!-- Benner Import End -->


		<!-- Footer Start-->
		<%-- <div id="inc_footer">
			<div id="footer_area">
				<c:import url="/EgovPageLink.do?link=egovframework/com/main_bottom" />
			</div>
		</div> --%>
		<!-- Footer End -->
	</div>
<!-- Content End -->
        
</body>
</html>
