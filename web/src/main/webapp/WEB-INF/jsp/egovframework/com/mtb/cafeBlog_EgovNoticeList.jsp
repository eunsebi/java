


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images/egovframework/com/cop/bbs/" />
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
<title>게시물 목록 - <c:out value="${brdMstrVO.bbsNm}" />
</title>
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

<link href="<c:url value='/css/egovframework/com/cmm/com.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/button.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css" />

<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
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
	
			function fn_egov_addNotice() {
				document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
				document.frm.submit();
			}
	
			function fn_egov_select_noticeList(pageNo) {
				/* if(document.frm.searchWrd.value.trim() == ''){
					alert("검색어를 입력해 주세요.");
					document.frm.searchWrd.value = "";
					document.frm.searchWrd.focus();
					return false;
				} */
				document.frm.pageIndex.value = pageNo;
				document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
				document.frm.submit();
			}
	
			function fn_egov_inqire_notice(i, nttId, bbsId) {
				document.subForm.nttId.value = nttId;
				document.subForm.bbsId.value = bbsId;
				document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
				document.subForm.submit();
			}

		//-->
		</script>
	</c:otherwise>
</c:choose>
<script type="text/javascript">
var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
var getContextPath = "${pageContext.request.contextPath}";
var path = "http://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.serverPort}";
</script>
<script language="javascript1.2" src="<c:url value='/js/egovframework/com/sym/mnu/mpm/EgovMainMenu.js' />"></script>

<style type="text/css">
h1 {
	font-size: 12px;
}

caption {
	visibility: hidden;
	font-size: 0;
	height: 0;
	margin: 0;
	padding: 0;
	line-height: 0;
}
</style>

<script language='javascript'>
		//this_url		="/";
		this_skin	="<c:url value='/images/cafeblog' />";
		is_Admin	="";
		is_Member="";
		is_Category="";
		TnTimgurl="./img";
		shop_this_skin="./skin_shop/standard";
		shop_url="/board.php?board=myhomeboard&command=shop";
		TnTpopupeffect="";
	</script>
<script type='text/javascript' src="<c:url value='/js/cafeblog/b_script/main_script.js' />"></script>
<link href="<c:url value='/css/cafeblog/shop_public.css' />" rel='stylesheet' type='text/css'>
<script language="JavaScript">

			// 배경색,이미지 변경
			function ch_bg_set(css_text){
				if(css_text.match(/(gif|jpg|png|bmp)\s*$/i)){// img
					document.body.style.backgroundImage="url("+css_text+")";
					css_text="background:url("+css_text+");";
				}else{// color
					document.body.style.backgroundImage="url('')";
					document.body.style.backgroundColor=css_text;
					css_text="background-color:"+css_text+";";
				}
				TnT_setcookie("TnTmyhomeboardbgcss",css_text,240); // 배경색,이미지 변경값을 240 시간 동안 유지시킴
			}

			// 회원정보 iwindow 레이어 (name card)
			function memcard_iwindow_OPEN(id){	if(id) iwindow_OPEN('iwindow_member_rank','nmd','rank_m_id='+id,'width=225,height=135');}

			// 메인 검색폼
			function act_main_search(this_f){
				if(!this_f.search.value) return false;
				for(i=1; i<21; ++i){chkid=document.getElementById('srh_opt'+i);
				if(chkid && chkid.checked==true) this_f.shwhere.value+=chkid.value+'|';}
			} function srh_option_view(ev,this_t){publicLayerDisplay(ev,'sh_main_optn',TnT_get_objLeft(this_t),TnT_get_objTop(this_t)+20,0,0,1);}

		</script>

</head>

<body>

	<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<table width=100% height=100% cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td class=round_bg1></td>
				<td class=round_bg_top_bott></td>
				<td class=round_bg2></td>
			</tr>
			<tr>
				<td class=round_bg_left_right></td>
				<td bgcolor=#ffffff align=center valign=top>
					<!-- 게시판 타이틀 부분 -->

					<table width=98% cellpadding=5 border=0>
						<tr>
							<td style="font-size: 10pt; font-weight: bold; height:50px;">
								<img src="<c:url value='/images/cafeblog/b_img_add/abs_h3.gif' />" align=absbottom>
								<c:out value="${brdMstrVO.bbsNm}" /> &nbsp;<br> <img src="<c:url value='/images/cafeblog/b_img_add/coarseline.gif' />">
							</td>
							<td align=right class=no_imgborder>
								<img src="<c:url value='/images/cafeblog/b_img_add/style_bbs.gif' />" id='const_set1'></a>&nbsp;
								<img src="<c:url value='/images/cafeblog/b_img_add/style_blog.gif' />" id='const_set2'></a>&nbsp;
								<img src="<c:url value='/images/cafeblog/b_img_add/style_webzine.gif' />" id='const_set3'></a>&nbsp;
								<img src="<c:url value='/images/cafeblog/b_img_add/style_album.gif' />"	id='const_set4'></a>&nbsp;
								<img src="<c:url value='/images/cafeblog/b_img_add/style_index.gif' />" id='const_set5'></a>
							</td>
						</tr>
					</table>
					
					<!-- ★ 글목록 테이블 CSS -->
					<style type='text/css'>
						A.subjectColor:link {
							text-decoration: none;
							color: #222222;
						} /*글제목: 읽지 않은 글 */
						A.subjectColor:visited {
							text-decoration: none;
							color: #888888;
						} /*글제목: 읽은 글 */
						A.subjectColor:hover {
							text-decoration: none;
							color: #bb0000;
						} /*글제목: 마우스OVER */
						#mainIndexTable td {
							
						} /*글목록 전체 <td>*/
						.head_td {
							height: 22px;
							color: #555555;
							border-width: 0;
							background-image: url(<c:url value='/images/cafeblog/b_img/attrib/th_bg2.gif' />);
						}
						
						.head_td img {
							border-width: 0;
						}
						
						.head_td a:link, a:visited {
							color: #333333;
						}
						
						.list_default {
							padding-left: 2px;
						}
						
						.list_check {
							text-align: center;
							width: 20px;
						}
						
						.list_no {
							text-align: center;
							font-size: 7pt;
							font-family: Tahoma, 돋움;
							font-weight: bold;
							letter-spacing: -1;
							color: #777777;
						}
						
						.list_subject {
							width:;
							word-break: break-all;
							padding-left: 2px;
						}
						
						.font_repcnt {
							color: #278BE9;
							font-size: 7pt;
							font-family: Tahoma, 돋움;
						}
						
						.list_name {
							text-align: left;
							letter-spacing: -1;
							width: 100;
							padding-left: 2px;
						}
						
						.list_date {
							text-align: center;
							font-size: 7pt;
							font-family: Tahoma, 돋움;
							width: 50;
							padding: 0 3 0 2;
						}
						
						.list_hit {
							text-align: center;
							font-size: 7pt;
							font-family: Tahoma, 돋움;
							width: 30;
						}
						
						.list_category {
							text-align: center;
							letter-spacing: -1;
							font-size: 8pt;
							font-family: 돋움;
							padding: 0 2 0 1;
							color: #CF6C0B;
						}
						
						.list_other {
							text-align: center;
						}
						
						.list_wr_add {
							padding-left: 2px;
						} /*입력란 추가 생성한 <td>*/
						.list_hr_tr {
							display:;
						}
						
						.list_hr_line {
							height: 1;
							background-color: #eeeeee;
							padding: 0;
						}
						
						.list_photo {
							background-color: #ffffff;
							border: 1px solid #f0f0f0;
							cursor: pointer;
							width: 60;;
						}
						
						.list_thumbnail {
							background-color: #ffffff;
							border: 1px solid #f0f0f0;
							cursor: pointer;
							width: 60;;
						}
						
						.list_thumbnail2 {
							background-color: #ffffff;
							border: 1px solid #f0f0f0;
							cursor: pointer;
							width: 90;
						}
						
						.font8pt {
							font-size: 8pt;
							font-family: 돋움;
							color: #666666;
						}
						
						.page_number {
							color: #444444;
							font-size: 8pt;
							font-family: Tahoma, 돋움;
							border: 1px solid #dddddd;
							background-color: #ffffff;
							padding: 0 2 0 3;
							margin: 0 2 0 2;
						} /*글목록 페이지 번호*/
						#opennumber {
							border-bottom: 2px solid #F58E5B;
						} /*본문 출력된 글제목 바탕색*/
						#mainbutton_td img {
							margin-left: 7px;
						} /* 하단 메인버튼*/
					</style>

					<div>

						<!--- "글목록 상단에 내용 삽입" --->


						<div id='mainIndexDiv' style="width: 96%; padding: 0 0 10 0;">


							<!-- ★ 좌.상단 TOOL BAR(도구모음)  +  Tool버튼(각 버튼별 출력 여부는 보드설정-[4-20]에서 설정함) -->
							<table border=0 cellpadding=0 cellspacing=0 width='100%'>
								<tr>
									<td valign=bottom style='padding: 0 0 1 15;'>
										<img src="<c:url value='/images/cafeblog/b_img/i_button/toolbar.gif' />" align=absmiddle style='cursor: pointer' onmouseover="balloon_on('도구모음 On/Off',this,-5,0)" onmouseout="balloon_off()" onclick="publicLayerDisplay(event,'div_toollayer',0,0,30,18,'toggle')">
										<div id='div_toollayer' style='position: absolute; visibility: hidden; z-Index: 9; padding: 0;'>
											<nobr>
												<a onclick="iwindow_OPEN('iwindow_login','','','width=180,height=90')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_login.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_sort','','','width=120,height=120')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_sort.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_indexstyle','','indextype=&indexorder=&indexmany=','width=205,height=110')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_option.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_stat','','','width=150,height=175')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_stat.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_point','','','width=175,height=305,btn_help=y')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_point.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_joinlist','','','width=180,height=250,btn_grow=y')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_joinlist.gif' />" border=0></a>
												<a onclick="iwindow_OPEN('iwindow_msgview','','','width=135,height=130')">
													<img src="<c:url value='/images/cafeblog/b_img/i_button/b_msg.gif' />" border=0></a>
											</nobr>
									</td>
									<td align=right>
										<img src="<c:url value='/images/cafeblog/b_img/i_button/rss.gif' />" border=0></a>&nbsp;&nbsp;
									</td>
								</tr>
							</table>

							<!-- ★ 글목록 Main -->
							<table id='mainIndexTable' cellpadding=0 cellspacing=0 width='100%' border=0>
								<tbody style='background-color: #ffffff;'>
									<tr align=center style='color: #555555;'>
										<td width="5%" class=head_td>
											<nobr>
												<span class=list_no>&nbsp;N&nbsp;</span>
											</nobr>
										</td>
										<td class=head_td align=left><nobr>&nbsp; &nbsp;제목</nobr></td>
										<td class=head_td></td>
										<td width="12%" class=head_td align=left>&nbsp;&nbsp; 글쓴이</td>
										<td width="10%" class=head_td>작성일</td>
										<td width="5%" class=head_td>조회</td>
									</tr>

									<!-- loop 시작 -->
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr onMouseOver=this.style.backgroundColor='#fdfdfc' onMouseOut=this.style.backgroundColor='' height='26'>
										<td class=list_no>
											<nobr>
												&nbsp;
												<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" />
												&nbsp; &nbsp;
											</nobr>
										</td>
										<td class=list_subject>
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
								                    &nbsp;
								                </c:forEach>
												<!-- <img src="<c:url value='/images/egovframework/business/reply_arrow.gif'/>" alt="reply arrow"> -->
											</c:if>
											<c:choose>
												<c:when	test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
													<font class=font_repcnt><b>
														<c:out value="${result.cmtAnswerCnt }" /></b>
													</font>
												</c:when>
												<c:otherwise>
													<a class="board" href="/cop/bbs/selectBoardArticle.do?nttId=<c:out value="${result.nttId}"/>&amp;bbsId=<c:out value='${result.bbsId}' />" onclick="fn_egov_inqire_notice('<c:out value="${result.nttId}" />','<c:out value='${result.bbsId}' />'); return false;"> <c:out value="${result.nttSj}" /></a>
													<font class=font_repcnt><b><c:out value="${result.cmtAnswerCnt }" /></b></font>
												</c:otherwise>
											</c:choose>
										</td>
										<td></td>
										<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
											<td><c:out value="${result.ntceBgnde}" /></td>
											<td><c:out value="${result.ntceEndde}" /></td>
										</c:if>
										<c:if test="${anonymous != 'true'}">
											<td class=list_name>
												<span onclick="iwindow_OPEN('iwindow_writer','n_card','no=160&thiswhere=indexName','width=120,height=85,titlebar=n')" style='cursor: pointer'><c:out value="${result.frstRegisterNm}" /></span>
											</td>
										</c:if>
										<td class=list_date>
											<nobr>
												<c:out value="${result.frstRegisterPnttm}" />
											</nobr>
										</td>
										<td class=list_hit>
											<nobr>
												<c:out value="${result.inqireCo}" />
											</nobr>
										</td>
									</tr>

									<tr class=list_hr_tr>
										<td colspan="7" class=list_hr_line></td>
									</tr>
								</c:forEach>
									<!-- //loop 끝 -->
								</tbody>
							</table>

							<!-- ★ 글목록 하단-->
							<table border=0 cellspacing=0 cellpadding=5 width='100%' style='margin-top: 7px;'>
								<tr>
								<c:if test="${brdMstrVO.authFlag == 'Y'}">
									<td id='mainbutton_td'>
										<a href="<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>?bbsId=<c:out value="${boardVO.bbsId}"/>">
											<img src="<c:url value='/images/cafeblog/b_img/i_button/write.gif' />" align=absmiddle border=0></a>
									</td>
								</c:if>
									<td align=right valign=top>
										<span class="right_board_list">
											<div id="paging_div">
												<ul class="paging_align">
													<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />
												</ul>
												<br>
											</div>
										</span>
									</td>
								</tr>
								
								<tr>
									<td colspan=2 align=right>

										<form name="frm" action ="<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>" method="post">
											<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
											<input type="hidden" name="nttId"  value="0" />
											<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
											<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
											<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
											<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
							           		<input type="submit" value="실행" onclick="fn_egov_select_noticeList('1'); return false;" id="invisible" class="invisible" />

											<!--제목 icon-->
											<%-- <img src="<c:url value='/images/cafeblog/b_img/i_button/sh_subject1.gif' />" align=absmiddle style="cursor: pointer" id='sh_ico_1' onload="selected_chk(this,'checked')" onclick="search_select(this,'0')"> --%>

											<!--내용 icon-->
											<%-- <img src="<c:url value='/images/cafeblog/b_img/i_button/sh_tbody1.gif' />" align=absmiddle style="cursor: pointer" id='sh_ico_2' onload="selected_chk(this,'')" onclick="search_select(this,'1')" hspace=2> --%>

											<!--이름/별명 icon-->
											<%-- <img src="<c:url value='/images/cafeblog/b_img/i_button/sh_name1.gif' />" align=absmiddle style="cursor: pointer" id='sh_ico_3'	onload="selected_chk(this,'')" onclick="search_select(this,'2')"> --%>

											<select name="searchCnd" id="searchCnd">
												<!-- <option selected="selected" value=''>--선택하세요--</option> -->
												<option selected="selected" value="0" <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> >제목</option>
												<option value="1" <c:if test="${searchVO.searchCnd == '1'}">selected="selected"</c:if> >내용</option>
												<option value="2" <c:if test="${searchVO.searchCnd == '2'}">selected="selected"</c:if> >작성자</option>
											</select>
							
											<!--검색어 입력란 -->
											<img src="<c:url value='/images/cafeblog/b_img/i_button/search_round.gif' />" align=absmiddle><input type=text
												name=searchWrd value='<c:out value="${searchVO.searchWrd}"/>' autocomplete=off style='border:
												1px solid #888ca5; border-right: 0; border-left: 0px; width: 90px; height: 18px; vertical-align: middle;'
												onkeypress="press(event);" title="검색어 입력" /><a href="#noscript" onclick="fn_egov_select_noticeList('1'); return false;"><img
												src="<c:url value='/images/cafeblog/b_img/i_button/search.gif' />"	align=absmiddle border='0'></a>

										</form>

									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>

	</div>
	<!-- 메인탑 컨텐츠 끝 -->
</body>
</html>