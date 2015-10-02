<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<c:url value='/js/iljin/jquery-1.5.1.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/iljin/common.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/iljin/json2.js' />"></script>
<title>title</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/egovframework/iljin/portal.css' />">
<script>

var user_nm = "심은섭";
var user_id = "290099";
var now = new Date();
var today = now.getYear()+"-"+(now.getMonth()+1)+"-"+now.getDate();

$(document).ready(function(){
	initEventHanlder();
});

//=============================================
//document start 
//=============================================
function funProcInit()
{
	funRequestGroup1();
	setTimeout("funRequestGroup2()",100);
}

//=============================================
// request group1
//=============================================
function funRequestGroup1()
{
	funMailCnt();		//- 메일 건수
	funApprCnt();		//- 결재 건수
}

//=============================================
// request group2
//=============================================
function funRequestGroup2()
{
	funOrderCnt();		//- 지시 건수
	funScheCnt();		//- 일정 건수
}

//=============================================
// request Mail Count
//=============================================
function funMailCnt()
{
	var mailUrl = "http://imail.iljin.co.kr/mail/"+user_id+".nsf/($newinbox)?readviewentries&count=1&ui=webmail";
	commGetXml(mailUrl,"responseMailCnt","responseMailErr");
}

//=============================================
// response Mail Count
//=============================================
function responseMailCnt(xml)
{
	var mailCnt = $(xml).find("viewentries").attr("toplevelentries");
	
	if(typeof(mailCnt) == "undefined"){
		$("#mail span").text("0");
	}else{
		$("#mail span").text(mailCnt);
	}
}

//=============================================
//response Mail Err
//=============================================
function responseMailErr()
{
	$("#mail span").text("0");
}

//=============================================
// request Appr Count
//=============================================
function funApprCnt()
{
	var apprUrl = "http://iapp.iljin.co.kr/emate-k15/appro.nsf/view02?readviewentries&RestrictToCategory="+user_id+"&count=1";
	commGetXml(apprUrl,"responseApprCnt","responseApprErr");
}

//=============================================
// response Appr Count
//=============================================
function responseApprCnt(xml)
{
	var apprCnt = $(xml).find("viewentries").attr("toplevelentries");
	
	if(typeof(apprCnt) == "undefined"){
		$("#appr span").text("0");
	}else{
		$("#appr span").text(apprCnt);
	}
}

//=============================================
//response Appr Err
//=============================================
function responseApprErr()
{
	$("#appr span").text("0");
}

//=============================================
// request Order Count
//=============================================
function funOrderCnt()
{
	var orderUrl = "http://iapp.iljin.co.kr/emate-k15/bizOrder2007.nsf/view02?readviewentries&RestrictToCategory="+user_nm+"/"+user_id+"/ILJIN&count=1";
	commGetXml(orderUrl,"responseOrderCnt","responseOrderErr");
}

//=============================================
// response Order Count
//=============================================
function responseOrderCnt(xml)
{
	var orderCnt = $(xml).find("viewentries").attr("toplevelentries");
	
	if(typeof(orderCnt) == "undefined"){
		$("#order span").text("0");
	}else{
		$("#order span").text(orderCnt);
	}
}

//=============================================
//response Order Err
//=============================================
function responseOrderErr()
{
	$("#order span").text("0");
}

//=============================================
//request Sche Count
//=============================================
function funScheCnt()
{
	var scheUrl = "http://iapp.iljin.co.kr/emate-k15/todo.nsf/bydaysche?readviewentries&RestrictToCategory="+user_nm+today+"&count=1";
	commGetXml(scheUrl,"responseScheCnt","responseScheErr");
}

//=============================================
//response Sche Count
//=============================================
function responseScheCnt(xml)
{
	var schedCnt = $(xml).find("viewentries").attr("toplevelentries");
	
	if(typeof(schedCnt) == "undefined"){
		$("#sched span").text("0");
	}else{
		$("#sched span").text(schedCnt);
	}
}

//=============================================
//response Sche Err
//=============================================
function responseScheErr()
{
	$("#sched span").text("0");
}


//=============================================
//document Event Handler Function 
//=============================================
function initEventHanlder()
{
	//- 메일 건수 클릭
	$("#mail").click(function(){
		var mail_url = "http://imail.iljin.co.kr/mail/"+290099+".nsf/splitFrame?readform&node=1&expand=n&ui=webmail";
		$("#body", top.main.document).attr("src",encodeURI(mail_url));
	});
	
	//- 결재 건수 클릭
	$("#appr").click(function(){
		var appr_url = "http://iapp.iljin.co.kr/portal.nsf/splitFrame?readform&menu=전자결재&expand=n&node=전자결재ㆍ결재함&content=/emate-k15/appro.nsf/view02?openview&count=1";
		$("#body", top.main.document).attr("src",encodeURI(appr_url));
	});
	
	//- 지시 건수 클릭
	$("#order").click(function(){
		var order_url = "http://iapp.iljin.co.kr/portal.nsf/splitFrame?ReadForm&menu=업무지원&node=지시업무ㆍ지시받은 내역&expand=n&content=http://imail.iljin.co.kr/emate-k15/bizOrder2007.nsf/view02?openview";
		$("#body", top.main.document).attr("src",encodeURI(order_url));
	});
	
	//- 금일 일정 건수 클릭
	$("#sched").click(function(){
		var sched_url = "http://iapp.iljin.co.kr/emate-k15/todo.nsf/splitFrame?readform";
		$("#body", top.main.document).attr("src",encodeURI(sched_url));
	});
	
	//- document start
	funProcInit();
}

</script>
</head>
<body>
<div class="insa2">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="84px">
				<!-- 사진 영역 -->
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="photoBoxWrap" align="center"><img style="width:78px; height:77px;" src="<c:url value='/images/egovframework/common/nophoto.gif' />" border="3"></td>
						<!-- <td class="photoBoxWrap" align="center"><img style="width:78px; height:77px;" src="http://iapp.iljin.co.kr/picture.nsf/pview/290099/$file/290099.jpg"  onerror="this.src='/images/egovframework/common/nophoto.gif'" border="3"></td> -->
					</tr>
				</table>
				<!-- 사진 영역 -->
			</td>
			<td valign="top">
				<!-- 건수 정보 영역 -->
				<table width="90%" border="0" cellspacing="0" cellpadding="0" class="insaList">
					<tr height="18">
						<td><img src="<c:url value='/images/egovframework/common/i_mail.gif' />" align="absmiddle">메일</td>
						<!-- <td align="right"><a id="mail" href="#"><span class="styleTxt2"></span></a> 건</td> -->
						<td align="right"><a id="mail" href="<c:url value='/uss/ion/ntr/listNoteRecptn.do' />"><span class="styleTxt2"><c:out value="${NoteRecptnRelationCnt }" /></span></a> 건</td>
					</tr>
					<%-- <tr height="18">
						<td><img src="<c:url value='/images/egovframework/common/i_approval.gif' />" align="absmiddle">결재</td>
						<td align="right"><a id="appr" href="#"><span class="styleTxt2"><c:out value="${RwardManageConfmAtCnt }" /></span></a> 건</td>
					</tr> --%>
					<tr height="18">
						<td><img src="<c:url value='/images/egovframework/common/i_work.gif' />" align="absmiddle">지시</td>
						<td align="right"><a id="order" href="#"><span class="styleTxt2"></span></a> 건</td>
					</tr>
					<tr height="18">
						<td><img src="<c:url value='/images/egovframework/common/i_schedule.gif' />" align="absmiddle">일정</td>
						<td align="right"><a id="sched" href="#"><span class="styleTxt2"></span></a> 건</td>
					</tr>
				</table>
				<!-- 건수 정보 영역 -->
			</td>
		</tr>
	</table>
</div>
</body>
</html>