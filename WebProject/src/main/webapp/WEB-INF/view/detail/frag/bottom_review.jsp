<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
