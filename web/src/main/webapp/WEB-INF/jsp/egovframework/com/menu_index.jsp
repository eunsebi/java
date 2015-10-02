<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /**
  * @Class Name : EgovMainMenuIndex.jsp
  * @Description : MainMenuIndex Page
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *  ?vStartP=<c:out value="${result.menuNo}"/> <c:out value="${result.chkURL}"/>
  */

%>

<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insanely Tadpole Blog</title>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0">

<!-- main_head_test 전체 레이어 시작 -->

<div id="sub_wrapper">

	<!-- Header Start -->
	<div id="inc_header">
		<c:import url="/EgovPageLink.do?link=egovframework/com/main_head" />
		<%-- <iframe id="Header" name="Header" src="<c:url value='/sym/mnu/mpm/EgovMainMenuHead.do' />" style="width:100%;" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" title="SubMenu"></iframe>  --%>
	</div>				
	<!-- Header End -->

	<!-- Content Start -->
	<div id="inc_body">
		<!-- Sub Menu Start -->
		<div id="left_body">
			<iframe id="SubMenu" name="SubMenu" src="<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" style="WIDTH: 100%; HEIGHT: 600px" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" title="SubMenu"></iframe>
		</div>
		<!-- Sub Menu End -->
	
		<!-- Main Content Start -->
		<div id="center_body_no_right_body">
 			<iframe id="main_right" name="main_right" src="<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" style="WIDTH: 100%; HEIGHT: 600px" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" title="MainContent"></iframe>
		</div>
		<!-- Main Content End -->

<%--
		<!-- QuickMenu Start -->
 		<div id="right_body">
			<c:import url="/EgovPageLink.do?link=egovframework/com/EgovQuickMenu" />
		</div>
		<!-- QuickMenu End -->
 --%>			
	</div>
	<!-- Content End -->


	<!-- Footer Start-->
<%-- 	<div id="inc_footer">
	    <div id="footer_area">
			<c:import url="/EgovPageLink.do?link=egovframework/com/main_bottom" />
	    </div>
	</div> --%>
	<!-- Footer End -->

</div>

</body>

<%-- <frameset rows="122,*,50" frameborder="0" >
	<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuHead.do' />" name="main_top" marginwidth="0" marginheight="0">
	<frameset cols="273,*" frameborder="0">
		<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuLeft.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" scrolling="no" name="main_left" marginwidth="0" marginheight="0">
		<frame src="<c:url value='/sym/mnu/mpm/EgovMainMenuRight.do' />?vStartP=<c:out value="${resultVO.menuNo}" />" name="main_right" marginwidth="0" marginheight="0">
	</frameset>
	<frame src="<c:url value='/EgovPageLink.do' />?link=/egovframework/com/main_bottom" scrolling="no" name="main_bottom" marginwidth="0" marginheight="0">
</frameset> --%>
</html>
