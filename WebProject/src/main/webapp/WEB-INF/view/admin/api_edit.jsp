<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 본문 -->
<div class="main">
    <h3>API 리스트 관리</h3>
    <hr>
    <div class="top-nav-box">공연/전시/관람</div>
    <div class="table-box">
        <table>
            <tr>
                <td>코드</td>
                <td><input type="text" class="blank" id="edit_code"></td>
                <td>대분류</td> 
                <td><select id="cat1">
                        <option value="공연">공연</option>
                        <option value="전시">전시</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" class="blank" id="edit_title"></td>
                <td>소분류</td>
                <td><select id="cat2">
                        <option value="연극">연극</option>
                        <option value="미술">미술</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>발행개수</td>
                <td><input type="text" class="blank" id="edit_qty"></td>
                <td>시작일</td>
                <td>
                    <label for="date"><input type="date" id="stdate"></label>
                </td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" class="blank" id="edit_price"></td>
                <td>종료일</td>
                <td>
                    <label for="date"><input type="date" id="endate"></label>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" class="blank" id="edit_address"></td>
                <td>키즈</td>
                <td><select id="catkids">
                        <option value="N">N</option>
                        <option value="Y">Y</option>
                    </select></td>
            </tr>
            <tr>
                <td>장소</td>
                <td><input type="text" class="blank" id="edit_place"></td>
            </tr>
            <tr>
                <td>썸네일</td>
                <td><input type="text" class="blank" id="edit_Thumbnail"></td>
            </tr>
        </table>
    </div>
    <button>저장</button>
    <button onclick="location.href='api-list.html'">취소</button>
</div>
