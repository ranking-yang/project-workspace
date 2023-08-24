<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script>
		
		$.ajax({
            url : "/main/identify", 
            type: "GET",
            dateType: "text",
            success : function(result) {
            	console.log(result);
            	if(result){
            		$("#loginmenu").append("<button class='user-nav-btn' id='mypage'>마이페이지</button>"
						+"<button class='user-nav-btn' id='logout'>로그아웃</button>")
            	}else{
            		$("#loginmenu").append("<button class='user-nav-btn' id='login'>로그인</button>"
    						+"<button class='user-nav-btn' id='join'>회원가입</button>")
            	}
            }
		});
		$(document).on("click","#mypage", function() {
			location.href="/mypage";
		});
		$(document).on("click","#logout", function() {
			location.href="/logout";
		});
		$(document).on("click","#login", function() {
			location.href="/login";
		});
		$(document).on("click","#join", function() {
			location.href="/user/newJoin";
		});
	
	</script>