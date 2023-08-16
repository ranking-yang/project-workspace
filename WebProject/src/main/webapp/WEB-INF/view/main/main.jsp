<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/main/css/main.css" var="css" />
<c:url value="/resources/main/js/main.js" var="js" />
<%@ include file="../common/commonCss.jsp" %> <!-- 공통 css -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="${css}">
<script src="${js}" defer></script>
<script src="https://kit.fontawesome.com/cdd406875c.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script> 

	function ticketajax(){
		
		$.ajax({
			url:"main/rank",
			type:"GET",
			success : function(result) {
				$(".performance-list").empty();
				console.log(result);
				for (var i = 0; i < result.li_per.length; i++) {
		            var key = result.li_per[i].poster;
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>"+star+"</span>"
					+"<div class='img-wrap'><img src='"+key+"'>"
					+"</div></div>");
			    }
			}
		});
	}
	function starajax(){
		
		$.ajax({
			url:"main/starRank",
			type:"GET",
			success : function(result) {
				$(".performance-list").empty();
				console.log(result);
				for (var i = 0; i < result.li_per.length; i++) {
		            var key = result.li_per[i].poster;
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>"+star+"</span>"
					+"<div class='img-wrap'><img src='"+key+"'>"
					+"</div></div>");
			    }	
			}
		});
	}
	
	function reviewajax(){
		
		$.ajax({
			url:"main/reviewRank",
			type:"GET",
			success : function(result) {
				$(".performance-list").empty();
				console.log(result);
				for (var i = 0; i < result.li_per.length; i++) {
		            var key = result.li_per[i].poster;
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 	
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>"+star+"</span>"
					+"<div class='img-wrap'><img src='"+key+"'>"
					+"</div></div>");
			    }	
			}
		});
	}
	$(document).ready(function(){
		ticketajax();
	});
	
	$(document).on("click", "#rank_btn", function(){
		ticketajax();
	});
	$(document).on("click", "#rank_star", function(){
		starajax();
	});
	$(document).on("click", "#rank_review", function(){
		reviewajax();
	});
	
	
</script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="main-background">
		<section id="ranking-container">
			<div class="filter">
				<ul id="filter-list">
					<li class="filter-item">
						<button class="filter-btn" id="rank_btn">예매순</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="rank_star">별점순</button>
					</li>
					<li class="filter-item">
						<button class="filter-btn" id="rank_review">후기순</button>
					</li>
				</ul>
			</div>
			<div class="wrapper">
				<i id="left" class="fa-solid fa-angle-left"></i>
				 <div class="performance-list">
				 </div>
				<i id="right" class="fa-solid fa-angle-right"></i>
			</div>
		</section>
	</div>
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/commonJs.jsp" %>
</body>
</html>