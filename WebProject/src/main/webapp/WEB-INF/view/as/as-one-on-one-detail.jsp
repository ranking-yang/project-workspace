<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>[고객센터] 1:1문의</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/ad03eb7935.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/as/css/as-one-on-one.css">
<%@ include file="../common/commonCss.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div id="body">
		<div id="as-container">
			<div id="as-side-menu">
				<div id="as-side-menu-title">고객센터</div>
				<div id="notice" class="as-side-menu-subtitle">공지사항</div>
				<div id="freq-questions" class="as-side-menu-subtitle">자주 묻는
					질문</div>
				<div id="one-on-one" class="as-side-menu-subtitle selected">1:1
					문의</div>
			</div>
			<div id="as-board">
				<div id="as-board-list-header">
					<div id="as-board-title">1:1 문의</div>
				</div>
				<div id="as-board-detail">
					<div id="as-board-list-category">
						<div class="onedetail-title">글쓰기</div>
						<div></div>
					</div>
				</div>

				<!-- 여기서 만들어야됨 -->
				<!------------- S : 오른쪽 컨텐츠 영역 ----------->
				<div class="mypage_right_wrap">
					<script language="JAVASCRIPT">
						function check_Valid() {
							// 등록 버튼 클릭 후 삭제 : 중복등록 방지
							document.getElementById('bbs_submit').style.display = 'none';
							return true;
						}
					</script>

					<div style="margin-top: 17px;">
						<form action="/as/one-on-one/write" method="post">
							<div style="width: 775px; margin-top: 10px; border: 1px solid #ccc; overflow: hidden; font-size: 15px;">
								<div style="float: left; width: 100px; height: 45px; padding: 13px 15px; background: #eee;">
									제목</div>
								<div style="float: left; width: 605px; padding: 9px 20px; background: #f9f9f9;">
									<input name="oneon_title" type="text" value="" maxlength="100"
										style="width: 590px; height: 24px; padding: 2px 5px; font-size: 15px; color: #313131;"
										placeholder="제목을 입력해주세요" required="">
								</div>
								<div style="clear: both;"></div>
							</div>
							<div style="margin-top: 10px; border: 1px solid #ccc; width: 775px;">
								<textarea style="width: 770px; height: 300px; border: none; font-size: 15px; color: #313131; line-height: 22px; padding: 15px; resize: none;"
									name="oneon_content" placeholder="문의사항을 입력해주세요" required=""></textarea>
							</div>
							<div style="margin-top: 20px;">
								<button id="oneon_submit" value="등록" class="cs_btn_red_button">등 록</button>
							</div>
						</form>
					</div>
				</div>
				<!------------- E : 오른쪽 컨텐츠 영역 ----------->
			</div>

		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>