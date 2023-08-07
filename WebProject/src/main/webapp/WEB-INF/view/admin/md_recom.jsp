<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main">
	<h3> MD 추천(선택한 카테고리에 맞춘 공연 선택 가능 ajax 형식 틀)</h3>
    <hr>
    <div class="filter">
        <label for="date">시작일:
            <input type="date" id="date"></label>
        <label for="date">종료일:
            <input type="date" id="date"></label>
        <select id="keyword">
            <option value="option1">제목</option>
            <option value="option2">내용</option>
            <option value="option2">제목+내용</option>
            <option value="option2">작성자</option>
        </select>
        <label for="text">
            <input type="text" id="keyword"></label>
        <button>검색</button>
    </div>
</div>