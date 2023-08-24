$(document).ready(function() {	
	// 처음에 환불요청 부분이 보이게
	$('.tabcontent').first().css('display', 'block');
	
	// 체크박스 전체 선택
	$("input[name=selectAll]").click(function(){	
	    if($("input[name=selectAll]").prop("checked")){
		
		    $("input[name=select]").prop("checked",true);   // 전체 체크
		} else {
		    $("input[name=select]").prop("checked",false);  // 전체 체크 해제
		}
	});
	
	// 달력
	$("#request-startDate").on("input", function() {
	       $("#request-endDate").attr("min", $(this).val());
	});
	
	$("#request-endDate").on("input", function() {
	       $("#request-startDate").attr("max", $(this).val());
	});
	
	$("#complete-startDate").on("input", function() {
	       $("#complete-endDate").attr("min", $(this).val());
	});
	
	$("#complete-endDate").on("input", function() {
	       $("#complete-startDate").attr("max", $(this).val());
	});
	
	// 검색창 초기화
	$("#refund-request-search-filter").change(function() {		
		let filter = $("#refund-request-search-filter").val();
		let value = $("#refund-request-search-value");
		let startDate = $("#request-startDate");
		let endDate = $("#request-endDate");
		
		value.val("");
		startDate.val("");
		endDate.val("");
		
		if (filter === "all") {
			value.attr("disabled", true);
			startDate.attr("disabled", false);
			endDate.attr("disabled", false);
		} else if (filter === "payment-num") {
			value.attr("disabled", false);
			startDate.attr("disabled", true);
			endDate.attr("disabled", true);			
		} else {
			value.attr("disabled", false);
			startDate.attr("disabled", false);
			endDate.attr("disabled", false);
		}
	});
	
	$("#refund-complete-search-filter").change(function() {
		
		let filter = $("#refund-complete-search-filter").val();
		let value = $("#refund-complete-search-value");
		let startDate = $("#complete-startDate");
		let endDate = $("#complete-endDate");
		
		value.val("");
		startDate.val("");
		endDate.val("");
		
		if (filter === "all") {
			value.attr("disabled", true);
			startDate.attr("disabled", false);
			endDate.attr("disabled", false);
		} else if (filter === "payment-num") {
			value.attr("disabled", false);
			startDate.attr("disabled", true);
			endDate.attr("disabled", true);			
		} else {
			value.attr("disabled", false);
			startDate.attr("disabled", false);
			endDate.attr("disabled", false);
		}
		
	});
	
	// 환불요청 검색 버튼
	$("#search_refund_btn").click(function() {		
		let option = $("#refund-request-search-filter").val();
		let value = $("#refund-request-search-value").val();
		let startday = $("#request-startDate").val();
		let endday = $("#request-endDate").val();
		
		if (option !== "all" && value == "") {
			alert('검색어를 입력하세요');
		} else if (startday && endday == "" || endday && startday == "") {
			alert('검색할 환불요청일을 모두 입력하세요');
		} else {
			ajaxtable("search_request");			
		}
	});
	
	// 환불완료 검색 버튼
	$("#sucess_btn").click(function() {		
		let option = $("#refund-complete-search-filter").val();
		let value = $("#refund-complete-search-value").val();
		let startday = $("#complete-startDate").val();
		let endday = $("#complete-endDate").val();
		
		if (option !== "all" && value == "") {
			alert('검색어를 입력하세요');
		} else if (startday && endday == "" || endday && startday == "") {
			alert('검색할 환불요청일을 모두 입력하세요');
		} else {
			ajaxtable("search_complete");			
		}
	});
	
	// 환불 요청 처리 (DB 수정 및 포트원 환불 요청)
	$("#refund_tickets_Btn").click(function() {
		// 클릭된 것들 값 가져오기
		let checkBox = $("input:checkbox[name=select]:checked");
		
		let selecties = [];
		
		checkBox.each(function(i) {
			let tr = checkBox.parent().parent().parent().eq(i);
			let td = tr.children();	
			
			let selection = {
				member_code: td.eq(2).text(),
				payment_code: td.eq(3).text(),
				total_price: td.eq(7).text()
			}
			
			selecties.push(selection);
		});
		
		
		if (selecties.length == 0) {
			alert('환불할 티켓을 선택해주세요');
		} else {			
			// ajax로 환불 처리
			$.ajax({
	        	method: "POST",
	        	url: "/admin/refund/request", 
	       	 	contentType: "application/json", 
	        	data: JSON.stringify(selecties), 
	        	success: function(result) {
	        		// 환불요청 List DTO 재로딩	        			        		
					plusstr = '<td><label> <input type="checkbox" name="select" class="refund-chkBox" value="select" onchange="changeBackgroundColor(this)"></label></td>';
	        		
						$("#refund_table td").remove();
						
		        		if (result.length == 0) {
							let str = "<tr><td colspan='9'>조회되는 티켓이 없습니다.</td></tr>";
							$("#refund_table").append(str);
						} else {
							$(result).each(function(){
								let str = "<tr>";
								str += plusstr;
								str += '<td>'+this.member_id+'</td>';
								str += '<td>'+this.member_code+'</td>';
								str += '<td>'+this.payment_code+'</td>';
								str += '<td>'+this.performance_name+'</td>';
								str += '<td>'+this.payment_date+'</td>';
								str += '<td>'+this.refund_date+'</td>';
								str += '<td>'+this.total_price+'</td>';
								str += '<td>'+this.refund_status+'</td>';
								str += "</tr>";	 
								$("#refund_table").append(str);
							});
						}
	       		 },
	        	error: function(xhr, status, error) {
	            	alert('환불에 실패했습니다.');
	        	}
			});	
		}		
	});
});
	
// 탭 메뉴 클릭 시, 색 바뀌게
function openRefundTab(evt, refund_cat) {

	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tabBtn");
	for (i = 0; i < tablinks.length; i++) {

		tablinks[i].className = tablinks[i].className
				.replace(" active", "");
	}

	document.getElementById(refund_cat).style.display = "grid";
	evt.currentTarget.className += " active";
}

// 초기화 버튼
function resetForm(table) {
	// 체크박스 초기화
	var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	checkboxes.forEach(function(checkbox) {
		checkbox.checked = false;
	});

	// 텍스트 필드 초기화
	var textFields = document.querySelectorAll('input[type="text"]');
	textFields.forEach(function(textField) {
		textField.value = '';
	});

	// 날짜 필드 초기화
	var dateFields = document.querySelectorAll('input[type="date"]');
	dateFields.forEach(function(dateField) {
		dateField.value = '';
	});
	
	$("#" + table + " td").remove();
	
}

// 체크박스 클릭 시 블록지정 
function changeBackgroundColor(checkbox) {
	var row = checkbox.parentNode.parentNode.parentNode; // <tr> 요소 선택
	var tds = row.getElementsByTagName('td'); // <td> 요소들 선택

	if (checkbox.checked) {
		for (var i = 0; i < tds.length; i++) {
			tds[i].style.backgroundColor = '#767678'; // 선택된 경우 배경 색상 변경
		}
	} else {
		for (var i = 0; i < tds.length; i++) {
			tds[i].style.backgroundColor = ''; // 선택이 해제된 경우 배경 색상 제거
		}
	}
}

// 탭 메뉴 클릭 시, List DTO 요청
function ajaxtable (checkbtn){
	let plusstr = "";
	let uri = "";
	let keyword = "";
	
	if(checkbtn == "search_request"){
		table = "refund_table";
		category = "환불요청";	
		uri = $("#refund-request-search-filter").val();
		keyword = $('#refund-request-search-value').val();
		startday = $('#request-startDate').val();
		endday = $('#request-endDate').val();	
		plusstr = '<td><label> <input type="checkbox" name="select" value="select" onchange="changeBackgroundColor(this)"></label></td>';
	} else {
		table = "list_table";
		category= "환불완료";
		uri = $("#refund-complete-search-filter").val();
		keyword = $('#refund-complete-search-value').val();
		startday = $('#complete-startDate').val();
		endday = $('#complete-endDate').val();
		plusstr = "";
	}
	
	$.ajax({
		url : "/admin/refund/" + uri,
		type : "GET",
		data: {
			option: category,
			keyword: keyword,
			startday: startday,
			endday: endday
		},
		success : function(result) {
			$("#" + table + " td").remove();
			
			if (result.length == 0) {
				let str = "<tr><td colspan='9'>조회되는 티켓이 없습니다.</td></tr>";
				$("#" + table).append(str);
			} else {
				$(result).each(function(){
				let str = "<tr>";
				str += plusstr;
				str += '<td>'+this.member_id+'</td>';
				str += '<td>'+this.member_code+'</td>';
				str += '<td>'+this.payment_code+'</td>';
				str += '<td>'+this.performance_name+'</td>';
				str += '<td>'+this.payment_date+'</td>';
				str += '<td>'+this.refund_date+'</td>';
				str += '<td>'+this.total_price+'</td>';
				str += '<td>'+this.refund_status+'</td>';
				str += "</tr>";
				$("#" + table).append(str);
			});
			}			
		}
	});
}