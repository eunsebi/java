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
* 공정  확인
******************************************************** */
function deptNameCheck() {
	var code = document.getElementById("codeId").value;
	var schdulDeptName = document.getElementById("schdulDeptName").value;
	var select = document.getElementById("facility");
	//var bbsId = document.getElementById("bbsId").value;
	var option_value = select.options[select.selectedIndex].value;
	//var option_text   = select.options[select.selectedIndex].text;
	
	// 1공장 전열로
	if (code == "COM100" && schdulDeptName == "ORGNZT_0000000000011" && option_value == "MA01") {
		document.getElementById('consumable').value = "CON11";
	} else if (code == "COM100" && schdulDeptName == "ORGNZT_0000000000000") {
		document.getElementById('consumable').value = "CON10";
	}
	
	// 1공장 DFR라미
	if (code == "COM110" && schdulDeptName == "ORGNZT_0000000000011" && option_value == "MA03") {
		document.getElementById('consumable').value = "CON21";
	} else if (code == "COM110" && schdulDeptName == "ORGNZT_0000000000000") {
		document.getElementById('consumable').value = "CON21";
	}
	
	// 1공장 평행광 노광
	if (code == "COM120" && schdulDeptName == "ORGNZT_0000000000011" && option_value == "MA02") {
		document.getElementById('consumable').value = "CON31";
	} else if (code == "COM120" && schdulDeptName == "ORGNZT_0000000000000") {
		document.getElementById('consumable').value = "CON30";
	}
	
	// 실버인쇄기
	if (code == "COM140" && schdulDeptName == "ORGNZT_0000000000000" && option_value == "MA06") {
		document.getElementById('consumable').value = "CON30";
	} else if (code == "COM140" && schdulDeptName == "ORGNZT_0000000000011") {
		document.getElementById('consumable').value = "CON50";
	}
	
	// MIR건조로
	if (code == "COM190" && schdulDeptName == "ORGNZT_0000000000011" && option_value == "MA05") {
		document.getElementById('consumable').value = "CON62";
	} else if (code == "COM190" && schdulDeptName == "ORGNZT_0000000000011" && option_value == "MA06") {
		document.getElementById('consumable').value = "CON62";
	} else if (code == "COM190" && schdulDeptName == "ORGNZT_0000000000000") {
		if (option_value == "MA05") {
			document.getElementById('consumable').value = "CON61";
		} else if (option_value == "MA06"){
			document.getElementById('consumable').value = "CON10";
		} else {
			document.getElementById('consumable').value = "CON60";
		}
	}
	
	// TR인쇄기
	if (code == "COM170" && schdulDeptName == "ORGNZT_0000000000011") {
		document.getElementById('consumable').value = "CON51";
	} else if (code == "COM170" && schdulDeptName == "ORGNZT_0000000000000") {
		if (option_value == "MA06") {
			document.getElementById('consumable').value = "CON51";
		} else {
			document.getElementById('consumable').value = "CON50";
		}
	}
	
}

/* ********************************************************
* 유포지 
******************************************************** */
function consumableCheck() {
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
				document.getElementById('consumable').value = "CON170";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con11;
			} else if (option_value == "MA02") {
				document.getElementById('consumable').value = "CON171";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con10;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM100" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON171";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con10;
		}
		
		// DFR라미 1공장
		if (code == "COM110" && bbsId == "CONS_001") {
			if(option_value == "MA03") {
				document.getElementById('consumable').value = "CON121";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con21;
			} else if (option_value == "MA01" || option_value == "MA02" ){
				document.getElementById('consumable').value = "CON120";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con20;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM110" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON121";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con21;
		}
		
		// 평행광 노광
		if (code == "COM120" && bbsId == "CONS_001") {
			if(option_value == "MA02") {
				document.getElementById('consumable').value = "CON130";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con31;
			} else if(option_value == "MA01" || option_value == "MA03" | option_value == "MA04"){
				document.getElementById('consumable').value = "CON131";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con30;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM120" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON131";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con30;
		}
		//실버 인쇄기
		if (code == "COM140" && bbsId == "CONS_001") {
			document.getElementById('consumable').value = "CON140";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con50;
		} else if (code == "COM140" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON140";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con50;
			
			if(option_value == "MA06") {
				document.getElementById('consumable').value = "CON131";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con30;
			}
			
		}
		
		// MIR건조로
		if (code == "COM190" && bbsId == "CONS_001") {
			if(option_value == "MA05" || option_value == "MA06" ) {
				document.getElementById('consumable').value = "CON151";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con62;
			} else {
				document.getElementById('consumable').value = "CON150";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con60;
			}
		} else if (code == "COM190" && bbsId == "CONS_002") {
			if (option_value == "MA05") {
				document.getElementById('consumable').value = "CON152";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con61;
			} else if (option_value == "MA06"){
				document.getElementById('consumable').value = "CON011";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con10;
			} else {
				document.getElementById('consumable').value = "CON150";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con60;
			}
		}
		
		// DI 노광기
		if (code == "COM150" && bbsId == "CONS_001") {
			document.consumableInventoryVO.facility.disabled=true;
			document.getElementById('facility').value = "";
			
		} else if(code == "COM150" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON050";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con70;
		}
		
		// TR인쇄기
		if (code == "COM170" && bbsId == "CONS_001") {
			if (option_value == "MA06") {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			} else {
				document.getElementById('consumable').value = "CON141";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con51;
			}
			
		} else if (code == "COM170" &&  bbsId == "CONS_002") {
			if (option_value == "MA06") {
				document.getElementById('consumable').value = "CON141";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con51;
			} else {
				document.getElementById('consumable').value = "CON140";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con50;
			}
		}
		
		// 롤라미
		if (code == "COM1195" && bbsId == "CONS_001") {
			document.getElementById('consumable').value = "";
			alert("없는 설비입니다.");
			
		} else if (code == "COM195" &&  bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON160";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con94;
			
		}
		
	}
	
}

/* ********************************************************
* 필터 설비별 체크 확인
******************************************************** */
function filter_consumableCheck() {

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
		// D.E.S 필터
		if(code == "COM130" && bbsId == "CONS_001") {
			if (option_value == "MA01") {
				document.getElementById("consumable").value = "CON001";			// 현상 하우징
				document.getElementById("consumable_1").value = "CON002";		// 현상 수세
				document.getElementById("consumable_2").value = "CON004";		// 에칭 하우징
				document.getElementById("consumable_3").value = "CON002";		// 에칭 수세
				document.getElementById("consumable_4").value = "CON001";		// 박리 하우징
				document.getElementById("consumable_5").value = "CON002";		// 박리 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";		// 현상 수세
				document.getElementById("useCn_2").value = "";		// 에칭 하우징
				document.getElementById("useCn_3").value = "";		// 에칭 수세
				document.getElementById("useCn_4").value = "";		// 박리 하우징
				document.getElementById("useCn_5").value = "";		// 박리 수세
			} else if (option_value == "MA02") {
				document.getElementById("consumable").value = "CON003";			// 현상 하우징
				document.getElementById("consumable_1").value = "CON003";		// 현상 수세
				document.getElementById("consumable_2").value = "CON003";		// 에칭 하우징
				document.getElementById("consumable_3").value = "CON003";		// 에칭 수세
				document.getElementById("consumable_4").value = "CON001";		// 박리 하우징
				document.getElementById("consumable_5").value = "CON003";		// 박리 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";		// 현상 수세
				document.getElementById("useCn_2").value = "";		// 에칭 하우징
				document.getElementById("useCn_3").value = "";		// 에칭 수세
				document.getElementById("useCn_4").value = "";		// 박리 하우징
				document.getElementById("useCn_5").value = "";		// 박리 수세
			} else {
				document.getElementById("consumable").value = "";			// 현상 하우징
				document.getElementById("consumable_1").value = "";		// 현상 수세
				document.getElementById("consumable_2").value = "";		// 에칭 하우징
				document.getElementById("consumable_3").value = "";		// 에칭 수세
				document.getElementById("consumable_4").value = "";		// 박리 하우징
				document.getElementById("consumable_5").value = "";		// 박리 수세
				alert("없는 설비입니다.");
			}
		} else if (code == "COM130" && bbsId == "CONS_002") {
			document.getElementById("consumable").value = "CON001";			// 현상 하우징
			document.getElementById("consumable_1").value = "CON003";		// 현상 수세
			document.getElementById("consumable_2").value = "CON001";		// 에칭 하우징
			document.getElementById("consumable_3").value = "CON003";		// 에칭 수세
			document.getElementById("consumable_4").value = "CON001";		// 박리 하우징
			document.getElementById("consumable_5").value = "CON003";		// 박리 수세
			
			document.getElementById("useCn").value = "";			// 현상 하우징
			document.getElementById("useCn_1").value = "";		// 현상 수세
			document.getElementById("useCn_2").value = "";		// 에칭 하우징
			document.getElementById("useCn_3").value = "";		// 에칭 수세
			document.getElementById("useCn_4").value = "";		// 박리 하우징
			document.getElementById("useCn_5").value = "";		// 박리 수세
		}
		
		// 실버현상기
		if (code == "COM160" && bbsId == "CONS_001") {
			if (option_value == "MA01" || option_value == "MA02") {
				document.getElementById("consumable").value = "CON002";			// 현상 하우징 1번
				document.getElementById("consumable_1").value = "CON002";		// 현상 하우징 2번
				document.getElementById("consumable_2").value = "CON002";		// 현상 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징 1번
				document.getElementById("useCn_1").value = "";			// 현상 하우징 2번
				document.getElementById("useCn_2").value = "";			// 현상 수세
			} else {
				document.getElementById("consumable").value = "";			// 현상 하우징 1번
				document.getElementById("consumable_1").value = "";			// 현상 하우징 2번
				document.getElementById("consumable_2").value = "";			// 현상 수세
				alert("없는 설비입니다.");
			}
		} else if (code == "COM160" && bbsId == "CONS_002") {
			if (option_value == "MA02" || option_value == "MA03" || option_value == "MA01") {
				document.getElementById("consumable").value = "CON002";			// 현상 하우징 1번
				document.getElementById("consumable_1").value = "CON002";		// 현상 하우징 2번
				document.getElementById("consumable_2").value = "CON002";		// 현상 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";			// 현상 하우징
				document.getElementById("useCn_2").value = "";			// 현상 수세
			} else if (option_value == "MA04") {
				document.getElementById("consumable").value = "CON101";			// 현상 하우징 1번
				document.getElementById("consumable_1").value = "CON101";		// 현상 하우징 2번				
				document.getElementById("consumable_2").value = "CON103";		// 현상 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징 1번
				document.getElementById("useCn_1").value = "";			// 현상 하우징 2번
				document.getElementById("useCn_2").value = "";			// 현상 수세
			} else {
				document.getElementById("consumable").value = "";			// 현상 하우징 1번
				document.getElementById("consumable_1").value = "";			// 현상 하우징 2번
				document.getElementById("consumable_2").value = "";			// 현상 수세
				alert("미사용 설비입니다.");
			}
		}
	}
	
}
/* ********************************************************
* UV Ramp 설비별 체크 확인
******************************************************** */
function consumableCheck2() {
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
		// 평행광 노광기 UV Ramp
		if (code == "COM120" && bbsId == "CONS_001") {
			if(option_value == "MA04") {
				document.getElementById('consumable').value = "CON101";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con35;
			} else if(option_value == "MA01" || option_value == "MA02" || option_value == "MA03") {
				document.getElementById('consumable').value = "CON100";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con36;
			} else {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			}
		} else if (code == "COM120" && bbsId == "CONS_002") {
			if (option_value == "MA08" || option_value == "MA09") {
				document.getElementById('consumable').value = "CON100";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con36;
			} else {
				document.getElementById('consumable').value = "CON101";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con35;
			}
		}
		
		// 경화기 UV RAMP
		if (code == "COM180" && bbsId == "CONS_001") {
			if(option_value == "MA06") {
				document.getElementById('consumable').value = "";
				alert("없는 설비입니다.");
			} else {
				document.getElementById('consumable').value = "CON110";
				document.getElementById('useCn').value = "2";
				document.all.inventoryCnStyle.style.display="";
				document.getElementById('inventoryCn').value = con90;
			}
		} else if(code == "COM180" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "CON110";
			document.getElementById('useCn').value = "2";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con90;
		}
		
		// SS라인 경화기 UV Ramp
		if (code == "COM181" && bbsId == "CONS_001") {
			document.getElementById('useCn').value = "2";
			document.getElementById('consumable').value = "CON110";
			document.all.inventoryCnStyle.style.display="";
			document.getElementById('inventoryCn').value = con90;

		} else if(code == "COM181" && bbsId == "CONS_002") {
			document.getElementById('consumable').value = "";
			alert("없는 설비입니다.");
		}
	}
}

/* ********************************************************
* 액절롤러 설비별 체크 확인
******************************************************** */
function dry_consumableCheck() {

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
		// D.E.S 필터
		if(code == "COM130" && bbsId == "CONS_001") {
			if (option_value == "MA01") {
				document.getElementById("consumable").value = "CON080";			// 현상
				document.getElementById("consumable_1").value = "CON081";		// 에칭
				document.getElementById("consumable_2").value = "CON080";		// 박리
				
				document.getElementById("useCn").value = "";		// 현상
				document.getElementById("useCn_1").value = "";		// 에칭
				document.getElementById("useCn_2").value = "";		// 박리
			} else if (option_value == "MA02") {
				document.getElementById("consumable").value = "CON080";			// 현상
				document.getElementById("consumable_1").value = "CON081";		// 에칭
				document.getElementById("consumable_2").value = "CON080";		// 박리
				
				document.getElementById("useCn").value = "";		// 현상
				document.getElementById("useCn_1").value = "";		// 에칭
				document.getElementById("useCn_2").value = "";		// 박리
			} else {
				document.getElementById("consumable").value = "";		// 현상
				document.getElementById("consumable_1").value = "";		// 에칭
				document.getElementById("consumable_2").value = "";		// 박리
				alert("없는 설비입니다.");
			}
		} else if (code == "COM130" && bbsId == "CONS_002") {
			document.getElementById("consumable").value = "CON080";			// 현상
			document.getElementById("consumable_1").value = "CON081";		// 에칭
			document.getElementById("consumable_2").value = "CON080";		// 박리
			
			document.getElementById("useCn").value = "";		// 현상
			document.getElementById("useCn_1").value = "";		// 에칭
			document.getElementById("useCn_2").value = "";		// 박리
		}
		
		// 실버현상기
		if (code == "COM160" && bbsId == "CONS_001") {
			if (option_value == "MA01" || option_value == "MA02") {
				document.getElementById("consumable").value = "CON082";			// 현상 하우징
				document.getElementById("consumable_1").value = "CON082";		// 현상 수세
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";		// 현상 수세
			} else {
				document.getElementById("consumable").value = "";			// 현상 하우징
				document.getElementById("consumable_1").value = "";		// 현상 수세
				alert("없는 설비입니다.");
			}
		} else if (code == "COM160" && bbsId == "CONS_002") {
			if (option_value == "MA01" || option_value == "MA02" || option_value == "MA03") {
				document.getElementById("consumable").value = "CON082";			// 현상 상부
				document.getElementById("consumable_1").value = "CON082";		// 현상 하부
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";		// 현상 수세
			} else if (option_value == "MA04") {
				document.getElementById("consumable").value = "CON083";			// 현상 상부
				document.getElementById("consumable_1").value = "CON083";		// 현상 하부
				
				document.getElementById("useCn").value = "";			// 현상 하우징
				document.getElementById("useCn_1").value = "";		// 현상 수세
			} else {
				document.getElementById("consumable").value = "";			// 현상 하우징
				document.getElementById("consumable_1").value = "";		// 현상 수세
				alert("미사용 설비입니다.");
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
		
		if (codeId == "CON10") {
			con10 = con10 - cn;
			if (con10 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON11") {
			con11 = con11 - cn;
			if (con11 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON20") {
			con20 = con20 - cn;
			if (con20 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON21") {
			con21 = con21 - cn;
			if (con21 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON30") {
			con30 = con30 - cn;
			if (con30 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON31") {
			con31 = con31 - cn;
			if (con31 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON50") {
			con50 = con50 - cn;
			if (con50 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON51") {
			con51 = con51 - cn;
			if (con51 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON60") {
			con60 = con60 - cn;
			if (con60 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON61") {
			con61 = con61 - cn;
			if (con61 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON62") {
			con62 = con62 - cn;
			if (con62 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON70") {
			con70 = con70 - cn;
			if (con70 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON94") {
			con94 = con94 - cn;
			if (con94 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
		
		
		
	//}
	
}

/* ********************************************************
* 필터 소모품 계산
******************************************************** */
function filter_Calculator(objArr) {

	if (objArr == 0) {
		var codeId = document.getElementById("consumable").value;
		var cn = document.getElementById("useCn").value;
		var select = document.getElementById("consumable");
		var option_text   = select.options[select.selectedIndex].text;
		
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 1) {
		var codeId = document.getElementById("consumable_1").value;
		var cn = document.getElementById("useCn_1").value;
		var select = document.getElementById("consumable_1");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 2) {
		var codeId = document.getElementById("consumable_2").value;
		var cn = document.getElementById("useCn_2").value;
		var select = document.getElementById("consumable_2");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 3) {
		var codeId = document.getElementById("consumable_3").value;
		var cn = document.getElementById("useCn_3").value;
		var select = document.getElementById("consumable_3");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 4) {
		var codeId = document.getElementById("consumable_4").value;
		var cn = document.getElementById("useCn_4").value;
		var select = document.getElementById("consumable_4");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 5) {
		var codeId = document.getElementById("consumable_5").value;
		var cn = document.getElementById("useCn_5").value;
		var select = document.getElementById("consumable_5");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON100") {
			con100 = con100 - cn;
			if (con100 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON101") {
			con101 = con101 - cn;
			if (con101 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON102") {
			con102 = con102 - cn;
			if (con102 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON103") {
			con103 = con103 - cn;
			if (con103 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON104") {
			con104 = con104 - cn;
			if (con104 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	}
	
}

/* ********************************************************
* 액절롤러 소모품 계산
******************************************************** */
function dry_Calculator(objArr) {

	if (objArr == 0) {
		var codeId = document.getElementById("consumable").value;
		var cn = document.getElementById("useCn").value;
		var select = document.getElementById("consumable");
		var option_text   = select.options[select.selectedIndex].text;
		
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 1) {
		var codeId = document.getElementById("consumable_1").value;
		var cn = document.getElementById("useCn_1").value;
		var select = document.getElementById("consumable_1");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 2) {
		var codeId = document.getElementById("consumable_2").value;
		var cn = document.getElementById("useCn_2").value;
		var select = document.getElementById("consumable_2");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 3) {
		var codeId = document.getElementById("consumable_3").value;
		var cn = document.getElementById("useCn_3").value;
		var select = document.getElementById("consumable_3");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 4) {
		var codeId = document.getElementById("consumable_4").value;
		var cn = document.getElementById("useCn_4").value;
		var select = document.getElementById("consumable_4");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	} else if (objArr == 5) {
		var codeId = document.getElementById("consumable_5").value;
		var cn = document.getElementById("useCn_5").value;
		var select = document.getElementById("consumable_5");
		var option_text   = select.options[select.selectedIndex].text;
		if (codeId == "CON40") {
			con40 = con40 - cn;
			if (con40 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON44") {
			con44 = con44 - cn;
			if (con44 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON80") {
			con80 = con80 - cn;
			if (con80 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON81") {
			con81 = con81 - cn;
			if (con81 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	}
	
}

/* ********************************************************
* UV Ramp 소모품 계산
******************************************************** */
function uvRamp_calculator(objArr) {

	//if (objArr == 0) {
		var codeId = document.getElementById("consumable").value;
		var cn = document.getElementById("useCn").value;
		var select = document.getElementById("consumable");
		var option_text   = select.options[select.selectedIndex].text;
		
		if (codeId == "CON35") {
			con35 = con35 - cn;
			if (con35 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON36") {
			con36 = con36 - cn;
			if (con36 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		} else if (codeId == "CON90") {
			con90 = con90 - cn;
			if (con90 < 0 ) {
				alert(option_text+"\n"+"재고 부족");
			}
		}
		
	//}
	
}

/* ********************************************************
* 소모품 코드별 수량 등록
******************************************************** */
function codeNumbering() {

	// 전열로 유포지(710mm)
	if (document.getElementById('CON171') == null) {
		con10 = "0";
	} else {
		con10 = document.getElementById('CON171').value;
	}
	
	// 전열로 유포지(800mm)
	if (document.getElementById('CON170') == null) {
		con11 = "0";
	} else {
		con11 = document.getElementById('CON170').value;
	}
	
	// DFR 유포지(530mm)
	if (document.getElementById('CON120') == null) {
		con20 = "0";
	} else {
		con20 = document.getElementById('CON120').value;
	}
	
	// DFR 유포지(630mm)
	if (document.getElementById('CON121') == null) {
		con21 = "0";
	} else {
		con21 = document.getElementById('CON121').value;
	}
	
	// 에칭노광 유포지(650mm)
	if (document.getElementById('CON131') == null) {
		con30 = "0";
	} else {
		con30 = document.getElementById('CON131').value;
	}
	
	// 에칭노광 유포지(530mm)
	if (document.getElementById('CON130') == null) {
		con31 = "0";
	} else {
		con31 = document.getElementById('CON130').value;
	}
	
	// 노광기 UV램프(8Kw)
	if (document.getElementById('CON101') == null) {
		con35 = "0";
	} else {
		con35 = document.getElementById('CON101').value;
	}
	
	// 노광기 UV램프(5Kw)
	if (document.getElementById('CON130') == null) {
		con36 = "0";
	} else {
		con36 = document.getElementById('CON130').value;
	}
	
	
	// 인쇄기 유포지(655mm)
	if (document.getElementById('CON140') == null) {
		con50 = "0";
	} else {
		con50 = document.getElementById('CON140').value;
	}
	
	// 인쇄기 유포지(545mm)
	if (document.getElementById('CON141') == null) {
		con51 = "0";
	} else {
		con51 = document.getElementById('CON141').value;
	}
	
	// MIR건조로 유포지(760mm)
	if (document.getElementById('CON150') == null) {
		con60 = "0";
	} else {
		con60 = document.getElementById('CON150').value;
	}
	
	// MIR건조로 유포지(860mm)
	if (document.getElementById('CON152') == null) {
		con61 = "0";
	} else {
		con61 = document.getElementById('CON152').value;
	}
	
	// IR건조로 유포지(600mm)
	if (document.getElementById('CON151') == null) {
		con62 = "0";
	} else {
		con62 = document.getElementById('CON151').value;
	}
	
	// DI노광기 유포지(660mm)
	if (document.getElementById('CON050') == null) {
		con70 = "0";
	} else {
		con70 = document.getElementById('CON050').value;
	}
	
	// UV경화기 UV램프(수은)
	if (document.getElementById('CON110') == null) {
		con90 = "0";
	} else {
		con90 = document.getElementById('CON110').value;
	}
	
	// UV경화기 UV램프(메탈)
	if (document.getElementById('CON91') == null) {
		con91 = "0";
	} else {
		con91 = document.getElementById('CON91').value;
	}
	
	// 필터(500x50)
	if (document.getElementById('CON100') == null) {
		con100 = "0";
	} else {
		con100 = document.getElementById('CON100').value;
	}
	
	// 필터(500x10)
	if (document.getElementById('CON101') == null) {
		con101 = "0";
	} else {
		con101 = document.getElementById('CON101').value;
	}
	
	// 필터(750x50)
	if (document.getElementById('CON102') == null) {
		con102 = "0";
	} else {
		con102 = document.getElementById('CON102').value;
	}
	
	// 필터(250x10)
	if (document.getElementById('CON103') == null) {
		con103 = "0";
	} else {
		con103 = document.getElementById('CON103').value;
	}
	
	// 필터(500x1)
	if (document.getElementById('CON104') == null) {
		con104 = "0";
	} else {
		con104 = document.getElementById('CON104').value;
	}
	
	// SUS 액절롤러
	if (document.getElementById('CON40') == null) {
		con40 = "0";
	} else {
		con40 = document.getElementById('CON40').value;
	}
	
	// Ti 액절롤러
	if (document.getElementById('CON44') == null) {
		con44 = "0";
	} else {
		con44 = document.getElementById('CON44').value;
	}
	
	// 실버 상부 액절롤러
	if (document.getElementById('CON80') == null) {
		con80 = "0";
	} else {
		con80 = document.getElementById('CON80').value;
	}
	
	// 실버 하부 액절롤러
	if (document.getElementById('CON81') == null) {
		con81 = "0";
	} else {
		con81 = document.getElementById('CON81').value;
	}
	
	// 롤라미 유포지
	if (document.getElementById('CON170') == null) {
		con94 = "0";
	} else {
		con94 = document.getElementById('CON170').value;
	}
}
