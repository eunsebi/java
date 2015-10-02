<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- header_css -->
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

<link href="/css/egovframework/com/cmm/com.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/button.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cmm/mpm.css" rel="stylesheet" type="text/css" />
<link href="/css/egovframework/com/cop/tpl/egovbbsTemplate.css" rel="stylesheet" type="text/css" />

<title>재고부족</title>
</head>
<body>
<!-- 메인탑 컨텐츠 시작 -->
	<div id="center_body">
		<DIV id="content" style="width:660px">
		<div class="board_title01"><span class="black_title_text">재고부족</span></div>
			<div class="egovframe_tablestyle">
				<h2>
				재고가 부족합니다.<br>
				재고를 확인해주세요.
				</h2>
			</div>
			
			<div align="right">

				<ul style="padding-top: 100px;">
					<a href="/com/mat/MaterialCreanRollerConsumption.do?codeId=<c:out value='${codeId}' />"><img src="/images/egovframework/adt/btn_list.gif" border="0" /></a>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>