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
<%-- <script src="${js}" defer></script> --%>
<script src="https://kit.fontawesome.com/cdd406875c.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="${js}" defer></script>
<script> 

	function ticketajax(){
		
		$.ajax({
			url:"main/rank",
			type:"GET",
			success : function(result) {
				$(".performance-list").empty();
				let length = result.li_per.length > 10 ? 10 : result.li_per.length;
				for (var i = 0; i < length; i++) {
		            var key = result.li_per[i].poster;
		           
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>⭐ "+star+"</span>"
					+"<input type='hidden' id='perfom_code' value='"+result.li_per[i]["performance_code"]+"'>"
					+"<input type='hidden' id='perfom_category' value='"+result.li_per[i]["main_category"]+"'>"
					+"<div class='img-wrap'><img class='imgtag' src='"+key+"'>"
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
				let length = result.li_per.length > 10 ? 10 : result.li_per.length;
				for (var i = 0; i < length; i++) {
		            var key = result.li_per[i].poster;
		            
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>⭐ "+star+"</span>"
					+"<input type='hidden' id='perfom_code' value='"+result.li_per[i]["performance_code"]+"'>"
					+"<input type='hidden' id='perfom_category' value='"+result.li_per[i]["main_category"]+"'>"
					+"<div class='img-wrap'><img class='imgtag' src='"+key+"'>"
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
				let length = result.li_per.length > 10 ? 10 : result.li_per.length;
				for (var i = 0; i < length; i++) {
		            var key = result.li_per[i].poster;
		            var star = result.perfom[i].toFixed(1);
		            var ranking = i + 1; 	
					$(".performance-list").append("<div class='poster'><span class='ranking'>"+ranking+"</span>"
					+"<span class='star'>⭐ "+star+"</span>"
					+"<input type='hidden' id='perfom_code' value='"+result.li_per[i]["performance_code"]+"'>"
					+"<input type='hidden' id='perfom_category' value='"+result.li_per[i]["main_category"]+"'>"
					+"<div class='img-wrap'><img class='imgtag' src='"+key+"'>"
					+"</div></div>");
			    }	
			}
		});
	}
	$(document).ready(function(){
		ticketajax();
		$("#rank_btn").focus();
		$(".performance-list").on("click", ".poster", function(){
	        var perfomCode = $(this).find("#perfom_code").val();
	        var category = $(this).find("#perfom_category").val();
	        if(category == "art"){
	        	location.href="/product-detail-ex?performance_code="+perfomCode;
	        }else{
	        	location.href="/product-detail?performance_code="+perfomCode;	
	        }
	        
	    });
			
	});
	
	$(document).on("click", "#rank_btn", function(){
		$('.filter-btn').css('color', 'white');
		$('#rank_btn').css('color', 'deeppink');
		ticketajax();
		$("#rank_btn").focus();
		$("#rank_star").blur();
		$("#rank_review").blur();
	});
	$(document).on("click", "#rank_star", function(){
		$('.filter-btn').css('color', 'white');
		$('#rank_star').css('color', 'deeppink');
		starajax();
		$("#rank_btn").blur();
		$("#rank_star").focus();
		$("#rank_review").blur();
	});
	$(document).on("click", "#rank_review", function(){
		$('.filter-btn').css('color', 'white');
		$('#rank_review').css('color', 'deeppink');
		reviewajax();
		$("#rank_star").blur();
		$("#rank_btn").blur();
		$("#rank_review").focus();
	});
	
	document.addEventListener("DOMContentLoaded", function() {
	    const carousel = document.querySelector(".performance-list");
	    const arrowIcons = document.querySelectorAll(".wrapper i");

	    let isDragStart = false, isDragging = false, prevPageX, prevScrollLeft, positionDiff = 0;

	    const showHideIcons = () => {
	        let scrollWidth = carousel.scrollWidth - carousel.clientWidth;
	        arrowIcons[0].style.display = carousel.scrollLeft === 0 ? "none" : "block";
	        arrowIcons[1].style.display = carousel.scrollLeft === scrollWidth ? "none" : "block";
	    };

	    arrowIcons.forEach(icon => {
	        icon.addEventListener("click", () => {
	            const imgTags = carousel.querySelectorAll(".imgtag"); // Select image elements within the click event
	            if (imgTags.length === 0) return; // Exit if no images are found
	            let firstImgWidth = imgTags[0].clientWidth + 14;
	            carousel.scrollLeft += icon.id === "left" ? -firstImgWidth : firstImgWidth;
	            setTimeout(showHideIcons, 60);
	        });
	    });

	    const autoSlide = () => {
	    	const imgTags = carousel.querySelectorAll(".imgtag"); // Select image elements within the click event
            if (imgTags.length === 0) return; // Exit if no images are found
            
	        if (carousel.scrollLeft === (carousel.scrollWidth - carousel.clientWidth)) return;

	        positionDiff = Math.abs(positionDiff);
	        let firstImgWidth = imgTags[0].clientWidth + 14;
	        let valDifference = firstImgWidth - positionDiff;

	        if (carousel.scrollLeft > prevScrollLeft) {
	            carousel.scrollLeft += positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	        } else {
	            carousel.scrollLeft -= positionDiff > firstImgWidth / 3 ? valDifference : -positionDiff;
	        }
	    };

	    const dragStart = (e) => {
	        isDragStart = true;
	        prevPageX = e.pageX;
	        prevScrollLeft = carousel.scrollLeft;
	    };

	    const dragging = (e) => {
	        if (!isDragStart) return;
	        e.preventDefault();
	        isDragging = true;
	        carousel.classList.add("dragging");
	        positionDiff = e.pageX - prevPageX;
	        carousel.scrollLeft = prevScrollLeft - positionDiff;
	        showHideIcons();
	    };

	    const dragStop = () => {
	        isDragStart = false;
	        carousel.classList.remove("dragging");

	        if (!isDragging) return;
	        isDragging = false;
	        autoSlide();
	    };

	    carousel.addEventListener("mousedown", dragStart);
	    carousel.addEventListener("mousemove", dragging);
	    carousel.addEventListener("mouseup", dragStop);
	    carousel.addEventListener("mouseleave", dragStop);
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