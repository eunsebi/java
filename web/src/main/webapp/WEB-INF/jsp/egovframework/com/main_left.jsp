<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
 /**
  * @Class Name : left.jsp
  * @Description :  좌측메뉴화면
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
  *
  */

  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cmm/mpm.css' />" type="text/css" />

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


<title>메뉴정보등록</title>
<script type="text/javascript">
	var imgpath = "<c:url value='/images/egovframework/com/cmm/utl/'/>";
	var getContextPath = "${pageContext.request.contextPath}";
	var path = "http://" + "${pageContext.request.serverName}" + ":" + "${pageContext.request.serverPort}";
</script>
<script language="javascript1.2" src="<c:url value='/js/egovframework/com/sym/mnu/mpm/EgovMainMenu.js' />" /></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#left_menu_architect").hide();
    $("#left_menu_support").hide();
    var submenu = '1';
    if(submenu == 3){$("#left_menu_architect").show();}
    if(submenu == 7){$("#left_menu_support").show();}
});
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight= "0">

<form name="menuListForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuListSelect.do' />" method="post">
<DIV id="main" style="display:">
	<c:forEach var="result" items="${list_menulist}" varStatus="status" >
	<input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${pageContext.request.contextPath}/${result.chkURL}|"/>
	</c:forEach>
	<div class="tree" style="overflow: auto; position: absolute; z-index: 5; padding: 0pt 0pt 0pt 10px;">
		<script language="javascript">
			var Tree = new Array;
			for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
				Tree[j] = document.menuListForm.tmp_menuNm[j].value;
			}
			createTree(Tree, true, '<c:out value="${resultVO.tempInt}"/>');
		</script>
	</div>
</DIV>
</form>

<%-- <form name="menuListForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuListSelect.do' />" method="post">
<DIV id="main" style="display:">

<table width="181" cellpadding="8" class="table-search" border="1">
  <tr>
    <td width="181" class="title_left" >
        <div style="width:0px; height:0px;">
		<c:forEach var="result" items="${list_menulist}" varStatus="status" >
		<input type="hidden" name="tmp_menuNm" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${pageContext.request.contextPath}/${result.chkURL}|"/>
		</c:forEach>
		</div>
		<div class="tree" style="overflow: auto; position: absolute; z-index: 5; padding: 0pt 0pt 0pt 49px; width: 214px; height: 512px;">
		<script language="javascript">
			var Tree = new Array;
			for (var j = 0; j < document.menuListForm.tmp_menuNm.length; j++) {
				Tree[j] = document.menuListForm.tmp_menuNm[j].value;
			}
			createTree(Tree, true, '<c:out value="${resultVO.tempInt}"/>');
		</script>
		</div>
   </td>
 </tr>
</table>
</DIV>
</form> --%>
</body>
</html>

