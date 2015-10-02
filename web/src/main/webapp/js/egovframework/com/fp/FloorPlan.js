/****************************************************************
 *
 * 파일명 : FloorPlan
 * 설 명 : 도면 등록 대체하는 JavaScript
 *
 *    수정일      수정자     Version        Function 명
 * ------------    ---------   -------------  ----------------------------
 * 2015.02.27    심은섭       1.0             최초생성
 *
 */

function specChange() {
	
	var select = document.getElementById('spec');
	var option_value = select.options[select.selectedIndex].value;
	
	if (option_value == 'etc') {
		document.getElementById('spec_01').value = '';
		document.getElementById('spec_02').value = '';
		document.getElementById('spec_03').value = '';
		document.getElementById('spec_04').value = '';
	}
	
	var codeDc = document.getElementById(option_value).value;
	
	var strArray = codeDc.split(',');
	
	document.getElementById('spec_01').value = strArray[0];
	document.getElementById('spec_02').value = strArray[1];
	document.getElementById('spec_03').value = strArray[2];
	document.getElementById('spec_04').value = strArray[3];
	
}
