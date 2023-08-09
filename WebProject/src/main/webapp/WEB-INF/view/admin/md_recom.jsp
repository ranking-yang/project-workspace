<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	 <script>
	 
	 	// 메뉴 버튼 클릭시 이벤트
		$(function(){
			var checkShowCode = new Array();
			$('input[class="showpost"]').change(function() { // 공연중 포스터를 클릭시
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').find('.product-module').data('pk'); // 선택한 input 가져오기
	                checkShowCode.push(labelText);
	                console.log("Label text:", labelText);
	                
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkShowCode.length; i++) {
	            		  if(checkShowCode[i] === labelText)  {
	            			  checkShowCode.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
			/* $.ajax({
	            url : "/admin/md/select",
	            type: "POST",
	            success : function(result) {
	            
	            }
			}); */
			
			// 카테고리 부문 선택시 
			var checkCategory = new Array();
			$('input[type=radio]').change(function() {
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').text(); // 선택한 input 가져오기
	                checkCategory.push(labelText);
	                console.log("Label text:", labelText);
	                
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkCategory.length; i++) {
	            		  if(checkCategory[i] === labelText)  {
	            			  checkCategory.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
			// 
			var checkLocal = new Array();
			$('input[class="optionlocal"]').change(function() {
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').text(); // 선택한 input 가져오기
	                checkLocal.push(labelText);
	                console.log("Label text:", labelText);
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkLocal.length; i++) {
	            		  if(checkLocal[i] === labelText)  {
	            			  checkLocal.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
			var checkshow = new Array();
			$('input[class="optionshow"]').change(function() {
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').text(); // 선택한 input 가져오기
	                checkshow.push(labelText);
	                console.log("Label text:", labelText);
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkshow.length; i++) {
	            		  if(checkshow[i] === labelText)  {
	            			  checkshow.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
			var checkmusic = new Array();
			$('input[class="optionmusic"]').change(function() {
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').text(); // 선택한 input 가져오기
	                checkmusic(labelText);
	                console.log("Label text:", labelText);
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkmusic.length; i++) {
	            		  if(checkmusic[i] === labelText)  {
	            			  checkmusic.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
			var checkart = new Array();
			$('input[class="optionart"]').change(function() {
				if ($(this).is(":checked")) {
	                var labelText = $(this).next('label').text(); // 선택한 input 가져오기
	                checkart.push(labelText);
	                console.log("Label text:", labelText);
	            }else{
	            	var labelText = $(this).next('label').text(); // 선택해제 한 input 가져오기
	            	for(let i = 0; i < checkart.length; i++) {
	            		  if(checkart[i] === labelText)  {
	            			  checkart.splice(i, 1);
	            		     i--;
	            		  }
	            	}
	            }
	        });
		});
	 </script>
<div class="main">
	<h3> MD 추천(선택한 카테고리에 맞춘 공연 선택 가능 ajax 형식 틀)</h3>
    <hr>
    	<div id="mdselect">
    		<h3>MD 추천 사항</h3>
    		<input type="text" id="md_title"> 
    		<input type="date" id="md_stdate">
    		<input type="date" id="md_endate"> 
    	</div>
    	<div id="mdbtn">
    		<button>추가</button>
    		<button>초기화</button>
    	</div>
    	<div id="mdmenu">
    	<table id="mdtable" style="width:1200px">
    		<tr>
    			<th>분류</th>
    			<th colspan="8">선택</th>
    		</tr>
    		<tr>
   				<td><label>카테고리 선택</label></td>
   				<td><input type="radio" class="optionchk" id="catg0" name="catoption" checked="checked">
   					<label for="catg0"> 전체 </label>
   				</td>
   				<td><input type="radio" class="optionchk" id="catg1" name="catoption">
   					<label for="catg1"> 공연 </label>
   				</td>
   				<td><input type="radio" class="optionchk" id="catg2" name="catoption">
   					<label for="catg2"> 음악 </label>
   				</td>
   				<td><input type="radio" class="optionchk" id="catg3" name="catoption">
   					<label for="catg3"> 전시 </label>
   				</td>
   				<td><input type="radio" class="optionchk" id="catg4" name="catoption">
   					<label for="catg4"> 키즈 </label>
   				</td>
   			</tr>
   			<tr>
   				<td rowspan="2"><label>지역 선택</label></td>
   				<td><input type="checkbox" class="optionlocal" id="local1">
   					<label for="local1"> 서울 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local2">
   					<label for="local2"> 경기 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local3">
   					<label for="local3"> 부산 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local4">
   					<label for="local4"> 광주 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local5">
   					<label for="local5"> 대전 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local6">
   					<label for="local6"> 울산 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local7">
   					<label for="local7"> 세종 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local8">
   					<label for="local8"> 제주 </label>
   				</td>
   				</tr>
   			<tr>
   				
   				<td><input type="checkbox" class="optionlocal" id="local9">
   					<label for="local9"> 강원 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local10">
   					<label for="local10"> 충북 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local11">
   					<label for="local11"> 충남 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local12">
   					<label for="local12"> 전북 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local13">
   					<label for="local13"> 전남 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local14">
   					<label for="local14"> 경북 </label>
   				</td>
   				<td><input type="checkbox" class="optionlocal" id="local15">
   					<label for="local15"> 경남 </label>
   				</td>

   				</tr>
   			
   			<tr>
   				<td rowspan="2"><label>연극 장르 선택</label></td>
   				<td><input type="checkbox" class="optionshow" id="show1">
   					<label for="show1"> 소극 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show2">
   					<label for="show2"> 역사 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show3">
   					<label for="show3"> 뮤지컬 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show4">
   					<label for="show4"> 로맨스 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show5">
   					<label for="show5"> 코미디 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show6">
   					<label for="show6"> 블랙코미디 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show7">
   					<label for="show7"> 신화/판타지 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show8">
   					<label for="show8"> 발레 </label>
   				</td>
   				</tr>
   			<tr>
   				<td><input type="checkbox" class="optionshow" id="show9">
   					<label for="show9"> 드라마 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show10">
   					<label for="show10"> 인형극 </label>
   				</td>
   				<td><input type="checkbox" class="optionshow" id="show11">
   					<label for="show11"> 풍자 </label>
   				</td>
   				
   			</tr>
   			
   			<tr>
   				<td rowspan="2"><label>음악 장르 선택</label></td>
   				<td><input type="checkbox" class="optionmusic" id="music1">
   					<label for="music1"> 클래식 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music2">
   					<label for="music2"> 팝/록 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music3">
   					<label for="music3"> 재즈 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music4">
   					<label for="music4"> 전통음악 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music5">
   					<label for="music5"> 전자음악 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music6">
   					<label for="music6"> 월드뮤직 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music7">
   					<label for="music7"> 컨트리/블루그래스 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music8">
   					<label for="music8"> 클럽/EDM </label>
   				</td>
   				</tr>
   			<tr>
   				<td><input type="checkbox" class="optionmusic" id="music9">
   					<label for="music9"> 오페라 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music10">
   					<label for="music10"> 아카펠라 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music11">
   					<label for="music11"> 페스티벌 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music12">
   					<label for="music12"> 헤비메탈 </label>
   				</td>
   				<td><input type="checkbox" class="optionmusic" id="music13">
   					<label for="music13"> 소울/퓨전 </label>
   				</td>
   			</tr>
   			<tr>
   				<td rowspan="2"><label>전시 장르 선택</label></td>
   				<td><input type="checkbox" class="optionart" id="art1">
   					<label for="art1"> 미술 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art2">
   					<label for="art2"> 사진 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art3">
   					<label for="art3"> 과학 및 기술 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art4">
   					<label for="art4"> 역사 및 문화 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art5">
   					<label for="art5"> 패션 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art6">
   					<label for="art6"> 음악 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art7">
   					<label for="art7"> 자동차 및 기술 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art8">
   					<label for="art8"> 디자인 </label>
   				</td>
   				</tr>
   			<tr>
   				<td><input type="checkbox" class="optionart" id="art9">
   					<label for="art9"> 식품 및 요리 </label>
   				</td>
   				<td><input type="checkbox" class="optionart" id="art10">
   					<label for="art10"> 미디어 아트 </label>
   				</td>
   			</tr>
    	</table>
      	</div>
    </div>
    	<input type="hidden" id="md_pernoteat" value="${performance}">
    	<div id="md_product">
        	<c:forEach var="product" items="${performance}">
			    <div>
			    <input type="checkbox" class="showpost" id="md_${product.performance_code}" style="width:20px"/>
			    <label for="md_${product.performance_code}" >
			    <div class="product-module" data-category="${product.main_category}" data-pk="${product.performance_code}">			    	
			        <img class="product-module-poster" src="${product.poster}" alt="포스터">
			        <div class="product-module-top">
			            <div class="tag">
			            	<span>
					           <c:set var="test" value="${product.address}" />${fn:substring(test, 0, 2)}
					        </span>
				            <span>
					           ${product.sub_category}
					        </span>
			            </div>
			        </div>
			        <div class="product-module-title">${product.performance_name}</div>
			    </div>
			    </label>
			    </div>
			    
			</c:forEach>
		</div>
