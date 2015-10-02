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
	<c:if test="${loginVO != null}">
		<jsp:forward page="/sym/mnu/mpm/EgovMainMenuHome.do" />
	</c:if>
	
	<c:if test="${loginVO == null }">
		<%-- <jsp:forward page="/uat/uia/egovLoginUsr.do"/> --%>
		<jsp:forward page="/EgovContent.do"/>
		<%-- <jsp:forward page="/sym/mnu/mpm/EgovMainMenuHome.do" /> --%>
	</c:if>
</body>
</html>