$(document).ready(function() {
	function getNoticeList() {
		$.ajax({
			method: "GET",
			url: "/admin/notice/list",
			success: function(result) {
				$("#tablewrap tbody").empty();
				result.forEach(function(item) {
					let row = $('<tr>');
					row.append('<td><label><input type="checkbox" name="select" data-code="'+ item.notice_code +'" onchange="changeBackgroundColor(this)"></label></td>');
					row.append('<td>' + item.notice_level + '</td>');
					row.append('<td>' + item.notice_code + '</td>');
					row.append('<td><span class="notice_title">' + item.notice_title + '</span></td>');
					row.append('<td>' + item.notice_date + '</td>');
					$("#tablewrap tbody").append(row);
				});

				$("input[name=notice-title]").val("");
				$('#notice-content').val("");
				$("input[name='notice-level']:checked").val("");

				$('#notice-list').show();
				$('#notice-write').hide();
				$('#notice-write-btn').show();
				$('#notice-delete-btn').show();
				$('#notice-title').text("공지사항 관리");
			}
		});

	}

	// document가 ready 되면 list 받아와서 테이블 그리기
	getNoticeList();

	// 목록 버튼 누르면 리스트 받아와서 그리기
	$('#notice-list-btn').click(function() {
		getNoticeList();
	});

	// 글쓰기 버튼 누르면 write 페이지 show
	$('#notice-write-btn').click(function() {
		let str = $('<div>');
		str.append('<div id="notice-title"><input type="text" name="notice-title" style="width:100%; height: 30px; font-size : 20px;" </div>');
		str.append('<div id="important-btn"><input type="radio" name="notice-level" value="0" checked><label for="normal-radio">일반</label><input type="radio" name="notice-level" value="1"><label for="fixed-radio">고정</label></div>');
		str.append('<textarea id="notice-content"></textarea>');
		str.append('<div id="confirm-btn"><button id="notice-confirm-btn">등록</button></div></div>');
		$("#notice-title-box").empty().append(str);

		$('#notice-list').hide();
		$('#notice-write').show();
		$('#notice-write-btn').hide();
		$('#notice-delete-btn').hide();
		$('#notice-title').text("공지사항 작성");
	});

	// write 페이지에서 값 입력 후 등록 버튼 클릭시
	$(document).on('click', '#notice-confirm-btn', function() {
		let title = $("input[name=notice-title]").val();
		let content = $("#notice-content").val();
		let level = $("input[name='notice-level']:checked").val();

		if (title == "" || title == null) {
			alert('제목을 작성해 주세요.');
		} else if (content == "" || title == null) {
			alert('내용을 작성해 주세요.')
		} else {
			let newNotice = {
				notice_title: title,
				notice_content: content,
				notice_level: level
			};

			$.ajax({
				method: "POST",
				url: "/admin/notice/add",
				contentType: "application/json",
				data: JSON.stringify(newNotice),
				success: function(result) {
					confirm("공지사항을 등록하시겠습니까?");
					alert("새로운 공지사항이 등록되었습니다.");
					// 새로운 게시글 등록 성공 후 list 다시 받아와서 테이블 그리기
					getNoticeList();

				},
				error: function(xhr, status, error) {
					alert("공지사항 등록이 실패하였습니다.");
					
				}
			});
		}
	});

	// 체크박스 선택 후 삭제 버튼 이벤트
	$(document).on('click', '#notice-delete-btn', function() {

		let selected = $('input:checkbox[name=select]:checked');
		let selectedNoticeCodes = [];

		selected.each(function() {

			let noticeCode = $(this).data();
			selectedNoticeCodes.push(noticeCode);
		})
		

		if (selectedNoticeCodes.length == 0) {
			alert('삭제할 게시글을 선택해주세요');
		} else {
			
			confirm("공지사항을 삭제하시겠습니까?");

			$.ajax({
				method: "POST",
				url: "/admin/notice/deleteNotice",
				contentType: "application/json",
				data: JSON.stringify(selectedNoticeCodes),
				success: function(response) {
					
					//삭제 성공시 공지사항 list를 다시 받아와서 테이블 그리기
					alert("공지사항이 삭제되었습니다.");
					getNoticeList();

				},
				error: function(xhr, status, error) {
					alert("공지사항 삭제를 실패하였습니다.");
					
				}
			})
		}

	});


	// 공지사항 제목 클릭시 해당 공지사항을 수정하는 기능
	$(document).on("click", ".notice_title", function() {
		var checkBtn = $(this);
		let tr = checkBtn.closest('tr');
		let td = tr.children();
		let noticeCode = td.eq(2).text();

		$.ajax({
			method: "GET",
			url: "/admin/notice/getNotice/" + noticeCode,
			success: function(result) {
				$("#notice-title-box").empty();
				let str = $('<div>');
				str.append('<div id="notice-title"><input type="text" name="notice-title" style="width:100%; height: 30px; font-size : 20px;" value="' + result.notice_title + '"></div>');
				str.append('<div id="important-btn"><input type="radio" name="notice-level" value="0" checked><label for="normal-radio">일반</label><input type="radio" name="notice-level" value="1"><label for="fixed-radio">고정</label></div>');
				str.append('<textarea id="notice-content">' + result.notice_content + '</textarea>');
				str.append('<div id="confirm-btn"><button id="notice-edit-btn">수정</button></div></div>');
				str.append('<input type="hidden" name="notice-code" value="' + noticeCode + '">');
				
				$("#notice-title-box").append(str);

				$('#notice-list').hide();
				$('#notice-write').show();
				$('#notice-write-btn').hide();
				$('#notice-delete-btn').hide();
				$('#notice-title').text("공지사항 작성");

			}
		});
	})

	// 공지사항 수정 버튼 : DB에 해당 공지사항을 update하는 요청
	$(document).on("click", "#notice-edit-btn", function() {
		let noticeTitle = $("input[name=notice-title]").val();
		let noticeContent = $('#notice-content').val();
		let noticeLevel = $("input[name='notice-level']:checked").val();
		let noticeCode = $("input[name=notice-code]").val();

		// 팝업 창 띄우기
		let confirmResult = confirm("게시글을 수정하시겠습니까?");

		if (confirmResult) {
			let notice = {
				notice_code: noticeCode,
				notice_title: noticeTitle,
				notice_content: noticeContent,
				notice_level: noticeLevel
			};

			$.ajax({
				method: "POST",
				url: "/admin/notice/editNotice",
				contentType: "application/json",
				data: JSON.stringify(notice),
				success: function(result) {
					if (result === 1) {
						alert("게시글이 수정되었습니다.");
						getNoticeList();
					}
				}
			});
		}
	});


})