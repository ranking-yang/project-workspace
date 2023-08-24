<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[고객센터] 1:1문의</title>
    <script src="https://kit.fontawesome.com/ad03eb7935.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/as/css/as-one-on-one.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script>
	$(document).ready(function(){
		$(".as-board-list-board").on("click", ".board-title", function() {
	        var code = $(this).siblings(".board-num").text();
	        
	        location.href = "/as/one-on-one/select?onecode="+code;
	        
	    });
	});
    
    </script>
    <%@ include file="../common/commonCss.jsp"%>
</head>
<body>
    <%@ include file="../common/header.jsp"%>
    <div id="body">
    <div id="as-container">
        <div id="as-side-menu">
            <div id="as-side-menu-title">고객센터</div>
            <div id="notice" class="as-side-menu-subtitle">공지사항</div>
            <div id="freq-questions"class="as-side-menu-subtitle">자주 묻는 질문</div>
            <div id="one-on-one" class="as-side-menu-subtitle selected">1:1 문의</div>
        </div>
        <div id="as-board">
            <div id="as-board-list-header">
                <div id="as-board-title">1:1 문의</div>
                <button id="addAsk" onclick="location.href='/as/one-on-one-detail'">문의하기</button>
            </div>
            <div id="as-board-list">
                <div id="as-board-list-category">
                    <div>번호</div>
                    <div>제목</div>
                    <div>작성일</div>
                    <div>처리상태</div>
                </div>
                <c:forEach items="${oneonDto}" var ="oneon">
	                <div class="as-board-list-board">
	                    <div class="board-num">${oneon.one_code}</div>
	                    <div class="board-title">${oneon.one_title}</div>
	                    <div class="board-date">${oneon.one_date}</div>
	                    <c:choose>
							<c:when test="${oneon.one_state == 1}">
	                    		<div class="board-status standby"><span>처리중</span></div>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<div class="board-status done"><span>답변완료</span></div>
	                    	</c:otherwise>
	                    </c:choose>
	                </div>
                </c:forEach>
                </div>
				
            <div id="as-board-list-page-buttons">
                <button id="oneon-prev-btn" class="move-buttons">&lt;</button>
					<c:forTokens delims="/" items="${pageBtnNum}" var="i">
						<c:choose>
							<c:when test="${i eq pagination.pageNum}">
								<input type="hidden" id="page-num" value="${pagination.pageNum}" />
								<input type="hidden" id="max-num" value="${pagination.maxNum}" />
								<button class="oneon-page-buttons page-buttons selected"
									value="${i}">${i}</button>
							</c:when>
							<c:otherwise>
								<button class="oneon-page-buttons page-buttons" value="${i}">${i}</button>
							</c:otherwise>
						</c:choose>
					</c:forTokens>
					<button id="oneon-next-btn" class="move-buttons">&gt;</button>
				</div>
			</div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp"%>
	<script src="/resources/as/js/as.js"></script>
	<%@ include file="../common/commonJs.jsp"%>
</body>
</html>