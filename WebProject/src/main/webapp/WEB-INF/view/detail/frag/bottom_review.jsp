<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <div id="reviews_container">
	    <c:forEach var="review" items="${reviews }">
	  		<div class="review">
	  			<div class="review_star">
	  			<c:set var="stars" value="${['⭐', '⭐⭐', '⭐⭐⭐', '⭐⭐⭐⭐', '⭐⭐⭐⭐⭐']}" />
				<c:choose>
				  <c:when test="${review.review_star > 0 && review.review_star <= 5}">
				    <div>${stars[review.review_star]}</div>
				  </c:when>
				</c:choose>
	  			</div>
	    		<div class="review_info">
	    			<span class="reviewer_id">작성자 : ${review.review_writer_code} | </span><%-- 여기는 추후에 이름 혹은 id를 가져와야함 --%>
	    			<span class="review_date">${review.review_date}</span>
	    		</div>
	    		<div class="review_content">
		    		<div class="review_content">${review.review_content}</div>
		    		<div class="review_image">${review.review_image }</div>
	    		</div>
	    	</div>
	    </c:forEach>
   </div>
