<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <h3>관람은 만족하셨나요?</h3>
    <div class="stars" id="starContainer">
      <img class="star gray" src="../resource/gray_star.PNG" alt="1점" data-rating="0">
      <img class="star gray" src="../resource/gray_star.PNG" alt="2점" data-rating="0">
      <img class="star gray" src="../resource/gray_star.PNG" alt="3점" data-rating="0">
      <img class="star gray" src="../resource/gray_star.PNG" alt="4점" data-rating="0">
      <img class="star gray" src="../resource/gray_star.PNG" alt="5점" data-rating="0">
    </div>
    <h3>만족한 부분을 적어주세요</h3>
    <textarea id="writeNote" style="resize:none;" rows="10" cols="55" form="form"></textarea>
    <h3>사진으로 인증하면 더욱 좋아요</h3>
    <input type="file" id="imageInput" accept="image/*" onchange="previewImage()">
    <div id="imagePreview"></div>
    <button class="submit" id="popupButton" onclick="showPopup()" type="submit" form="form">작성완료</button>
    <form action="/product/reviews" method="post" id="form"></form>
  </div>
</body>
</html>