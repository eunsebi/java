<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<jsp:forward page="/sym/mms/EgovMainMenuHome.do"/>--%>
<%--<jsp:forward page="WEB-INF/jsp/egovframework/com/cmm/EgovUnitMain.jsp"/>--%>
<%-- <jsp:forward page="/index.do"/> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insanely Tadpole Blog Login</title>
</head>
<body>
 	<form name="consumableInventoryVO" id="consumableInventoryVO" action="?" method="post">
		<input type="hidden" name="bbsId" id="bbsId" value='<c:out value="${consumableInventoryVO.bbsId }" />' />
		<input type="hidden" name="codeId" id="codeId" value="<c:out value="${consumableInventoryVO.codeId }" />" />
		<input type="hidden" name="mode" id="mode" value="<c:out value="${consumableInventoryVO.mode }" />" />
		<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
	</form>
	<jsp:forward page="/com/cons/consumableFilterUseRegister.do" />
</body>
</html>