package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.ReviewDTO;

public interface ReviewMapper {
	int insertReview(ReviewDTO review);
    ReviewDTO selectReviewByCode(Integer reviewCode);
    void updateReview(ReviewDTO review);
    void deleteReview(Integer reviewCode);
    List<ReviewDTO> getAllReviews(); // 모든 리뷰 정보 가져오기
}
