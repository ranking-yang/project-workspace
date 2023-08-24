$(document).ready(function() {
	function getFaqList() {
		$.ajax({
			method: "GET",
			url: "/admin/faq/list",
			success: function(result) {
				$("#tablewrap_faq tbody").empty();
				result.forEach(function(item) {
					let row = $('<tr>');
					row.append('<td><label><input type="checkbox" name="select" data-code="' + item.question_code + '" onchange="changeBackgroundColor(this)"></label></td>');
					row.append('<td>' + item.question_code + '</td>');
					row.append('<td>' + item.question_category + '</td>');
					row.append('<td><span class="faq_title">' + item.question_title + '</span></td>');
					$("#tablewrap_faq tbody").append(row);
				});

				$('#faq-list').show();
				$('#faq-write').hide();
				$('#faq-write-btn').show();
				$('#faq-delete-btn').show();
				$('#faq-title').text("자주묻는질문 관리");
			}
		});

	}

	// document가 ready 되면 list 받아와서 테이블 그리기
	getFaqList();

	// 목록 버튼 누르면 리스트 받아와서 그리기
	$('#faq-list-btn').click(function() {
		getFaqList();
	});

	// 글쓰기 버튼 누르면 write 페이지 show
	$('#faq-write-btn').click(function() {
		let str = $('<div>');
		str.append('<div id="faq-title"><input type="text" name="faq-title" style="width:100%; height: 30px; font-size : 20px;"></div>');
		str.append('<div><select id="category-select"><option value="member">회원</option><option value="login">로그인</option><option value="payment">결제</option><option value="refund">취소/환불</option><option value="ticket">티켓</option><option value="etc">기타</option></select></div>');
		str.append('<textarea id="faq-content"></textarea>');
		str.append('<div id="confirm-btn"><button id="faq-confirm-btn">등록</button></div></div>');
		$("#faq-title-box").empty().append(str);

		$('#faq-list').hide();
		$('#faq-write').show();
		$('#faq-write-btn').hide();
		$('#faq-delete-btn').hide();
		$('#faq-title').text("자주묻는질문 작성");
	});

	// write 페이지에서 값 입력 후 등록 버튼 클릭시
	$(document).on('click', '#faq-confirm-btn', function() {
		let title = $("input[name=faq-title]").val();
		let content = $("#faq-content").val();
		let category = $("#category-select option:selected").text();

		if (title == "" || title == null) {
			alert('제목을 작성해 주세요.');
		} else if (content == "" || title == null) {
			alert('내용을 작성해 주세요.')
		} else {
			let newfaq = {
				question_category: category,
				question_title: title,
				question_content: content
			};

			$.ajax({
				method: "POST",
				url: "/admin/faq/add",
				contentType: "application/json",
				data: JSON.stringify(newfaq),
				success: function(result) {
					confirm("자주묻는질문을 등록하시겠습니까?");
					alert("새로운 자주묻는질문이 등록되었습니다.");
					// 새로운 게시글 등록 성공 후 list 다시 받아와서 테이블 그리기
					getFaqList();

				}
			});
		}
	});

	// 체크박스 선택 후 삭제 버튼 이벤트
	$(document).on('click', '#faq-delete-btn', function() {

		let selected = $('input:checkbox[name=select]:checked');
		let selectedFaqCodes = [];

		selected.each(function() {
			let faqCode = $(this).data();
			selectedFaqCodes.push(faqCode);
		})

		if (selectedFaqCodes.length == 0) {
			alert('삭제할 게시글을 선택해주세요');
		} else {
			
			confirm("게시글을 삭제하시겠습니까?");
			
			$.ajax({
				method: "POST",
				url: "/admin/faq/deleteFaq",
				contentType: "application/json",
				data: JSON.stringify(selectedFaqCodes),
				success: function(response) {
					//삭제 성공시 공지사항 list를 다시 받아와서 테이블 그리기
					alert("게시글이 삭제되었습니다.");
					getFaqList();

				},
				error: function(xhr, status, error) {
					alert("게시글 삭제를 실패하였습니다.");
					
				}
			})
		}

	});


	// 공지사항 제목 클릭시 해당 공지사항을 수정하는 기능
	$(document).on("click", ".faq_title", function() {
		let checkBtn = $(this);
		let tr = checkBtn.closest('tr');
		let td = tr.children();
		let faqCode = td.eq(1).text();

		$.ajax({
			method: "GET",
			url: "/admin/faq/getFaq/" + faqCode,

			success: function(result) {

				let str = $('<div>');
				str.append('<div id="faq-title"><input type="text" name="faq-title" style="width:100%; height: 30px; font-size : 20px;" value="' + result.question_title + '"></div>');
				str.append('<div><select id="category-select"><option value="member">회원</option><option value="login">로그인</option><option value="payment">결제</option><option value="refund">취소/환불</option><option value="ticket">티켓</option><option value="etc">기타</option></select></div>');
				str.append('<textarea id="faq-content">' + result.question_content + '</textarea>');
				str.append('<div id="confirm-btn"><button id="faq-edit-btn">수정</button></div></div>');
				str.append('<input type="hidden" name="faq-code" value="' + faqCode + '">');
				$("#faq-title-box").empty().append(str);

				$('#faq-list').hide();
				$('#faq-write').show();
				$('#faq-write-btn').hide();
				$('#faq-delete-btn').hide();
				$('#faq-title').text("자주묻는질문 작성");

			}
		});
	})

	// 공지사항 수정 버튼 : DB에 해당 공지사항을 update하는 요청
	$(document).on("click", "#faq-edit-btn", function() {
		let title = $("input[name=faq-title]").val();
		let content = $("#faq-content").val();
		let category = $("#category-select option:selected").text();
		let faqCode = $("input[name=faq-code]").val();

		// 팝업 창 띄우기
		let confirmResult = confirm("게시글을 수정하시겠습니까?");

		if (confirmResult) {
			if (title == "" || title == null) {
				alert('제목을 작성해 주세요.');
			} else if (content == "" || title == null) {
				alert('내용을 작성해 주세요.')
			} else {
				let newfaq = {
					question_code: faqCode,
					question_category: category,
					question_title: title,
					question_content: content
				};

				$.ajax({
					method: "POST",
					url: "/admin/faq/edit",
					contentType: "application/json",
					data: JSON.stringify(newfaq),
					success: function(result) {
						if (result === 1) {
							alert("게시글이 수정되었습니다.");
							getFaqList();
						}
					}
				});
			}
		}
	});



})