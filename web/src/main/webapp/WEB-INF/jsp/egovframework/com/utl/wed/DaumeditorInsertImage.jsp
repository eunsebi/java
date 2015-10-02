<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Daum에디터 - 이미지 첨부</title> 
<script src="/html/egovframework/com/cmm/utl/daumeditor/js/popup.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/html/egovframework/com/cmm/utl/daumeditor/css/popup.css" type="text/css"  charset="utf-8"/>
<script type="text/javascript">
// <![CDATA[
	
	function done() {
		if (typeof(execAttach) == 'undefined') { //Virtual Function
	        return;
	    }
		
		var _mockdata = {
			'imageurl': '${url}',
			'filename': '${filename}',
			'filesize': '${filesize}',
			'imagealign': 'C',
			'originalurl': '',
			'thumburl': ''
		};
		execAttach(_mockdata);
		closeWindow();
	}

	function initUploader(){
	    var _opener = PopupUtil.getOpener();
	    if (!_opener) {
	        alert('잘못된 경로로 접근하셨습니다.');
	        return;
	    }
	    
	    var _attacher = getAttacher('image', _opener);
	    registerAction(_attacher);
	}
	
	function onUpload() {
		var f_upload = document.getElementById("f_upload");
		var file = f_upload.value;

		if (!file) {
			alert("You have to select image file first");
			f_upload.focus();

			return false;
		}

		var frm = document.getElementsByTagName("form")[0];

		frm.submit();

		return false;
	};
// ]]>
</script>
</head>
<body onload="initUploader();">
<div class="wrapper">
	<div class="header">
		<h1>사진 첨부</h1>
	</div>	
	<div class="body">
		<dl class="alert">
		    <dt>사진 첨부 확인</dt>
		    <dd>
		    	확인을 누르시면 임시 데이터가 사진첨부 됩니다.<br /> 
				인터페이스는 소스를 확인해주세요.
			</dd>
			<form action="" method="post" enctype="multipart/form-data">
				<dd>
					<input type="file" name="file" id="f_upload" style="width: 100%" title="Select upload image here" />
						<button name="upload" onclick="return onUpload();" title="Upload image file">Upload</button>
				</dd>
				<dd>
					<input type="text" name="url" id="f_url" style="width: 75%" title="Enter the image URL here" value="${url}" />
						<button name="preview" onclick="return onPreview();" title="Preview the image in a new window">Preview</button>
				</dd>
				
			</form>
		</dl>
	</div>
	<div class="footer">
		<p><a href="#" onclick="closeWindow();" title="닫기" class="close">닫기</a></p>
		<ul>
			<li class="submit"><a href="#" onclick="done();" title="등록" class="btnlink">등록</a> </li>
			<li class="cancel"><a href="#" onclick="closeWindow();" title="취소" class="btnlink">취소</a></li>
		</ul>
	</div>
</div>
</body>
</html>