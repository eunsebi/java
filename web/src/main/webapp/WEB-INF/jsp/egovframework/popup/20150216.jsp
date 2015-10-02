<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>▒▒▒  공지사항  ▒▒▒</title>

<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css" />

<script language="javascript">
function fncGoAfterErrorPage(){
    history.back(-2);
}

/* ********************************************************
 * 쿠키설정
 ******************************************************** */
function fnSetCookiePopup( name, value, expiredays ) {
	  var todayDate = new Date();
	  todayDate.setDate( todayDate.getDate() + expiredays );
	  document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
/* ********************************************************
* 체크버튼 클릭시
******************************************************** */
function fnPopupCheck() {
	fnSetCookiePopup( "${popupId}", "done" , 365);
	window.close();
}
</script>
</head>

<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"><br />
    <br />
    <br />
    <table width="600" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/images/egovframework/com/cmm/blue_bg.jpg">
      <tr>
        <td align="center"><table width="100%" border="0" cellspacing="9" cellpadding="0">
          <tr>
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><img src="${pageContext.request.contextPath}/images/egovframework/adt/top_menu/egov_framelogo.jpg" width="379" height="57" /></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>

              <tr>
                <td align="center"><table width="520" border="0" cellspacing="2" cellpadding="2">
                  <tr>
                    <td width="399" align="left" class="lt_text2">소모품 현황 Open</td>
                  </tr>
                  <tr>
                    <td align="left" valign="top" class="lt_text5">
                    
- Site별 메뉴에 유포지(크린페이퍼), 필터, UV램프 메뉴 등록해 놓았음 <br><br>
- 각 공정 근무시 재고파악하여 입고수량에 입력바라며 잘 활용 및 등록 바람<br><br>
- 앉아서 재고파악할수있도록 잘 활용 바람(안되면 열심히 몸이 고생해야지 ㅋㅋㅋ)<br><br>
                    
                    </td>
                  </tr>
                </table>
                  <table width="500" border="0" cellspacing="2" cellpadding="2">
                                  </table></td>
              </tr>
              <tr>
                <td><br />
                  <br /></td>
              </tr>
               <tr>
                <td align="center">
	                <!-- <a href="javascript:closeWin();" onfocus="blur()"><img src="${pageContext.request.contextPath}/images/egovframework/btn_close.gif" align="absmiddle" alt="닫기" /></a> -->
					<c:if test="${stopVewAt eq 'Y'}">
다음부터 이 창을 열지 않음  <input type="checkbox" name="chkPopup" value="" onClick="fnPopupCheck()" title="다음부터창열지않기체크">
<a href="javascript:self.close();" onfocus='this.blur()'>[닫기]</a>
</c:if>
    	           <%--  <a href="javascript:fncGoAfterErrorPage();"><img src="${pageContext.request.contextPath}/images/egovframework/com/cmm/go_history.jpg" width="90" height="29" border="0"/></a> --%>
                </td>
              </tr>
            </table>
              <br /></td>
          </tr>
        </table></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>