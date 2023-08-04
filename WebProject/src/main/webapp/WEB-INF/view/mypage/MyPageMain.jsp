<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:url value ="/resources/mypage/css/MyPageMain.css" var="maincss"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link href="${maincss}" rel="stylesheet">
</head>

<body style="background:#f4f4f4; overflow:hidden; height:auto; ">
	
	<div class="mypage_top">

    <div class="mypage_top_left">
      <img src="/resources/img/before-red.png" style="object-fit: scale-downl; width:200px; height:100px; margin-top:15px; margin-left:15px;">
    </div>

    <div class="mypage_top_right">

      <div class="mypage_top_contents" style="margin-left:10px;">
        <div class="mypage_top_title" style="font-weight:normal; padding-top:2px;">안녕하세요😊</div>
        <a href="myticket.php?mode=modify">
          <div style="margin-top:6px;"><span class="mypage_top_name">이종현</span><span class="mypage_top_name_nim">님</span></div>
        </a>
      </div>

      <div class="mypage_top_contents">
        <a href="myticket_point.php?mode=point">
          <div class="mypage_top_title">나의 포인트 <span class="arrow_gt">＞</span></div>
          <div class="mypage_top_number">0</div>
        </a>
      </div>

      <div class="mypage_top_contents">
        <a href="myticket.php?mode=buy&amp;type=able">
          <div class="mypage_top_title">이용가능티켓 <span class="arrow_gt">＞</span></div>
          <div class="mypage_top_number">0</div>
        </a>
      </div>

      <div class="mypage_top_contents" style="width:135px; border:none;">
        <!-- 예비칸 -->
      </div>

    </div>
    </div>
	
  <div class="mypage_wrap">

    <!------------- S : 왼쪽 메뉴 영역 ----------->
    <div class="mypage_left_wrap">

      <div class="mypage_left_title">
        마이티켓
      </div>

      <ul>
        <li onclick="location.href=&quot;myticket.php?mode=buy&quot;" class="mypage_left_sub">
                      <span class="mypage_left_sub_on">예매내역</span>
                  </li>

        <li onclick="location.href=&quot;myticket.php?mode=cancel&quot;" class="mypage_left_sub">
                      <span class="mypage_left_sub_off">취소/환불내역</span>
                  </li>

        <li onclick="location.href=&quot;user_review.php?mode=review&quot;" class="mypage_left_sub">
                      <span class="mypage_left_sub_off">나의 이용후기</span>
                  </li>

        <li onclick="location.href=&quot;myticket_point.php?mode=point&quot;" class="mypage_left_sub">
                  <span class="mypage_left_sub_off">나의 포인트</span>
                </li>
      </ul>

      <ul>
        <li onclick="location.href=&quot;coupon_regist.php?mode=coupon&quot;" class="mypage_left_sub">
                  <span class="mypage_left_sub_off">쿠폰/상품권 등록</span>
                </li>

        <li onclick="location.href=&quot;myticket.php?mode=modify&quot;" class="mypage_left_sub">
                  <span class="mypage_left_sub_off">회원정보 수정</span>
                </li>
      </ul>

      <ul>
        <li onclick="location.href=&quot;bbs_list.php?tb=board_notice&quot;" class="mypage_left_sub">
          <span class="mypage_left_sub_off">공지사항</span>
        </li>

        <li onclick="location.href=&quot;bbs_list.php?tb=board_faq&quot;" class="mypage_left_sub">
          <span class="mypage_left_sub_off">자주묻는질문</span>
        </li>

        <li onclick="location.href=&quot;bbs_list.php?tb=board_private&quot;" class="mypage_left_sub">
          <span class="mypage_left_sub_off">1:1문의</span>
        </li>
      </ul>
	</div>
	
	<!------------- S : 오른쪽 컨텐츠 영역 ----------->
    <div class="mypage_right_wrap">

      <div class="mypage_right_title" style="margin-bottom:20px;">
        예매내역
      </div>

      <div style="padding-bottom:10px;">
  <!-- 구매내역출력 페이지당 노출 갯수에서 able only일 때도 전체 갯수로 count하는 문제 있어서 type으로 나눔 -->

      <p style="width:100%; text-align:center; font-size:18px; padding-top:100px;">예매 내역이 없습니다.</p> 

	    <div style="padding-top: 10px; ">
	      
	        <style type="text/css">
	          #page{text-align:center; padding:0 0 30px 0;}
	          #page a,div#page b{border:1px solid #d9d9d9; color:#555; font-size:14px; padding:5px 5px; margin:0 2px; background:#fff; }
	          #page a:hover{text-decoration:none; color:black; background:#ededed;}
	          #page a.prev{width:70px; padding-left:5px;}
	          #page a.next{width:70px;padding-right:5px;}
	          #page b.now{border:0px;color:#ff0000;font-weight:bold; background:none}
	        </style>
	        <div id="page"></div>
		</div>
    </div>
    <!------------- E : 오른쪽 컨텐츠 영역 ----------->

  </div>
</div>

</div>
	
</body>
</html>