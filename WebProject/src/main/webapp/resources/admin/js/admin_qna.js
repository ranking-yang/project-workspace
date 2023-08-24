$(document).ready(function() {

	function loadQnaList(url) {
		$.ajax({
			method: "GET",
			url: url,
			success: function(result) {
				$("#qna_table tbody").empty(); // 테이블 데이터 초기화
				result.forEach(function(item) {
					let row = $('<tr>');
					if (item.qa_answer === null) {
						row.append('<td><span class="processing">답변대기</span></td>');
					} else {
						row.append('<td><span class="complete">답변완료</span></td>');
					}
					row.append('<td data-qaCode="${' + item.qa_code + '"}>' + item.qa_code + '</td>');
					row.append('<td>' + item.performance_code + '</td>');
					row.append('<td>' + item.qa_writer_id + '</td>');
					row.append('<td>' + item.qa_date + '</td>');
					if (item.qa_answer === null) {
						row.append('<td><button class="addAnswer">답변</button></td>');
					} else {
						row.append('<td><button class="editAnswer">답변수정</button></td>');
					}
					$("#qna_table tbody").append(row); // tbody에만 추가
				});
			},
			error: function(xhr, status, error) {
				console.error('목록 불러오기를 실패했습니다.');
				console.error('Error:', error);
			}
		});
	}





	function refreshQnatab(url) {
		$.ajax({
			method: "GET",
			url: url,
			success: function(result) {
				$("#qnatab").empty();
				let str = $('<div id="qna_filter_con"><select id="qna-filter" name="qna-filter"><option value="allQnas">전체</option><option value="qnaProcessing">답변대기</option><option value="qnaComplete">답변완료</option></select></div><div class="table-box"><table id="qna_table" style="padding: 20px 30px;"><thead><tr><th>상태</th><th>qa_code</th><th>performance_code</th><th>ID</th><th>date</th><th>답변하기</th></tr></thead><tbody></tbody></table></div>');
				$('#qnatab').append(str);
				result.forEach(function(item) {
					let row = $('<tr>');
					if (item.qa_answer === null) {
						row.append('<td><span class="processing">답변대기</span></td>');
					} else {
						row.append('<td><span class="complete">답변완료</span></td>');
					}
					row.append('<td data-qaCode="${' + item.qa_code + '}">' + item.qa_code + '</td>');
					row.append('<td>' + item.performance_code + '</td>');
					row.append('<td>' + item.qa_writer_id + '</td>');
					row.append('<td>' + item.qa_date + '</td>');
					if (item.qa_answer === null) {
						row.append('<td><button class="addAnswer">답변</button></td>');
					} else {
						row.append('<td><button class="editAnswer">답변수정</button></td>');
					}
					$("#qna_table tbody").append(row); // tbody에 데이터 추가
				});

				// 필터링 옵션 변경 시 이벤트 다시 초기화
				$("#qna-filter").change(function() {
					let filter = $("#qna-filter").val();
					if (filter === "allQnas") {
						loadQnaList("/admin/qna/all");
					} else if (filter === "qnaProcessing") {
						loadQnaList("/admin/qna/processing");
					} else {
						loadQnaList("/admin/qna/complete");
					}
				});
			},
			error: function(xhr, status, error) {
				console.error('목록 불러오기를 실패했습니다.');
				console.error('Error:', error);
			}
		});
	}


	// 초기 데이터 로딩
	loadQnaList("/admin/qna/main");

	// 필터링 옵션 변경 시 이벤트
	$("#qna-filter").change(function() {
		let filter = $("#qna-filter").val();
		if (filter === "allQnas") {
			loadQnaList("/admin/qna/all");
		} else if (filter === "qnaProcessing") {
			loadQnaList("/admin/qna/processing");
		} else {
			loadQnaList("/admin/qna/complete");
		}
	});

	// 답변달기 버튼
	$(document).on("click", ".addAnswer", function() {
		var checkBtn = $(this);
		let tr = checkBtn.closest('tr');
		let td = tr.children();
		let qaCode = td.eq(1).text();

		$.ajax({
			method: "GET",
			url: "/admin/qna/addAnswer/" + qaCode,
			success: function(result) {
				let str = $('<div class="addAnswerCon">');
				str.append('<div class="answerListBtnDiv"><button class="answerListBtn">목록</button></div><div class="addAnswerHeader"><div id="qa_code">' + result.qa_code + '</div><div>작성자 : ' + result.qa_writer_id + '</div><div>' + result.qa_date + '</div></div>');
				str.append('<div class="addAnswerBody"><div>' + result.qa_content + '</div></div>');
				str.append('<div class="addAnswerBottom"><textarea id="addAnswerTextarea"></textarea><button id="addAnswerBtn">등록</button></div>');
				$("#qnatab").empty().append(str);
			},
			error: function(xhr, status, error) {
				console.error('qna 불러오기를 실패했습니다.');
				console.error('Error:', error);
			}
		});
		
		$(document).on("click", ".answerListBtn", function(){
			refreshQnatab("/admin/qna/main");
		});

		// 답변 등록 버튼
		$(document).on("click", "#addAnswerBtn", function() {
			let answerContent = $('#addAnswerTextarea').val();

			// 팝업 창 띄우기
			let confirmResult = confirm("답변을 등록하시겠습니까?");

			if (confirmResult) {
				let qna = {
					qa_code: qaCode,
					qa_answer: answerContent
				};

				$.ajax({
					method: "POST",
					url: "/admin/qna/insertAnswer",
					contentType: "application/json",
					data: JSON.stringify(qna),
					success: function(result) {
						if (result === 1) {
							alert("답변이 등록되었습니다.");
							refreshQnatab("/admin/qna/main");
						} else {
							console.log("답변 추가 실패");
						}
					},
					error: function(xhr, status, error) {
						console.error('답변 추가를 실패했습니다.');
						console.error('Error:', error);
					}
				});
			} else {
				console.log("답변 등록 취소");
			}
		});

	});
	// 답변 수정 버튼
	$(document).on("click", ".editAnswer", function() {
		var checkBtn = $(this);
		let tr = checkBtn.closest('tr');
		let td = tr.children();
		let qaCode = td.eq(1).text();

		$.ajax({
			method: "GET",
			url: "/admin/qna/addAnswer/" + qaCode,
			success: function(result) {
				let str = $('<div class="addAnswerCon">');
				str.append('<div class="answerListBtnDiv"><button class="answerListBtn">목록</button></div><div class="addAnswerHeader"><div id="qa_code">' + result.qa_code + '</div><div>작성자 : ' + result.qa_writer_id + '</div><div>' + result.qa_date + '</div></div>');
				str.append('<div class="addAnswerBody"><div>' + result.qa_content + '</div></div>');
				str.append('<div class="addAnswerBottom"><textarea id="addAnswerTextarea">'+result.qa_answer+'</textarea><button id="addAnswerBtn">등록</button></div>');
				$("#qnatab").empty().append(str);
			},
			error: function(xhr, status, error) {
				console.error('qna 불러오기를 실패했습니다.');
				console.error('Error:', error);
			}
		});

		$(document).on("click", ".answerListBtn", function(){
			refreshQnatab("/admin/qna/complete");
		});
		
		$(document).on("click", "#addAnswerBtn", function() {
			let answerContent = $('#addAnswerTextarea').val();

			// 팝업 창 띄우기
			let confirmResult = confirm("답변을 수정하시겠습니까?");

			if (confirmResult) {
				let qna = {
					qa_code: qaCode,
					qa_answer: answerContent
				};

				$.ajax({
					method: "POST",
					url: "/admin/qna/insertAnswer",
					contentType: "application/json",
					data: JSON.stringify(qna),
					success: function(result) {
						if (result === 1) {
							alert("답변이 수정되었습니다.");
							refreshQnatab("/admin/qna/main");
						} else {
							console.log("답변 수정 실패");
						}
					},
					error: function(xhr, status, error) {
						console.error('답변 추가를 실패했습니다.');
						console.error('Error:', error);
					}
				});
			} else {
				console.log("답변 등록 취소");
			}
		});

	});

});