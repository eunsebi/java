<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" type="text/css">
<link href="<c:url value='/css/egovframework/com/common.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/com/com.css' />"  rel="stylesheet" type="text/css" />

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

<title>Insanely Tadpole Blog HeadMenu</title>

<script language="javascript" src="<c:url value='/js/egovframework/com/main.js' />"></script>
<script type="text/javascript">
	var getContextPath = "${pageContext.request.contextPath}";
</script>

<!-- 정보알림이 표시를 위한 스크립트  Start -->
<script type="text/javascript">
	var noi_url = "<c:url value='/uss/ion/noi/getNotifications.do'/>";
</script>

<script type="text/javascript" language="javaScript" src="<c:url value='/js/egovframework/com/uss/ion/noi/EgovNotification.js'/>"></script>
<!-- 정보알림이 표시를 위한 스크립트  End -->

<script type="text/javascript">
	/* function fn_main_headPageMove(menuNo, url){
		document.selectOne.vStartP.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do'/>";
	    document.selectOne.target = "main_left";
	    document.selectOne.submit();
 	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do'/>";
	    document.selectOne.target = "main_right";
	    document.selectOne.submit();
	} */
	
	function fn_main_headPageMove(menuNo, url){
		document.selectOne.vStartP.value=menuNo;
		document.selectOne.chkURL.value=url;
	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do'/>";
	    document.selectOne.target = "SubMenu";
	    document.selectOne.submit();
 	    document.selectOne.action = "<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do'/>";
	    document.selectOne.target = "main_right";
	    document.selectOne.submit();
	}

	function actionLogout()
	{
		document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
		document.selectOne.target = "_top";
		document.selectOne.submit();
		//top.document.location.href = "<c:url value='/j_spring_security_logout'/>";
	}
	
	function goTargetPage(targetPage){
		document.frmMenu.action = ""+targetPage+"";
		document.frmMenu.submit();
	}
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0">

		<noscript>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
		
		
		<form name="rightfrm" method="post" action="">
			<input type="hidden" name="bbsId" value="" />
			<input type="hidden" name="nttId"  value="" />
			<input type="hidden" name="cmmntyId" value="" />
			<input type="hidden" name="cmmntyNm" value="" />
			<input type="hidden" name="faqId" value=""/>
			<input type="hidden" name="qaId" value=""/>
			<input type="hidden" name="passwordConfirmAt" value=""/>
			<input type="hidden" name="newsId" value=""/>
			<input type="hidden" name="qestnrId" id="qestnrId" value=""/>
			<input type="hidden" name="qestnrTmplatId"  id="qestnrTmplatId" value=""/>
			<input type="hidden" name="eventId" value=""/>
			<input type="hidden" name="searchCondition" value=""/>
			<input type="hidden" name="searchKeyword" value=""/>
			<input type="hidden" name="menu" value=""/>
			<input type="hidden" name="submenu" value=""/>
		  
			<input type="hidden" name="bbsTyCode" value="" />
			<input type="hidden" name="bbsAttrbCode" value="" />
			<input type="hidden" name="authFlag" value="" />
			<input type="hidden" name="pageIndex" value="" />
			<input type="hidden" name="menuNo" value="" />
			<input type="hidden" name="chkURL" value="" />
		</form>
		<form name="frmMenu" method="post" action="">
			<input name="adminMenu" type="hidden" value="1">
			
		<div class="header_wrap">
		
			<div id="toparea_div">
		
	<!-- 로고시작 -->

				<div id="header_logoarea">
					<div id="header_egovframe"><a href="<c:url value='/sym/mnu/mpm/EgovMainMenuHome.do'/>" ><img src='<c:url value="/images/egovframework/adt/top_menu/egov_framelogo.jpg" />' alt="eGovframe 표준프레임워크"/></a></div>
				
					<div id="header_mopas"></div>
				
	<!-- 검색영역 -->
				
					<div id="header_searcharea">
				
						<div id="search_div">
				
							<label for="searchWrdPtl" style="visibility:hidden;width:0px;height:0px;font-size:0px;">포탈검색 검색어</label>
	
							<input name="searchWrdPtl" id="searchWrdPtl" class="search_field" onkeydown="return CheckEnt();" onfocus="OutputBackImg(this);" onblur="InputBackImg(this);" />
	
			        		<input type="hidden" name="searchWrd" value=""/>
	
			        	</div>
				
						<div id="submit_div">
	
							<a href="#n" onclick="fn_egov_searchList('1'); return false;" target="_self"><input type="image" src='<c:url value="/images/egovframework/adt/top_menu/btn_topsearch.gif" />' alt="검색" title="통합검색" /></a>
	
						</div>
				
					</div>
				
	<!-- 글로벌 메뉴 -->
				
					<div id="header_rightmenu_area">
				<c:if test="${loginVO == null}">
						<ul>
							<li>
								<a href="javascript:goTargetPage('<c:url value='/' />uat/uia/egovLoginUsr.do')" title="Insanely Tadpole Blog 로그인하기" target="_self"  style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">LogIn</a>
				              	
							</li>
				        	<li><a href="/EgovSiteMap.jsp" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">Sitemap</a></li>
							<li><a href="/EgovMap.jsp?menu=1&amp;submenu=8" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">Contact us</a></li>
							<li><a href="/EgovAdtView_Eng.jsp" target="_self" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">English</a></li>
						</ul>
					</c:if>
	
					<c:if test="${loginVO != null}">    
					<c:set var="loginName" value="${loginVO.name }"/>
						<ul>
							<c:out value="${loginVO.name }" />님으로 접속하였습니다.<br>
							<li>
	               				<a href="javascript:goTargetPage('<c:url value='/' />uat/uia/actionLogout.do')" title="로그아웃하기" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">LogOut</a>
							</li>
							
				   	    	<li><a href="<c:url value='/uss/umt/EgovMyPageRetrieve.do' />" onclick="goTargetPage(this.href); return false;" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">MyPage</a></li>
									
				        	<li><a href="<c:url value='/egovframework/com/EgovSiteMap.jsp'/>" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">Sitemap</a></li>
	<!--
							<li><a href="http://www.egovframe.go.kr/EgovMap.jsp?menu=1&submenu=8" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">Contact us</a></li>
							<li><a href="http://www.egovframe.go.kr/EgovAdtView_Eng.jsp" target="_self" style="float:left; list-style-type: none;font-size:12px;padding-left:6px;color:#888;line-height:30px;">English</a></li>
	-->
					    </ul>
				</c:if>
					</div>
				</div>
			</div>

		</form>				
			
	<!-- Main Menu Start -->
			<div id="globalnavi_div">
				<ul id="sublayer">
					<form name="selectOne">
						<input name="vStartP" type="hidden" />
						<input name="chkURL" type="hidden" />
						<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/com/common.css' />" /> --%>
					<c:forEach var="result" items="${list_headmenu}" varStatus="status">
						<li>
							<a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a>
						</li>
					</c:forEach>
					</form>
				</ul>
			</div>
	<!-- Main Menu End -->
		</div>



<%--     <div id="gnb">
    <div id="top_logo"><a href="<c:url value='/sym/mnu/mpm/EgovMainMenuHome.do' />" target=_top><img src="<c:url value='/images/egovframework/com/logo_01.gif' />" alt="egovframe" /></a></div>
     <div id="use_descri">
            <ul>
                <li>공통서비스 테스트 사이트(업무사용자용)</li>
                 <li><a href="javascript:actionLogout()"><img src="<c:url value='/images/egovframework/com/logout_btn.gif' />" alt="로그아웃" /></a></li>
            </ul>
    </div>
    </div>
    <div id="new_topnavi">
        <ul>
			<li><a href="<c:url value='/sym/mnu/mpm/EgovMainMenuHome.do' />" target="_top">HOME</a></li>
			<c:forEach var="result" items="${list_headmenu}" varStatus="status">
			   <li class="gap"> l </li>
			   <li><a href="javascript:fn_main_headPageMove('<c:out value="${result.menuNo}"/>','<c:out value="${result.chkURL}"/>')"><c:out value="${result.menuNm}"/></a></li>
			</c:forEach>
        </ul>
    </div> --%>


</body>
</html>
