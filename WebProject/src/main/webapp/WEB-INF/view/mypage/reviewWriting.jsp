<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>리뷰작성</title>
  <link rel="stylesheet" href="/resources/mypage/css/star.css">
</head>
<body>
	<div class="review-box">
	<sec:authentication property="principal" var="prc" />
				<input type="hidden" id="bottom_member_id" name="review_writer_code"
					value="${prc.member_code}" form="form"/>
				<input type="hidden" name="performance_code" value="${performance_code}" form="form"/>
				<input type="hidden" name="payment_code" value="${payment_code}" form="form"/>
				<input type="hidden" name="reviewer_id" value="${prc.member_id}" form="form"/>
    <h3>관람은 만족하셨나요?</h3>
    <input type="hidden" id="review_star" name="review_star" form="form" value="" />
    <div class="stars" id="starContainer">
      <img class="star gray" src="../../../resources/mypage/img/gray_star.png" alt="1점" data-rating="0" onclick="setRating(1)">
      <img class="star gray" src="../../../resources/mypage/img/gray_star.png" alt="2점" data-rating="0" onclick="setRating(2)">
      <img class="star gray" src="../../../resources/mypage/img/gray_star.png" alt="3점" data-rating="0" onclick="setRating(3)">
      <img class="star gray" src="../../../resources/mypage/img/gray_star.png" alt="4점" data-rating="0" onclick="setRating(4)">
      <img class="star gray" src="../../../resources/mypage/img/gray_star.png" alt="5점" data-rating="0" onclick="setRating(5)">
    </div>
    <h3>만족한 부분을 적어주세요</h3>
    <textarea form="form" id="writeNote" name="review_content" style="resize:none;" rows="10" cols="55"></textarea>
    <button class="submit" id="popupButton" onclick="popup();" type="button" form="form">작성완료</button>
    <form action="/mypage/reviews/insert" method="post" id="form"></form>
  </div>
  <script src="/resources/mypage/js/starprocess.js"></script>
</body>
</html>