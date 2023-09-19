function delete_alrim(review_code, performance_code){
			
	if (window.confirm('정말로 삭제하시겠습니까?')) {
		let formElement = $("<form>").attr({
		action: deletePath,
		method: "post",
		id: "delete_form"
	});

	let review_code_input = $("<input>").attr({
	type: "hidden",
	name: "review_code",
	value: review_code
	});

	let performance_code_input = $("<input>").attr({
	type: "hidden",
	name: "performance_code",
	value: performance_code
	});

	formElement.append(review_code_input);
	formElement.append(performance_code_input);

	$("#mypage_value").append(formElement);
			    
	$("#delete_form").submit();
			    
	alert("삭제가 완료되었습니다");
	}
}
		
function update_content(review_code) {
	// 객체를 JSON 문자열로 변환하여 서버로 전송
	window.open('/mypage/reviewUpdate?review_code=' + review_code, 'reviewUpdate', 'width=625px,height=425px,left=655px,top=250px');
}
	
$(document).ready(function() {
		// 화면이 로드될 때 가져온 val 값으로 select box 선택되어 있음
		let valName = $("#filter-select").data('val');	
		$("#filter-select").val(valName).prop("selected", true);
});
	
function changeSeq() {	
	location.href = "/mypage/review/" + $("#filter-select").val();
}
	
function goToperformance(category, performance_code) {
	if (category !== "art") {
		location.href = '/product-detail?performance_code=' + performance_code;				
	} else {
		location.href = '/product-detail-ex?performance_code=' + performance_code;				
	}	

}