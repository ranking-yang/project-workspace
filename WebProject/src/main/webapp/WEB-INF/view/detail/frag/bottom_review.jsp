<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>>>>>>> refs/heads/update

<<<<<<< HEAD
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
=======
<div id="reviews_container">
	<div class="score">
		<div class="score_left">
			<div class="score_left_average">4.8</div>
			<div class="score_left_stars">
				<div class="score_left_star_based">
					<div class="score_left_star_filled" style="width: calc(4.8 * 24px);"></div>
				</div>
			</div>
			<div class="score_left_total">(859명)</div>
		</div>
		<div class="score_right">
			<c:set var="bar" value="${bar = [5, 4, 3, 2, 1]}" />
			<c:forEach items="${bar}" var="score">
			  <div class="progress">
			    <div>${score}점</div>
			    <div class="progress_bar">
			      <div class="progress_value"></div>
			    </div>
			  </div>
			</c:forEach>
		</div>
	</div>
	<c:forEach var="review" items="${reviews }">
		<div class="review">
			<div class="review_top">
				<div class="review_stars">
					<div class="review_star_based">
						<div class="review_star_filled" style="width: calc(${review.review_star} * 24px);"></div>
					</div>
				</div>
				<div class="reviewer_id">${review.reviewer_id}</div>
				<div class="review_date">${review.review_date}</div>
			</div>
			<div class="review_content">${review.review_content}</div>
		</div>
	</c:forEach>
</div>
<
>>>>>>> refs/heads/update
