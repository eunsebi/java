/****************************************************************
 *
 * 파일명 : ConsumableInventory.js
 * 설 명 : 소모품 사용현황을 대체하는 JavaScript
 *
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2015.02.08    심은섭       1.0             최초생성
 *
 */

/* ********************************************************
* 크린롤러 및 핫롤러 
******************************************************** */
function CleanRoller_consumableCheck() {
	var code = document.getElementById("codeId").value;
	var schdulDeptId = document.getElementById("schdulDeptId").value;
	var bbsId = document.getElementById("bbsId").value;
	var select = document.getElementById("facility");
	var option_value = select.options[select.selectedIndex].value;
	//var option_text   = select.options[select.selectedIndex].text;
	
	//var consumable = document.getElementById("consumable");
	//var consumableCode = consumable.options[sh.selectedIndex].value;
	
	if (schdulDeptId == "") {
		alert("부서명을 먼저 선택하세요");
		return;
	} else {
		// 전열로
		//alert(schdulDeptName);
		if (code == "COM100" && bbsId == "CONS_001") {
			if(option_value == "MA01") {
				document.getElementById('consumable').value = "CON010";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con300;
			} else if (option_value == "MA02") {
				document.getElementById('consumable').value = "CON011";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con300;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM100" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON011";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con300;
		}
		
		// DFR라미 1공장
		if (code == "COM110" && bbsId == "CONS_001") {
			if(option_value == "MA03") {
				document.getElementById('consumable').value = "CON091";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con310;
			} else if (option_value == "MA01" || option_value == "MA02" ){
				document.getElementById('consumable').value = "CON090";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con311;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM110" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON091";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con310;
		}
		
		// 평행광 노광
		if (code == "COM120" && bbsId == "CONS_001") {
			if(option_value == "MA02") {
				document.getElementById('consumable').value = "CON020";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con320;
			} else if(option_value == "MA01" || option_value == "MA03" | option_value == "MA04"){
				document.getElementById('consumable').value = "CON021";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con320;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM120" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON021";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con320;
		}
		//실버 인쇄기
		if (code == "COM140" && bbsId == "CONS_001") {
			document.getElementById('consumable').value = "CON030";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con330;
		} else if (code == "COM140" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON030";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con330;
		}
		
		// MIR건조로
		if (code == "COM190" && bbsId == "CONS_001") {
			if(option_value == "MA05" || option_value == "MA06" ) {
				document.getElementById('consumable').value = "CON042";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con92;
			} else {
				document.getElementById('consumable').value = "CON040";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con341;
			}
		} else if (code == "COM190" && bbsId == "CONS_002") {
			if (option_value == "MA05") {
				document.getElementById('consumable').value = "CON041";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con340;
			} else if (option_value == "MA06"){
				document.getElementById('consumable').value = "CON042";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con300;
			} else {
				document.getElementById('consumable').value = "CON040";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con341;
			}
		}
		
		// DI 노광기
		if (code == "COM150" && bbsId == "CONS_001") {
			document.consumableInventoryVO.facility.disabled=true;
			document.getElementById('facility').value = "";
			
		}
		
		// TR인쇄기
		if (code == "COM170" && bbsId == "CONS_001") {
			if (option_value == "MA06") {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			} else {
				document.getElementById('consumable').value = "CON061";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con331;
			}
			
		} else if (code == "COM170" &&  bbsId == "CONS_002") {
			if (option_value == "MA06") {
				document.getElementById('consumable').value = "CON061";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con331;
			} else {
				document.getElementById('consumable').value = "CON060";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con330;
			}
		}

		// 롤라미
		if (code == "COM195" && bbsId == "CONS_001") {
			if (option_value == "MA06") {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			} else {
				document.getElementById('consumable').value = "CON070";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con95;
			}
			
		} else if (code == "COM195" &&  bbsId == "CONS_002") {
			if (option_value == "MA05") {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			} else {
				document.getElementById('consumable').value = "CON070";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con95;
			}
		}
		
	}
	
}


/* ********************************************************
* 크린롤러 소모품 계산
******************************************************** */
function cleanRoller_Calculator(objArr) {
	//if (objArr == 0) {
		var codeId = document.getElementById("consumable").value;
		var cn = document.getElementById("useCn").value;
		var select = document.getElementById("consumable");
		var option_text   = select.options[select.selectedIndex].text;
		
		if (codeId == "CON300") {
			con300 = con300 - cn;
			if (con300 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON310") {
			con310 = con310 - cn;
			if (con310 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON311") {
			con311 = con311 - cn;
			if (con311 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON320") {
			con320 = con320 - cn;
			if (con320 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON330") {
			con330 = con330 - cn;
			if (con330 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON331") {
			con331 = con331 - cn;
			if (con331 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON340") {
			con340 = con340 - cn;
			if (con340 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON341") {
			con341 = con341 - cn;
			if (con341 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON350") {
			con350 = con350 - cn;
			if (con350 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON92") {
			con92 = con92 - cn;
			if (con92 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON95") {
			con95 = con95 - cn;
			if (con95 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	//}
	
}



/* ********************************************************
* 소모품 코드별 수량 등록
******************************************************** */
function codeNumbering() {

	// 전열로 크린롤러
	if (document.getElementById('CON300') == null) {
		con300 = "0";
	} else {
		con300 = document.getElementById('CON300').value;
	}
	
	// DFR라미 핫롤러 큰것
	if (document.getElementById('CON310') == null) {
		con310 = "0";
	} else {
		con310 = document.getElementById('CON310').value;
	}
	
	// DFR라미 핫롤러 작은것
	if (document.getElementById('CON311') == null) {
		con311 = "0";
	} else {
		con311 = document.getElementById('CON311').value;
	}

	// 평행광 노광기 크린롤러
	if (document.getElementById('CON320') == null) {
		con320 = "0";
	} else {
		con320 = document.getElementById('CON320').value;
	}

	// 인쇄기 크린롤러 650mm
	if (document.getElementById('CON330') == null) {
		con330 = "0";
	} else {
		con330 = document.getElementById('CON330').value;
	}
	
	// 인쇄기 크린롤러 540mm
	if (document.getElementById('CON331') == null) {
		con331 = "0";
	} else {
		con331 = document.getElementById('CON331').value;
	}

	// MIR건조로 크린롤러 큰것
	if (document.getElementById('CON340') == null) {
		con340 = "0";
	} else {
		con340 = document.getElementById('CON340').value;
	}
	
	// MIR건조로 크린롤러 작은것
	if (document.getElementById('CON341') == null) {
		con341 = "0";
	} else {
		con341 = document.getElementById('CON341').value;
	}
	
	// DI노광기 크린롤러 큰것
	if (document.getElementById('CON350') == null) {
		con350 = "0";
	} else {
		con350 = document.getElementById('CON350').value;
	}

	// IR건조로 크린롤러
	if (document.getElementById('CON92') == null) {
		con92 = "0";
	} else {
		con92 = document.getElementById('CON92').value;
	}
	
	// 롤라미 메인롤러
	if (document.getElementById('CON95') == null) {
		con95 = "0";
	} else {
		con95 = document.getElementById('CON95').value;
	}
	
}