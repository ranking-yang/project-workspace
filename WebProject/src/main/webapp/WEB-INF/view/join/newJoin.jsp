<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<title>회원가입 작성 - 타임티켓</title>

<link rel="stylesheet" href="/resources/join/css/newJoin.css" />

</head>

<body>

	<div class="join_wrap">

		<div>
			<img src="/resources/join/images/logo.jpg"
				style="width: 150px; height: 102px;">
		</div>

		<form method="post">

			<!-- 아이디 -->
			<section class="section_wrap_top">
				<input type="text" id="user_id" name="member_id" placeholder="아이디"
					class="input_box icon_id" oninput="removeSpace(this)"
					style="text-transform: lowercase;">
				<!-- 입력 형식에 맞지 않을 때 / 입력하지 않았을 때 얼럿 -->
				<div class="input_alret_id"></div>
			</section>

			<!-- 비밀번호 / 비밀번호 확인 -->
			<section class="section_wrap">
				<input type="password" id="user_pass" name="member_pwd"
					placeholder="비밀번호" class="input_box icon_pass"
					autocomplete="new-password">
				<div class="input_alret_password"></div>
			</section>

			<section class="section_wrap">
				<input type="password" id="user_pass_verify" name="member_pwd_verify"
					placeholder="비밀번호 확인" class="input_box icon_pass2"
					autocomplete="new-password">
				<div class="input_alret_password" style="visibility: hidden;"></div>
			</section>


			<!-- 이름 -->
			<section class="section_wrap">
				<input type="text" id="user_name" name="member_name" placeholder="이름"
					value="" class="input_box icon_name">
				<div class="input_alret_name"></div>
			</section>

			<!-- 이메일 -->
			<section class="section_wrap">
				<input type="text" id="user_email" name="member_email"
					placeholder="이메일" value="" class="input_box icon_email"
					oninput="removeSpace(this)">
				<div class="input_alret_email"></div>
			</section>

			<!-- 생년월일 -->
			<section class="section_wrap">
				<input type="text" id="user_birth_date" name="member_birth"
					placeholder="생년월일" value="" class="input_box icon_birth_date"
					oninput="removeSpace(this)">
				<div class="input_alret_birth_date"></div>
			</section>

			<!-- 휴대폰 인증 -->
			<section class="section_wrap">
				<div class="section_title">휴대폰 인증</div>
				<div class="flex_between">
					<div>
						<input type="tel" id="user_hphone" name="member_phone"
							maxlength="13" value="" onkeydown="checkChangeNumber();"
							placeholder="휴대폰 번호" class="input_box icon_hphone"
							style="width: 265px; padding-left: 50px;">
					</div>
					<div>
						<input type="button" id="input_hphone_btn" class="btn_hphone_on"
							value="인증요청">
					</div>
				</div>

			</section>

			<!-- <section class="section_wrap" style="margin-top: 30px;">
				<div class="section_title">이용약관 동의</div>

				<div class="checkbox_group" style="margin-top: 0;">
					<div class="checkbox_line check_all">
						<input type="checkbox" id="check_all" class="checkbox"> <label
							for="check_all">전체 동의</label>
					</div>
					<div class="checkbox_line">
						<input type="checkbox" id="check_1" class="checkbox"> <label
							for="check_1">만 14세 이상입니다<span class="check_req">(필수)</span></label>
					</div>
					<div class="checkbox_line detail_seperate">
						<div>
							<input type="checkbox" id="check_2" class="checkbox"> <label
								for="check_2">이용약관 동의<span class="check_req">(필수)</span></label>
						</div>
						<div>
							<a
								href="/html_file.php?file1=default.html&amp;file2=user_stipulation.html&amp;mode=join"
								class="check_detail" target="_blank">내용보기</a>
						</div>
					</div>
					<div class="checkbox_line detail_seperate" style="border: none;">
						<div>
							<input type="checkbox" id="check_3" class="checkbox"> <label
								for="check_3">개인정보 수집·이용 동의<span class="check_req">(필수)</span></label>
						</div>
						<div>
							<a
								href="/html_file.php?file1=default.html&amp;file2=user_defend_s.html&amp;mode=join"
								class="check_detail" target="_blank">내용보기</a>
						</div>
					</div>
				</div>
			</section> -->

			<input type="submit" id="submitComplete" class="btn_submit"
				value="가입완료" alt="가입완료">

		</form>

	</div>
	
</body>

</html>