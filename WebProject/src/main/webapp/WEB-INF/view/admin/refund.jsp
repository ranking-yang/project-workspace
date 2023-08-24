<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/admin/js/admin_refund.js" var="admin_refund_js" />

<div class="main" id="refund_main">

	<!-- 환불탭 -->
	<div id="refund_tab">
		<div><button class="tabBtn active" onclick="openRefundTab(event, 'Refund-request')">환불요청</button></div>
		<div><button class="tabBtn" onclick="openRefundTab(event, 'Refund-complete')">환불완료</button></div>
	</div>
	
	<!-- 환불요청 구성요소 -->
	<div id="Refund-request" class="tabcontent">
		<div class="tab-search-area">	
			
			<div class="tab-search-name">검색</div>
			<div>
				<select id="refund-request-search-filter" name="search-filter" style="height: 30px;">
					<option value="all">전체</option>
					<option value="user-id">아이디</option>
					<option value="payment-num">결제번호</option>
				</select> 
				<input type="text" id="refund-request-search-value" name="search-field" class="search-text" style="height: 25px;" disabled="disabled">
			</div>
			<div class="tab-search-name">환불 요청일</div>
			<div>
				<input type="date" id="request-startDate" style="height: 25px;"> ~ <input type="date" id="request-endDate" style="height: 25px;">
			</div>
			
			<div>
				<!-- 검색/초기화버튼 -->
				<button class="search-btn" id="search_refund_btn">검색</button>
				<button class="initialization-btn" onclick="resetForm('refund_table')">초기화</button>			
			</div>	
			
		</div>
		
		<div style="text-align: right; padding-right: 20px;">		
			<button class="initialization-btn" id="refund_tickets_Btn">환불</button>
		</div>

		<!-- 검색 결과 테이블 -->
		<div style="overflow-x: auto; overflow-y: auto;" class="table-box" id="tableContainer">
			<table id="refund_table">
				<tr>
					<th><label><input type="checkbox" name="selectAll" value="select"> 전체선택</label></th>
					<th>아이디</th>
					<th>멤버코드</th>
					<th>결제번호</th>
					<th>공연명</th>
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
		
		<div class="tab-search-area">	
			
			<div class="tab-search-name">검색</div>
			<div>
				<select id="refund-complete-search-filter" name="search-filter" style="height: 30px;">
					<option value="all">전체</option>
					<option value="user-id">아이디</option>
					<option value="payment-num">결제번호</option>
				</select> 
				<input type="text" id="refund-complete-search-value" name="search-field" class="search-text" style="height: 25px;" disabled="disabled">
			</div>
			<div class="tab-search-name">환불 요청일</div>
			<div>
				<input type="date" id="complete-startDate" style="height: 25px;"> ~ <input type="date" id="complete-endDate" style="height: 25px;">
			</div>
			
			<div>
				<!-- 검색/초기화버튼 -->
				<button class="search-btn" id="sucess_btn">검색</button>
				<button class="initialization-btn" onclick="resetForm('list_table')">초기화</button>			
			</div>	
			
		</div>

		<!-- 검색 결과 테이블 -->
		<div style="overflow-x: auto; overflow-y: auto;" class="table-box" id="tableContainer">
			<table id="list_table">
				<tr>
					<th>아이디</th>
					<th>멤버코드</th>
					<th>결제번호</th>
					<th>공연명</th>
					<th>결제일자</th>
					<th>환불요청일자</th>
					<th>결제금액</th>
					<th>처리상태</th>
				</tr>
			</table>
			</div>
		</div>
	</div>

</div>

<script src="${admin_refund_js}"></script>
