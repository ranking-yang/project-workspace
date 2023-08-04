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
                <td><input type="text" class="blank"></td>
                <td>대분류</td> 
                <td><select id="dropdown">
                        <option value="option1">공연</option>
                        <option value="option2">전시</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" class="blank"></td>
                <td>소분류</td>
                <td><select id="dropdown">
                        <option value="option1">연극</option>
                        <option value="option2">미술</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>발행개수</td>
                <td><input type="text" class="blank"></td>
                <td>시작일</td>
                <td>
                    <label for="date"><input type="date" id="date"></label>
                </td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" class="blank"></td>
                <td>종료일</td>
                <td>
                    <label for="date"><input type="date" id="date"></label>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" class="blank"></td>
                <td>키즈</td>
                <td><select id="dropdown">
                        <option value="option1">N</option>
                        <option value="option2">Y</option>
                    </select></td>
            </tr>
            <tr>
                <td>장소</td>
                <td><input type="text" class="blank"></td>
            </tr>
            <tr>
                <td>썸네일</td>
                <td><input type="text" class="blank"></td>
            </tr>
        </table>
    </div>
    <button>저장</button>
    <button onclick="location.href='api-list.html'">취소</button>
</div>
