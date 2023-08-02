package com.team.webproject.mapper;

import com.team.webproject.dto.ReviewDTO;

public interface ReviewMapper {
	// 리뷰 작성
    int insertReview(ReviewDTO review);

    // 리뷰 조회
    ReviewDTO selectReviewByCode(Integer reviewCode);

    // 리뷰 수정
    int updateReview(ReviewDTO review);

    // 리뷰 삭제
    int deleteReview(Integer reviewCode);
}
