<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="contentstyle1" id="content_2" style="">
	<div class="main_tab_wrap">
		<div class="score_section" style="padding-top: 10px">
			<div class="score_section_left" style="margin-top: 10px;">
				<div class="score_section_left_average">0</div>
				<div class="score_section_left_stars">
					<div class="score_section_left_star">
						<div class="score_section_left_star_filled"
							style="width: calc(0 * 24px);"></div>
					</div>
				</div>
				<div id="reviewCountpeople" class="score_section_left_total">(0명)</div>
			</div>
			<div class="score_section_right">
				<div class="progress_section">
					<div>5점</div>
					<div class="progress_section_bar">
						<div class="progress_section_value progress_section_value_5"
							style="width: 0%;"></div>
					</div>
				</div>
				<div class="progress_section">
					<div>4점</div>
					<div class="progress_section_bar">
						<div class="progress_section_value progress_section_value_4"
							style="width: 0%;"></div>
					</div>
				</div>
				<div class="progress_section">
					<div>3점</div>
					<div class="progress_section_bar">
						<div class="progress_section_value progress_section_value_3"
							style="width: 0%;"></div>
					</div>
				</div>
				<div class="progress_section">
					<div>2점</div>
					<div class="progress_section_bar">
						<div class="progress_section_value progress_section_value_2"
							style="width: 0%;"></div>
					</div>
				</div>
				<div class="progress_section">
					<div>1점</div>
					<div class="progress_section_bar">
						<div class="progress_section_value progress_section_value_1"
							style="width: 0%;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="review_start" style="">
			<div class="review_text" id="review_text_container"></div>
		</div>
	</div>
</div>