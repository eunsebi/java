<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ page import="java.util.*, java.text.*"  %>

<%

//오늘 날짜 데이터
String thisDay = new java.text.SimpleDateFormat ("yyyy-MM-dd").format(new java.util.Date());
//System.out.println("thisDay : " + thisDay);
//하루 증가된 날짜 계산을 위해서 
String thisDayMore = thisDay.replaceAll("-","");
int thisDayMoreInt = Integer.parseInt(thisDayMore);
thisDayMoreInt = thisDayMoreInt+14;
thisDayMore = String.valueOf(thisDayMoreInt);

//System.out.println("thisDayMoreInt : " + thisDayMoreInt);
//System.out.println("ThisDayMore1 : " + thisDayMore);

SimpleDateFormat sdfmt = new SimpleDateFormat("yyyyMMdd"); 
Date date = sdfmt.parse(thisDayMore);

thisDayMore = new java.text.SimpleDateFormat ("yyyyMMdd").format(date);

//System.out.println("ThisDayMore2 : " + thisDayMore);

%>

<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--
        다음오픈에디터 사용 튜토리얼은 이 페이지로 대신합니다.
        추가적인 기능 개발 및 플러그인 개발 튜토리얼은 홈페이지를 확인해주세요.
        작업이 완료된 후에는 주석을 삭제하여 사용하십시요.

        다음오픈에디터의 라이선스는 GNU LGPL(Lesser General Public License) 으로
        오픈되어 있는 소스이므로 저작권료 없이 사용이 가능하며, 목적에 맞게 수정하여 사용할 수 있으십니다.
        또한 LGPL에는 수정한 부분의 소스공개를 권장하고 있으나, 강제 사항은 아니므로 공개하지 않으셔도 무방합니다.
        다만 사용하시는 소스 상단 부분에 다음오픈에디터를 사용하셨음을 명시해 주시길 권장 드리며,
        꾸준한 업데이트를 할 예정이니 종종 방문 하셔서 버그가 수정 되고 기능이 추가된 버전들을 다운로드 받아 사용해 주세요.

        라이센스 : GNU LGPL(Lesser General Public License)
        홈페이지 : https://github.com/daumcorp/DaumEditor/
    -->
    <!--
        에디터 리소스들을 로딩하는 부분으로, 경로가 변경되면 이 부분 수정이 필요.
        주의: 서비스에 이용시 loader 에 붙은 environment=development 값을 제거해야 브라우저 캐시를 사용할 수 있습니다.
    -->
    <link rel="stylesheet" href="<c:url value='/html/egovframework/com/cmm/utl/daumeditor/css/editor.css'/>" type="text/css" charset="utf-8"/>
    
	<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
	<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
	<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">

    <script src="<c:url value='/html/egovframework/com/cmm/utl/daumeditor/js/editor_loader.js'/>" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
	<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js'/>" ></script>
	<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
	<script type="text/javascript" src="<c:url value='/js/egovframework/com/cop/bbs/EgovBBSMng.js' />"></script>
	
	<script type="text/javascript">
	_editor_area = "nttCn";
	/* _editor_url = "<c:url value='/html/egovframework/com/cmm/utl/htmlarea3.0/'/>"; */
	_editor_url = "<c:url value='/html/egovframework/com/cmm/utl/daumeditor/js/editor_loader.js/'/>";
	</script>


	<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>
	<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
	<script type="text/javascript">
		function fn_egov_validateForm(obj) {
			return true;
		}
	
		function fn_egov_regist_notice() {
			//document.board.onsubmit();
	
			/* if (document.getElementById("SchduleData_2").value == "1" && document.getElementById("SchduleData_3").value == "1"){
				alert("온도프로파일 한개만 선택하세요");
				return;
			} */
	
			if (confirm('<spring:message code="common.regist.msg" />')) {
				//document.board.onsubmit();
				document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
				document.board.submit();
			}
		}
	
		function fn_egov_select_noticeList() {
			document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
			document.board.submit();
		}
		function makeFileAttachment(){
		<c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
			 var maxFileNum = document.board.posblAtchFileNumber.value;
		     if(maxFileNum==null || maxFileNum==""){
		    	 maxFileNum = 3;
		     }
			 var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
			 multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
		</c:if>
		}
	
	function selectTitle(str) {
	
		var ss = "<c:out value='${bdMstr.bbsId}'/>";
	
		var date = "<%=thisDay %>"; 
		document.board.nttSj.value=date +"일 " + str;
	}
	
	
	</script>
	
<style type="text/css">
.noStyle {background:ButtonFace; BORDER-TOP:0px; BORDER-bottom:0px; BORDER-left:0px; BORDER-right:0px;}
  .noStyle th{background:ButtonFace; padding-left:0px;padding-right:0px}
  .noStyle td{background:ButtonFace; padding-left:0px;padding-right:0px}
</style>
<title><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</title>

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>
</head>
<body onload="loadContent()">
<div class="body">
	<!-- 에디터 시작 -->
	<!--
		@decsription
		등록하기 위한 Form으로 상황에 맞게 수정하여 사용한다. Form 이름은 에디터를 생성할 때 설정값으로 설정한다.
	-->
	<%-- <form name="tx_editor_form" id="tx_editor_form" action="http://posttestserver.com/post.php" method="post" accept-charset="utf-8"> --%>
	<form:form commandName="board" name="tx_editor_form" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
		<input type="hidden" name="returnUrl" value="<c:url value='/cop/bbs/forUpdateBoardArticle.do'/>"/>
		
		<input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />
		<input type="hidden" name="nttId" value="<c:out value='${result.nttId}'/>" />
		<input type="hidden" name="schdule" value="<c:out value='${result.schduleData_1}'/>,<c:out value='${result.schduleData_2}'/>,<c:out value='${result.schduleData_3}'/>" />
		
		<input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
		<input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
		<input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
		<input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
		<input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
		<input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
		<input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
		
		<input type="hidden" name="cal_url" value="<c:url value='/sym/cal/EgovNormalCalPopup.do'/>" />
		
		<c:if test="${anonymous != 'true'}">
		<input type="hidden" name="ntcrNm" value="dummy">	<!-- validator 처리를 위해 지정 -->
		<input type="hidden" name="password" value="dummy">	<!-- validator 처리를 위해 지정 -->
		</c:if>
		
		<c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
		   <input id="ntceBgnde" name="ntceBgnde" type="hidden" value="10000101">
		   <input id="ntceEndde" name="ntceEndde" type="hidden" value="99991231">
		</c:if>
		<!-- 에디터 컨테이너 시작 -->
		<div id="tx_trex_container" class="tx-editor-container">
		
			<table width="100%" cellpadding="8" class="table-search" border="0">
				<tr>
					<td width="100%"class="title_left">
						<img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목버튼이미지">
						&nbsp;<c:out value='${bdMstr.bbsNm}'/> - 게시글 수정
					</td>
				 </tr>
			</table>
			
			<table width="100%" border="0" cellpadding="0" cellspacing="1" class="generalTable">
				<tr>
					<th width="15%" height="23" class="emphasisRight" nowrap><spring:message code="cop.nttSj" />
						<img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
					<td width="80%" nowrap colspan="3">
						<input name="nttSj" type="text" size="60" value='<c:out value="${result.nttSj}" />'  maxlength="60" title="제목수정">
							<br/><form:errors path="nttSj" />
					</td>
				</tr>
				  
				<c:if test="${bdMstr.bbsId == 'BBSMSTR_000000000002' || bdMstr.bbsId == 'BBSMSTR_000000000012'}">
				<tr>
					<th width="23%" class="emphasisRight" nowrap>체크사항</th>
					<td>
				  		<input id="SchduleData_1" name="SchduleData_1" type="checkbox" value="1" <c:if test="${result.schduleData_1 == '1' }">checked</c:if>>에칭 스탭 비치
				  		<input id="SchduleData_2" name="SchduleData_2" type="checkbox" value="1" <c:if test="${result.schduleData_2 == '1' }">checked</c:if>>전열로 프로파일 비치
				  		<input id="SchduleData_3" name="SchduleData_3" type="checkbox" value="1" <c:if test="${result.schduleData_3 == '1' }">checked</c:if>>MIR,전열,박스오븐 프로파일 비치
				  	</td>
				</tr>
				</c:if>
			</table>
			
			<c:import url="/EgovPageLink.do?link=egovframework/com/cop/bbs/wysiwyg" />
			
		</div>
		<!-- 에디터 컨테이너 끝 -->
	</form:form>
</div>
<!-- 에디터 끝 -->
<script type="text/javascript">
	var config = {
		txHost: 'http://127.0.0.1', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) http://xxx.xxx.com */
		txPath: '/html/egovframework/com/cmm/utl/daumeditor/js', /* 런타임 시 리소스들을 로딩할 때 필요한 부분으로, 경로가 변경되면 이 부분 수정이 필요. ex) /xxx/xxx/ */
		txService: 'sample', /* 수정필요없음. */
		txProject: 'sample', /* 수정필요없음. 프로젝트가 여러개일 경우만 수정한다. */
		initializedId: "", /* 대부분의 경우에 빈문자열 */
		wrapper: "tx_trex_container", /* 에디터를 둘러싸고 있는 레이어 이름(에디터 컨테이너) */
		form: 'tx_editor_form'+"", /* 등록하기 위한 Form 이름 */
		txIconPath: "/images/daumeditor/images/icon/editor/", /*에디터에 사용되는 이미지 디렉터리, 필요에 따라 수정한다. */
		txDecoPath: "/images/daumeditor/images/deco/contents/", /*본문에 사용되는 이미지 디렉터리, 서비스에서 사용할 때는 완성된 컨텐츠로 배포되기 위해 절대경로로 수정한다. */
		canvas: {
            exitEditor:{
                /*
                desc:'빠져 나오시려면 shift+b를 누르세요.',
                hotKey: {
                    shiftKey:true,
                    keyCode:66
                },
                nextElement: document.getElementsByTagName('button')[0]
                */
            },
			styles: {
				color: "#123456", /* 기본 글자색 */
				fontFamily: "굴림", /* 기본 글자체 */
				fontSize: "10pt", /* 기본 글자크기 */
				backgroundColor: "#fff", /*기본 배경색 */
				lineHeight: "1.5", /*기본 줄간격 */
				padding: "8px" /* 위지윅 영역의 여백 */
			},
			showGuideArea: false
		},
		events: {
			preventUnload: false
		},
		sidebar: {
			attachbox: {
				show: true,
				confirmForDeleteAll: true
			}
		},
		size: {
			contentWidth: 700 /* 지정된 본문영역의 넓이가 있을 경우에 설정 */
		}
	};

	EditorJSLoader.ready(function(Editor) {
		var editor = new Editor(config);
	});
	
</script>

<!-- Sample: Saving Contents -->
<script type="text/javascript">
	/* 예제용 함수 */
	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	/**
	 * Editor.save()를 호출한 경우 데이터가 유효한지 검사하기 위해 부르는 콜백함수로
	 * 상황에 맞게 수정하여 사용한다.
	 * 모든 데이터가 유효할 경우에 true를 리턴한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 모든 데이터가 유효할 경우에 true
	 */
	function validForm(editor) {
		// Place your validation logic here

		// sample : validate that content exists
		var validator = new Trex.Validator();
		var content = editor.getContent();
		
		// 기존 스크립 추가
		var ntceBgnde = eval(document.getElementById("ntceBgnde").value);
		var ntceEndde = eval(document.getElementById("ntceEndde").value);
		
		<c:if test="${bdMstr.bbsId == 'BBSMSTR_000000000002' || bdMstr.bbsId == 'BBSMSTR_000000000012'}">
			if(document.getElementById("SchduleData_2").checked == true && document.getElementById("SchduleData_3").checked == true) {
				alert("온도프로파일 체크 두개는 안돼요~~~~~");
				return;
			}
		</c:if>
		
		if(ntceBgnde > ntceEndde){
			alert("게시기간 종료일이 시작일보다 빠릅니다.");
			return;
		}
		// 기존 스크립 끝
		
		if (!validateBoard(document.board)){
			return;
		}
		
		if (!validator.exists(content)) {
			alert('내용을 입력하세요');
			return false;
		}
		 
		return true;
		
	}

	/**
	 * Editor.save()를 호출한 경우 validForm callback 이 수행된 이후
	 * 실제 form submit을 위해 form 필드를 생성, 변경하기 위해 부르는 콜백함수로
	 * 각자 상황에 맞게 적절히 응용하여 사용한다.
	 * @function
	 * @param {Object} editor - 에디터에서 넘겨주는 editor 객체
	 * @returns {Boolean} 정상적인 경우에 true
	 */
	function setForm(editor) {
        var i, input;
        var form = editor.getForm();
        var content = editor.getContent();

        // 본문 내용을 필드를 생성하여 값을 할당하는 부분
        var textarea = document.createElement('textarea');
        textarea.name = 'nttCn';
        textarea.value = content;
        form.createField(textarea);

        /* 아래의 코드는 첨부된 데이터를 필드를 생성하여 값을 할당하는 부분으로 상황에 맞게 수정하여 사용한다.
         첨부된 데이터 중에 주어진 종류(image,file..)에 해당하는 것만 배열로 넘겨준다. */
        var images = editor.getAttachments('image');
        for (i = 0; i < images.length; i++) {
            // existStage는 현재 본문에 존재하는지 여부
            if (images[i].existStage) {
                // data는 팝업에서 execAttach 등을 통해 넘긴 데이터
                alert('attachment information - image[' + i + '] \r\n' + JSON.stringify(images[i].data));
                input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'attach_image';
                input.value = images[i].data.imageurl;  // 예에서는 이미지경로만 받아서 사용
                form.createField(input);
            }
        }

        var files = editor.getAttachments('file');
        for (i = 0; i < files.length; i++) {
            input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'attach_file';
            input.value = files[i].data.attachurl;
            form.createField(input);
        }
        document.board.action = "<c:url value='/cop/bbs${prefix}/updateBoardArticle.do'/>";
        document.board.submit();
        //return true;
	}
</script>
<div style="text-align: center;"><button onclick='saveContent()'>등록</button><button onClick='fn_egov_select_noticeList()'>목록</button></div>
<!-- End: Saving Contents -->

<!-- Sample: Loading Contents -->
<textarea id="sample_contents_source" style="display:none;">
	<c:out value="${result.nttCn}" />
</textarea>
<script type="text/javascript">
	function loadContent() {
		var attachments = {};
		/* attachments['image'] = [];
		attachments['image'].push({
			'attacher': 'image',
			'data': {
				'imageurl': 'http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8',
				'filename': 'github.gif',
				'filesize': 59501,
				'originalurl': 'http://cfile273.uf.daum.net/original/2064CD374EE1ACCB0F15C8',
				'thumburl': 'http://cfile273.uf.daum.net/P150x100/2064CD374EE1ACCB0F15C8'
			}
		});
		attachments['file'] = [];
		attachments['file'].push({
			'attacher': 'file',
			'data': {
				'attachurl': 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
				'filemime': 'image/gif',
				'filename': 'editor_bi.gif',
				'filesize': 640
			}
		}); */
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments": function () { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for (var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content": document.getElementById("sample_contents_source") /* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	}
</script>
<!-- <div><button onclick='loadContent()'>SAMPLE - load contents to editor</button></div> -->
<!-- End: Loading Contents -->

</body>
</html>