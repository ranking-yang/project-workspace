<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/detail/css/detail_bottom.css"/>
<script src="/resources/detail/js/detail_bottom.js"></script>

	<section style="width:820px; margin:0 auto; padding-top:20px;">

    <!-- 메뉴영역 -->
    <ul id="maintab" class="shadetabs FixedTopMenu" style="border-radius:10px 10px 0 0;">
      <li id="tab_01_notice" class="selected"><span onclick="loadTab('content_1', this)" class="Topclass">안내</span></li>
      <li id="tab_02_review" class=""><span onclick="loadTab('content_2', this); setFormVisibility1();" class="Topclass">후기<span id="reviewCount" style="letter-spacing:-1px;">(0)</span></span></li>
      <li class=""><span onclick="loadTab('content_3', this); setFormVisibility2();" class="Topclass">Q&amp;A<span id="commentCount" style="letter-spacing:-1px;">(0)</span></span></li>
      <li class=""><span onclick="loadTab('content_4', this)" class="Topclass">장소</span></li>
      <li class=""><span id="tab_05_refund" onclick="loadTab('content_5', this)" class="Topclass">환불규정</span></li>
    </ul>

    <!---------------------- 탭 영역 시작 ----------------------->
    <div id="ajaxcontentarea" class="contentstyle" style="border-radius:0 0 10px 10px">
	    <!-- 안내탭 시작 -->
	    <%@ include file="./frag/bottom_info_ex.jsp" %>
	  	<!-- 후기탭 시작 -->
	  	<%@ include file="./frag/bottom_review.jsp" %>
	  	<!-- Q&A탭 시작 -->
	  	<%@ include file="./frag/bottom_qna.jsp" %>
		<!-- 장소탭 시작 -->
	  	<%@ include file="./frag/bottom_place.jsp" %>
		<!-- 환불규정탭 시작 -->	
		<%@ include file="./frag/bottom_refund.jsp" %>
  	</div>
  	
</section>
<%
  String userId = (String) session.getAttribute("userId");
%>
<script>
  var userId = "${userId}";
</script>