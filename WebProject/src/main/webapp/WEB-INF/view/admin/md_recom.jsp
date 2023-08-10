<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main">
	<h3> MD 추천(선택한 카테고리에 맞춘 공연 선택 가능 ajax 형식 틀)</h3>
    <hr>
    	<table id="mdtable">
    		<tr>
    			<th>분류</th>
    			<th>선택</th>
    		</tr>
   			<tr>
   				<td><label>지역 선택</label></td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 서울 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 경기 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 부산 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 광주 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 대전 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 울산 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 세종 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 제주 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 강원 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 충북 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 충남 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 전북 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 전남 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 경북 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 경남 </label>
   				</td>
   			</tr>
   			<tr>
   				<td><label>카테고리 선택</label></td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 공연 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 음악 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 전시 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 키즈 </label>
   				</td>
   			</tr>
   				<tr>
   				<td><label>연극 장르 선택</label></td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 소극 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 역사 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 뮤지컬 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 로맨스 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 코미디 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 블랙코미디 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 신화/판타지 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 발레 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 드라마 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 인형극 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 풍자 </label>
   				</td>
   				
   			</tr>
   			</tr>
   				<tr>
   				<td><label>음악 장르 선택</label></td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 클래식 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 팝/록 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 재즈 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 전통음악 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 전자음악 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 월드뮤직 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 컨트리/블루그래스 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 클럽/EDM </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 오페라 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 아카펠라 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 페스티벌 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 헤비메탈 </label>
   				</td>
   				<td><input type="checkbox",>
   					<label for="seoul"> 소울/퓨전 </label>
   				</td>
   			</tr>
   			<tr>
   				<td><label>전시 장르 선택</label></td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 미술 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 사진 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 과학 및 기술 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 역사 및 문화 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 패션 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 음악 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 자동차 및 기술 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 디자인 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 식품 및 요리 </label>
   				</td>
   				<td><input type="checkbox", id="ckbox">
   					<label for="seoul"> 미디어 아트 </label>
   				</td>
   			</tr>
    	</table>
    	<hr>
</div>