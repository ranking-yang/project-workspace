<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div id="reviews_container">
	<c:choose>
		<c:when test="${countReviews eq 0}">
			<div id="noReview">
				<div>아직 등록된 후기가 없어요 😭</div>
			</div>
		</c:when>
		<c:otherwise>
	<div class="score">
		<div class="score_left">
			<div class="score_left_average">${avgScore }</div>
			<div class="score_left_stars">
				<div class="score_left_star_based">
					<div class="score_left_star_filled" style="width: calc(${avgScore} * 24px);"></div>
				</div>
			</div>
			<div class="score_left_total">(${countReviews }명)</div>
		</div>
		<div class="score_right">
		  <c:set var="scores" value="${scores = [5, 4, 3, 2, 1]}" />
		  <c:set var="scoreRateMap" value="${scoreRate}" />
		  <c:forEach items="${scores}" var="score">
		    <c:set var="rate" value="${scoreRateMap.get(Integer.parseInt(score))}" />
		    <div class="progress">
		      <div>${score}점</div>
		      <div class="progress_bar">
		        <div class="progress_value" style="width: ${rate}%;"></div>
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
	</c:otherwise>
	</c:choose>
</div>
