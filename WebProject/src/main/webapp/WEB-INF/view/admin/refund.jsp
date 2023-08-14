<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	//탭 메뉴 이벤트 설정
	function openrefund(evt, refund_cat) {

		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {

			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		document.getElementById(refund_cat).style.display = "block";
		evt.currentTarget.className += " active";

	}

	// 초기화 버튼 스크립트

	function resetForm() {
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
	
	function ajaxtable (checkbtn, refund){
		if(checkbtn == "search_refund"){
			table = "refund_table";
			category = "환불요청";
			
			plusstr = '<td><label> <input type="checkbox" name="select" value="select" onchange="changeBackgroundColor(this)"></label></td>';
			plusalpa = '<tr><th><label><input type="checkbox" name="select"value="select" onchange="changeBackgroundColor(this)">전체선택</label></th><th>주문번호</th><th>결제일자</th><th>환불요청일자</th><th>결제금액</th><th>처리상태</th></tr>';
		}else{
			table = "list_table";
			category= "환불완료";
			plusstr ="";
			plusalpa = '<tr><th>주문번호</th><th>결제일자</th><th>환불요청일자</th><th>결제금액</th><th>처리상태</th></tr>';
		}
		str = "";
		$.ajax({
			url : "/admin/refund",
			type : "GET",
			data: {
				option: category
			},
			success : function(result) {
				$("#"+table).empty();
				$("#"+table).append(plusalpa);
				$(result).each(function(){
					str += "<tr>";
					str += plusstr;
					str += '<td>'+this.payment_code+'</td>';
					str += '<td>'+this.payment_date+'</td>';
					str += '<td>'+this.refund_date+'</td>';
					str += '<td>'+this.total_price+'</td>';
					str += '<td>'+this.refund_status+'</td>';
					str += "</tr>";
				});
				$("#"+table).append(str);
			}
		});
	}
    // 환불요청 부분 
	$(document).on("click", "#search_refund_btn", function() {
		
		var category = "search_refund";
		ajaxtable(category);
	});
    // 환불완료 부분
	$(document).on("click", "#sucess_btn", function() {
		var category = "sucess_btn";
		ajaxtable(category);
	});
	
	// 검색 버튼 클릭 후 결과 테이블
</script>


<div class="main">

	<!-- 환불탭 -->
	<div class="refund_tab">
		<button class="tablinks" onclick="openrefund(event, 'Refund-request')">환불요청</button>
		<button class="tablinks"
			onclick="openrefund(event, 'Refund-complete')">환불완료</button>
	</div>
	<!-- 환불요청 구성요소 -->
	<div style="display: none;" id="Refund-request" class="tabcontent">
		<div class="tab_search_area">

			<select id="search-filter" name="search-filter" style="height: 25px;">
				<option value="order-number">주문번호</option>
			</select> <input type="text" name="search-field" class="search-text"
				style="height: 25px;"> <label for="date">시작일: <input
				type="date" style="height: 25px;"></label> <label for="date">종료일:
				<input type="date" style="height: 25px;">
			</label>
			<!-- 검색/초기화버튼 -->
			<button class="search-btn" id="search_refund_btn">검색</button>
			<button class="initialization-btn" onclick="resetForm()">초기화</button>
			<button class="initialization-btn" onclick="resetForm()">환불</button>

		</div>

		<!-- 검색 결과 테이블 -->
		<div style="overflow-x: auto; overflow-y: auto;" class="table-box"
			id="tableContainer">
			<table class="api-table" id="refund_table">
				<tr>
					<th><label><input type="checkbox" name="select"
							value="select" onchange="changeBackgroundColor(this)">전체선택</label></th>
					<th>주문번호</th>
					<th>결제일자</th>
					<th>환불요청일자</th>
					<th>결제금액</th>
					<th>처리상태</th>
				</tr>
			</table>
		</div>
	</div>

	<!-- 환불완료 구성요소 -->
	<div id="Refund-complete" class="tabcontent">
		<div class="tab_search_area">

			<select id="search-filter" name="search-filter" style="height: 25px;">
				<option value="order-number">주문번호</option>
			</select> <input type="text" name="search-field" class="search-text"
				style="height: 25px;"> <label for="date">시작일: <input
				type="date" style="height: 25px;"></label> <label for="date">종료일:
				<input type="date" style="height: 25px;">
			</label>
			<!-- 검색/초기화버튼 -->
			<button class="search-btn" id="sucess_btn">검색</button>
			<button class="initialization-btn" onclick="resetForm()">초기화</button>

		</div>

		<!-- 검색 결과 테이블 -->
		<div style="overflow-x: auto; overflow-y: auto;" class="table-box"
			id="tableContainer">
			<table class="api-table" id="list_table">
				<tr>
					<th>주문번호</th>
					<th>결제일자</th>
					<th>환불요청일자</th>
					<th>결제금액</th>
					<th>처리상태</th>
				</tr>
			</table>
		</div>
	</div>
</div>
